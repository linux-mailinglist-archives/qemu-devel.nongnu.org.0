Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B22B83F8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 19:40:13 +0100 (CET)
Received: from localhost ([::1]:36026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSNI-0005kj-GR
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 13:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfS3P-0000HS-Uu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:19:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kfS3O-00027b-4h
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 13:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605723577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkUwKzbW7FkrXWN4KnhAzzNgbVjfQ8UhHuhR1bKgbKc=;
 b=EgRKSQaObWo1K01cTRP2PkuFQP7YsDOQ8t6i+H1M+HZ+tk/eQoHagLRNX9i7IzRxdaazY5
 Hy75a2rut35WJwF+gW7Ei3WgOO1yWyKt9GBCkB1Bs/fds1X/TtuDv4JNw7hj0MSXWkIU4A
 bOmGUjDnVLfiMRs20o1B9Ca7tCZHcvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-svk7MoMMNmW5cMDkYRvLYQ-1; Wed, 18 Nov 2020 13:19:30 -0500
X-MC-Unique: svk7MoMMNmW5cMDkYRvLYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C98F18B613A;
 Wed, 18 Nov 2020 18:19:29 +0000 (UTC)
Received: from [10.3.112.188] (ovpn-112-188.phx2.redhat.com [10.3.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8495C1A3;
 Wed, 18 Nov 2020 18:19:25 +0000 (UTC)
Subject: Re: [PATCH 00/11] mirror: cancel nbd reconnect
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <0954b696-7aa3-b593-2095-10b677a322c1@redhat.com>
Date: Wed, 18 Nov 2020 12:19:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 12:04 PM, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> The problem
> 
> Assume we have mirror job with nbd target node with enabled reconnect.
> Connection failed. So, all current requests to nbd node are waiting for
> nbd driver to reconnect. And they will wait for reconnect-delay time
> specified in nbd blockdev options. This timeout may be long enough, for
> example, we in Virtuozzo use 300 seconds by default.
> 
> So, if at this moment user tries to cancel the job, job will wait for
> its in-flight requests to finish up to 300 seconds. From the user point
> of view, cancelling the job takes a long time. Bad.
> 
> Solution
> 
> Let's just cancel "waiting for reconnect in in-flight request coroutines"
> on mirror (and backup) cancel. Welcome the series below.

Given that we're past -rc2, I think this is enough on the 'new feature'
side to defer into 6.0 rather than trying to claim as a bug-fix needed
for 5.2-rc3.

That said, the summary does make it sound like a worthwhile thing to add.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



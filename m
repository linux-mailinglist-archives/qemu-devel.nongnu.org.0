Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C952FDF1A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 03:16:37 +0100 (CET)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2PWW-0006D3-PK
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 21:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PV8-0005cw-C1
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2PV6-0004M4-T7
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 21:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611195308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyZlqpDX6/+D2wOaAxxSEqIexc7QiJ+D41ZCACYXLAA=;
 b=GM+mTJymu6mJY7PA82ht7/iroDelDyHEzhoRdByuqPAkSSLwVeGBrf7vW+MCRfN6nUUAIv
 mWI86vawOpXWuBqlh269V6+D5/OwZNdepAxX/xhM1OWrlebkq2IGQC7jqnyT/thKa8MJu6
 O30hoK4OY1Bl9DNRzeWvXg8oF8YBPwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-1jKtdKSgOFCd94Npf9oWhA-1; Wed, 20 Jan 2021 21:15:04 -0500
X-MC-Unique: 1jKtdKSgOFCd94Npf9oWhA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0406C107ACE3;
 Thu, 21 Jan 2021 02:15:03 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AE3A5B4BD;
 Thu, 21 Jan 2021 02:14:59 +0000 (UTC)
Subject: Re: [PATCH 00/11] mirror: cancel nbd reconnect
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201118180433.11931-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <9929c251-603b-9d22-30c3-d8261d212e1c@redhat.com>
Date: Wed, 20 Jan 2021 20:14:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201118180433.11931-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Because of my question on 4/11, I did not queue the entire series yet.
But 6/11 was trivial enough to queue now.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C92E1D9F83
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 20:30:11 +0200 (CEST)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb70D-0002jM-NY
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 14:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jb6yb-00018N-CN
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:28:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37073
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jb6ya-0000vU-LQ
 for qemu-devel@nongnu.org; Tue, 19 May 2020 14:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589912907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/wp0axk2sLL7lnGcc+3pWWNP3gTIul+y25ZdWXMREj8=;
 b=RA8JVGLnfgwUoo/ngF7CTbXWPyn/vMMsXgZdXyrVZCR+hJYSWCs5SsxPtvBOmbjl8WkBuj
 PIdLx6UyZM2Fs3CdbPT/qAEYTn8Titt/in/ft4bBLlWUtsJxolE5S53A6hA7v7MAssroh4
 v9DKHB/3aSGKhdRjx2rQ8LYhoMU2mrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-guX3tc3TMxSOGxqA8zxAFg-1; Tue, 19 May 2020 14:28:22 -0400
X-MC-Unique: guX3tc3TMxSOGxqA8zxAFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F225C461;
 Tue, 19 May 2020 18:28:20 +0000 (UTC)
Received: from [10.3.112.88] (ovpn-112-88.phx2.redhat.com [10.3.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 941851057FA7;
 Tue, 19 May 2020 18:28:17 +0000 (UTC)
Subject: Re: [PATCH v2] block: Factor out bdrv_run_co()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200519175650.31506-1-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1d2f5f23-298f-700c-d024-111f9bcebec2@redhat.com>
Date: Tue, 19 May 2020 13:28:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519175650.31506-1-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 23:56:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, fam@euphon.net, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/19/20 12:56 PM, Vladimir Sementsov-Ogievskiy wrote:
> We have a few bdrv_*() functions that can either spawn a new coroutine
> and wait for it with BDRV_POLL_WHILE() or use a fastpath if they are
> alreeady running in a coroutine. All of them duplicate basically the

already

> same code.
> 
> Factor the common code into a new function bdrv_run_co().
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>     [Factor out bdrv_run_co_entry too]
> ---
> 
> Hi!
> 
> I'm a bit lost on rebasing "block/io: safer inc/dec in_flight sections"
> (is it needed or not?), so, I decided to send just this one patch:
> 
> I suggest to go a bit further, and refactor that bdrv_run_co don't need
> additional *ret argument neither NOT_DONE logic.

Yes, and this approach was easier to review than v1.

> 
>   block/io.c | 191 ++++++++++++++++++++---------------------------------
>   1 file changed, 70 insertions(+), 121 deletions(-)
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



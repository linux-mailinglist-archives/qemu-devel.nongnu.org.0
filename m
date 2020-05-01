Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B11C205F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 May 2020 00:10:03 +0200 (CEST)
Received: from localhost ([::1]:40050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUdr8-00020Q-Qc
	for lists+qemu-devel@lfdr.de; Fri, 01 May 2020 18:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUdpQ-0001Lc-Jg
 for qemu-devel@nongnu.org; Fri, 01 May 2020 18:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jUdpP-0001YC-QT
 for qemu-devel@nongnu.org; Fri, 01 May 2020 18:08:16 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42363
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jUdpP-0001Wm-Bx
 for qemu-devel@nongnu.org; Fri, 01 May 2020 18:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588370891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pMVEiYMQfHRYcIfWEnvDyJBUSxvjXO6LpDCAoABlzyg=;
 b=STWHUEnBv/EqaQCuc6lRiM2DGZbq/IDp8IjZa1yvS34lBL70z7la6Z5Bf7oMOeN+yKjBpw
 1L+UAug3cG4xApv9WwEOWvRNbtaLWkTj9T+Tjx2wH19dyVhcB3NPGTow5AzHc5eYOV4mqv
 lHnCABaP6gvkqWfB64tu7hk3gZYH530=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-9SSXap_4MzCGX-fDkJhG-w-1; Fri, 01 May 2020 18:08:09 -0400
X-MC-Unique: 9SSXap_4MzCGX-fDkJhG-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EA20EC1A8;
 Fri,  1 May 2020 22:08:07 +0000 (UTC)
Received: from [10.3.114.73] (ovpn-114-73.phx2.redhat.com [10.3.114.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57DBA6152C;
 Fri,  1 May 2020 22:08:02 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] block/io: expand in_flight inc/dec section:
 bdrv_make_zero
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200427143907.5710-1-vsementsov@virtuozzo.com>
 <20200427143907.5710-10-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <191f526c-2fb3-d7d3-cf79-df0780e8ee22@redhat.com>
Date: Fri, 1 May 2020 17:08:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427143907.5710-10-vsementsov@virtuozzo.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 17:26:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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

On 4/27/20 9:39 AM, Vladimir Sementsov-Ogievskiy wrote:
> It's safer to expand in_flight request to start before enter to
> coroutine in synchronous wrappers and end after BDRV_POLL_WHILE loop.
> Note that qemu_coroutine_enter may only schedule the coroutine in some
> circumstances.

See my wording suggestions earlier in the series.

> 
> bdrv_make_zero update includes refactoring: move the whole loop into
> coroutine, which has additional benefit of not create/enter new
> coroutine on each iteration.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/io.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 51 insertions(+), 3 deletions(-)
> 

> +int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
> +{
> +    int ret;
> +
> +    bdrv_inc_in_flight(child->bs);
> +
> +    if (qemu_in_coroutine()) {
> +        /* Fast-path if already in coroutine context */
> +        ret = bdrv_do_make_zero(child, flags);
> +    } else {
> +        BdrvDoMakeZeroData data = {
> +            .child = child,
> +            .flags = flags,
> +            .done = false,

Another case where the line '.done = false,' is optional, thanks to C 
semantics, but does not hurt to leave it in.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



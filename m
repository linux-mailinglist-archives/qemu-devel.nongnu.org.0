Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D422779EE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 22:08:47 +0200 (CEST)
Received: from localhost ([::1]:40604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLXXp-0006OO-W4
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 16:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kLXWY-0005hh-N0
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 16:07:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kLXWW-0003OG-I8
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 16:07:26 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600978043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np3K7qbEYGxezSL8czkCjjbXnss4SiIO2lac/O264zc=;
 b=RufWcpztvUxcbto9PlHU1yvYKsDoI3BQVBi4lOXuyerotgSe30Y4ZADndkEtzns9sSHmVo
 lGq/HPleow2vSw+bXB0UE9/ymSAOGb/CPFxXXY/K/TXOpgwL5W+jM9AtCZOt4i2FZxqM6z
 98nWBwodBq3b2HlCPk7L+oEScYKiMDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-BvMzRureMrGvjy7G3CbiBQ-1; Thu, 24 Sep 2020 16:07:21 -0400
X-MC-Unique: BvMzRureMrGvjy7G3CbiBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85ACB801002;
 Thu, 24 Sep 2020 20:07:19 +0000 (UTC)
Received: from [10.3.114.148] (ovpn-114-148.phx2.redhat.com [10.3.114.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F3B3A40;
 Thu, 24 Sep 2020 20:07:15 +0000 (UTC)
Subject: Re: [PATCH v7 2/5] block/io: bdrv_common_block_status_above: support
 include_base
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20200924194003.22080-1-vsementsov@virtuozzo.com>
 <20200924194003.22080-3-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f18a7304-e373-2126-d06f-5ef20323180b@redhat.com>
Date: Thu, 24 Sep 2020 15:07:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200924194003.22080-3-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.214, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/20 2:40 PM, Vladimir Sementsov-Ogievskiy wrote:
> In order to reuse bdrv_common_block_status_above in
> bdrv_is_allocated_above, let's support include_base parameter.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Alberto Garcia <berto@igalia.com>
> ---
>   block/coroutines.h |  2 ++
>   block/io.c         | 21 ++++++++++++++-------
>   2 files changed, 16 insertions(+), 7 deletions(-)
> 

> +++ b/block/io.c
> @@ -2343,6 +2343,7 @@ early_out:
>   int coroutine_fn
>   bdrv_co_common_block_status_above(BlockDriverState *bs,
>                                     BlockDriverState *base,
> +                                  bool include_base,
>                                     bool want_zero,
>                                     int64_t offset,
>                                     int64_t bytes,
> @@ -2354,10 +2355,11 @@ bdrv_co_common_block_status_above(BlockDriverState *bs,
>       BlockDriverState *p;
>       int64_t eof = 0;
>   
> -    assert(bs != base);
> +    assert(include_base || bs != base);
> +    assert(!include_base || base); /* Can't include NULL base */

I wonder if this would be easier to read as:

if (include_base) {
     assert(bs != base);
} else {
     assert(base); /* Can't include NULL base */
}

but I won't insist.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



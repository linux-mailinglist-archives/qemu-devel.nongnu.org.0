Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CE937B0A2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 23:16:52 +0200 (CEST)
Received: from localhost ([::1]:39524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgZkJ-0001F5-Cd
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 17:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgZie-0000Ky-Qi
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lgZid-0000B2-4U
 for qemu-devel@nongnu.org; Tue, 11 May 2021 17:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620767706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2G5gRgrWpM0DK1+EHBdWIFlzMcGn0KMdeO4LnAS0w0w=;
 b=iAU7BAFHvOGq62oZY+34sLpq3F9H6CXSbqFe62yc+pZrOxSRoP4Zc8rvYXExHnAS6zUzv2
 Pa+WgYqxkluh9XuUnQkusozU+7O9kkRQ8LzJY5jX43UaOr9sXqZhYsrUMCyXHPQip42D6l
 UcZeMzbMNlcCRy+VGpo81zZPG32yhBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-y7A0bYXFMfCjPsGLMeXSFA-1; Tue, 11 May 2021 17:15:03 -0400
X-MC-Unique: y7A0bYXFMfCjPsGLMeXSFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62EF4107ACCD;
 Tue, 11 May 2021 21:15:01 +0000 (UTC)
Received: from [10.3.114.221] (ovpn-114-221.phx2.redhat.com [10.3.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5353B60C04;
 Tue, 11 May 2021 21:14:52 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210324205132.464899-1-vsementsov@virtuozzo.com>
 <20210324205132.464899-6-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v4 05/11] block: use int64_t instead of uint64_t in
 copy_range driver handlers
Message-ID: <0d5f5ba8-97f4-ce8d-311f-795458df6399@redhat.com>
Date: Tue, 11 May 2021 16:14:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210324205132.464899-6-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, integration@gluster.org, berto@igalia.com,
 stefanha@redhat.com, pavel.dovgaluk@ispras.ru, sw@weilnetz.de, pl@kamp.de,
 qemu-devel@nongnu.org, mreitz@redhat.com, jsnow@redhat.com,
 ronniesahlberg@gmail.com, pbonzini@redhat.com, namei.unix@gmail.com,
 dillaman@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 3:51 PM, Vladimir Sementsov-Ogievskiy wrote:
> We are generally moving to int64_t for both offset and bytes parameters
> on all io paths.
> 
> Main motivation is realization of 64-bit write_zeroes operation for
> fast zeroing large disk chunks, up to the whole disk.
> 
> We chose signed type, to be consistent with off_t (which is signed) and
> with possibility for signed return type (where negative value means
> error).
> 
> So, convert driver copy_range handlers parameters which are already
> 64bit to signed type.
> 
> Now let's consider all callers. Simple
> 
>   git grep '\->bdrv_co_copy_range'
> 
> shows the only caller:
> 
>   bdrv_co_copy_range_internal(), which doesn bdrv_check_request32(),

s/doesn/does/

>   so everything is OK.
> 
> Still, the functions may be called directly, not only by drv->...
> Let's check:
> 
> git grep '\.bdrv_co_copy_range_\(from\|to\)\s*=' | \
> awk '{print $4}' | sed 's/,//' | sed 's/&//' | sort | uniq | \
> while read func; do git grep "$func(" | \
> grep -v "$func(BlockDriverState"; done
> 
> shows no more callers. So, we are done.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  include/block/block_int.h | 12 ++++++------
>  block/file-posix.c        | 10 +++++-----
>  block/iscsi.c             | 12 ++++++------
>  block/qcow2.c             | 12 ++++++------
>  block/raw-format.c        | 16 ++++++++--------
>  5 files changed, 31 insertions(+), 31 deletions(-)

Fewer drivers implement this, so easier review :)

> +++ b/block/qcow2.c
> @@ -3975,9 +3975,9 @@ static coroutine_fn int qcow2_co_pdiscard(BlockDriverState *bs,
>  
>  static int coroutine_fn
>  qcow2_co_copy_range_from(BlockDriverState *bs,
> -                         BdrvChild *src, uint64_t src_offset,
> -                         BdrvChild *dst, uint64_t dst_offset,
> -                         uint64_t bytes, BdrvRequestFlags read_flags,
> +                         BdrvChild *src, int64_t src_offset,
> +                         BdrvChild *dst, int64_t dst_offset,
> +                         int64_t bytes, BdrvRequestFlags read_flags,
>                           BdrvRequestFlags write_flags)
>  {
>      BDRVQcow2State *s = bs->opaque;

The use of cur_bytes = MIN(bytes, INT_MAX) looks odd, when we could
instead clamp to a nicer aligned boundary.  As noted before,
qcow2_get_host_offset() then further clamps cur_bytes, and the caller is
already splitting up requests larger than 2G, but copy_from is one of
those interfaces that is actually designed to have potentially nice
speedups with large byte ranges within the same filesystem (faster than
what is possible with usual pread/pwrite).  Then again, that's probably
more for file-posix (where we know the bytes are contiguous) than qcow2
(where we do have to worry about whether clusters are contiguous), so
we'll still have to keep a while(bytes) fragmenting loop in this
function.  Thoughts for a future patch, doesn't affect correctness of
this one.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org



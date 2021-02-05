Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A258310A7B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 12:44:35 +0100 (CET)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7zXN-00018Q-1s
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 06:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l7zW3-0000ah-MJ; Fri, 05 Feb 2021 06:43:11 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1l7zVz-0005Xv-IH; Fri, 05 Feb 2021 06:43:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=tiVs4iz9bDqXXSF0VpApUWN/eLZd1oFx9pAi4oCN068=; 
 b=CleQR/bIL+wxHYhtSwvuBPWetj/LYs7QkdwDKa3S3sYdmpmHkNpgm5ir+r02LWPB5MBkbQnK+x6wrJ3+ddEXV41J5gnrUPo9EOTO9n93txIGSk8zgiWq44F4BZdatsJcwSjfG6KGJOKCEwBf9ruZjNQljZVzSJl6F3bQbVssA80fqEC0X6WgomaYX+k7ofLQIfdwglJjCPpLjBVtxIsdAw6vhRV1RJaq/R0AXinou9wJ7662iqdMz6pxclib/WgXTVbsblRsWVceVfy04TLbmxv3rhi4WEwUQoN5JfKcgbAUZsF/7XBMaqz9eKQoECaLimpBOysQhead7+lLqrq5KQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l7zVv-0002tt-BO; Fri, 05 Feb 2021 12:43:03 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1l7zVv-0002SE-2H; Fri, 05 Feb 2021 12:43:03 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Subject: Re: [PATCH v7 08/14] block/qcow2: qcow2_get_specific_info(): drop
 error propagation
In-Reply-To: <20210202124956.63146-9-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-9-vsementsov@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 05 Feb 2021 12:43:03 +0100
Message-ID: <w51lfc2bv08.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, pavel.dovgaluk@ispras.ru,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 02 Feb 2021 01:49:50 PM CET, Vladimir Sementsov-Ogievskiy wrote:
> -Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
> -                                                Error **errp)
> +bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
> +                                Qcow2BitmapInfoList **info_list, Error **errp)
>  {
>      BDRVQcow2State *s = bs->opaque;
>      Qcow2BitmapList *bm_list;
>      Qcow2Bitmap *bm;
> -    Qcow2BitmapInfoList *list = NULL;
> -    Qcow2BitmapInfoList **tail = &list;
>  
>      if (s->nb_bitmaps == 0) {
> -        return NULL;
> +        *info_list = NULL;
> +        return true;
>      }
>  
>      bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
>                                 s->bitmap_directory_size, errp);
> -    if (bm_list == NULL) {
> -        return NULL;
> +    if (!bm_list) {
> +        return false;
>      }
>  
> +    *info_list = NULL;
> +
>      QSIMPLEQ_FOREACH(bm, bm_list, entry) {
>          Qcow2BitmapInfo *info = g_new0(Qcow2BitmapInfo, 1);
>          info->granularity = 1U << bm->granularity_bits;
>          info->name = g_strdup(bm->name);
>          info->flags = get_bitmap_info_flags(bm->flags & ~BME_RESERVED_FLAGS);
> -        QAPI_LIST_APPEND(tail, info);
> +        QAPI_LIST_APPEND(info_list, info);
>      }
>  
>      bitmap_list_free(bm_list);
>  
> -    return list;
> +    return true;
>  }

Maybe I'm reading this wrong but...

In the original code you had the head and tail of the list ('list' and
'tail') then you would append items to the tail and finally return the
head.

However the new code only uses and updates 'info_list' and it does not
keep the head anywhere, so what the caller gets is a pointer to the
tail.

Berto


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A566131A59F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 20:49:37 +0100 (CET)
Received: from localhost ([::1]:47348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAeRc-0000yN-DU
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 14:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAeMo-00076j-RJ
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:44:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lAeMm-0006Ax-Nx
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 14:44:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613159075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQfcDJJCNsLHUbWKDd2jINmjvknOg/j8CsgUY9osG6Y=;
 b=Q71KvEZVvD5PegEcIa5jApNexafiT0E59A+0KW6qr2DUjhi4YAEw1ngz2pQODG2oHQR6Ck
 Rh9olqyF6LqyAeXN752+yRjfvHBt+iaq2McYpdAs+Ic1xYhKSiR4NWLXA8IDJHLDmUcry1
 wJIbvccaMXuT8WwL8WhDZKVtjok/Zlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-qIBUekLzPCW6Y_uIZkfzWg-1; Fri, 12 Feb 2021 14:44:28 -0500
X-MC-Unique: qIBUekLzPCW6Y_uIZkfzWg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B27D3107ACF2;
 Fri, 12 Feb 2021 19:44:25 +0000 (UTC)
Received: from [10.3.114.150] (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14E3F60BE5;
 Fri, 12 Feb 2021 19:44:20 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
 <20210202124956.63146-9-vsementsov@virtuozzo.com>
 <w51lfc2bv08.fsf@maestria.local.igalia.com>
 <f5c4c064-166f-a2bd-8d86-1c25a3c26646@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v7 08/14] block/qcow2: qcow2_get_specific_info(): drop
 error propagation
Message-ID: <c30fc7f1-bc0d-3080-1980-b3e9eebeb16f@redhat.com>
Date: Fri, 12 Feb 2021 13:44:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <f5c4c064-166f-a2bd-8d86-1c25a3c26646@virtuozzo.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 5:52 AM, Vladimir Sementsov-Ogievskiy wrote:
> 05.02.2021 14:43, Alberto Garcia wrote:
>> On Tue 02 Feb 2021 01:49:50 PM CET, Vladimir Sementsov-Ogievskiy wrote:
>>> -Qcow2BitmapInfoList *qcow2_get_bitmap_info_list(BlockDriverState *bs,
>>> -                                                Error **errp)
>>> +bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
>>> +                                Qcow2BitmapInfoList **info_list,
>>> Error **errp)
>>>   {
>>>       BDRVQcow2State *s = bs->opaque;
>>>       Qcow2BitmapList *bm_list;
>>>       Qcow2Bitmap *bm;
>>> -    Qcow2BitmapInfoList *list = NULL;
>>> -    Qcow2BitmapInfoList **tail = &list;
>>>         if (s->nb_bitmaps == 0) {
>>> -        return NULL;
>>> +        *info_list = NULL;
>>> +        return true;
>>>       }
>>>         bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
>>>                                  s->bitmap_directory_size, errp);
>>> -    if (bm_list == NULL) {
>>> -        return NULL;
>>> +    if (!bm_list) {
>>> +        return false;
>>>       }
>>>   +    *info_list = NULL;
>>> +
>>>       QSIMPLEQ_FOREACH(bm, bm_list, entry) {
>>>           Qcow2BitmapInfo *info = g_new0(Qcow2BitmapInfo, 1);
>>>           info->granularity = 1U << bm->granularity_bits;
>>>           info->name = g_strdup(bm->name);
>>>           info->flags = get_bitmap_info_flags(bm->flags &
>>> ~BME_RESERVED_FLAGS);
>>> -        QAPI_LIST_APPEND(tail, info);
>>> +        QAPI_LIST_APPEND(info_list, info);
>>>       }
>>>         bitmap_list_free(bm_list);
>>>   -    return list;
>>> +    return true;
>>>   }
>>
>> Maybe I'm reading this wrong but...
>>
>> In the original code you had the head and tail of the list ('list' and
>> 'tail') then you would append items to the tail and finally return the
>> head.
>>
>> However the new code only uses and updates 'info_list' and it does not
>> keep the head anywhere, so what the caller gets is a pointer to the
>> tail.
>>
> 
> No. *info_list is modified only on the first loop iteration. And than
> info_list is switched to &(*(info_list))->next, so on second iteration
> we will modify @next field of first element, not original *info_list.

Elsewhere when making these types of conversions, Markus suggested that
I keep a separate tail variable, initialized by the parameter info_list,
to make it more apparent.  As in squashing the patch below:

With that, it looks this series is reviewed, so I'm planning on taking
it through my dirty-bitmaps tree (perhaps I'm stretching the fact that
patch 10/14 is definitely dirty-bitmaps into taking the whole series,
but I doubt I'll hear any complaints from other block maintainers)


diff --git i/block/qcow2-bitmap.c w/block/qcow2-bitmap.c
index e50da1ee7da3..f417f9ccb195 100644
--- i/block/qcow2-bitmap.c
+++ w/block/qcow2-bitmap.c
@@ -1103,6 +1103,7 @@ bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
+    Qcow2BitmapInfoList **tail;

     if (s->nb_bitmaps == 0) {
         *info_list = NULL;
@@ -1116,13 +1117,14 @@ bool qcow2_get_bitmap_info_list(BlockDriverState
*bs,
     }

     *info_list = NULL;
+    tail = info_list;

     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
         Qcow2BitmapInfo *info = g_new0(Qcow2BitmapInfo, 1);
         info->granularity = 1U << bm->granularity_bits;
         info->name = g_strdup(bm->name);
         info->flags = get_bitmap_info_flags(bm->flags &
~BME_RESERVED_FLAGS);
-        QAPI_LIST_APPEND(info_list, info);
+        QAPI_LIST_APPEND(tail, info);
     }

     bitmap_list_free(bm_list);

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org



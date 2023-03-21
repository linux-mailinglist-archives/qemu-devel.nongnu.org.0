Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F76C3159
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 13:17:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peaub-0006P5-KA; Tue, 21 Mar 2023 08:16:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1peauZ-0006Of-NL
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 08:16:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1peauX-0007I8-Ov
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 08:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679400976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6G0Vbbd3HMyI0rKbLv+6aMc+GTs3qmfXTOajoAKczg=;
 b=KAmL2ruPyKL0CEy53VyD9VKoURBKZjoQn6HOn85mGOsRnQiP2UIBTv1Yh+IH2of/oP2PSc
 nl6cevAZnhLvPZnoC3VwLOCxIVAn7JoxQmoPg/yMuDRmGJz4iZHBA8VKrR/1dqMTrWp7Lg
 KT1QxIh2jobEkUCkztmgKPYfvyHIKZc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-mbscKzOpMOua4PWUWVL_9Q-1; Tue, 21 Mar 2023 08:16:14 -0400
X-MC-Unique: mbscKzOpMOua4PWUWVL_9Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 iv18-20020a05600c549200b003ee21220fccso1337354wmb.1
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 05:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679400973;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6G0Vbbd3HMyI0rKbLv+6aMc+GTs3qmfXTOajoAKczg=;
 b=VKwQ+6G/AKjZs9fU9+c/vBe2VGny0QxGSaoLrF6hMtB5MXQKIOMTrY0l6nTbpJVI01
 V5v8Cbgd7jwovCM5IDits4F7Q67pcxEtYw3KasAz2R4k3vsITn7Ma0anmJgqmTJQSv2Z
 s2HvMN6AJeSuvkm4T14gQi8A4QVfuszLToiRhewnQqzlKtrG1SbzXJU6JcixJAyCy9Ee
 nYSDmyu3Yba08hDUPDrlW4IRnsi0uEdnWeG68c+6znnZysn4+KJQmnJnk5UtFRNt8s+I
 AkSoUVUyxf+cC4aFQL3xUmCoEWxUa4cO+YWVre5uRj71D5VL+IgDWI+ZLZNNCFe3M9uK
 ctrw==
X-Gm-Message-State: AO0yUKWqDq6i3Dun+bpWVquBCY9bmgQGwbfkP5UrFHQxmD1Dc9iVmd0M
 5jdYiFS4spNLD6ZJzkvT3n7q5tUac/Z2TXT8cTKESf5B0FG/J62WpHkV5baIjE99jJg4KDKEDn8
 upAaCUKlF0c2x4qA=
X-Received: by 2002:a5d:52cb:0:b0:2ce:a0c7:153a with SMTP id
 r11-20020a5d52cb000000b002cea0c7153amr2247861wrv.14.1679400973481; 
 Tue, 21 Mar 2023 05:16:13 -0700 (PDT)
X-Google-Smtp-Source: AK7set/wh34CRVNmmf/w6jceqXxVBI0eLbmiypgCeEJhlAtTt/ea2vkGPZ1iUHgdOPZFRy4KZOnUCA==
X-Received: by 2002:a5d:52cb:0:b0:2ce:a0c7:153a with SMTP id
 r11-20020a5d52cb000000b002cea0c7153amr2247849wrv.14.1679400973198; 
 Tue, 21 Mar 2023 05:16:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 c8-20020adfe708000000b002cde626cd96sm11126764wrm.65.2023.03.21.05.16.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 05:16:12 -0700 (PDT)
Message-ID: <fabc9edf-697e-41d3-101a-bd7a6ddda84a@redhat.com>
Date: Tue, 21 Mar 2023 13:16:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH for-8.0 1/3] async: Suppress GCC13 false positive in
 aio_bh_poll()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230321083322.663561-1-clg@kaod.org>
 <20230321083322.663561-2-clg@kaod.org>
 <1dc87cd2-2f86-3580-3f29-a89de375c79d@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <1dc87cd2-2f86-3580-3f29-a89de375c79d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/21/23 12:57, Paolo Bonzini wrote:
> On 3/21/23 09:33, Cédric Le Goater wrote:
>> +static void aio_bh_slice_insert(AioContext *ctx, BHListSlice *slice)
>> +{
>> +    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, slice, next);
>> +}
>> +
>>   /* Multiple occurrences of aio_bh_poll cannot be called concurrently. */
>>   int aio_bh_poll(AioContext *ctx)
>>   {
>> @@ -164,7 +169,13 @@ int aio_bh_poll(AioContext *ctx)
>>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
>> -    QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>> +
>> +    /*
>> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
>> +     * 'slice' is being stored in a global list in 'ctx->bh_slice_list'.
>> +     * Use a helper to silent the compiler
>> +     */
>> +    aio_bh_slice_insert(ctx, &slice);
>>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>>           QEMUBH *bh;
>> -- 
> 
> Sorry, but an API that has "insert" and not "remove", and where the argument is *expected to be* a local variable (which must be removed to avoid a dangling pointer---and the warning is exactly -Wdangling-pointer), ranks at least -7 in the bad API ranking[1].

:)

> I tried wrapping the BHListSlice and BHListSlice* into an iterator struct (which is also really overkill, but at least---in theory---it's idiomatic), but the code was hard to follow.
> 
> The fact that the workaround is so ugly, in my opinion, points even more strongly at the compiler being in the wrong here.

It was initially called slice_dangling_pointer_fixup() how's that ?

An alternative could be :

@@ -164,7 +164,14 @@ int aio_bh_poll(AioContext *ctx)
  
      /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
      QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
+    /*
+     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
+     * 'slice' is being stored in the global list 'ctx->bh_slice_list'.
+     */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wdangling-pointer="
      QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
+#pragma GCC diagnostic pop
  
      while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
          QEMUBH *bh;

May be that's more explicit. I wonder if we need to ifdef clang also.

Thanks,

C.



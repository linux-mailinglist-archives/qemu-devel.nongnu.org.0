Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A23640C16
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 18:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p19kS-0006ss-Qn; Fri, 02 Dec 2022 12:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p19kQ-0006sP-Sj
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 12:22:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p19kP-0002z4-3d
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 12:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670001768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbQghpm50c3Rj60M1mHtjr43EC/cO/aMIiavLtKpl1E=;
 b=LanzOlZ7wN4euMvGdwXTnF1j4wpQWnVlKKX/QGqZu7/Pr0/ZXK7e63bLrmvsjh6xxCP5Fn
 hU7yXuYKnVFkfLLpfGKimQys9VQntlF40MOeMyY2dBvPz1pSopzhPC9lRPEL31JR5mngzS
 tZfp0+ctNnQbHloAmpsYDJHvEifo/1M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-1W1FP8EbNMWg8UHIK6GryA-1; Fri, 02 Dec 2022 12:22:46 -0500
X-MC-Unique: 1W1FP8EbNMWg8UHIK6GryA-1
Received: by mail-wr1-f70.google.com with SMTP id
 o8-20020adfba08000000b00241e80f08e0so1235170wrg.12
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 09:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AbQghpm50c3Rj60M1mHtjr43EC/cO/aMIiavLtKpl1E=;
 b=koxkiEMIGfHVVUGhCdIgli2vldggY4hu29fjLN5bbI57fbA0S/bRZgbAVs06Y12o7E
 8/XOu4L+l3/NZOsv77V+ewbmarXTuNjuLliXweAvJlKYkxr4dCVetT63F/eX70SfQ7uM
 lGeD8U5UcWIonEo9oVmW8xHM+UiZBzDBsH1mLOqMKNbISuJUOGegCEpyz549u7BBRzvo
 XaUC3wd8/sVct/24hebLNvuzERmlcYZ7Vtl4YFEJ+bXLRMeH9ZQ5prfKM8bb9yn0UQJC
 fKF1pDInKiymL60APv1pp8/jmUOQWWT3VmlVsRPVO+nE8sEyLe8TFzaceepcEvsUUQnX
 3u8Q==
X-Gm-Message-State: ANoB5pmqHg2Q60AXHHN4qT7VerXiwPqo2pniAV3CvGL5aCARODn5Ine/
 EmfoPT97GstXqcQy0rKAyiasMS+1EitXlm0n2MnJUn1R0d8rKf6okcxJ2S6jDXNgCyb2rwdoyav
 Akn9cp81RQM6kLR0=
X-Received: by 2002:a5d:6706:0:b0:241:cf90:ab1e with SMTP id
 o6-20020a5d6706000000b00241cf90ab1emr34618945wru.685.1670001765475; 
 Fri, 02 Dec 2022 09:22:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7ofvJ7FPSoCRgn73B6YHzB818HogM3pkAT0XRg2STTOAjTf5qucFhOV98ves5DSDDHRvvW4Q==
X-Received: by 2002:a5d:6706:0:b0:241:cf90:ab1e with SMTP id
 o6-20020a5d6706000000b00241cf90ab1emr34618925wru.685.1670001765118; 
 Fri, 02 Dec 2022 09:22:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 s16-20020a7bc390000000b003b476cabf1csm9614368wmj.26.2022.12.02.09.22.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Dec 2022 09:22:44 -0800 (PST)
Message-ID: <eee6b6e6-e62c-0d87-1f98-913b4b194a1a@redhat.com>
Date: Fri, 2 Dec 2022 18:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, kwolf@redhat.com
References: <20221202132701.531048-1-pbonzini@redhat.com>
 <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <632abcb8-3a66-2b93-eb33-ef12953abd18@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.258, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_DOTEDU=1.99 autolearn=no autolearn_force=no
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

On 12/2/22 14:42, Emanuele Giuseppe Esposito wrote:
> 
> 
> Am 02/12/2022 um 14:27 schrieb Paolo Bonzini:
>> Changes to the BlockDriverState graph will have to take the
>> corresponding lock for writing, and therefore cannot be done
>> inside a coroutine.  Move them outside the test body.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
>>   1 file changed, 46 insertions(+), 17 deletions(-)
>>
>> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
>> index 6ae44116fe79..d85083dd4f9e 100644
>> --- a/tests/unit/test-bdrv-drain.c
>> +++ b/tests/unit/test-bdrv-drain.c
>> @@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
>>       }
>>   }
>>   
>> +static BlockBackend *blk;
>> +static BlockDriverState *bs, *backing;
>> +
>> +static void test_drv_cb_init(void)
>> +{
>> +    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
>> +    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
>> +                              &error_abort);
>> +    blk_insert_bs(blk, bs, &error_abort);
>> +
>> +    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
>> +    bdrv_set_backing_hd(bs, backing, &error_abort);
>> +}
>> +
>> +static void test_drv_cb_fini(void)
> 
> fini stands for "finito"? :)

No, for finish :) 
http://ftp.math.utah.edu/u/ma/hohn/linux/misc/elf/node3.html

> Anyways, an alternative solution for this is also here (probably coming
> from you too):
> https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg03517.html

Much better.  At least patches 7-8 from that series have to be salvaged, 
possibly 10 as well.

Paolo



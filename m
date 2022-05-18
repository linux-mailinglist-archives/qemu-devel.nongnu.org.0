Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0751252B45C
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 10:07:04 +0200 (CEST)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrEhv-0001cr-7r
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 04:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEdn-0008PL-Fa
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrEdj-0003UK-75
 for qemu-devel@nongnu.org; Wed, 18 May 2022 04:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652860958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO8E2l/aapTWr//awTMwoKIM2VWZagf8e9tkMqm2woc=;
 b=Uq+Vtd8HbuOv/WcO48XLYR5jY2EXH83NC4BlcUWkfPKxbsqYyNLDXp9KHzUu4JcmTyv78v
 o+fBN+2wV1hsZqFsbe8Hwf5gbgwduRY2ym/a3jdeHjjX158nNOX12/OEYhBoXQtlnjNhQT
 +vuwW5E/sKZll0vwkUjowZwO4sIvtzI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-HgjuB8DjP3iaPqwZvWw4kQ-1; Wed, 18 May 2022 04:02:37 -0400
X-MC-Unique: HgjuB8DjP3iaPqwZvWw4kQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u11-20020a056000038b00b0020c9ea8b64fso316971wrf.2
 for <qemu-devel@nongnu.org>; Wed, 18 May 2022 01:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=UO8E2l/aapTWr//awTMwoKIM2VWZagf8e9tkMqm2woc=;
 b=iGtf0UR+kEn+QpfSK8QdaDTevJObmfyPdBxAk6J8IojKxsrdxPaIkwsE3Prw6EqugF
 9tb6rfpjzhwhdzX3PYMDj/nKEW88W8oc9IPOL6med7wew9oJiiD+cgaIn1aNdbdt7Ntr
 DMJ5vTEspvY1m1vA5u2MDXd5JvDeag6XKZuHsPyQzI9EVdb0qZoh2zqwta0mChebyuY+
 XldteArwV45DCIuKcfqqk/m/jOMJzDu5JVnD4JByH8Mktb9gTu1BW7DuhzlylceuPtPi
 wujHV2YgmG2UA8FofmTQ+Mg7a9k6PJtbPKwTyZ/UK0aGM3bft67x4f7Wr2KUd8N0aror
 mHOg==
X-Gm-Message-State: AOAM533oCuyLsX3mSFVVz/7Z+VVckRoAX9hTWbnUdCW0odkpNHRsEmC3
 xHwYTNLQaVpcz7/GrJwwGzRuMlBA1KDaiuzy5nfUIQpoHaUIqBv1hAUH3B1EE/b25hp9ku1JRfD
 TVvnUCmwlwE8BPN4=
X-Received: by 2002:a05:600c:ad3:b0:394:46ae:549b with SMTP id
 c19-20020a05600c0ad300b0039446ae549bmr35196648wmr.113.1652860956118; 
 Wed, 18 May 2022 01:02:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiyEXRDMVEX7RdQ1x3/fHssB2j/UgPms2Lr5sNWZhCpDndWRHucErUoazdKqgeL00RpgueXA==
X-Received: by 2002:a05:600c:ad3:b0:394:46ae:549b with SMTP id
 c19-20020a05600c0ad300b0039446ae549bmr35196635wmr.113.1652860955892; 
 Wed, 18 May 2022 01:02:35 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c415200b00394708a3d7dsm3642156wmm.15.2022.05.18.01.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 01:02:35 -0700 (PDT)
Message-ID: <159d28b9-3607-dd66-975b-bf004752cda4@redhat.com>
Date: Wed, 18 May 2022 10:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 3/9] target/s390x: add zpci-interp to cpu models
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org,
 david@redhat.com
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, mst@redhat.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-4-mjrosato@linux.ibm.com>
 <f7ca365a-1e7e-d0a8-8a0e-5cf744cd1d20@redhat.com>
In-Reply-To: <f7ca365a-1e7e-d0a8-8a0e-5cf744cd1d20@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/2022 10.01, Thomas Huth wrote:
> On 04/04/2022 20.17, Matthew Rosato wrote:
>> The zpci-interp feature is used to specify whether zPCI interpretation is
>> to be used for this guest.
>>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c          | 1 +
>>   target/s390x/cpu_features_def.h.inc | 1 +
>>   target/s390x/gen-features.c         | 2 ++
>>   target/s390x/kvm/kvm.c              | 1 +
>>   4 files changed, 5 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 90480e7cf9..b190234308 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -805,6 +805,7 @@ static void 
>> ccw_machine_6_2_instance_options(MachineState *machine)
>>       static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V6_2 };
>>       ccw_machine_7_0_instance_options(machine);
>> +    s390_cpudef_featoff_greater(14, 1, S390_FEAT_ZPCI_INTERP);
>>       s390_set_qemu_cpu_model(0x3906, 14, 2, qemu_cpu_feat);
>>   }
>> diff --git a/target/s390x/cpu_features_def.h.inc 
>> b/target/s390x/cpu_features_def.h.inc
>> index e86662bb3b..4ade3182aa 100644
>> --- a/target/s390x/cpu_features_def.h.inc
>> +++ b/target/s390x/cpu_features_def.h.inc
>> @@ -146,6 +146,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: 
>> Conditional-external-interception f
>>   DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
>>   DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
>>   DEF_FEAT(AP, "ap", MISC, 0, "AP instructions installed")
>> +DEF_FEAT(ZPCI_INTERP, "zpci-interp", MISC, 0, "zPCI interpretation")
>>   /* Features exposed via the PLO instruction. */
>>   DEF_FEAT(PLO_CL, "plo-cl", PLO, 0, "PLO Compare and load (32 bit in 
>> general registers)")
>> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
>> index 22846121c4..9db6bd545e 100644
>> --- a/target/s390x/gen-features.c
>> +++ b/target/s390x/gen-features.c
>> @@ -554,6 +554,7 @@ static uint16_t full_GEN14_GA1[] = {
>>       S390_FEAT_HPMA2,
>>       S390_FEAT_SIE_KSS,
>>       S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
>> +    S390_FEAT_ZPCI_INTERP,
>>   };
>>   #define full_GEN14_GA2 EmptyFeat
>> @@ -650,6 +651,7 @@ static uint16_t default_GEN14_GA1[] = {
>>       S390_FEAT_GROUP_MSA_EXT_8,
>>       S390_FEAT_MULTIPLE_EPOCH,
>>       S390_FEAT_GROUP_MULTIPLE_EPOCH_PTFF,
>> +    S390_FEAT_ZPCI_INTERP,
>>   };
> 
> If you add something to the default model, I think you also need to add some 
> compatibility handling to the machine types. See e.g. commit 84176c7906f as 
> an example.

Ah, never mind, it's there some lines earlier in the patch ... I guess I did 
not have not enough coffee today yet...

  Thomas




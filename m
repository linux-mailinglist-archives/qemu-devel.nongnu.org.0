Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3BE5E681B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 18:10:31 +0200 (CEST)
Received: from localhost ([::1]:50128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOmU-0008W5-GY
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obOH4-0002YH-NE
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1obOH3-0001BY-3j
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 11:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663861079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YJNntHnNVx9DjTtgGxZpzEAtUrjEucKjwFkoAo+C+4=;
 b=dVCEtRbrhcGYN4/fd3shP08F4I2S2Hwg/KJE5FUIqa1cmQlxSBaqUaxGuNJkquSf5Ri0rQ
 HSWm5JcmSINefcHL+zazwXm4IHRAT8CQiybeeL0xng5WCqNZd+jYZQfJIYgNIlXAOgU4Ke
 QY4GlCJF7B2LITglBYVCc5WY8PflIOA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-202-opB5z4pjOJCX3BwK1G4B3A-1; Thu, 22 Sep 2022 11:37:58 -0400
X-MC-Unique: opB5z4pjOJCX3BwK1G4B3A-1
Received: by mail-wm1-f69.google.com with SMTP id
 h133-20020a1c218b000000b003b3263d477eso4220001wmh.8
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 08:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=4YJNntHnNVx9DjTtgGxZpzEAtUrjEucKjwFkoAo+C+4=;
 b=eyjpggHtK9QNkB14PlLEaaTUJcCtSvvTHWjZrpK6B2o+iOJq5FxdA2SJ5r2yL0G8bz
 yodctCQ42MgLgXcf/mIW8zu4+5U4SUdwbDGPv+xn4bn3/oolZ7hFs/P3FzQgQnlUnipk
 wkNJ3pdi0oR1nkvSPW2WWRKRn51IbadPYSz5NbFBi1nRCLyksLF6QcnzlPJRgm4AxhmE
 ByHAx0PfSt8prTC4x+SWM4E5GYnBab9JwXC0guaSw2Q6c7RuVdQTFo7chagldFxw20Dx
 F3hKjCjGT2eQWBabT2SO3h82jUpLA6VxRMpJpQD/uoN9kxwJgrFDC2IgIhef1faAzfo5
 bfYw==
X-Gm-Message-State: ACrzQf3cACG8v853VDWpOAcbT8AnhIUrtQ/nNUqI2I9GVcVr+2ZLJR/t
 S6x8Yd1XLMaiG0fAhAI3I+LeORST7wcm2DCOOVg7PWOUbyjJzDosIASI9WQ6dW/VND8FMS82hzY
 NAs9vPpwNabGEs9Q=
X-Received: by 2002:adf:ff85:0:b0:228:c365:de29 with SMTP id
 j5-20020adfff85000000b00228c365de29mr2385880wrr.415.1663861077324; 
 Thu, 22 Sep 2022 08:37:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7MjsGw5iPt7hQ7OdJ/oVBCjMRO24VUc8TUHsWT5YUGxNyJ56vyHvd309RCWlVhrFvaL5H4gg==
X-Received: by 2002:adf:ff85:0:b0:228:c365:de29 with SMTP id
 j5-20020adfff85000000b00228c365de29mr2385865wrr.415.1663861077011; 
 Thu, 22 Sep 2022 08:37:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f?
 (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de.
 [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003a5c244fc13sm6602549wms.2.2022.09.22.08.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 08:37:56 -0700 (PDT)
Message-ID: <1f7cbb94-d319-237e-6ad6-40dbf1cf7f94@redhat.com>
Date: Thu, 22 Sep 2022 17:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 1/2] target/s390x: support SHA-512 extensions
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <20220921100729.2942008-1-Jason@zx2c4.com>
 <793e6018-da21-2247-1348-ad0e62030e25@redhat.com>
 <YyxyxCZH4X5n7Rdy@zx2c4.com>
 <5a8f56a5-50ec-01f3-094f-b1213bb29e56@redhat.com>
 <cd8de41e-3401-5e24-4112-47a5a6f8cbb4@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <cd8de41e-3401-5e24-4112-47a5a6f8cbb4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.893, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22.09.22 17:36, Thomas Huth wrote:
> On 22/09/2022 16.51, David Hildenbrand wrote:
> [...]
>> Thanks. I'll resend this patch only as reply to your original one,
>> so Thomas can easily pick it up (or add more feedback :)).
> 
> We're also missing the machine compat handling ... could you
> add something like this on top:
> 
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -803,8 +803,11 @@ DEFINE_CCW_MACHINE(7_2, "7.2", true);
>    
>    static void ccw_machine_7_1_instance_options(MachineState *machine)
>    {
> +    static const S390FeatInit qemu_cpu_feat = { S390_FEAT_LIST_QEMU_V7_1 };
> +
>        ccw_machine_7_2_instance_options(machine);
>        s390_cpudef_featoff_greater(16, 1, S390_FEAT_PAIE);
> +    s390_set_qemu_cpu_model(0x8561, 15, 1, qemu_cpu_feat);
>    }
>    
>    static void ccw_machine_7_1_class_options(MachineClass *mc)
> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
> --- a/target/s390x/gen-features.c
> +++ b/target/s390x/gen-features.c
> @@ -744,13 +744,16 @@ static uint16_t qemu_V7_0[] = {
>        S390_FEAT_MISC_INSTRUCTION_EXT3,
>    };
>    
> +static uint16_t qemu_V7_1[] = {
> +    S390_FEAT_VECTOR_ENH2,
> +};
> +
>    /*
>     * Features for the "qemu" CPU model of the latest QEMU machine and the "max"
>     * CPU model under TCG. Don't include features that are not part of the full
>     * feature set of the current "max" CPU model generation.
>     */
>    static uint16_t qemu_MAX[] = {
> -    S390_FEAT_VECTOR_ENH2,
>        S390_FEAT_MSA_EXT_5,
>        S390_FEAT_KIMD_SHA_512,
>        S390_FEAT_KLMD_SHA_512,
> @@ -876,6 +879,7 @@ static FeatGroupDefSpec QemuFeatDef[] = {
>        QEMU_FEAT_INITIALIZER(V6_0),
>        QEMU_FEAT_INITIALIZER(V6_2),
>        QEMU_FEAT_INITIALIZER(V7_0),
> +    QEMU_FEAT_INITIALIZER(V7_1),
>        QEMU_FEAT_INITIALIZER(MAX),
>    };
>    
> (otherwise I can also add it when picking up the patch)

He, I just added that already while testing :)

-- 
Thanks,

David / dhildenb



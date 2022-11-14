Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2E628DD7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:59:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiob-0000aS-Ti; Mon, 14 Nov 2022 18:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouig9-0006Od-1i
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouQw1-000277-OD
 for qemu-devel@nongnu.org; Sun, 13 Nov 2022 23:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668399540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QJJ3PB0BcSyOgmHfEoCo6xAB6agfK9XINjLTBq9Xr3I=;
 b=EfBmjDzmKfRAqC6YB+0FJy/tVOW5JtZiwZ/Eg0Aj1Urrv+L4r0O5fDrYY19Rbc9fQbFOAE
 wqOo4AHQOZfUazAXCNbYZ74nq/SdVl5sw/QGsVpVr6eG6mMaabSfgYYX1KAe6XblzQ5I9e
 +f5C/2H4YmsvSwpIw0qkrnPmx4xiDIY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-417-e5lCra_hPc6DbMYM0z7uIA-1; Sun, 13 Nov 2022 23:18:59 -0500
X-MC-Unique: e5lCra_hPc6DbMYM0z7uIA-1
Received: by mail-qk1-f199.google.com with SMTP id
 x2-20020a05620a448200b006fa7dad5c1cso10149577qkp.10
 for <qemu-devel@nongnu.org>; Sun, 13 Nov 2022 20:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJJ3PB0BcSyOgmHfEoCo6xAB6agfK9XINjLTBq9Xr3I=;
 b=k2jHHp8gu78Se7jqIEUGTKEMzPqAMCq4qf7w1AlQ38JgdaPSo7ylhiTsqMdK7/0vPr
 um23eub0DrKimIrH3UxzjIoxoWViarMEAuOzl2Z8uB3duQujkzcHLqZtbQvlsUD7/buH
 HR1Rl7gLP+OpPIRW3+hZsRalYMGhJDtsrTMGMaFEvvq8fGiul8O+DOm7jqlX0NZ5Qzmy
 BFFl1HuyyfSo4imADISARoGhNuF+3Gn8ZUr33OSPJ4bryBFzCYRTCHOXSJJoe0T3c8i2
 x4ed5zWLJiMtWXfoLkdVfknisqm4qWRnK//j8XtivriN6O1U6QCzqnGxKMG0WsnhwqS8
 qDqg==
X-Gm-Message-State: ANoB5plX5eqEKwC6OTFyjhHzrsIJcZ8BnilZD22Dnv+/7B2uk1/bGiAw
 naZULHPNxrI8WaFZKKczi+1FmsdhTIWe4Q2GlF6lE3aouoTn1a7ck2QuomiCVyftuvcTZDrU2jQ
 J6ZXarzLu8YZG3Qc=
X-Received: by 2002:ac8:4258:0:b0:39c:df33:c189 with SMTP id
 r24-20020ac84258000000b0039cdf33c189mr10936628qtm.498.1668399538531; 
 Sun, 13 Nov 2022 20:18:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4c7kSc8WUIe9KX63u64aXvOhLO+JpiLid78aaU0Kwa2jIMJBrzq2MezzOVFbOEWEzKU+SKlQ==
X-Received: by 2002:ac8:4258:0:b0:39c:df33:c189 with SMTP id
 r24-20020ac84258000000b0039cdf33c189mr10936613qtm.498.1668399538268; 
 Sun, 13 Nov 2022 20:18:58 -0800 (PST)
Received: from [192.168.8.100] (tmo-084-81.customers.d1-online.com.
 [80.187.84.81]) by smtp.gmail.com with ESMTPSA id
 bi31-20020a05620a319f00b006bb366779a4sm5866521qkb.6.2022.11.13.20.18.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Nov 2022 20:18:57 -0800 (PST)
Message-ID: <ebf26a93-761d-ad29-2f74-08d77b003010@redhat.com>
Date: Mon, 14 Nov 2022 05:18:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] s390x: Fix spelling errors
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>
References: <20221111182828.282251-1-thuth@redhat.com>
 <501d0b54-41b6-9b7a-9b15-dc59c1ca0b82@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <501d0b54-41b6-9b7a-9b15-dc59c1ca0b82@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

On 11/11/2022 19.38, Stefan Weil wrote:
> Am 11.11.22 um 19:28 schrieb Thomas Huth:
> 
>> Fix typos (discovered with the 'codespell' utility).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/s390x/ipl.h                      | 2 +-
>>   pc-bios/s390-ccw/cio.h              | 2 +-
>>   pc-bios/s390-ccw/iplb.h             | 2 +-
>>   target/s390x/cpu_models.h           | 4 ++--
>>   hw/s390x/s390-pci-vfio.c            | 2 +-
>>   hw/s390x/s390-virtio-ccw.c          | 6 +++---
>>   target/s390x/ioinst.c               | 2 +-
>>   target/s390x/tcg/excp_helper.c      | 2 +-
>>   target/s390x/tcg/fpu_helper.c       | 2 +-
>>   target/s390x/tcg/misc_helper.c      | 2 +-
>>   target/s390x/tcg/translate.c        | 4 ++--
>>   target/s390x/tcg/translate_vx.c.inc | 6 +++---
>>   pc-bios/s390-ccw/start.S            | 2 +-
>>   13 files changed, 19 insertions(+), 19 deletions(-)
>>
>> diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
>> index dfc6dfd89c..7fc86e7905 100644
>> --- a/hw/s390x/ipl.h
>> +++ b/hw/s390x/ipl.h
>> @@ -140,7 +140,7 @@ void s390_ipl_clear_reset_request(void);
>>    * have an offset of 4 + n * 8 bytes within the struct in order
>>    * to keep it double-word aligned.
>>    * The total size of the struct must never exceed 28 bytes.
>> - * This definition must be kept in sync with the defininition
>> + * This definition must be kept in sync with the definition
>>    * in pc-bios/s390-ccw/iplb.h.
>>    */
>>   struct QemuIplParameters {
>> diff --git a/pc-bios/s390-ccw/cio.h b/pc-bios/s390-ccw/cio.h
>> index 1e5d4e92e1..88a88adfd2 100644
>> --- a/pc-bios/s390-ccw/cio.h
>> +++ b/pc-bios/s390-ccw/cio.h
>> @@ -20,7 +20,7 @@ struct pmcw {
>>       __u32 intparm;      /* interruption parameter */
>>       __u32 qf:1;         /* qdio facility */
>>       __u32 w:1;
>> -    __u32 isc:3;        /* interruption sublass */
>> +    __u32 isc:3;        /* interruption subclass */
>>       __u32 res5:3;       /* reserved zeros */
>>       __u32 ena:1;        /* enabled */
>>       __u32 lm:2;         /* limit mode */
>> diff --git a/pc-bios/s390-ccw/iplb.h b/pc-bios/s390-ccw/iplb.h
>> index 772d5c57c9..cb6ac8a880 100644
>> --- a/pc-bios/s390-ccw/iplb.h
>> +++ b/pc-bios/s390-ccw/iplb.h
>> @@ -81,7 +81,7 @@ extern IplParameterBlock iplb 
>> __attribute__((__aligned__(PAGE_SIZE)));
>>   #define QIPL_FLAG_BM_OPTS_ZIPL  0x40
>>   /*
>> - * This definition must be kept in sync with the defininition
>> + * This definition must be kept in sync with the definition
>>    * in hw/s390x/ipl.h
>>    */
>>   struct QemuIplParameters {
>> diff --git a/target/s390x/cpu_models.h b/target/s390x/cpu_models.h
>> index 74d1f87e4f..15c0f0dcfe 100644
>> --- a/target/s390x/cpu_models.h
>> +++ b/target/s390x/cpu_models.h
>> @@ -24,13 +24,13 @@ struct S390CPUDef {
>>       uint8_t gen;            /* hw generation identification */
>>       uint16_t type;          /* cpu type identification */
>>       uint8_t ec_ga;          /* EC GA version (on which also the BC is 
>> based) */
>> -    uint8_t mha_pow;        /* Maximum Host Adress Power, mha = 2^pow-1 */
>> +    uint8_t mha_pow;        /* Maximum Host Address Power, mha = 2^pow-1 */
> 
> 
> This comment could use lower case words.

I thought so, too, but I guess the author used capital letters on purpose to 
make sure to explain the "mha" acronym this way ...

Anyway, I don't mind, we can also switch to lower case here, if that's 
preferred.


>> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
>> index 2aefa508a0..5f0adb0b4a 100644
>> --- a/hw/s390x/s390-pci-vfio.c
>> +++ b/hw/s390x/s390-pci-vfio.c
>> @@ -313,7 +313,7 @@ retry:
>>   /*
>>    * Get the host function handle from the vfio CLP capabilities chain.  
>> Returns
>>    * true if a fh value was placed into the provided buffer.  Returns false
>> - * if a fh could not be obtained (ioctl failed or capabilitiy version does
>> + * if a fh could not be obtained (ioctl failed or capability version does
>>    * not include the fh)
>>    */
>>   bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 7d80bc1837..2e64ffab45 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -354,7 +354,7 @@ static int s390_machine_protect(S390CcwMachineState *ms)
>>       }
>>       error_setg(&pv_mig_blocker,
>> -               "protected VMs are currently not migrateable.");
>> +               "protected VMs are currently not migratable.");
> 
> 
> This might again be a different British / American spelling.

Maybe ... I did some internet search but I did not found anything reliable 
apart from some few pages saying that "migrateable" is an alternative 
spelling for "migratable". Anyway, the latter seems much more common, so I 
think we should switch to it - also to silence codespell here in future runs.

  Thomas



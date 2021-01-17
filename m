Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E872F9414
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 18:00:17 +0100 (CET)
Received: from localhost ([::1]:42390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1BPU-0005EO-J7
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 12:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BNe-0004nd-QX
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:58:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1BNd-0005DV-69
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 11:58:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id q18so14239051wrn.1
 for <qemu-devel@nongnu.org>; Sun, 17 Jan 2021 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z4iGE15bjDwkQeDXz4tlv+jpuQZpRRHLVkokO7H8oDA=;
 b=EKgi6tgDOQhJpy+JkSaR7bTZWgPMaIAD0ztTknSSDeV1g3zn1+ENuNlA4YN36OSZH+
 856FoiEayWAnECRN9X4D4PPgF05cDsFo0PgeC06tM6acXNEn5YCNC5wb6M+XNOVWB9yU
 6/V3zNyszJVLyOjaT0okl1ox6Knp4Rk5K8MvdyMavh1GI4g0+QP+JAIrnfJEL1smByI6
 Cos6tSHvgYv9O4IynG9L5SBTQD+TN3i1ebYfSXSgju2ieA0EHUuFwnLgOU4v3bBlGlB5
 MHa5Bqt0DPnBBRQStmhjH3HTKiDftIgahKq/77aeghxi/nhJ2Rb2xhekK6I0oDO8N2QU
 eV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z4iGE15bjDwkQeDXz4tlv+jpuQZpRRHLVkokO7H8oDA=;
 b=AlYyP7y+Ur8LjoyfB1m3rIdGsem0UuGuqboZTHiXracngtyufRIZSOhoBYeVzK9K9j
 PYnLFQJEsdj9Y0wSSUSaF5ru8iAO/C8G5nsN1EWXTpvnzm/nBR9tY4PXbHQBMxaWSVxr
 xbF+mWtCcjrjs7O92b+kIktqmi3jfzGvcfLPRgECrw6lwdoRwMbp7otKPpkVaY68h+WV
 bdU+fDcQxtehVJ/15EwbQpGIhynVFqtQGB6wl4Hqo/JK5Nmkj/etVYFBC8KVH16cOh2j
 W//WllIaqLNJF7YTOSIvSAHHsh3zoST5bq0sS29oDgLKUDp4n5629Un0QwpM1paBsy03
 wBew==
X-Gm-Message-State: AOAM532etNth54Mpm86CAiGYFlGHmkrNHvDLdgl64s6h/027QvLSdHLe
 sSt+sqHHj5IhS5lzTZvvBN2enOmNOjI=
X-Google-Smtp-Source: ABdhPJxVPIUwjxsNk+w1wab4ksvnR5+iatMd6PYgrE9Wpa276ulf66hMib5kuCLQT6DQ2LmixCMcww==
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr21924452wru.96.1610902699288; 
 Sun, 17 Jan 2021 08:58:19 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b13sm22527855wrt.31.2021.01.17.08.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 08:58:18 -0800 (PST)
Subject: Re: [PATCH] softmmu/physmem: Hint notifier is not NULL in
 as_translate_for_iotlb()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210117160754.4086411-1-f4bug@amsat.org>
 <CAFEAcA8U74GifK08MtY8xU25EgfMxQf2kJO_Mn_yKeoabQokaA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1593ada3-1715-7363-deaf-04d61aee74bc@amsat.org>
Date: Sun, 17 Jan 2021 17:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8U74GifK08MtY8xU25EgfMxQf2kJO_Mn_yKeoabQokaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 5:47 PM, Peter Maydell wrote:
> On Sun, 17 Jan 2021 at 16:07, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> When using GCC 10.2 configured with --extra-cflags=-Os, we get:
>>
>>   softmmu/physmem.c: In function ‘address_space_translate_for_iotlb’:
>>   softmmu/physmem.c:643:26: error: ‘notifier’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     643 |         notifier->active = true;
>>         |                          ^
>>   softmmu/physmem.c:608:23: note: ‘notifier’ was declared here
>>     608 |     TCGIOMMUNotifier *notifier;
>>         |                       ^~~~~~~~
>>
>> Insert assertions as hint to the compiler that 'notifier' can
>> not be NULL there.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Yet another hole in our CI.
>> ---
>>  softmmu/physmem.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 6301f4f0a5c..65602ed548e 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -605,7 +605,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
>>       * when the IOMMU tells us the mappings we've cached have changed.
>>       */
>>      MemoryRegion *mr = MEMORY_REGION(iommu_mr);
>> -    TCGIOMMUNotifier *notifier;
>> +    TCGIOMMUNotifier *notifier = NULL;
>>      int i;
>>
>>      for (i = 0; i < cpu->iommu_notifiers->len; i++) {
>> @@ -638,6 +638,7 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
>>          memory_region_register_iommu_notifier(notifier->mr, &notifier->n,
>>                                                &error_fatal);
>>      }
>> +    assert(notifier != NULL);
>>
>>      if (!notifier->active) {
>>          notifier->active = true;
> 
> Is the assert() necessary to prevent the compiler complaining?
> Usually we don't bother if it's about to be dereferenced anyway.

Yes you are right, the assert() is not necessary. Simply initializing
the value silents the error.

Regards,

Phil.


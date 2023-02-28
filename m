Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230866A6265
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX8Sv-0000e7-7R; Tue, 28 Feb 2023 17:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8Ss-0000cD-RT
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:28:54 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX8Sr-0002Q6-8B
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 17:28:54 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bx12so8201666wrb.11
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 14:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677623331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e+Uoa9havPFpkGRSwJnaTYxQPKUfGPPt+Jit4IgbJQs=;
 b=MEN0q5agSTefijXYjNSnHP1SylbVRNaY5lzt0vpR7biI7wFbbpLeq+HmcPKOSzs6Zb
 CwhiuPNtzxGZexQCXDvPoZRzl4fSNRO/c+kP9yMa1H2XCOhlrNVR9xE0ESRkEraCtaDD
 CKCQONo1inAVc6Zfy2f9SpQ7XxI+RNZiLKxFiFzDTvQfkxYZ3swr9e8hXgfb5EZcswnX
 mG+0TrcC/GF922fiS8tY3gN1wqKdWWpRgcZzQBHkib35mezt9Yyez1XIN4iIfIqUL93f
 Rle36IyM7I5Fjs+75eyEpSunrNEAenVdKrMFwTcTT9R7A/DildlaYn1WHtJ0Re3fGCmJ
 gyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677623331;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e+Uoa9havPFpkGRSwJnaTYxQPKUfGPPt+Jit4IgbJQs=;
 b=mIiPa5pMH02XpF0J1ywHlMs9chlqxbreP5wIZ1yAr8PlGEyQbwbWU+O3PYVRMyNl9u
 t281k9PHyiO/kbh4A0wrFAC0nKaioeDxH+He9sEjMBE8+zNC1kbqRYLw1WWUiw1Jv+Ux
 mT9fpFIqHtYfi0iMe0HmjlYPII47ZntcWmFbXKcWRXgfxKHusR6NDwPYykUqCnJxoyU1
 I261qh7Z+H32OF6eGrOHYVnDflX/ErGWhGygYMTCsEFzWdb7uOnkEmsqnREUdRUwczRs
 F80OBTN2UUyBQsm+74Nx7E0l+jTyuKzh9K6x+mGEBiCDoeydchHUz0X3evOV2AdDlh0i
 KbAQ==
X-Gm-Message-State: AO0yUKWk8OaSgSc73ZSRg37pIHL+AmdkhTuzn4XPYY+cSs8fYIrGcvJ6
 7e572v/YPoQTLxzXh2677645Rw==
X-Google-Smtp-Source: AK7set8QPI2UIObttH3MhJVbuEjyM+P6TMo2kMuKJTjD7IVQYVwBX+e0KjXAnY1au7iwmDZvgNkE+g==
X-Received: by 2002:adf:cf04:0:b0:2c7:19c1:5557 with SMTP id
 o4-20020adfcf04000000b002c719c15557mr4027240wrj.64.1677623331614; 
 Tue, 28 Feb 2023 14:28:51 -0800 (PST)
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.166]) by smtp.gmail.com with ESMTPSA id
 u5-20020a5d6ac5000000b002c5a1bd5280sm10696129wrw.95.2023.02.28.14.28.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 14:28:51 -0800 (PST)
Message-ID: <c4a0c32c-413b-647a-6bdb-207559ca5c7f@linaro.org>
Date: Tue, 28 Feb 2023 23:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] hw/southbridge/piix: Use OBJECT_DECLARE_SIMPLE_TYPE()
 macro
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230210165754.34342-1-philmd@linaro.org>
 <20230210165754.34342-2-philmd@linaro.org>
 <6C95F114-3CC2-4258-8151-8CB678AA8DC3@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6C95F114-3CC2-4258-8151-8CB678AA8DC3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/2/23 22:35, Bernhard Beschow wrote:
> 
> 
> Am 10. Februar 2023 16:57:51 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
>> similarly to automatic conversion from commit 8063396bf3
>> ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> include/hw/southbridge/piix.h | 8 +++-----
>> 1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
>> index 0bf48e936d..a58bf13a41 100644
>> --- a/include/hw/southbridge/piix.h
>> +++ b/include/hw/southbridge/piix.h
>> @@ -29,7 +29,7 @@
>> #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
>> #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>>
>> -struct PIIXState {
>> +struct PIIX3State {
>>      PCIDevice dev;
>>
>>      /*
>> @@ -57,14 +57,12 @@ struct PIIXState {
>>      /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
>>      MemoryRegion rcr_mem;
>> };
>> -typedef struct PIIXState PIIX3State;
>>
>> #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>> -DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
>> -                         TYPE_PIIX3_PCI_DEVICE)
>> -
>> #define TYPE_PIIX3_DEVICE "PIIX3"
>> #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>> #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>>
>> +OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
>> +
>> #endif
> 
> The PIIX consolidation series drops the "3" for reuse by PIIX4. Do we really need this?

Unfortunately we do to be able to use the OBJECT_DECLARE_SIMPLE_TYPE()
macro which generates the typedefs. When I get to your patches later
this indeed ends as (PIIXState, PIIX_PCI_DEVICE).


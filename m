Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8FE41AF7D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 14:56:22 +0200 (CEST)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVCej-0000aL-DB
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 08:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVCZ1-0005pw-G1
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:50:29 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:34583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVCYv-0000g5-En
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:50:23 -0400
Received: by mail-qk1-x736.google.com with SMTP id i132so40629927qke.1
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
 b=QQ9nWeMK37xStcubx5e+t+SHBrmDrrKwfBTLAsALjR6DY5Ovu9JPPhirBPbfifK8fz
 NHDuAztWuYHEbVLtW62c2/+6COPAbNLeIIFH7l1YGntdchiD35RnsvDK7QvzqB19/6Ho
 L/GnECrVa8nyNWWAL6ffkYgS5FlMPrQdMWvgu2/MjfixA168PPKiIiqvKxj+GgY13Wh1
 DZzKBLmYWPyg03+zV3l9xfTKS7iR+eOq4fyYW1W8OGSotD/lJop0+GgutXAgLBUy+aCJ
 N8a1OQ475pkuEYpyHmYfIcvOlJcuWaKGaG2Qlek2ioKu9Ur433jNIJ8yRAljI8bBDxJt
 ywng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nifb82zOt4L1jbCwPB7F1P15sSowUBIE8D9lmMaSkIc=;
 b=PTTD9qFKg9CtcrN1FcIT/Dtt5IHR398X6YQg7ih99FGDaSGO4Clk7vXhALoKT1yUZ1
 lJrxBVscQU1QK2NiOIcuhp8U1lyXLPVtjyTgy67tWcP4rcOCblPQZzbjLvhIxcy6cG36
 rzMf6QaqMP7hpTBMt3NN1Fy6fnQ2oToBbNe/HjCzeKMJ3oOlXx6m23ZNJcBtZs6l+k2d
 o9sMRU+11RMwOcPOBwTMFJEuR/u4/7McFeTbTiGQM+6AaOJX7Zz0/x9avP3s0Kz/hMnn
 Zifhoi/9fGsKkLBXdmlNbcDFHy0RvlDr02QN46BKmEjQ0NEyBZ97JyHUA30CyVSfnId/
 8qLg==
X-Gm-Message-State: AOAM533LuiOaBPu5A71S8OVOpIUTgQx0knOW7PKBgCX4zq63UlK99/oz
 553BCBo5wtluj6NQ1Jn/cQkx0A==
X-Google-Smtp-Source: ABdhPJxwCmNVP4ejlJqyMRRsFa/BQaGuBqPrVm4WaB55TO71/7vz+lXnPtevUz/ZWeoo6QPQ0hWAgw==
X-Received: by 2002:a37:8085:: with SMTP id b127mr4957268qkd.449.1632833419774; 
 Tue, 28 Sep 2021 05:50:19 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-31-215-130.sc.res.rr.com.
 [24.31.215.130])
 by smtp.gmail.com with ESMTPSA id y22sm14358443qkp.9.2021.09.28.05.50.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 05:50:19 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
 <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
 <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9d3cceef-f385-5d0b-6b0d-2b7be17ce187@linaro.org>
Date: Tue, 28 Sep 2021 08:50:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 7:32 AM, Gerd Hoffmann wrote:
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 608d768a4371..72e4e3b5bb89 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -160,7 +160,9 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr);
>    * so this is generally safe. If more selective flushing is required
>    * use one of the other functions for efficiency.
>    */
> +#ifdef TCG_DIRECT_CALL
>   void tlb_flush(CPUState *cpu);
> +#endif

I'm pretty sure you can drop these ifdefs.  Just because there's a regular declaration for 
a function doesn't mean a subsequent inline definition does not apply.

And even if that didn't work, I'd be willing to trade inline expansion for not adding lots 
of ifdefs...

> +static inline void tlb_flush(CPUState *cpu)
> +{
> +    tcg.tlb_flush(cpu);
> +}

... these could just as well be out-of-line.


r~


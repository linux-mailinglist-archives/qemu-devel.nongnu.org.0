Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D523FEE77
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:13:00 +0200 (CEST)
Received: from localhost ([::1]:58872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmWZ-0001ob-Me
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mLmT8-000565-Ug
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:26 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mLmT7-0001jD-BZ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:09:26 -0400
Received: by mail-wr1-x430.google.com with SMTP id g18so2827077wrc.11
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
 b=XNzeVVZgMTwvaMW+hf4ZU151vXY/tds9syru115vJWY2H9xi7NvkSLiKaf12IA2hmz
 4Twf+2KjSav4TdlFitm4lyz20GrQtiikbfLSNIYfE+tALQeeymUgusxfeSVth6gQ3uX6
 S2/mAgq97r9x3T58N0MON1+gBwMJ95T3hJLwKW0v9kfgeYMkiDyBVBkCNZgt3ZDrL10V
 x+AQO8dZOJW4KNpgWEWmAkAmEqFTZQfRASG2II4Hc0vabX+EuGis/weTAS7UEXw6WjAn
 mjtM3K3OONcQPvFv6bO++KaTMt80vA00Zxrg9JxLRI505QmzbauyaXOT/enXybhA2Yea
 fEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BumYjg4HruxpBMDsswz5KhY/vuqWINMWr2ZsWHfVXuI=;
 b=KwUR1WQD1b8Y01pZVOPLmcMB3CjbCWZztshRhwhoEJe7nLxhQi9yYeDlWFe3fHSEUH
 3J64/0KsAfRXznoi4vOtlAGizkQTJHOUt7wWJRIa9Gg8gr22r9FB6wUFWcAd6uVFk+bg
 L3S39wGI4imUAuTonYktb0doXvFRqIRmDXuWgepG/kj/WKGEQwxdSngaMmsJ5NV3JKay
 0hpFMvgXHmy9fSq/QVOJHEtOpsV5yx1nUgVT5f35hgj9xCuJqh57OLQjApGep3iFn3Yg
 JAwp7lBb9V9kx6wt6otgXSf8n6iJ3WNQmfLK4NBWQhCp5HBaWvKrvheh4+1zRDOsY5nV
 AADg==
X-Gm-Message-State: AOAM530J1qsrzW7qh34iwiLf8Flt/DpjjVQ8O603jOsXa2oyT8sa/7jk
 NIrrOJh+ge92oNk/M/NDyQOOpA==
X-Google-Smtp-Source: ABdhPJw2kJqBm+YJ0W8PQQ91PAyB8vki1xITesAqGqbwujN1Yeq9boGiJSOCtAjS1XUUOw3zXsCIQg==
X-Received: by 2002:adf:8027:: with SMTP id 36mr3675503wrk.109.1630588162694; 
 Thu, 02 Sep 2021 06:09:22 -0700 (PDT)
Received: from [192.168.8.107] (61.red-176-80-253.dynamicip.rima-tde.net.
 [176.80.253.61])
 by smtp.gmail.com with ESMTPSA id f17sm1669167wmf.4.2021.09.02.06.09.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 06:09:22 -0700 (PDT)
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
Date: Thu, 2 Sep 2021 15:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831121545.2874233-11-kraxel@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.225,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Peter Xu <peterx@redhat.com>,
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 2:15 PM, Gerd Hoffmann wrote:
> diff --git a/target/i386/helper.c b/target/i386/helper.c
> index 533b29cb91b6..100add713c5d 100644
> --- a/target/i386/helper.c
> +++ b/target/i386/helper.c
> @@ -103,7 +103,7 @@ void x86_cpu_set_a20(X86CPU *cpu, int a20_state)
>   
>           /* when a20 is changed, all the MMU mappings are invalid, so
>              we must flush everything */
> -        tlb_flush(cs);
> +        tcg.tlb_flush(cs);

I think this is a mistake.

(1) If tcg module is not enabled, we should be able to make a direct call.

(2) A *proper* modularization would load the target/ stuff as a module as well, at which 
point this should be a call through the PLT, not an indirect call after a couple of 
indirect pointer loads.

So IMO we want to retain the direct function call syntax in all the uses.  I think you 
want to put wrapper functions doing the indirection somewhere -- possibly tcg-module.c.


r~


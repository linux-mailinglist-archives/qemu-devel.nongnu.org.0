Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1246932E0
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 18:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQtp6-0004rx-JQ; Sat, 11 Feb 2023 12:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtp4-0004rR-Gv
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:38:02 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQtp2-0002Ke-TA
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 12:38:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id d2so8358177pjd.5
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 09:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4rbJQDCt8h1x+iVBndNEn3VcW3E6iRbpdC9T4E9ylS4=;
 b=wj8saiGQ6cShy1/6aS1mGay6p+FMnbc/WaJg4Dwd+RWJ1iqcIT4pDpyIB7PJj6VePN
 30bgPMxGhvGpkEnBWJbU/TzSP9wXM55dthkVdl9coM7QejRgpGqtuVoXh2rRf4jBLqRm
 26F4njB5xbHKfTKsyiiUVUMU+M/J7CBS4vXQ0y99EnY62o/IyJ8ETO4MOH/diAEVo1hl
 tEA6oP/Oo0oERxMrWXIxue5ud6+r28KpfypDd3i62IwCu8ZxktDlHS1pGwCYNboqKBRd
 qd2WiGBmLKdrWYI2+J48RWRuWi/cUmW15GoKL+EFFgPmEGpVg8xaGU71NKSYUNIZN1Rw
 pG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4rbJQDCt8h1x+iVBndNEn3VcW3E6iRbpdC9T4E9ylS4=;
 b=iKqrSWM1fFA2W2+kj79htgM/7WkE93AGEWGqvXo2NRjWa6O3CtW4W8p8EvSPHqOYm8
 F0yu6afm+hOlAkUuE8r8Xdgig8eGdqj7/E16s4mPX46Y2SUiz0q6LqgWgrjtA+PiSqFB
 QzF7sWI4IfvZWpEbXCd7ifPCYjiita3ffK8v0PXlUEcsW0XfhkGjAW0mEibQ0C2oyZMG
 qH7/MGRJNLzGkRBhrq1UBPzPbK/yCaBkp8+R87JEBKmvUKfFHFm2s3Ehmt0DmAMJMeLI
 WKnTu+pjANekKLcKjygBzSnWlUqepsB344zPglbcnsT83awCWeG8FsqT+I9J9aDWoQe+
 4bXg==
X-Gm-Message-State: AO0yUKUjTg37kvPX5/sRAQkHIoyG8ydAttAZ3u9vuL8Mk7sLTEOq+uGZ
 T5WAr3qn+CMuMm2jxOU2pLykQw==
X-Google-Smtp-Source: AK7set+ZByX65SoQx4skXSGJNPGznAS8VQo6XhvffW0gWLdiHsDwOdcoFtN7agttiD7FewApWil5nA==
X-Received: by 2002:a17:903:189:b0:196:8cf4:9ca7 with SMTP id
 z9-20020a170903018900b001968cf49ca7mr21890154plg.19.1676137079312; 
 Sat, 11 Feb 2023 09:37:59 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 2-20020a170902ee4200b0019a88c1cf63sm1133222plo.180.2023.02.11.09.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 09:37:58 -0800 (PST)
Message-ID: <774de782-5513-adf0-7ec4-506703086115@linaro.org>
Date: Sat, 11 Feb 2023 07:37:53 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/11] hw/isa: Rename isa_bus_irqs() ->
 isa_bus_register_input_irqs()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-ppc@nongnu.org, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20230210163744.32182-1-philmd@linaro.org>
 <20230210163744.32182-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163744.32182-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/10/23 06:37, Philippe Mathieu-Daudé wrote:
> isa_bus_irqs() register an array of input IRQs on
> the ISA bus. Rename it as isa_bus_register_input_irqs().
> 
> Mechanical change using:
> 
>   $ sed -i -e 's/isa_bus_irqs/isa_bus_register_input_irqs/g' \
>     $(git grep -wl isa_bus_irqs)
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/hppa/machine.c    | 2 +-
>   hw/i386/microvm.c    | 2 +-
>   hw/i386/pc_piix.c    | 2 +-
>   hw/isa/i82378.c      | 2 +-
>   hw/isa/isa-bus.c     | 8 ++++----
>   hw/isa/lpc_ich9.c    | 2 +-
>   hw/isa/piix4.c       | 2 +-
>   hw/isa/vt82c686.c    | 2 +-
>   hw/mips/jazz.c       | 2 +-
>   hw/ppc/pnv_lpc.c     | 2 +-
>   hw/sparc64/sun4u.c   | 2 +-
>   include/hw/isa/isa.h | 4 ++--
>   12 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


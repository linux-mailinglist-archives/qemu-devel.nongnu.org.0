Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32151510EB5
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:24:46 +0200 (CEST)
Received: from localhost ([::1]:41426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXMD-00064Z-4S
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXL7-0005O9-PS
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:23:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXL6-0005Bl-AW
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:23:37 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso3799197pjb.1
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+2ejhXtcMp5XensGM+ArijZVHsPoXxp10y2I4vg5WBY=;
 b=OcIafg7xmoNkfFF2odQC+IOSKSKaCQG1Eir2jI4/h+8VUbXUjt+8dxYDqgGDR8t3Cj
 xhyAn6ORcbTPqsqhx/pIBUwM7Yag4PMBPSKtVo9S5GhKc26nYtm7rcAcTwlORC+2AhqP
 6ZkuHzEsFl1zHdHovvN95CtFwzi6DZpIXIaMy4hZ5rOSZZc8BxMptOKkBBqOrPxcC7St
 keNp0HixTNDsw7roVJZHyLiJYHHZv3nMbuYvD2wVkKOZS+jYZuoxI4I3CZ9e0gKdc5A4
 bS7kwYHxpNFZqM7AiGAoqWXp2Zd6WVXpx5UDtfl46dfo8xbIuPmQ7fP7flg0huxYxIEy
 m1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2ejhXtcMp5XensGM+ArijZVHsPoXxp10y2I4vg5WBY=;
 b=nO5JTY3QzE5Yq8YVy/8F1BSGYvbZM0+571YYEcGARiqar4N0T1sH567yLONoDLju+v
 fspj/OmHn4jPpR3uxbjnJ9V0hG0dqniGA8lcdwQM3sOtPOcTXAiIa3OAVmGgGOc9zuZd
 SWgvPYmjRqH4RSgE9teMbOIPiNK2e4/hZVtO3VRIErwWPK/kKiGABUAInhSiYLFNvohc
 FPe6+Q12gbXIZWm5wxltGjEY88HMNWdGM+t6mlwnbbqwg3qVWNr6vhpSDe5Pp7TFugx8
 zehMWGPqUpp/+/FeSYU0dRmVB9/oCftqjEp/O5bsRHqAJxC7kksgGi8sWm7vbYJMTnCc
 m58A==
X-Gm-Message-State: AOAM530nMECNREPeHCeYF+BoWSCiUrIo5M1UF/WWHoplZsMHRCGnEUs7
 wEcWaRzA0DKkL6iJ2XeNn+qhBhXQ79UdUA==
X-Google-Smtp-Source: ABdhPJxtIMPgoU0Ay8LQS/gAbwO2PrwX7d+Z3zojRWJoqeY49dGJZkq3+G45NfCwBULZn/uB2Z4w/w==
X-Received: by 2002:a17:90a:1602:b0:1d9:9ddd:1f8b with SMTP id
 n2-20020a17090a160200b001d99ddd1f8bmr10528685pja.130.1651026214839; 
 Tue, 26 Apr 2022 19:23:34 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a636808000000b00398e9c7049bsm14339158pgc.31.2022.04.26.19.23.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 19:23:34 -0700 (PDT)
Message-ID: <dd11435a-c68a-2b95-6dd4-63160c2db4ae@linaro.org>
Date: Tue, 26 Apr 2022 19:23:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 39/43] hw/loongarch: Add LoongArch load elf function.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-40-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-40-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -525,8 +525,12 @@ static const MemoryRegionOps loongarch_qemu_ops = {
>   static void do_cpu_reset(void *opaque)
>   {
>       LoongArchCPU *cpu = opaque;
> +    CPULoongArchState *env = &cpu->env;
>   
>       cpu_reset(CPU(cpu));
> +    if (env->load_elf) {
> +        cpu_set_pc(CPU(cpu), env->elf_address);
> +    }

I guess this is one way to do it, but I did show you a way completely within the board code.


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E22CAB5B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 20:03:17 +0100 (CET)
Received: from localhost ([::1]:58594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkAvk-0000ob-MM
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 14:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkAt5-0007sA-OM
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:00:31 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kkAt4-0008GD-9T
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 14:00:31 -0500
Received: by mail-wm1-x343.google.com with SMTP id h21so8305526wmb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BkDl/A+PycOPSBJRB+p5112R1xEvfZJ/PzdFB/6D6vo=;
 b=eA7KoiOYAMs2+kDnlt1xdtexjpYRXWi+X2/yFMwXIOYP24vdjnbWXFoTnDw7EJWNzH
 9gE14ybRSR5am1h3dvd9tus1qeuK1m39lmd6wdRmRutfaXATsUX2CMBUwHVahR7+JM47
 eG/ERatJCj5T7uNFtgSv9zI3dsQT/JBcJE1FY26LzVNT9yJUxmtW3/9umxjZd7QsVvoJ
 DtTEK607L5igtiKfN99ytaYutlrtGVYVX23yDQma74w1WYd6ry1xMQSqsnYiNmW5IOFV
 YdY4SXh45jyqyPAm8IHv1ksFFoGgtVIDVLTCTKYjPBUHbMFZT2UvXf2IUHgeisOeRIU+
 7+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BkDl/A+PycOPSBJRB+p5112R1xEvfZJ/PzdFB/6D6vo=;
 b=qSOj0SNsw6gzfz5migxkYIFd22Yxfl4nRkv90rWoX13OMNlIOxvpFo/bicMfAINff2
 Tjcvx1ABeSAmtSCcNNseMKBSyQ9WGJ1+aO4C3TBtA9+Lzbw7Mg+v+dkIM+h1Bz/S7KCX
 rFNt5uIqXbRZWkyRBc3a45z10dgedg6baK8W+g2KW8ySz8iSMlIQ4IHAlVx4ZSlclxqK
 iGbbzdNFpcGz5iJ2P9PG5sVd1aComn36+Yj3r2NokRlLaRpvL/jpspr/PI0BeLHW3g7q
 KaoU0a8ylOFkzyij8h/VPAF/h06QABVBMXzraYTGuQjs5q6bqDsr2k7ZUyZPjeLCTv8L
 lZ0w==
X-Gm-Message-State: AOAM530+f7y3+9JLKrhhBOZxjNoyEqdGgKeV5u0tCehUObVzNcMnEisR
 2PNdVfGDcc7I7YtbI1RkbZg=
X-Google-Smtp-Source: ABdhPJz+LY/XQzdGVOm8QJs2lUGgpmSK16ZIRfK0oaVpQyI2tJPLXw44SDU5LsUJpl1m2koDlUojtA==
X-Received: by 2002:a1c:9a57:: with SMTP id c84mr4024701wme.183.1606849228820; 
 Tue, 01 Dec 2020 11:00:28 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id r13sm771614wrs.6.2020.12.01.11.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 11:00:28 -0800 (PST)
Subject: Re: [PATCH v2 4/6] linux-user/elfload: Introduce MIPS
 GET_FEATURE_REG_EQU() macro
To: Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhc@lemote.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-devel@nongnu.org
References: <20201201133525.2866838-1-f4bug@amsat.org>
 <20201201133525.2866838-5-f4bug@amsat.org>
 <cfef71ab-5ada-9a29-b111-44e2e07fc3bd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2557ff77-2550-31e6-3d09-512e5fe85d6b@amsat.org>
Date: Tue, 1 Dec 2020 20:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <cfef71ab-5ada-9a29-b111-44e2e07fc3bd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/1/20 6:36 PM, Richard Henderson wrote:
> On 12/1/20 7:35 AM, Philippe Mathieu-Daudé wrote:
>> +#define GET_FEATURE_REG_EQU(_reg, _mask, _val, _hwcap) \
>> +    do { \
>> +        if ((cpu->env._reg & (_mask)) == _val) { \
>> +            hwcaps |= _hwcap; \
>> +        } \
>> +    } while (0)
>> +
>>  static uint32_t get_elf_hwcap(void)
>>  {
>>      MIPSCPU *cpu = MIPS_CPU(thread_cpu);
>>      uint32_t hwcaps = 0;
>>  
>> -    GET_FEATURE_INSN(ISA_MIPS32R6 | ISA_MIPS64R6, HWCAP_MIPS_R6);
>> +    GET_FEATURE_REG_EQU(CP0_Config0, 7 << CP0C0_AR, 2, HWCAP_MIPS_R6);
> 
> You'd need 2 << CP0C0_AR for the equality to match.

Oops...

> Would it be better to have the shift as a separate argument?

Yes, thanks!

Phil.


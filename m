Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF52C36CBC0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 21:36:18 +0200 (CEST)
Received: from localhost ([::1]:41042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbTVJ-0000Yy-Qg
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 15:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTTH-0008Jd-Nk
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:34:11 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbTTG-0004Cz-8S
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 15:34:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 l189-20020a1cbbc60000b0290140319ad207so5347773wmf.2
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 12:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZJKYGH/WFScK/h418HeLxCp4gZadmLPj/OoJerI1FDM=;
 b=LqFAj3Ep+f8pSYNNw9ODSC0Hwz3THLTfzc+jCwVLa4WMkv23dYrXpLAvVfm8s8nA1z
 lQC30kwduaSwcaipx8D7S+0nvUCX2e2qMhyAD6KOlwWLcO6SXuUZTzN9u2v3r32RLLLO
 zVPxzW6R2QSo82k25L+nL98k1nM1US88ImjFijk/cnU5ZzFBTR2+1qqxNJYpYCKA0+1I
 GSKrKCF6WhjyYF4StJb6CuxgqJ1G1f98M70jyLKqcQroWL5Fi6d5pGFuXiQ9qwUtcrSe
 +EVo+cMKq8D7B6jf7CAtsh+BnPUAFy3Lnw1CQvGT6KkcrUhPa6EejrJ6Fuy2HZ5HtblQ
 tRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZJKYGH/WFScK/h418HeLxCp4gZadmLPj/OoJerI1FDM=;
 b=jgkyy+G2ldn6LjIkXV7ZKjKyRkhNKxdb6NywoC1cLbTwp00MYmi0t9Os8izYOxIL4e
 EG+ji4qw8P+q32qf6gOXW5rtMVcuDLnQfA7C/jQeTMoBE6RBzup5Yp62d53hCPNRkegu
 twdnaPyzCIQYbczaAbgAWPjViRWZFJ41jpS4JMD04qaxIjA9+GFycx44X3lwICChIlrX
 hdrttwwNsg4jZ6AfWw6y775UyB8oPgsFLLc4AhLHckpfYoqMts2abUb25bNB7OWQvHcR
 vXCE+BA1/PvARRHzN2PjschgrTvPH3ytRHKR8tNQcNOoepnwdKiruUw3/llWEdh4xbMi
 3zgA==
X-Gm-Message-State: AOAM531CKKNc9GAfQhX/o395dsmfIuevYz90LVhvXrQbFIo2ky/SFvc1
 D0kodVMBbiqMG1X+/JZDXCc=
X-Google-Smtp-Source: ABdhPJxzCsDlfdXLaqhdNMJBIsDkVVpGxJ0K2bGEYXlksXqki3kj1G3mjv36tv2zMBCXdYCVUDLsnA==
X-Received: by 2002:a1c:4c07:: with SMTP id z7mr1763556wmf.96.1619552048879;
 Tue, 27 Apr 2021 12:34:08 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t6sm5099328wrx.38.2021.04.27.12.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 12:34:08 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Add missing CP0 check to nanoMIPS RDPGPR /
 WRPGPR opcodes
To: qemu-devel@nongnu.org
References: <20210421185007.2231855-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <72eccd4f-3166-5288-c45c-fa44b9e35b9c@amsat.org>
Date: Tue, 27 Apr 2021 21:34:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421185007.2231855-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 8:50 PM, Philippe Mathieu-Daudé wrote:
> Per the nanoMIPS32 Instruction Set Technical Reference Manual,
> Revision 01.01, Chapter 3. "Instruction Definitions":
> 
> The Read/Write Previous GPR opcodes "require CP0 privilege".
> 
> Add the missing CP0 checks.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied to mips-next.


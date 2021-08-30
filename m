Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601163FBEAC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 00:04:40 +0200 (CEST)
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKpOQ-00087X-Iu
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 18:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpKb-00069Y-EZ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:00:41 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mKpKZ-0007ab-7t
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 18:00:41 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso455411wmc.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QlZhMg+9qmSyjqa1KlO3ljOvdTtFTs8w4n0mbgmxwgI=;
 b=j3M80XEnqm8wjBDfmqnkOU05+23RWJ/gNzhHlvnPDAkxPJCEMKugzSqC1kWsGoRs5Y
 aDGIIMIZKP98mAUeHwiOTboJoP0VFRVTP2RiB75eFiERPoCYrz9HomOypMU1+XgnuWoJ
 7creBDXqSryvI8uzklbnXaNSdSvu3XJIUwygYWmt2LEIgJw7wc0nhrFs7aFmGMJTknkz
 5+An0IEmoFHDKQ7pEYOdTCMtfbRk5sbEGOJaQcoP6nyhH0/tiaS1qnkA4e0F1P3q7i2z
 zt73lu1Fbtlm7ksDxPNIQH+6u7wXtz9vuh0qk/1v1TpxKrXkNg4VwlTKi57tswE+NYAR
 5wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QlZhMg+9qmSyjqa1KlO3ljOvdTtFTs8w4n0mbgmxwgI=;
 b=H1UiOS+D0vqa8GBduzvNyGEGVot7dAgGXQPgDe3MnTBEGVdZxCp/zzNDl/HNg6dTO3
 IqlAx37IImt/rktq4F09q6xhFVGnUqeGm1uo8RRuc8+rjSp14LhQ26tIJsUVdHhHDLO5
 ZmGCW09sNoMyXIKJFuxMraY/5iQZo6WousAuTb1qx8QhbjBqGDDBS444i4E2ilBEcuLZ
 YcZlux9R+vJvtUKre1287zGEPDGhy2LfYIku99EGW5Zvnb75lyh6KRL9zuT4o1h+XdUk
 ACF2683Q9huwd14zcFRLYDrtZf3fz3k7rHpVgWqAzRGZ1st4tauP8N545i4rAuFSixYu
 71Rw==
X-Gm-Message-State: AOAM533UQBwJq+FF7v/bMcBAPWBJQUVtgJoCLKjmzilSWRaM3km5D5Gy
 pUCYMz4iyRoSdLd1tL4/V+RkGH95in0=
X-Google-Smtp-Source: ABdhPJyZSjXZWDsyxAZGrHAicxL8LVrmABXJLcCVLzRKRg8KmmK68z/BD4p9j8bx3HZWz+7rhBnGaQ==
X-Received: by 2002:a05:600c:4b88:: with SMTP id
 e8mr1032567wmp.164.1630360835221; 
 Mon, 30 Aug 2021 15:00:35 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id y11sm19910512wru.0.2021.08.30.15.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 15:00:34 -0700 (PDT)
Subject: Re: [PATCH 00/48] tcg: optimize redundant sign extensions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210830062451.639572-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <520d8314-501f-a4c8-1a00-ec329a0cc7ee@amsat.org>
Date: Tue, 31 Aug 2021 00:00:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.932,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 8/30/21 8:24 AM, Richard Henderson wrote:
> Currently, we have support for optimizing redundant zero extensions,
> which I think was done with x86 and aarch64 in mind, which zero-extend
> all 32-bit operations into the 64-bit register.
> 
> But targets like Alpha, MIPS, and RISC-V do sign-extensions instead.
> The last 5 patches address this.
> 
> But before that, split the quite massive tcg_optimize function.

Looks promising after quick review. Do you have any comparison perf numbers?


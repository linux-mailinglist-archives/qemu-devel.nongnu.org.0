Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF331C330
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 21:47:32 +0100 (CET)
Received: from localhost ([::1]:54920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBkmJ-0004sY-9K
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 15:47:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkki-0004Nf-Jn
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:45:52 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBkkh-0006uC-5H
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 15:45:52 -0500
Received: by mail-pg1-x52d.google.com with SMTP id t26so4898552pgv.3
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dirmK9AFdO3CDsEyFHxvoJ11C9iaAOoiQtEdGkiSGH4=;
 b=DgA4zIyhY+7UqXbE/04EvrM7mLvQr3lkQ6fv/CmdgcWeSlBvvTGbcO9Rua+tS6RvVl
 5CE0na1mH/GdHIAuoaeVaFt7S062LF2KirsCFtcd/vFHOdKAW7Obl3IyavYgCt9sZZMp
 BuKKH/eZvYuixNhu5DtzR0GXfdR4E4L+WdinmWlirWjaxxc5efwn3ukWoMrlUupfwfkh
 MlysvVGu1sotYuS4MwFWsImD58GNk1M7kzju7ohy7Xjo9EzH2RgzBWdmBJY5YY4gXhww
 qD6RwUjV4Ks6SCfGkTM08xgizEEEjIQEEafepcp0MgBeV+2CdE/DLOzE1EZQBduLD0P+
 98Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dirmK9AFdO3CDsEyFHxvoJ11C9iaAOoiQtEdGkiSGH4=;
 b=lhL8xR4cRg/3akY7bZzBCaioowUCJhQbyPn+W98qeoV5lQDFsBGf8zB1m1rlxP/Ioy
 mPbtA+inLACMGJPtIMKw0SDkTNNEUYxC907Cck9LvoAshQIguhfFvSuTgGCsS/JLlnGO
 0UTa4amzs2egJhJL/D8cuAH8rvd2Y9Xix3226D4la2aplmOIbsR6VEc77aPZCoox4GGG
 cUU42FUvkl9p/7LD+nDp4A2vehoOXogRqWnqVecKa8sQPHNFRbnykA+S1tFS8bpQZ2CC
 ESpkBJxk1IQBkr37GVB0mNOWQLFB6L54oxzXEHMZOb1InYz1VUnlbvBHhHVqZIhjp8zg
 MU/Q==
X-Gm-Message-State: AOAM530/0v9mcmaoNrHSEO3t0KSbWemQxg8/sgaXPU5T2dKmlEnexuIt
 XLwQSy35ZL+YCt1U1p5fqUDs2w==
X-Google-Smtp-Source: ABdhPJyv46yJ9msXvipVp2fpWY5jnv75u9YpoIaXLlGqlUAqO191H/mL6y20873AbDwqeElkjKcRlA==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr16586865pgl.67.1613421949605; 
 Mon, 15 Feb 2021 12:45:49 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id o124sm20109305pfg.108.2021.02.15.12.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 12:45:49 -0800 (PST)
Subject: Re: [RFC PATCH 23/42] target/mips/tx79: Introduce PEXE[HW] opcodes
 (Parallel Exchange Even)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-24-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1a8434e7-9996-f34a-1f7a-4bcebb672fee@linaro.org>
Date: Mon, 15 Feb 2021 12:45:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210214175912.732946-24-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Fredrik Noring <noring@nocrew.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/21 9:58 AM, Philippe Mathieu-Daudé wrote:
> +    tcg_gen_mov_i64(ax, cpu_gpr[a->rt]);
> +    if (a->rd != a->rt) {
> +        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
> +    }
> +    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 32, 16);
> +    tcg_gen_shri_i64(ax, ax, 32);
> +    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 0, 16);

  mask = tcg_constant_i64(0x0000ffff0000ffffull);
  tcg_gen_rotli_i64(x, t, 32);
  tcg_gen_and_i64(d, t, mask);
  tcg_gen_and_i64(x, x, mask);
  tcg_gen_or_i64(d, d, x);


r~


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E8D256AE2
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 02:19:13 +0200 (CEST)
Received: from localhost ([::1]:32890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCB3w-0006wb-GQ
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 20:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCB2y-00068y-3M
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 20:18:12 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:40237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kCB2v-0006hP-Nv
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 20:18:11 -0400
Received: by mail-pg1-x533.google.com with SMTP id h12so2292481pgm.7
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 17:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ms7mOU8z63Af1AeL2eZnqji8xkbpsjvppZVJEXUAR8w=;
 b=N6adRlqGJOdClqJFGfSMG8ygekmeqOaABtbaw0/y/7gsJ3nbQScZ+c59ZUPhy3aroY
 GewgGkamRB56ZxpU70QKDTWnOKxSyno5MpvFRIDdNyeeQYuWGTgKcp4OfxcBd40oVYs5
 tfpVmWOGBshzvGc5VjsmWVda1WFTwiZET2+TR2sWEYRFb3me5tbgnsrJhNNG2ecQbd3R
 qezpOGb1SZmdvcr9F/GpFK6WiTLQOqOGWV9sIyv3DRlgFJLdEMzZWqhYPghl71YGzGcM
 0W/yZNOVEkvfPaudPUqLwAyGUEpwRKlNSP+3baChO+QXtTPll8Gp8DCERlLGttIsA28O
 xY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ms7mOU8z63Af1AeL2eZnqji8xkbpsjvppZVJEXUAR8w=;
 b=CP9Xt0vK4Emcyebnryo/TBG8EAi1AVu5gkAwbLpRHsIBExZeNJFFAwbQzTmtgZc256
 uUouUNrlnvigmwLu2ZBuHezYcd8xMDgluBkAb9S2RQyvF95azbVz4RqvGoLXtwjqEvlH
 GqCMD/rDwu6c7k0mRk9tuBSi0S0i8W28GqKm00/QBQd4ViDmqsmNtna+QT5Pxf2y2ExL
 /69nFEXxV63E8EtTpUv7IyGEqyAx//PzFPp9lUzOKpf7tNXVCtM0CxX8RDwIRdfe6oIi
 JcTRTIdD7foauNzUwD6v1VZfmgyn9AqUpNr8vx+a/x5bRtKPfYvSU0F1/GQ32MLXI9HA
 09MQ==
X-Gm-Message-State: AOAM532SRkLFywS8Gy8hv/L3kk4d/UdwHmI+qAou6aR4CS/ywiiplYh/
 ORMgpGuvrgu01gvt7KAonOlptw==
X-Google-Smtp-Source: ABdhPJwKYItyEHrR5ruQ4ylzOWnD8drdJ0ZeTDFRX+KPEb1GXWX5v20cCQ9B8mAJi116tBP/4BCH+A==
X-Received: by 2002:a63:c74d:: with SMTP id v13mr3723273pgg.98.1598746688516; 
 Sat, 29 Aug 2020 17:18:08 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f17sm3029918pjp.46.2020.08.29.17.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Aug 2020 17:18:07 -0700 (PDT)
Subject: Re: [RFC v4 65/70] target/riscv: add "set round to odd" rounding mode
 helper function
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200817084955.28793-1-frank.chang@sifive.com>
 <20200817084955.28793-66-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4b4b103f-a601-c3c0-594e-b570d8ac56fc@linaro.org>
Date: Sat, 29 Aug 2020 17:18:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817084955.28793-66-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/17/20 1:49 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> helper_set_rounding_mode() is responsible for SIGILL, and "round to odd"
> should be an interface private to translation, so add a new independent
> helper_set_rod_rounding_mode().
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/fpu_helper.c | 5 +++++
>  target/riscv/helper.h     | 1 +
>  target/riscv/internals.h  | 1 +
>  target/riscv/translate.c  | 5 +++++
>  4 files changed, 12 insertions(+)
...
> @@ -44,6 +44,7 @@ enum {
>      FRM_RUP = 3,    /* Round Up */
>      FRM_RMM = 4,    /* Round to Nearest, ties to Max Magnitude */
>      FRM_DYN = 7,    /* Dynamic rounding mode */
> +    FRM_ROD = 8,    /* Round to Odd */
>  };

This needs a comment, or a rename, to indicate that it is private to qemu.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



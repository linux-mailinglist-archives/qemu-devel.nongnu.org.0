Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD83F5B15B9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 09:33:15 +0200 (CEST)
Received: from localhost ([::1]:60588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWC2E-00078O-Ao
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 03:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWBzQ-0003yZ-E1
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 03:30:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oWBzJ-0008R3-IV
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 03:30:18 -0400
Received: by mail-wm1-x331.google.com with SMTP id j26so10273963wms.0
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 00:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=mRNz/jJ10FJ/aDska8sh57k0O4s10qIr6quHwEH65XE=;
 b=om9fwDu3eINUfWTwKyL5VhoKhX1nDa7fg1ipNUbvWYPwhG4r5ATAn15CHL1wjzN6N4
 SLw0P7j122QNxeBQNQiPvUHnsDqnicG6XSR2XzKNxrFLN8hIOYoMRGGP6l5dL8GIBOIg
 DeQecPNSeirSoh526gz4U+D8AlQBQ/GynWL5s8sIcoG65p++5LAHFlVlySFpEzL5f5WA
 VBmBfNSken0LlrTbszCqhnMT/pPdosovev1r48DVGBiWHOgrAZHlgBmB0OV6PG/ElMS9
 s6vWHaCcHxAkUPZCFfDQGDx7/diyyKFCu3sVQYAJd2JZxgX6xPhCTz7Xy8EcleyqreEu
 JIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=mRNz/jJ10FJ/aDska8sh57k0O4s10qIr6quHwEH65XE=;
 b=VgpBDMjtsC33OeXqFa7+Ykv0c4IEREM0lFN3awQu4e/gwkwaBZ+V2dvcPXJG2JJeUb
 9nhFuHKUMOOE5Fg3xvP1/iRMUzmDpRX82QS8l7xky9CiWItTyh2vt2G2wRyBSjEcnTwM
 nsaFVBpo0aG0x1Lf/NHd9Djk3aVTyKoakuzBmLZUZBI6hVEp3zXvCwzWo0LLbeEaiqdy
 2sPhRfk7quYLXgUFU2uymlP1lalhLu221XFbPim29XhjaAN2ijB2QC27lSjrPtiEMixW
 S1tEKORfcvRaMJSgWQL5oVivpuhA0/48lQPNFTGcsJLddgyIfL5vkzqNkh2GaAV8aXXu
 /Uuw==
X-Gm-Message-State: ACgBeo3dxATmaejgb7CqG5jFadnV3IyHLcaQr0A1f/SF12fZR1cJ67IT
 gM/8Mc+qWm+gTV6DYNcaMC8fWw==
X-Google-Smtp-Source: AA6agR66w6IgsCQNQ65n2ij1MiujniY1IrKhIkY+agst6KdMRCn+My8KN21SgG1N4lC0ClfdnIx3wQ==
X-Received: by 2002:a7b:cb41:0:b0:3b3:34d6:189f with SMTP id
 v1-20020a7bcb41000000b003b334d6189fmr281295wmj.6.1662622201683; 
 Thu, 08 Sep 2022 00:30:01 -0700 (PDT)
Received: from [192.168.1.87] ([109.78.97.14])
 by smtp.gmail.com with ESMTPSA id
 q184-20020a1c43c1000000b003a5dde32e4bsm1615015wma.37.2022.09.08.00.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 00:30:01 -0700 (PDT)
Message-ID: <f6c98fb6-38f7-5747-0db6-aec2c77edd9a@linaro.org>
Date: Thu, 8 Sep 2022 08:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/11] RISC-V: Adding T-Head SYNC instructions
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-4-christoph.muellner@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220906122243.1243354-4-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.199,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/6/22 13:22, Christoph Muellner wrote:
> +NOP_PRIVCHECK(th_sfence_vmas, REQUIRE_PRIV_MHS)
> +NOP_PRIVCHECK(th_sync, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)
> +NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)

These should not be nops: th_sfence_vmas requires a tlb flush; th.sync{,.i} needs to end 
the current translation block; th.sync.{s,is} needs multiprocessor sync, which involves a 
call to async_safe_run_on_cpu.


r~


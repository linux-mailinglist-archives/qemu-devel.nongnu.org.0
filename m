Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA42339F9
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 22:48:49 +0200 (CEST)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1FTs-0004Iq-Er
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 16:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1FR9-0002Ch-Aw
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 16:45:59 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1FR6-0006sF-Ir
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 16:45:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id mt12so5262676pjb.4
 for <qemu-devel@nongnu.org>; Thu, 30 Jul 2020 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a/Hs2zme5w/U6zePKQMyVR1cnSSjPxPR90z0tx0Azus=;
 b=Zb5+V/k04C3hX8QF9FEiPFh+Ewa1WFGBjMyB7jkNhosDWUWUbyynZdNGRcrxpA41PJ
 mnDBpoNbEybdJrKhPRILxrEetn3H/g7ax8HDRmrDansR3JvAz6EE4B4LVMeA4CNE8RQT
 eesHVDRSpukSWrr4ABdJ0dLM0aE2u2kLc16ug0M1baq1x1FQLOlGUysvyE0SRgLbmzKy
 iGKmK6syRsxXVaCycE557MVe2UDMAiS8X71FFUrN2I0bl1PfeizMhxvKy+Qvvo3FThP/
 zF0jspWyviHXlIXMjWAoSEJD39Q1nGkElK8RlFoM9+8mmX3jUrTEZWp3/NT9RQwJ2GPj
 zYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a/Hs2zme5w/U6zePKQMyVR1cnSSjPxPR90z0tx0Azus=;
 b=QI0XoaOy6Uj1NUMNmEocbjoQArV9tgN1/eq8rw3vzCfpRM1j33DGfwt/TjXNn0lOH6
 /MQs/vugnUtP04gNU0TkEy+dPyp1w78s+U5lSCDZjbb/kIOGc5tIW24S4iRCruTTCks8
 E06G6BMFokDektCzzYa5NeXR3NgwjKJXY7g2XXnnUzE2hNh6P9nZ8SeaoHmM2CHZAC8d
 4qKV7/hHhctbWTO+u4BY1XZ7wr3KBtR8vBUmoR/mTOAaD0ev9mHrBglEE3QhK1sUS19H
 A8V+eAv/0KCO5cfK66UTi48Y8m1yov57CNvmB3RELLSVodtt+5dP74nFwqAIdIlnbs7d
 PBTw==
X-Gm-Message-State: AOAM532xf2qg9/pz4UX1EaawJTrcofRxElAjR/i9Q2uD4nDDftDRM97b
 prkEAo1rpNSv1ZkJ4MKibZdHvw==
X-Google-Smtp-Source: ABdhPJx7DfbgoARYUWMiJ1wAJ3V8GOqAYBAmYuRe4oqUrFWYlYLxnYteeg9rQjVYLPt5GSnm+J5VVQ==
X-Received: by 2002:a63:1f11:: with SMTP id f17mr630952pgf.217.1596141954960; 
 Thu, 30 Jul 2020 13:45:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 22sm6857151pfh.157.2020.07.30.13.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 13:45:53 -0700 (PDT)
Subject: Re: [RFC v2 44/76] target/riscv: rvv-0.9: single-width averaging add
 and subtract instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-45-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5638f6d3-860d-d543-9498-b63f1ac8e7db@linaro.org>
Date: Thu, 30 Jul 2020 13:45:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-45-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the following instructions:
> 
> * vaaddu.vv
> * vaaddu.vx
> * vasubu.vv
> * vasubu.vx
> 
> Remove the following instructions:
> 
> * vadd.vi
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/helper.h                   | 16 ++++++
>  target/riscv/insn32.decode              | 13 +++--
>  target/riscv/insn_trans/trans_rvv.inc.c |  5 +-
>  target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
>  4 files changed, 102 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +static inline uint64_t aaddu64(CPURISCVState *env, int vxrm,
> +                               uint64_t a, uint64_t b)
> +{
> +    uint64_t res = a + b;
> +    uint8_t round = get_round(vxrm, res, 1);
> +    uint64_t over = res < a ? ((uint64_t)1 << 63) : 0;

You know you can write this as

    (uint64_t)(res < a) << 63

right?

r~


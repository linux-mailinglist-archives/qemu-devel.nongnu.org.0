Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7172692040
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTq1-000752-CE; Fri, 10 Feb 2023 08:53:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTq0-00074e-4S
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:53:16 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQTpy-0001zX-Bu
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:53:15 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 a8-20020a17090a6d8800b002336b48f653so3804644pjk.3
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 05:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uScA4mz6AfaSrTRBkOSunfzjc9Xo8y/z+vRr1Vkzyak=;
 b=kX8DW2xrhS9fgEQP35BRnswpu2ifkww8ZyFmykUOG3m1fghA7GUGQkXJ9RorR6AmSh
 jZ9bm/e6TTGX51MvNHfcJofYNflYVh4Z0gh593zCLCcTYLwv7JIS5wzHJMvKpK6ccjOy
 lvuz0A0l+Q265hSb1gdpFFGsf7knb9GBZnG68p11yRncsTrWPpfO01PhiO6naIKnTWRr
 bKR4+oTlbpPiEIu0mGJIjiKeyN3KNsLZ6ZRMs7Jc0h2CV/S+AWj2alGV25TXLJWzdFuh
 IDEqMmFHUB9ver+eHXaVI0joTfTNg1MLr0YID1F8Wcp5sEnva2oKzaER8PIfxtREGYO+
 JnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uScA4mz6AfaSrTRBkOSunfzjc9Xo8y/z+vRr1Vkzyak=;
 b=EfzfTPK1sE/lKRiXV/r8zpWB+lEXCBqbBk98gBI25JKOkVV2GjV614X1Gouzsz+oMe
 RK6TuyhR4O/aG89f6ec7IKtJK7OfmT2MXpSJfFan4q8Gwjfh297tNeAPk+BxW+wjSE+F
 PM4nZcYpY6VJhtrCia5CvFgDmn1h5MPkBBTiBaRxACry0tFfep2tEIUiD1x19V8wgsHK
 p95ESAs3rgm9Dcgh48eAik6T7Eqb1nll2xh2GzfYByCMZSQGCLyR6zsIG6+FmoPZi6YR
 KDJ8aiQCP1P2o19XpKxxB6gDOeKxM5PCxksoxmK2M/izFc6zhgTitIXJ/8OsMilXhQM2
 WGuQ==
X-Gm-Message-State: AO0yUKVvCAahf1NKTDeNQYpuUHsfmKZCtbJh3uh+0VHmm3QuTArRkU4y
 eLFpjZbnipUnVcL+Aux+GPDqGT7/fIpvOaW3ei+CJA==
X-Google-Smtp-Source: AK7set8fs5f8iTOCZjlSGCnVH3gCg3+RDx5LCmWJLZoN+JmxQxuAVDkvcxi4mrkdwVzRkmKLdYFUrZbfyuQvdXx4ujU=
X-Received: by 2002:a17:90a:2c07:b0:233:48e0:95e1 with SMTP id
 m7-20020a17090a2c0700b0023348e095e1mr892328pjd.137.1676037192874; Fri, 10 Feb
 2023 05:53:12 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-20-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 13:53:01 +0000
Message-ID: <CAFEAcA9Dxsi8ejgUkk2Er51QcQL7JqBfHiC1VLc6Ry2T6V_9JQ@mail.gmail.com>
Subject: Re: [PATCH 19/22] target/arm: Implement GPC exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 24 Jan 2023 at 00:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle GPC Fault types in arm_deliver_fault, reporting as
> either a GPC exception at EL3, or falling through to insn
> or data aborts at various exception levels.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>




> +static unsigned encode_gpcsc(ARMMMUFaultInfo *fi)
> +{
> +    static uint8_t const gpcsc[] = {
> +        [GPCF_AddressSize] = 0b00000,
> +        [GPCF_Walk] = 0b00010,
> +        [GPCF_Fail] = 0b00110,
> +        [GPCF_EABT] = 0b01010,
> +    };
> +
> +    /* Note that we've validated fi->gpcf and fi->level above. */
> +    return gpcsc[fi->gpcf] | fi->level;

GPCSC is 6 bits, and you've only put the top 5 bits in the
gpcsc[] array here, so you either need to shift that right
by 1, or else have the array entries all have an extra 0
on the least-significant end.

The comment says gpcf and level have been validated, but
the code assumes that GPCF_AddressSize implies level 0,
which isn't validated.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


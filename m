Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4684A9E69
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:57:09 +0100 (CET)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2pY-0004tQ-Iu
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2UW-0000jV-9W
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:35:26 -0500
Received: from [2a00:1450:4864:20::434] (port=46750
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG2US-0001F5-EC
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:35:22 -0500
Received: by mail-wr1-x434.google.com with SMTP id q19so257284wrc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qfOEoL2p3EODXhsAn0HuLADXq9PLYg2b73QbP2iQd+4=;
 b=ip6HlRgUQ+iC2oLPlStLQo2u74Gxt+7f1sfwc3XfMLJagx4URDmBEe+BUKS6P4jRPh
 A9sIf0iHNuCUkdgCiSCxZkWQzBb26U1zSRmdi2JYXk28M/elDVRlrR9KFXVvYHTGbT4x
 hDn/Ka2Twj1FdCPHyQBHIuLBO/bVtwml3NyZrXW+KNjUpiNP7ciq0icN1FF9u9P42V6O
 U4wM6FRBw7BNs0hsQPUqG5vsS1RRFQow3dGkF4lMTsdektHH1p5cfAVMy0AhQGqmPeuS
 cG0g2VCPIVAL9DNyaDYnKVLp8UmP9DC5ssXquVNcxGuiiAlQttSqrwDZ6rdu2Ko5E6AU
 gYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qfOEoL2p3EODXhsAn0HuLADXq9PLYg2b73QbP2iQd+4=;
 b=gRh1azeVW2/zOjKmzGjNLEwVgT7cbONgNd41514xV+XqIctBdwKjMtREMA8HspzDpD
 nIiH6QYI3Tu6We8/+Mcu47Y4IhmVvVB8zzRRGdVfTVO2T9S8mAmP2EgbpEAieD8RTsL9
 RGoJGUtgu5DSccLctNP4I8i5zXg/lhCoqDN6iCdvLv3wZ3T+4Yk2ydMXldnD7TOD1SHM
 +RFt0JVPCsjPQiBgUR8bmiXnL3Iv7X3G5Iq8rDItPJbaXTPWVx7ae35TTEbN3KbY0gB+
 A6pU/VzT49AGUWB9wTWpupzl4XhTLJRTtH0DHCDl2lwfpupnthJhPIonEPQ3Xhk3anzn
 tbuA==
X-Gm-Message-State: AOAM5314USEh4mxy93tEupeuw5FJmCfrwUYae/taEnLI317i83mGfEmd
 ysjjhRXcf70Q4hwmLMY1jb8+UPSPw6ULkZ05M1YmbA==
X-Google-Smtp-Source: ABdhPJyR2A1EUBqdO3eBqKUzmEtH2r8LymzBaoYdOABqyAjxBslDURmzmosnOqKj9v159ad6Q2GFrCUzVB/uc3Sdfcw=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr3447460wrq.172.1643996112879; 
 Fri, 04 Feb 2022 09:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-2-richard.henderson@linaro.org>
In-Reply-To: <20220204070011.573941-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 17:35:02 +0000
Message-ID: <CAFEAcA88SP8LSXgegfeC=cnzLiezzoAFujaatq2E6fT1zfzGXA@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] tcg/sparc: Add scratch argument to tcg_out_movi_int
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Feb 2022 at 07:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will allow us to control exactly what scratch register is
> used for loading the constant.  Also, fix a theoretical problem
> in recursing through tcg_out_movi, which may provide a different
> value for in_prologue.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target.c.inc | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg)
>  {
> -    tcg_out_movi_int(s, type, ret, arg, false);
> +    tcg_debug_assert(ret != TCG_REG_T2);
> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);

Here we assert that 'ret' isn't TCG_REG_T2, but in
tcg_out_addsub2_i64() we do:

           tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh);
and
           tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_T2, bh + (is_sub ? -1 : 1));

Otherwise looks OK.

thanks
-- PMM


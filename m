Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724E83CC6D7
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:36:25 +0200 (CEST)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4tr6-0006v8-DZ
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tpP-0004cI-9t
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:34:39 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tpN-00012J-SE
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:34:39 -0400
Received: by mail-ej1-x635.google.com with SMTP id hd33so21241735ejc.9
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YoYCO3dhMVBUip+An6H/5w/6LGA0I9NnHUXASn91iEU=;
 b=cwhmIboUWt5JU3YW+YO+tAp91etXcmY9tGzdHYRMv/FUWCrAK3PXKqSU9Hi8YLZKsD
 vyPdMjiT0wyV+k7xJK/ZZ3UcpDiI7q5Ejg+ePjF4iNSHi7nbYGPmjA+jktTVGP2ktn++
 /dkkkz2ocJS/GzSrmotnGMR53nHmovvtPrASKPQNSIcvDkp5qDMEBfmX4ralP4aKIsk3
 7BDfy7sEsO1xxHHvr2EPkmLTXi8GviuRVWrG0tt5CfuQBDwQRjQifdHOB5cCS/1racAH
 J98ZgrWzCil7ASxkadG0oZBnd6sh3LdUMSIHX1wtHhHWW/9kebSXf7ClyaX0xF0rl5wm
 Qtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YoYCO3dhMVBUip+An6H/5w/6LGA0I9NnHUXASn91iEU=;
 b=Xaoze2Ib5GUBbzsoqlzd6R+HW9mMLjUc+Ayr+tOhJCKw7Cu3VJI7S3r9un3ztZ2s40
 ZkqRDcm0Jf6k+Wsx62C0kxrENavEhi2Gn+vmbWhKxgWV3yIH0TBUeiVpwfGYtNLECeSE
 tCBeRVGLiiyMe0u9qectOAZ4UzFOfOfQMRnZNTsCdkjXcwxN6191ENvKCPGDowy6XScG
 wVZdLvI7tubccvErGX5nMjY/CEo3mWv7QbYAFjIzcWf+fs11+mq1c5t0qoYDK5uOXGtq
 RnYN8PitRE23ASjgl1s6L1CrcJTc2OvqIKJKxcjT4Y3JZBTwf/Who9agIjB+ChDsTf6x
 JPcA==
X-Gm-Message-State: AOAM533c9JsS6KkPYWYEDWq6kCPeNVhSwrHMprE9uDbbgojurAlMggZw
 yB+6pgxo1KZkrP6rOUJPqrzbjiz6feASjh6SiTmMhw==
X-Google-Smtp-Source: ABdhPJwsJHb+78SIJm2k49QHTeDWiQTVk4PLM2YupjTgm1E2O7rI4vHja5NpcZOP52uykSewfln90H2abSdcinsaNrs=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr19472218ejc.4.1626564876452; 
 Sat, 17 Jul 2021 16:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210717221851.2124573-1-richard.henderson@linaro.org>
 <20210717221851.2124573-10-richard.henderson@linaro.org>
In-Reply-To: <20210717221851.2124573-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Jul 2021 00:33:56 +0100
Message-ID: <CAFEAcA8V0aeLuX=UB0mUqmp5wgx+Vwn3E3rTd3EhK9DHk0_R7Q@mail.gmail.com>
Subject: Re: [PATCH v3 09/13] target/mips: Reduce mips_tr_breakpoint_check pc
 advance to 2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 17 Jul 2021 at 23:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The actual number of bytes advanced need not be 100% exact,
> but we should not cross a page when the insn would not.
>
> If mips16 or mips32e are enabled, the minimum insn size is 2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index fd980ea966..ef00fbd2ac 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -16192,7 +16192,7 @@ static bool mips_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cs,
>       * properly cleared -- thus we increment the PC here so that
>       * the logic setting tb->size below does the right thing.
>       */
> -    ctx->base.pc_next += 4;
> +    ctx->base.pc_next += 2;
>      return true;
>  }
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


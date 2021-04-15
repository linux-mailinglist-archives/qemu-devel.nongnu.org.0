Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423BA360A60
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:20:53 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1vP-0002tD-T7
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX1tv-0002ND-Ug
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:19:19 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX1tu-0002OP-6x
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:19:19 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u17so36841942ejk.2
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z/egrE6OhYbnHyUCrspoK8xcMuB+cOyXE70iDCJIb+M=;
 b=gbXmHmeVB5F2ETxhyPga2w0E8EBMAwWnWlbjRTTEDGwpGypa7GI39ZRGMKg6QcetK2
 vhOHjuq+zw9DeYKvj/CKAm7ZtNes4JAVtNiZrt+Xj9Dig1IXZHPtjNFjfmGoD3eqlaFm
 VbxK7dw1tNdyJRlIV94uMgmPJQtEcfl7QukBzd25RTtGswLu8YEj+Ld6VvtZiQ5laAXm
 8/8hnvB09K9sWtcHVlL1y6p0v0rfIYOR194sqq+8S4O/cPMqYy/28yj5TC0zFPMexRhI
 AoWP0vTW9log1RRgOr225Zb1nOttbp0c1tC1xejHvCcqDTX1pA5WOvzUjG0BmFBtI/GF
 YwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z/egrE6OhYbnHyUCrspoK8xcMuB+cOyXE70iDCJIb+M=;
 b=WzzRK6A9uT27Oqu58LV9vLMW/G43VwT2ImAz3bIxID+CZq1LIQ+rtdVBKmyrq5F8Uw
 e5UBslrfrwlcnnh3r/If0eNiNrXLbVSVWsV6ZzOvzm4cSGoM8rH+Ky5EBLJszsEz0RiC
 Yd02CCvJF0hmfzbAYQAZrMEmHfATJeNbXspvf5tl9ZkiaxUNlD8ha0TJTJqbNBm03mOi
 MkaiUTqpxfAsocjBKPhNYEDSKjStlMXmmZksn8sMQcZ0Q98s8IRBy6z82Ve98s3/Uele
 dJPdxNmYYS0n5pAC0v6dk9gDsNdllGCpwT1ArjMa2hoLYtICqYHasToIVONyp9j+AaqS
 nGFQ==
X-Gm-Message-State: AOAM533l7/fnbMu2nhjq0rZXaR6yF4YxRo3hUQF6hjYoFGg4+btgywfn
 WWnQtj7Q/2aDSPfK9SymcuwsBW6jfHmZUnwXFrlJLg==
X-Google-Smtp-Source: ABdhPJy4pBTl8dMoyJ/DVJZMDdpGzNUC2rvrSsYZaKyEGhAdsuw33JdhM2an7ADLjyeTFCcd5zgiXEQCn3ir/i7YTtE=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3426361ejg.482.1618492756156; 
 Thu, 15 Apr 2021 06:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
In-Reply-To: <20210218094706.23038-19-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 14:18:28 +0100
Message-ID: <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
Subject: Re: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Feb 2021 at 09:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> There is no real need to use CF_NOCACHE here. As long as the TB isn't
> linked to other TBs or included in the QHT or jump cache then it will
> only get executed once.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20210213130325.14781-19-alex.bennee@linaro.org>

Hi; I've just noticed that this commit seems to break the case of:
 * execution of code not from a RAM block
 * when icount is enabled
 * and an instruction is an IO insn that triggers io-recompile

because:

> @@ -2097,6 +2086,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>          tb_reset_jump(tb, 1);
>      }
>
> +    /*
> +     * If the TB is not associated with a physical RAM page then
> +     * it must be a temporary one-insn TB, and we have nothing to do
> +     * except fill in the page_addr[] fields. Return early before
> +     * attempting to link to other TBs or add to the lookup table.
> +     */
> +    if (phys_pc =3D=3D -1) {
> +        tb->page_addr[0] =3D tb->page_addr[1] =3D -1;
> +        return tb;
> +    }

we used to fall through here, which meant we called
tcg_tb_insert(tb). No we no longer do. That's bad, because
cpu_io_recompile() does:

    tb =3D tcg_tb_lookup(retaddr);
    if (!tb) {
        cpu_abort(cpu, "cpu_io_recompile: could not find TB for pc=3D%p",
                  (void *)retaddr);
    }

and since it can no longer find the TB, QEMU aborts.

thanks
-- PMM


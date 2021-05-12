Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D799637B8C9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 11:03:35 +0200 (CEST)
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgkmD-0003SE-NI
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 05:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkji-0001rC-FJ
 for qemu-devel@nongnu.org; Wed, 12 May 2021 05:00:58 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgkje-000673-Eq
 for qemu-devel@nongnu.org; Wed, 12 May 2021 05:00:58 -0400
Received: by mail-ej1-x636.google.com with SMTP id a4so33893786ejk.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SCeWcIdT0QPDMv2Vpp6YLFQgrh8sIwKUZV3woYqsN0Y=;
 b=cHbGCvl6341YKe5E2OhhRjJ85RIe0LAdSYO3PA3R0focIkX8v6TKF7/HcU/amc94j5
 ZUQUADmhN4AbGcbJ+oaagAxUlnW/Xf6UIRa+/R0/czgR1mwSpVmPvuR+tgLJmDDNfHpx
 Khf4J9w6Y1PS6VYphcubMyv9CC+pfX+K0fUbE8QC3+0WcGw3EV/bB26p7rPS8TVx8bFA
 Y2bjLJIJWZG+uF/HdIzwgPHcC4buMweTRUXBQZiRWU/xhFuXVnGieY2B0E1YclhfBf3G
 Kva43eskCI6/mG5AZeM2ILdM1ziOOODFnheUHeVLwWJcekLGnjt51AmTyBrgN56/cQiN
 CjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SCeWcIdT0QPDMv2Vpp6YLFQgrh8sIwKUZV3woYqsN0Y=;
 b=PoPEDthjkpqAwsvxWZGmA8Arp6i1nmUZ4RpZvBvgIfhl1DNbhUsrjmRFKVRGNsBI3g
 g1bQgQwqzB4PutDLUq6sJfueVtoa8PNguJqhDSuL+xTFMSucVJmRDQKz5eTR+8syb9ph
 XYNZ/LLDnpUtpv1fl68F174FM/ayWh37G2Kb0yy114bk4r5uiDHP9Gxz38IHcCoseqrx
 zfgTXGQBUhtCSM/VXKi92UZ1uoEJ8QZrUgEeL7CwBXMoHig4+D1HSI+RxTmT61TrTUUC
 zG3wLEXoiXvSRroVIBhxhckh8ZEGK1ddAGMzdbbkl5Y//u8i+sS3kL3Nqxn8oEMdNndL
 ducA==
X-Gm-Message-State: AOAM531tRVNhWncOX461CXNZ2pOCeFtelAbXaCWDRkqMW8T7pDwAUoV5
 j5xPqCP7WpNCdmtuxYZZLIgBO4My+aTgbBTuBzqfMw==
X-Google-Smtp-Source: ABdhPJzPz3yYMcE3k8FzafsSnCY0d97wEp0cmfhSQYWDUO6l9flZArYW6eB4TZS8UjvVXTiVdWOhUwvL1ZnDri7idn4=
X-Received: by 2002:a17:906:b1cc:: with SMTP id
 bv12mr36089903ejb.407.1620810050509; 
 Wed, 12 May 2021 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-30-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:59:37 +0100
Message-ID: <CAFEAcA_2rsJNFqyH=8_yWVtoRQ3iuKJ4X=THk-hnw+XdS4P6AA@mail.gmail.com>
Subject: Re: [PATCH v6 29/82] target/arm: Implement SVE2 SQSHRN, SQRSHRN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 21:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This completes the section "SVE2 bitwise shift right narrow".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  16 ++++++
>  target/arm/sve.decode      |   4 ++
>  target/arm/sve_helper.c    |  24 +++++++++
>  target/arm/translate-sve.c | 105 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 149 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


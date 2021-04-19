Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB6E364847
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:33:32 +0200 (CEST)
Received: from localhost ([::1]:58908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYWq3-0002BU-BN
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:33:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWmH-0008VT-I0
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:29:37 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWmD-0004nB-RC
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:29:37 -0400
Received: by mail-ed1-x529.google.com with SMTP id h10so41457047edt.13
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zXwnwN5tqNWAFfi0o6dM6Hf1uRXNTzIRfAoMwRurihE=;
 b=ZJx2OJSdB1Bwsvb7MbWEpqv5ozXM2o//Nb1co1wg/qT+bi+PZCezcSzRU2XeOxh23A
 LVEOsapLydkuurXUOYHpd/88udYBU1Rs78t3B1TztxricutXCzK353D+S4ISg4T8T3W7
 mxe/3Gm44EThtG15AyHvDbiO0m5uqLwyfhEaytIYRnnuO+laiV13tzbU2LWaeX4v0NME
 tc7zILsRLqQaF33KdWQiZPx9McRfg3pLij2JMDT7oeNQQxitXybONLbKeR65qDCzbeW2
 nWUi+/Go5kPYb1/lp6vBUJF1Qwo7t1wuzjFJDT8b4dGSq+TRyUoOAYniY2b5+VTR/R+f
 xUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zXwnwN5tqNWAFfi0o6dM6Hf1uRXNTzIRfAoMwRurihE=;
 b=TURa7LEHW19bywwxPyui5E4FeGqKwfxfsNiBXhBwLPRSqhbd/xOj0LxeiX8aQhipd3
 ZxzdcpzmdO8CzQhltCN7hJ2pLVM8r2Du2BGwsgSO7/v1OuVBzBFhKRQeAZ6nDplIic3Z
 YBALj5Qhfb93ux+LoEK5c75Ifq9gysZC337uKRY/st/XK5c9GAk4eARun283g0aPEMr0
 lH/ESr8C0DiqWCGPi/TYslfn10zLMLeXonHEVuBRcziq9v/UOOtKXnW0RJZcQxS6kfWG
 ImsBzgDsFVCa8B2BDSQNiW0HuSVgu1zOVCGDQESIYuwurF4QdMQi6p16EdV9ixGX0R3+
 TCnA==
X-Gm-Message-State: AOAM531AHvFIw4LthfmrvZ44qbVR7CgoRvhF72l5WL48R7Ast5oOxx3Y
 ys5G83RD1FsL/TOJUrHoxpzfofde+Tme7CjaefUbVfUSYyE=
X-Google-Smtp-Source: ABdhPJyiGTIML/Gv3B28xxBMtgpOrE8EKFJF9rWEM1Wwmbm13CGBgdumCYsismHABvIcHD3iConQJAxaPA/ntfdOi24=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr26616620edb.204.1618849772296; 
 Mon, 19 Apr 2021 09:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
 <20210416183106.1516563-3-richard.henderson@linaro.org>
In-Reply-To: <20210416183106.1516563-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:28:40 +0100
Message-ID: <CAFEAcA-jjNAx-zZdLRS6CYb+1w8UsezEGc+YzqvKj9-MKWrdcw@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] target/arm: Split out mte_probe_int
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split out a helper function from mte_checkN to perform
> all of the checking and address manpulation.  So far,
> just use this in mte_checkN itself.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 52 +++++++++++++++++++++++++++++++----------
>  1 file changed, 40 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


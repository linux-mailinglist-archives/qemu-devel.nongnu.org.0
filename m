Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC42FB9C4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:49:41 +0100 (CET)
Received: from localhost ([::1]:36360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sKC-0006BZ-AD
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:49:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sIj-0004xG-0S
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:48:09 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sIh-0005pd-Bg
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:48:08 -0500
Received: by mail-ed1-x530.google.com with SMTP id n6so6741866edt.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrgO/g9EYnBUxTPpEcL06DrbdVKzkPFKyMXV9M4hpUE=;
 b=sqcOyZYdS+gjkjrUsghdrNnMYAsLfgZzLCy0RZ9Z3HGJKDRW1zY1s15MIidzzh2Vi0
 E2ajgMEwPNeqB/m4Zv4ZmIEyzoevYTAByklMNQI+He2aDLHtZq6MSSzoKMlrAxNlWGTD
 wHJSYUbxC4T0+f3hlINP9ug2clRgCu/ScjgbxNpt8sBRGywVhdxEljYMYLTi2bhSJqr+
 yfnDUezmNlNeSE4b24ALbqi3bc2Umv+YhAvEpe6u0Q1x9y0s4Qme/Z/KvoSLAwGLLhfV
 6kUMKnLy+GSNzvE7q+y0tQpFH8c5OeRbP8WguV76PzBdMYxzdekB+XHojtiPH+kRUIxG
 0JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrgO/g9EYnBUxTPpEcL06DrbdVKzkPFKyMXV9M4hpUE=;
 b=TcguFrF6u4LlrAo3wJS9F1TACCaj8LAUp3VHUHk0RMGRX1lAE38KJLh5tJ0GZFpEZQ
 rvTTrH2midjpFYiaYk8ADn8lRxccwovNApdq8TLvJ6iRQoviTKUrQx+29OqhB27Gra4L
 yYuHZn8Eue4AAVw3MgiQQ4uFXC7hq7V4nm+R59zVGhYpnvKifu65VPF7UzT9y1EMnzzk
 OciMYtS22PhrSErX9S5s4cTNEK6QGsj6HD/Lr7v/niHPfAZZaPR3dA5Bxp3+p+PnwfMt
 xv0reZYxUhjFHZipOMrdtxCO84fVPwl0TyGAsJC9EOIiOnNzrv4uuyMlbuyb904NpRm8
 uayA==
X-Gm-Message-State: AOAM5302eSYGUbH7PY54ksxOU53shf9ztF9LTlxczGCdYiAWLKj1m1f2
 goHUM5xzpNb18NYp463fV4HpRwqDPggbZF4QCIKeZw==
X-Google-Smtp-Source: ABdhPJxJ9HR9Kumv8nhqWidsAqKrRuNeMfkoyJlK5p1QlPGrsItlQCBAzH/KlvSgWRMBN+tKoXacXIiIxwkXmpBSJzo=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr2837444edv.36.1611067685770; 
 Tue, 19 Jan 2021 06:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-8-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:47:54 +0000
Message-ID: <CAFEAcA_3fuqRZEE8QTx_nvgOXvmHFLvUwYm6kxfLBcEWk_R-UQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/22] tcg/tci: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target-con-str.h | 11 +++++++++++
>  tcg/tci/tcg-target.h         |  2 ++
>  tcg/tci/tcg-target.c.inc     | 14 --------------
>  3 files changed, 13 insertions(+), 14 deletions(-)
>  create mode 100644 tcg/tci/tcg-target-con-str.h
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


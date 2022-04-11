Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43DF4FBC3D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:37:24 +0200 (CEST)
Received: from localhost ([::1]:37826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndtIJ-0006UZ-Fv
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtF9-0004F4-Os
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:34:09 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:35470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtF8-0005Ri-2w
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:34:07 -0400
Received: by mail-yb1-xb33.google.com with SMTP id t67so10379463ybi.2
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS+w8cok9Q6yeri/4aVrtyvTlbCrt0U4UPAg5qXJuMw=;
 b=iZyHYu4Ne6vZ7oF4mMRyD2Wc4J/2IMz1teP7QrO4a4HzeI5ll8NEMUQ+DJ8Xt5LbRo
 urtTrvkk8RwexGTaeYpfckcRrOPp/iM2/UEJrVoSb4Vf0NPCLgJYx5ED2QZdAitp4Owr
 qHdfoZQLYUXXWP93M6BDkIhtT24lVKqhQwoLwEtgje6Tjd2DvG3GG1Wuym+vENfdHJmk
 hHV3Y2+e7wHiy2kavKVc7X0zu6+Arc5FT95w1XoJyxL66cGqOUZqMo2mKunT9KwCYJjx
 mtteJDwdAkIoUlh7qsncrARh52jTwpHkHc6aTcz9zzSsSaIxueRa28EtWsvHTmbqsjOf
 FnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS+w8cok9Q6yeri/4aVrtyvTlbCrt0U4UPAg5qXJuMw=;
 b=SSD0c++SCr3QsnygXjbpsBki3HczRtMn4/oBrH2TJPH1oiDBsflCWPkaOcQMV/j0gg
 o6MZNWftJJWCwHdk2rvve1BdgndTtyUUlWFW3qkMoqxi7R4KPjwptc8Rmv2R6AbKNKwH
 a+RnNVyTveJys9WgG/RE2QcERHSiZiHg3krjept3ahgO5sCiUJDW1iulx9sIzYTaM2e3
 qB8ztEcAl3bbPiV+6WpsRcdq/VGOyvEFun/BvuQQH2p3QgoNDVnx9gh7GWqikViQzM+c
 IPOl/LBThnQ3nEPyoTQum9UcGneVtqG+QVys85kfw7cyv4kKTGrlNwPK2+coKPxtUkNQ
 vaEA==
X-Gm-Message-State: AOAM531UbISklBsqHgsLOLgP7eKTwYsnWy00X3L6Rvi49s4aSDK0liX7
 kTUqLvDjBW6jQZjOoupgXU5SkhzhkIIBzph7TVw7YQ==
X-Google-Smtp-Source: ABdhPJz8oGcoTKwSkLnEN1xPB1RX1kFSKp9b74N7A+nYIk6SSXa9IRLB1l4a/q60puzHtosBruZeNjLgwftNPF71fnw=
X-Received: by 2002:a05:6902:1502:b0:63d:4d6f:dc1 with SMTP id
 q2-20020a056902150200b0063d4d6f0dc1mr21728473ybu.140.1649680445032; Mon, 11
 Apr 2022 05:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-2-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:33:54 +0100
Message-ID: <CAFEAcA8QhsNhyvFVSmDA6XJ4rHN9ubohvT_wK42SAne8XDVn4Q@mail.gmail.com>
Subject: Re: [PATCH 01/16] target/arm: Add isar predicates for FEAT_Debugv8p2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711352FBBAD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:53:07 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tJZ-0003kL-23
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t5j-0007eR-0d
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:38:49 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t5e-0005JU-N5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:38:46 -0500
Received: by mail-ej1-x62d.google.com with SMTP id w1so29067941ejf.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Uhe7tatp5j/9ievG27fRfThEAqjnIMWRPaVI7b9siQ=;
 b=vipE4B2JIF5YOsJwvnZy1s9h16SLjhB1povW84g8BlLaLiYl6Bss4VfbyafmmUrw74
 1HvACl1h5hHedCykEoNQ8pUyBVyH4nT5eW6RJoo/uGAjL5ghm9CskXDP9I6jPw7A0WfH
 kBImsjI4OVhCOlmMzlFlRdJ2plVEl4fEQnoz8UCMH4xo0GVoOWJQCmBOs747T3Zk1Hmw
 n6JjxfCQ+9/XOA2j1bfHhc3PLjsIYml7hu7LPpLz21LC//naa7pKjUC1vGzFQNz9UJaq
 Vy97+OWpXcO/NGClcmyLghVuC8WHmHjurChkh89wnQKSkmfQgmVatR36GSVkRJ8yXiQ5
 K2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Uhe7tatp5j/9ievG27fRfThEAqjnIMWRPaVI7b9siQ=;
 b=MzLpNSj1nz9aF3toE/LNIzJTUiKbrUjK52qii7Wlir7M4XsUXNQ2iTovkfi77suTIO
 ZI6BFVU+ANT7V8g+AvlnOY6NgQWRijX5BeAypzibM992C9RsAw0e2IJenMw2Sy8GJ8tt
 D0/n9xVWIAEIdNTQ1OhxhU9ufyr2QfeQHFiDKvnlL2Fq0Cz0J+HrFFRDnXKsTOcc6aul
 F1JPydAJqfgeHi6n/qmG+FWTjCe0VPKdthInXKjI5fN/2pdDZaJxRTTTeXlp4rNV/DwC
 NRXm1d2MQa4t1jXveczx3jUsYVIq8HB/S59Tz9C+yUb8ugz3CF67PnRF/xtMPM3penTT
 TSww==
X-Gm-Message-State: AOAM530opwjIETwHrxlCNUkL8GQ8ebWTP/kZU+w6Li/HbndQagDpbgxq
 QJANtv0kQaHV/XTAuiIc3iELNHENPvYi3z9Bl9fEIA==
X-Google-Smtp-Source: ABdhPJxSntyIGZqKGinZtkyQXXeYaAo2fGfX8qSop8AqzMa9wA+noMQRkaB2JtYT2k0/NPHAK32wIrT0meOWGIG1Qg8=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr3258587ejb.382.1611070720640; 
 Tue, 19 Jan 2021 07:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-18-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:38:29 +0000
Message-ID: <CAFEAcA88PzzLAn7VobttpqXESsJ-aF8=PpBka4Tko7RRyUwQxA@mail.gmail.com>
Subject: Re: [PATCH v2 17/22] tcg/ppc: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target-con-set.h |  42 +++++++++++
>  tcg/ppc/tcg-target.h         |   1 +
>  tcg/ppc/tcg-target.c.inc     | 136 +++++++++++++++--------------------
>  3 files changed, 99 insertions(+), 80 deletions(-)
>  create mode 100644 tcg/ppc/tcg-target-con-set.h

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


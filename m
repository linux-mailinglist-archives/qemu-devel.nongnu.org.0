Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B32FBBAF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:53:17 +0100 (CET)
Received: from localhost ([::1]:43636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tJk-00045g-Qv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tGg-0001XL-V5
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:50:08 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:46848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tGY-0007Hx-Ex
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:50:06 -0500
Received: by mail-ej1-x631.google.com with SMTP id rv9so10378574ejb.13
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0q4zCE3gZ5hoWYxCEGvoI7INSy2USUg86dxT5io9Pp4=;
 b=IWln7lWvF+DkgAy8dbaZC68n0EnCJw4IWnLX1uESG68S43wgAmz0ZNlwdzbbWjdXpx
 PoqgMPYOL13IfUElwuY8Dtu3tFpbtoSFL0xwcMKl8dZiV6MbWkLdd3so71M8pukkXT8f
 eNU4UWBqoIJxLJYevclcBjLVX/yCNu5x1yeznIII2+pqSRZ72auy2BGxn8mY8LacTvzX
 AhiH3y++bZfgWZ550VsOmkRs6lezT+w8NiylO41MIXdCxWtMxZDubNeAQBIIiVBvi2tB
 oPrXgg0Tvb4Wfe7XX1mVLJfpTlHvmi/6pxbogITeo9g9Lw21M05y817gq1AYmCZCmUyZ
 X79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0q4zCE3gZ5hoWYxCEGvoI7INSy2USUg86dxT5io9Pp4=;
 b=Uo/Xv+iTjkO48moVzdFFta6X9R0a3eUQIlRIgmc99ca8OuEnP5yg+XDqW1Ep2LqE5V
 BFZQiSvb0yaxyn+cKz04VUpYo/V/PNEFdMZ5jiTEwRBBWjOjAio6o4f/OZsi/yr8ABGE
 wx7DSrAddqEtL3q57YOoJOBYmw3EGlWR/8ReQNp9B/+xeOkRfc0mUOjXfa9iSxESA1Bd
 iGOtox9pDPq/LHv7x8Q0S3kyZoEzZoWARdhXAldyN4ijS8qI6BpN4zDUg2Nmv9uZy5gB
 +2WV2sn/dYK/xP+zoUXXE/3CSYqe8JdEpBxKdUHkooi+a6Drg/N+R+DMdYyhmYCk9/vy
 B5Fw==
X-Gm-Message-State: AOAM5311EM8QgEKjkbTF81C0Uv9f/7VE+ajrxR8htL4BwspXhTy1gCXO
 qpi6UIR21QUwGrf38j0hyF4ZnApqTr4bJpbXL6MaXE1K904=
X-Google-Smtp-Source: ABdhPJxuefaXdI9QAiRwTBTnjO9bYahqsbWpxFPbNy7yOeZrsqQBcEsyFANSvx7x3C9vHAK/BATEXCqD4UjravDch0E=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3490406ejd.250.1611071395293; 
 Tue, 19 Jan 2021 07:49:55 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-21-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:49:44 +0000
Message-ID: <CAFEAcA9Ou-XjvCSzyVPM25Gzn6jORQeXbtSN1+faaKEyGqpg2Q@mail.gmail.com>
Subject: Re: [PATCH v2 20/22] tcg/sparc: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Fri, 15 Jan 2021 at 21:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target-con-set.h | 32 +++++++++++++++
>  tcg/sparc/tcg-target.h         |  1 +
>  tcg/sparc/tcg-target.c.inc     | 75 +++++++++++-----------------------
>  3 files changed, 56 insertions(+), 52 deletions(-)
>  create mode 100644 tcg/sparc/tcg-target-con-set.h
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


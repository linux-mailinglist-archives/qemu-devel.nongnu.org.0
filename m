Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BC4215679
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 13:35:29 +0200 (CEST)
Received: from localhost ([::1]:34214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsPPE-0004eO-SL
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 07:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsPOS-0003gv-5c
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:34:40 -0400
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:37327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jsPOQ-0001i5-HN
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 07:34:39 -0400
Received: by mail-il1-x142.google.com with SMTP id r12so25354902ilh.4
 for <qemu-devel@nongnu.org>; Mon, 06 Jul 2020 04:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ir29VQn7VCPHcKrfWKTIh1fhAnbHBaskXhI11+RVahI=;
 b=xu6/7pgGpvGKjwPoZNVVTU+oxltjF7UCb8NZfATsXAR3lU/QF+2oTXrRiKQ63Q7cZ8
 grlDuPKh7pPTxKDVBwxlCQbY5MHVfQPm3Tt0gYCO0dUVZu1qwv8COmLMLzXQoWXSSfoG
 EWmKXxtFoCzSjIBCYfZ0ON6gcMxcTuCUWEHB9u6Cr3kWpP7Awo0iGNruFYe/IXqMzFRB
 1FOYPyserFtA2t/A7ODRxOH64NPtGsaoid8af3jeeaYkTVMwpEBm0VNcCZme1p9RBtyJ
 aXgBqZZCDoGcQYT7zWVa4GLYXrWmGT4gYP6blnIWh/8E0kowqIcSpIrA+Z3J09VN20i/
 ryew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ir29VQn7VCPHcKrfWKTIh1fhAnbHBaskXhI11+RVahI=;
 b=KYCMF8J/9qICVMrrb/+IkKcZeugELUbXI7U0dh7tq6iskw+5i8PBrjj8kN+6SQ5oJj
 28VDJvlc+0M7LZJHBr+ZchzREWwQ/uOZu5pLhnLJfNRp5TKZM2xHc17nb9OJ21zClinV
 Cd1Sl7UQlNVoZ2LufrZ8NX+dz6H/Yxy4n3IsSrsQ0jislnrY39CI+is5jmpDWG3I8TKh
 suHwrv+YA+VIN/E7TBqbjKvrQy2PUOyoPm/b45Q2EGaRUMPNpIh+PiferxUMLGeZ21ru
 H4Dmhd8bZSdaHyhM+OcXSmGWy+S5NzhfZ6DtnvP56iJUm8IEZ+d2ZnFCosRd+2njcLYL
 ooOQ==
X-Gm-Message-State: AOAM531Unn1V2tVhgC8KRbeMmcMI5Mkh25kYiFVdG0yxnRiSWUTGKIag
 yGFandbfmyUJo0zx1baJuZiC26sArcpjHxT+GIuwhg==
X-Google-Smtp-Source: ABdhPJxso2o1D/a191wytj1WJKAjwApNw/m4rTMHTwvlh8mW5TQ+aI9ATC1t3WlUJ2fzJpYw3VZihVmnBhcYcAhGBeM=
X-Received: by 2002:a92:d3c7:: with SMTP id c7mr30300440ilh.292.1594035277577; 
 Mon, 06 Jul 2020 04:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200519185645.3915-1-richard.henderson@linaro.org>
 <20200519185645.3915-3-richard.henderson@linaro.org>
In-Reply-To: <20200519185645.3915-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jul 2020 12:34:26 +0100
Message-ID: <CAFEAcA9PwNvkm2O3FchibuQZ7uG0PKe935ojEW=LYrJouF=Wyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] linux-user: Adjust guest page protection for the host
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=peter.maydell@linaro.org; helo=mail-il1-x142.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 May 2020 at 19:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Executable guest pages are never directly executed by
> the host, but do need to be readable for translation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/mmap.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


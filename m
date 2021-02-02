Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B438430C26A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:52:34 +0100 (CET)
Received: from localhost ([::1]:40034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6x2f-0004Ho-P5
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wl7-0000i1-S9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:26 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6wl5-0006BG-3o
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:34:25 -0500
Received: by mail-ed1-x535.google.com with SMTP id t5so2078621eds.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MypB+0cpkh92gkN1Vi1y0ZBTUrvtD5Er68ivZX5ch/Y=;
 b=M3WSyzexFHIAiI0y5Qp0YN634pffutu7nxEics+XQjWgA2HiNvDUG9ihgPpVShuj5k
 /BXsp/jLeBdqzj6EGe1CzmgWg8/oGc2i1ANadoNAblovHDdFtl8SBmchnOvZQTetS09a
 h1IErIlx9EaTtbkWb8ZZ2+z7WE8nDAk7+qsF8agS/noxrHVbL/hJwWh5c8SbzFN2i+Y7
 AuiJFFGq3z2ZqwkToosLbU5QSxyInvfqlE8yzn4J36/qUJHDh+vv0Zz41NGZhc6yMjzk
 oNHsHciMP+w7Kmx9VlWHqZH/wquisKtaUMH0AuziJjgyz1ikH5MiXkVuP2pBEi+iiFuE
 DnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MypB+0cpkh92gkN1Vi1y0ZBTUrvtD5Er68ivZX5ch/Y=;
 b=FKyIbJbbL6C8uyYc3V0fAKvlyTloeB1OXFV+LQloohjhxYPAcZALPsTS+pY66tnQIG
 E3QJxuhkhK2yin9+XRgpgbn+bEmrmNWQH/WOW30Q43BmK9IfUHKg8U9F9PpItq23k+0w
 vCiaIM0WHcA2iGv2CISG9hw0M6w2Mlk1KoLmbvfL7WK/Utd5iAjUC4A8LWw7LqecYLuy
 oBR0nCcBmD++FE0b/Leh6Jp+5BgUSrBgu3otAmq4aGtudXIn3RCyjeGw8dsc/hA2/ALS
 jwpT82ho22qR/mg99ACmnjJW4i/A9HErC1SJ9PVfQLLCs1pk+f4voz9Vl869YsIGI9tF
 S+fQ==
X-Gm-Message-State: AOAM533NL6y0pxPMaV4p1ECjFa+3zWUx8R0lPbtuj+/RoR9L+dyMWI3I
 hNnEYejXtwN02z764TEhfrzg6zZMndGcwr+qrIMbyQ==
X-Google-Smtp-Source: ABdhPJwvcAK508gqg4ihl4sGg9x86B6P4EoSsKPEQFNfB5UtsbbgFvZmG22TUkCXAcLuFz4UjpQdohv2uEKx0+Sc+24=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr23863521eds.204.1612276460435; 
 Tue, 02 Feb 2021 06:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128224141.638790-1-richard.henderson@linaro.org>
 <20210128224141.638790-10-richard.henderson@linaro.org>
In-Reply-To: <20210128224141.638790-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 14:34:09 +0000
Message-ID: <CAFEAcA-oZNJr_VADuc3WmxG1nHJWS18yfEyrQSvLrpu+G9iMog@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] linux-user: Do not use guest_addr_valid for
 h2g_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Thu, 28 Jan 2021 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only use of guest_addr_valid that does not begin
> with a guest address, but a host address being transformed to
> a guest address.
>
> We will shortly adjust guest_addr_valid to handle guest memory
> tags, and the host address should not be subjected to that.
>
> Move h2g_valid adjacent to the other h2g macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Ditch type changes; retain true for HLB <= GAM (pmm).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


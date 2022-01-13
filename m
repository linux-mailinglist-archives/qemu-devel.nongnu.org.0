Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1842F48DB06
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:51:00 +0100 (CET)
Received: from localhost ([::1]:39392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82NO-0003l9-ND
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:50:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n82KU-0001pg-Eh
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:47:58 -0500
Received: from [2a00:1450:4864:20::32e] (port=54175
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n82KS-00035g-Up
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 10:47:58 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l4so4170299wmq.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 07:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n9Del0SfgTOlhf0k1pQA7U1c8Ae7ngbF7sMLo4dCd0M=;
 b=KCpE/hq1SfNJu/Q/cVqIofa2M0OhAlLkyZuSiPN2N3XY4oZHWmb7N5XvwrZiudtP2d
 JaptxAB3lEekosikSofD/thvq4ZSEvDi9zrLHaoaRYvALcID+ncixNHGpieXuDKk2MxE
 zPwDf038Ra14fhlh0iuZPQexc9SFvL08GXv7xE+/fDPYxQ24If1Tzk1FMonS5KO/pNI0
 Ntr1ZzbI8432MaInyERyATfNhnOXqR1IVH66WLXxghIVLVRzxAhXC6vzk85YjjNIIBIV
 sNKOfxpsnwRuZ0vS4Re8lJhX4IUnUhidmy59vj364/UpGOE2pjSPQEHUwBB++T635i5x
 UvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n9Del0SfgTOlhf0k1pQA7U1c8Ae7ngbF7sMLo4dCd0M=;
 b=zPyfb45MwYtyMo3atbq2ybllozT+0wIzsheo7nGqW/9xY/h87jS+WLgoZd4slDm4Vq
 XJBVfaKwJ0DN/d8ABQlitJLM/WvFw5x+qhmmorjG14GGULONFfsDzHVJxvk7FjShGxq2
 IEo814kdZoY+cmOXSCds6zrS9Q/VuwAlrndP6n5F7kTe5PaLuPvuvfJvsNfImSrK8tAP
 z+G4VlTHViEj6OeHarULQem2WqQdhb7M+VkBQ2hGZZtWgdsGraIeZcnKLr7IWsuBnNII
 B97nn7Fmx4URyJNR/LLfJHcqF30MgwQRUjaeWQVc58suj/KH1CA52iThodXIi2wz331i
 q8tw==
X-Gm-Message-State: AOAM533kiZbmAVO7jPkKmD5cfCTKyKtILPEi2TRtGIbmWbMlVAxXcVs3
 C8lCg/3kziyASgEEEf1Upp8myWT3uBSLPhvbM59r2w==
X-Google-Smtp-Source: ABdhPJyYoOz7HrKeYwX9XTGUuqkYUzwYvZNLmJf744fE4kXe4ITtL7UODDIoxsd3J7IR+3qd3zUk3e6pcYtzXZRqQRU=
X-Received: by 2002:a05:600c:28c8:: with SMTP id
 h8mr11579634wmd.37.1642088874778; 
 Thu, 13 Jan 2022 07:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-2-imp@bsdimp.com>
In-Reply-To: <20220109161923.85683-2-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Jan 2022 15:47:42 +0000
Message-ID: <CAFEAcA8Jz9=FnMR9Q+pB+tfD_-34sRc_oxyqgbYw45_OZkF+VQ@mail.gmail.com>
Subject: Re: [PATCH 01/30] bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to
 match linux-user
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 9 Jan 2022 at 16:23, Warner Losh <imp@bsdimp.com> wrote:
>
> Move the EXCP_ATOMIC case to match linux-user/arm/cpu_loop.c:cpu_loop
> ordering.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


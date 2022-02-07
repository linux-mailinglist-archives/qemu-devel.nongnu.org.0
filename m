Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A053F4AC8B7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:38:59 +0100 (CET)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8uV-00008m-OQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:38:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH8nH-00045g-DQ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:31:20 -0500
Received: from [2a00:1450:4864:20::42c] (port=38761
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH8n0-0001GR-Sm
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 13:31:18 -0500
Received: by mail-wr1-x42c.google.com with SMTP id s10so23852952wra.5
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 10:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wOg+MvgnOce7tLr8HTzYEHi5urgP9pqg7d7vtoZkTDk=;
 b=yPksd/HRg3xCixhnU2Wl/TYEm8hyhNdDPEVXByb4eUfrzOW9RDDjh0DErG1nSDQazB
 V9M/hyJKBELrWBFt/sWrx2viWzboA7sAQiJghPW2l2BH7pAAA6qbNgVQ5S6/XKtE6GLz
 D/2wd5bI0EPOO4AsOoc7rh6HklU9zjHApR2joOTXxIjBlxdNn3b1GM29hzpo8qKeUISc
 6nMOGql0Demq0s7GzJvBvbkAmls+IwuhcxYWSK8ZNcod0DhJtb7UowWSdhNRmtNwcuMB
 fvbIY6rUTcR/DZaqsamn7iAQs13rgg+62hE1De0gRunJePp0LslCPURSzVj+QDJgT1dM
 Bktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wOg+MvgnOce7tLr8HTzYEHi5urgP9pqg7d7vtoZkTDk=;
 b=7kvYu2kktLMrojqo/dSW+EtEB5xKkVEK1O5F4k8rG0iiGawb5DdzowXzQvu7ayF7yH
 G1BZ1171J8k5XogPGh67ckSgpR3Kj2E5F90VmJHpMX3dn5Q1PHsZKC3McbXFkxSSx0ZN
 Myh5uyaYus+RLGzHlRMNXUDWbl8qBYHYyeAPAiG8qop96wVaBZniWDk0cqCZSnteeq9J
 u3apFS+r8dNhC1wzQHz3NbNVDFgLoj9Xv6coM6muqKmP4S+k4ekXmxJg8y2FTxN01nlB
 luvKq47LaIQvl20m8P/rIs7n2HoMthd6biHZA59jau6h76qzBKxAUtBwm53AD7kWTR/o
 liMA==
X-Gm-Message-State: AOAM533GjPnyoavtZUImjNLjtlr3aTPVrQEmz2q/3lWE4D6+2PjH2juo
 B2TYTHXJpPKMkOg+PDLHvJxjnu2FHlSeyICo90dN6Q==
X-Google-Smtp-Source: ABdhPJxaipUfPGjA3ck6snSDs4i531QAOqz3MnDVTtJ2hPxyiLHfqk5uH3cmwjxVJtCIUcKtrvT1de5a/5fhueLX55w=
X-Received: by 2002:adf:a51b:: with SMTP id i27mr624772wrb.172.1644258649130; 
 Mon, 07 Feb 2022 10:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20220206103138.36105-1-richard.henderson@linaro.org>
 <20220206103138.36105-7-richard.henderson@linaro.org>
In-Reply-To: <20220206103138.36105-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 18:30:38 +0000
Message-ID: <CAFEAcA_OhVMM-fpPYhfq2UVjbSGDN8s5JLGN=_CjEHVE7yeVrA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] tcg/sparc: Support unaligned access for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Feb 2022 at 10:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is kinda sorta the opposite of the other tcg hosts, where
> we get (normal) alignment checks for free with host SIGBUS and
> need to add code to support unaligned accesses.
>
> This inline code expansion is somewhat large, but it takes quite
> a few instructions to make a function call to a helper anyway.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


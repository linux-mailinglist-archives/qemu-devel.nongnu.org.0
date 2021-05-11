Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A637A3CE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:38:29 +0200 (CEST)
Received: from localhost ([::1]:36858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOqN-0004WU-Aj
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOSl-0006jC-NY
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:13:59 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgOSd-0000UB-G9
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:13:59 -0400
Received: by mail-ej1-x632.google.com with SMTP id m12so28712123eja.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0QxbAp7FgGeCC81Z1BKW2veeLkx9WqVARj9kyfd4fzU=;
 b=YL4klpZ/qQjvoaAAfHaCOJsVmZkKvhj0yf3Nj66tUrQiyrlxwVTG23fMXQ+GGKxp0w
 Kje5xuwcsxWoBeMT5z/aFIvweeQDue6LwXPOLTZ/9YT7IlqV041B0VWu6g3ss9fcYP9T
 EuHTZjbpgHZoKtxv8TnYuCyu7p//eqhLl4A7hQuwANNh/5qVN5SpNu2W6QvEyKwlYZvF
 twJ6QsInWdyAamNKaeXNd/byVwmbJTB1bBt189Trwc8tjdp/s4Um5ue/VEaGxL5CQfZK
 AbYekwEV7UD2qNtzNc9qvr/sPAZAMg2PQhDUC7rm0Pplgj4ReCGOYbIRfZQi8KZk550D
 iWZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0QxbAp7FgGeCC81Z1BKW2veeLkx9WqVARj9kyfd4fzU=;
 b=RP7dkRptdiO/LzXJWtKuk6HzvBrUz1bZiqe8wqd0U02icubt+TXbxTpjKzkok8UqfR
 7hLSEUct73DytSObkik6XCSEo8ipVexjfr8mWm/G5eGqb1z0BU70IWf1eQYjetbmRmQv
 fOtXnVOJvNRjnZofsfsv9lH4y2Bl3KiLcX14RCK+xjiA161iJjhYFeLiuEo+j/oAWKVa
 SZSuE48IgoZu9jUpCEqPDfgLRQeyW4hd0jWZeznn2BxM18deckrvZHYkeAJjA0VgvXg+
 L2E6Fbap32adkX56E5fbWdYhpvt4vZrReUsHQ9xFL1M2xvsbmMxWnqtWfcnSR4Zlyk0J
 Glig==
X-Gm-Message-State: AOAM530C5ymL4GBDvLspJApKNbAyI5medu6nzNbVDNwLOTqMaJe5oDDO
 iHc5Vtq/0jL6I048At5+C009LxCIdrcpo7AWUdIzrg==
X-Google-Smtp-Source: ABdhPJxdrIzRYsd/Ro2y0PNAGkJ+dJTOJ+9MZTPzpoCOC0m78vPSM4sI7G9aTld/y+Z7YChJ9rH5Gm+Jii5cE6HVZN4=
X-Received: by 2002:a17:906:364d:: with SMTP id
 r13mr31321347ejb.250.1620724429359; 
 Tue, 11 May 2021 02:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-12-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 10:12:37 +0100
Message-ID: <CAFEAcA8nBUhjsZb8vvFmj1zrxL+M_wZ5u_tDNcBfcrY1SM4LHw@mail.gmail.com>
Subject: Re: [PATCH v6 11/82] target/arm: Implement SVE2 integer add/subtract
 interleaved long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Fri, 30 Apr 2021 at 21:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      | 6 ++++++
>  target/arm/translate-sve.c | 4 ++++
>  2 files changed, 10 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


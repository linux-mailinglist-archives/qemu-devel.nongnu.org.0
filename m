Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93063621DA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 16:12:17 +0200 (CEST)
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXPCi-0000Nm-Oq
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 10:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXPBf-0008Ew-15
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:11:11 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXPBa-0005eq-95
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 10:11:10 -0400
Received: by mail-ed1-x52e.google.com with SMTP id g17so31739289edm.6
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPZpvGks/i5oe8yrSf39bSTkCfi5w1ciO0y9KaI0XgY=;
 b=Mqv5Nb+jql35jT4dsOicYtQkucptk9EjTWclgkt+ZvQO2+aUpGvU2jwxYQUu/V/BP+
 8oGBlGSY4GGA4Au9eMQdtGvkBfLb01ZwRmLOlcfzrk4P34blz3isXSp+L3YKiAq3Dx+E
 57TvvE3s7/xtn1wNi36vczOrs12nkcTaC6NBiOrZvESwEXxVQtOEY/+l82odBF0obd8D
 Nh1uUer8JTR5VymcPApQiBpkHc+HW7V6b4piHpivcUjoMvPrKSPDNN78VceKVCGmzl9s
 H3OMOP3085Z+HJHm9ElbKE99l9NbHtxo8JDUVgDs5j7h2MZMVYF02kRPI9b6vsu/cRr6
 Po7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPZpvGks/i5oe8yrSf39bSTkCfi5w1ciO0y9KaI0XgY=;
 b=bSI2naCnKmdaOPx4CjemEf8jFUnIGGjNOrD8sGnpnGIzAD3PKJRdspVDahNV6zgVUc
 /D9yJNyj+sv8CEdAai5WdQTW1qhc4qJwEocmwsts2oC1iG6BmZnmkHJl+6n2Z0G/GV/+
 Qh97CssbnZemOuSxTozIM66RcGjAuDsNS6H1EO57RHfasTAlQaLGO4HI1thvU9PGPhwS
 ypbyAZdTxtoIPu5VEybcTxjydeCGd4QCv7LyCXjY4DEq9QvRPO4Tv1dbRgAk2mTD6IO7
 hb2e6qDHbjXnOTmxzFwxJmlg6JNpAcQcf38bMC2H6EIupnJ0PZF+AZyynR/AOy6Evkfw
 Wn8Q==
X-Gm-Message-State: AOAM5315i4YzD0e/f7kCbweTujJ9b7mgdFIFMear3pcm8fnx1ZNU9YLn
 4CtRsCpC7+RM1C6G+wFH84xz5DrjM2L08e6TLffqww==
X-Google-Smtp-Source: ABdhPJyFmcLtb7ddxjpdt/xoYIXAyMGKJjrXkaKYAR7wBT/YtXAHGzWRUKg24cte4tqtD6HPWGF+RF3UVlkmbkDid7M=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr10155918edt.36.1618582263941; 
 Fri, 16 Apr 2021 07:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210415130305.28640-1-iii@linux.ibm.com>
 <20210415130305.28640-3-iii@linux.ibm.com>
In-Reply-To: <20210415130305.28640-3-iii@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Apr 2021 15:10:15 +0100
Message-ID: <CAFEAcA-8yh2GNEdP5yuY=_rKG_g4TLHauU=nYfGR_O-fT-2oMw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] target/arm: Make sure that commpage's tb->size != 0
To: Ilya Leoshkevich <iii@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 14:03, Ilya Leoshkevich <iii@linux.ibm.com> wrote:
>
> tb_gen_code() assumes that tb->size must never be zero, otherwise it
> may produce spurious exceptions. For ARM this may happen when creating
> a translation block for the commpage.
>
> Fix by pretending that commpage translation blocks have at least one
> instruction.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  target/arm/translate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 62b1c2081b..885f69b044 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9060,6 +9060,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      unsigned int insn;
>
>      if (arm_pre_translate_insn(dc)) {
> +        dc->base.pc_next += 4;
>          return;
>      }

Why does the call to arm_pre_translate_insn() in arm_tr_translate_insn() need
this change but not the one in thumb_tr_translate_insn() ?

thanks
-- PMM


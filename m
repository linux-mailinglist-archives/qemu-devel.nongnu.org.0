Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EC3FD6FE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 11:39:44 +0200 (CEST)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLMid-00012r-JG
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 05:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMgp-0000K9-FC
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:37:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLMgn-0005RF-R9
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 05:37:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id q11so3466747wrr.9
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 02:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VW06FrrgB09KCAlsGPR0aLTyskqrdqTXwcUXkzV5V7Y=;
 b=noEORVqFRPK+ukngyJTOKDXgfgeqGe7FO5XSPxTn7KXMn6jDAmgSU3aBVtYYEMCCjA
 y3f1MO2rO4beRVEJgtBYWRpM/qkdVBkEbEPACh/6Jv7RcIB2GmIDu+RzQ+65mXiKuvpJ
 GwRGL4CfqcEG9PlYh72AFHkfAQsndHJb2YnE44YYqpTEDxaWXqmQ0K5ZSz2sessuwSt8
 XwlY+qzZLJjEuAzl/HJAXeM87+3deNo5UXdkpZS3pyI2UKmYYFG2Zgs9I4eK1mmZ1Kt6
 A/VxngLCuzpfvWjphnzpBrEw7SQpOHr0EYXAPwg3HGRWsn9hDn5EUtKoyyrOZ1TILJ+h
 t65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VW06FrrgB09KCAlsGPR0aLTyskqrdqTXwcUXkzV5V7Y=;
 b=kuwMqUB2rTPuWxG+TFyXRh5+ruQ0+cA+p3DOIL82wk5ofbNiMpQBrHlFSzD+bCXY2z
 hpX3nQ8nUK8WmJN5BfGIKsYJrxdjsKuQAkAitjDU2tCStvMklMIx5NJz7IqBZhwtnwH/
 muqisxDXFU1rXx3MBAK/Xex9UIfthp+hRDsORsyGbpWNtWZM62e12Ar5/9tho2KeAFBI
 rSmZqJ+MTGRYGDHNuV18o4VnE0h96rTP6H6oEshfU2BtJZTnk2bTPT3uaUrc8fZ9p6f/
 iVrL3LKT3OGlqK8lQzZUijoVC1kwd7KNJ6+dK9MRPnP3hatR8U/0sERpLTfbTJsW7P/L
 u60g==
X-Gm-Message-State: AOAM530XMfJldrAT14UyFHpzm9apShUZ6R+PQ4kBaYHtkf1m+bMgQJd4
 t1UCuDjSNu1x56gWFLxH4Bn1hHWpFcPBiaFVqunKLA==
X-Google-Smtp-Source: ABdhPJzf/QaWtpGtQnnmOOdGsw35wac0FbxsNWyLKutYYFRhoDxZpzYuBJajR2ps/CGjwdYB1u/rjNXBdqud7pyiEOo=
X-Received: by 2002:a5d:6cb2:: with SMTP id a18mr36105864wra.172.1630489066078; 
 Wed, 01 Sep 2021 02:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210706234932.356913-1-richard.henderson@linaro.org>
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 10:36:58 +0100
Message-ID: <CAFEAcA-xg=QEUqsBGqFAHiMVi2vBG_BSoC5nGbzdcpyHb_+Dhw@mail.gmail.com>
Subject: Re: [PATCH v2 00/36] linux-user: Signal trampolines and vdsos
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Jul 2021 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Supercedes: <20210619034329.532318-1-richard.henderson@linaro.org>
> ("[PATCH 00/12] linux-user: Load a vdso for x86_64 and hppa")
>
> Supercedes: <20210618192951.125651-1-richard.henderson@linaro.org>
> ("[PATCH v2 00/23] linux-user: Move signal trampolines to new page")
>
> Changes for v2:
>   * Add vdsos for aarch64, arm, i386, riscv.
>   * Drop setup_sigtramp for any target with a vdso.
>   * Drop arm v1 signal support.
>   * Simplify ppc encode_trampoline.

I'm not planning to review this series, but a general comment:
I'm not really enthusiastic about the "vdso binaries checked into
git and the build mechanism is a random makefile that has to be
run by hand in the right environment" setup (and distros that
like to build everything from source probably won't be keen
either). At a minimum the handling of the cross-environment
stuff should be more automated and reproducible like 'make check-tcg'.
It would be useful also to get input from the Debian folks on
how they'd want to see the build-from-source requirements/setup
working...

-- PMM


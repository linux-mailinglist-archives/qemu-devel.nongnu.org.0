Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E68FF352F58
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 20:38:12 +0200 (CEST)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSOgN-0001Er-LP
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 14:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSOeB-0000Bv-Bq
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:35:55 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:41907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSOe9-0002BC-GT
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 14:35:55 -0400
Received: by mail-ej1-x630.google.com with SMTP id u5so8497458ejn.8
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ycLVpaygnCvDyiqZFpLSTc1Wmb/yz6jvDoc3DrtkmLw=;
 b=FFcroj93g5jbLT1wL8XukXK0tDH7E+vVGodgK3mdf5ixbBVpPub1Kuuo7IfgyjxNP8
 8RBx7rN0odxUs4qRzhsrkG+6SD4RnNs5QrDWs29VLAUbGv+oa+H+8fMA0NK8h8k81IFL
 5PcQRLGe7iRDnjGycT8E3C1dtd2MKZDdD3Ss1VCfxN8hMdXLCkxDm9DRUF58C6POJ1Pt
 F5kdz6TduaAf6hVAVX6cdKmbR5NRUACMjoWO0XpQnGR38BM9mNiCxPicgnJJLDNhbdwv
 XwlNBxPrnssYgyOlbMODp396ApSUA9tUlRDE0PWvL/imRiWOacEfqsdUmcN5j3BNqqna
 CGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ycLVpaygnCvDyiqZFpLSTc1Wmb/yz6jvDoc3DrtkmLw=;
 b=Ktxl/jWVlmyqkNFayC6X5b3JSQWsHzpAU6OeYtkVTy+V9O0zmPCFys1+T24y7VBjpD
 XNewS7dlieW+2+3XaNFbKXvjaZO9Lh1p7GRq9y878sPfbagJmeVxB4ZZLynwDqcWQp4a
 wj6YJQFXtRet4J29j8DNxxX6w5c0Gk6iMYe82U5+4RbOuPbrhLLY6lHjwkr6/pqwHmv3
 KK20K1Pbj/umWWTc2PM/gYXBbo0K5XiA/2sHN5oj5hG8brZCU1FJ93GD/Uga57lscio2
 MCK/2YmvFhmH7/mjs58JDep3gT5quvuJrq9vq6d1T7PU/BwA5Gc7GaHnKmsovVpXvFRf
 PWLA==
X-Gm-Message-State: AOAM53151n6w/uP0bFZAcSGhUd3TpHknruJYoqG5nvlSLp2lLLxFR3Do
 C8h8+aNOFTWOAP/uJpGi5q+/2K3NS7mIg8vSJS6o0Q==
X-Google-Smtp-Source: ABdhPJzNQKQx3avQfdXcNmVoAqwkHjiQhRCX2ZwyRDJ6ul6Quf6/VYujqNb6uOEE3vrao8MK9rqbtgth6WGn6dVLG0o=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr15201130ejh.4.1617388551330; 
 Fri, 02 Apr 2021 11:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210402053728.265173-1-richard.henderson@linaro.org>
 <20210402053728.265173-3-richard.henderson@linaro.org>
In-Reply-To: <20210402053728.265173-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Apr 2021 18:35:16 +0000
Message-ID: <CAFEAcA-jky04K9d3WFxj+JU31mP_NS+yrEDXzXaffYC7CRTFLQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Fix unaligned mte checks
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Apr 2021 at 06:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were incorrectly assuming that only the first byte of an MTE access
> is checked against the tags.  But per the ARM, unaligned accesses are
> pre-decomposed into single-byte accesses.  So by the time we reach the
> actual MTE check in the ARM pseudocode, all accesses are aligned.
>
> Therefore, drop mte_check1, since we cannot know a priori that an
> access is aligned.  Rename mte_checkN to mte_check, which now handles
> all accesses.  Rename mte_probe1 to mte_probe, and use a common helper.
>
> Drop the computation of the faulting nth element, since all accesses
> can be considered to devolve to bytes, and simply compute the faulting
> address.
>
> Buglink: https://bugs.launchpad.net/bugs/1921948
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This is a pretty chunky patch for this point in the release cycle.
I don't suppose there's a way to make it more digestible for review?

thanks
-- PMM


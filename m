Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B942FBD01
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:55:55 +0100 (CET)
Received: from localhost ([::1]:51070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uIN-0000Zg-0u
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uGH-0007bJ-0p
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:53:45 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:38434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uGF-0002A2-CC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:53:44 -0500
Received: by mail-ed1-x530.google.com with SMTP id s11so15070985edd.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pdvFCGCnfU+8VT2E5bpBPH3G9762bVnLk37eqDLYaWc=;
 b=AIozRlL/yU8cn0QuT1TnRSSwIh1mNMl2d/NpI2Gi+98HnvftU4jXihra+D5itBdDMX
 SLFOQH95rWVgNpxncJb4m6g8sTGSd4mxysfHpyE6iCDuh6qDNUVpeE5SCWLBxcPg86qN
 omQhecD+vVNrdjeIVct2rBgEwVfxDdUG/JlsqXeEPMLvx4SZ6ghfVC4P9W/PXqQ4I3Wo
 ST+xPZQIDWvisylApw2vOLZ4soNCQ6BdKMt/S3elQXFmnd8est2yhAgr2QqUKf254/FT
 5zAFkKt6Fn6ajlp/LneoZGBSdTVtKYRBr26X/75Nj6JtGwY8uBeu1TQi6+9RuNJEbiLl
 ECOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pdvFCGCnfU+8VT2E5bpBPH3G9762bVnLk37eqDLYaWc=;
 b=MDMgNxSxpvScR2J59A857hKxlRg1ft+7Xq1aRX4jZmSNW0KmTICxM/OMun6uIICqbG
 lR6t4OHm086nIS+MoOUjU6AhkNs9Gtix4eJT8O1S93KvJhuC/nj3a03GC90g+PsWgZs8
 WqvQv21nzI0Y9aMly6YzJIhGhnZcl//XI9AHbQzlhD3IacKThe80PsUUfKK2LCUgbyEc
 c5s9fz4x2iTAcCEVNctuVGU+b+5XoHncFba3dIX4Ougc7X7y9XYVF4dKuYRDNwGawyb8
 F1y3PiNsBxiDC+kd7dUDranqY9blK+0RdCFawrS5E2RABf+aeL/kWZilbZx8oRIqEs6Z
 RjPg==
X-Gm-Message-State: AOAM531/cxAxmF5nMVLYcB3c3UC54Sq5SxTmqZ30MklLnZTBnf/503bs
 NYISj1+dmSghvCwINiPAa9kIFBqgCsAeVlYa0SiQGw==
X-Google-Smtp-Source: ABdhPJyFn1TerrsRkYW2sdYXZqZE6XyqxHhXIQRRGczHyA+Ktt/aChrGTWso2shsJGJ0LmHtfYEd4AHx/tPZl8scvgA=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr4013015edv.100.1611075221597; 
 Tue, 19 Jan 2021 08:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-2-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:53:30 +0000
Message-ID: <CAFEAcA_TrPh5dXukro2RV4qs51Kph9S54rN1+O_cvRAhPFhZtg@mail.gmail.com>
Subject: Re: [PATCH v3 01/21] tcg: Introduce target-specific page data for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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

On Fri, 15 Jan 2021 at 22:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This data can be allocated by page_alloc_target_data() and
> released by page_set_flags(start, end, prot | PAGE_RESET).
>
> This data will be used to hold tag memory for AArch64 MTE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D601C3F2A35
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 12:40:40 +0200 (CEST)
Received: from localhost ([::1]:57000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH1x1-0002Mj-QL
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 06:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1w8-0001ga-9c
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:39:44 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:45935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH1w6-0005HE-OS
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 06:39:43 -0400
Received: by mail-ej1-x630.google.com with SMTP id e21so3389257ejz.12
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 03:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qvY+S6cZzdyJRQ2ZXpficW+MaieVtqWvGMOjQx7mPEo=;
 b=tt/BfpDtNfQ3JvfBSpEiS5bAyyFghbynnA3pSeqMIPR3wLv/ti/QEIQPxfRbAOxygX
 z9HyqeSreiz0NKuese0HxjPvd+2DolT6c8KBNcLJB4/tpcWd4sjuxmlrLAp+u5bjVVsw
 CS2VfnAlHhcriFIhKPlOV4IcV/QfSQRAMVDyqUPPSvuMhwHVjcWMzaCWqDILhA1sTqKu
 A/aCMhCfRDwHTVbd2NLsR64icA4s0DZprEuAOA7FYj7FjtIrTKTtsslsa/+9pBNxtF3G
 tfhmgnE8PrQgn/E9EAb69fm+AmuAD0o+GJxFJK3ex6gHiUVBAMtJcKYlm/PTEsDNsNgR
 iTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qvY+S6cZzdyJRQ2ZXpficW+MaieVtqWvGMOjQx7mPEo=;
 b=bJswH0RcaUIMUTJcKc9hO/btvCGBGcCIB0wj8x6Kquro/ThhcVlusOfrcLm60V8g8E
 hNoIO5i53QWSlFut24aO+YZ1fxyULwClRMiHoQKC1tRICF2ORL73kgd/7CQQ8hpTNP6E
 InhY5GKSVdld1XBIDIsFiteLZy7mPBFZDlZm3dVn+ZFHh+42ax9VO2R3bPJQ8oIRQXHU
 a3bE162rP3UVNyc+RMmom9O6hxtV+jdLuhIbR8V6mjH4MVhGtKQP9jN/ZTyEmJx5716J
 JZxmUwO/iPl36QynXyXvaVUt+m5EbHEVtrJYthG/D+N0vZ94BgUq/KNF3KNEgcR1LFVa
 f7qw==
X-Gm-Message-State: AOAM531og3oBv+8rz8tsvCMP6Zw9oTxCPbctocB2AjAIxe44PXx/WH9b
 0C2vL4v22e72TQQKabhNG9xPQEfwLe9FViSDd7NolA==
X-Google-Smtp-Source: ABdhPJxx6JQzpODTnxHMpFNX1MXUE7lo49Z/KXPr3f+rYgH3Kv+VmSA/M5mr74Ega5TdgGP09PBTs9wEnSWsZtXJg0k=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr21293825ejz.250.1629455980811; 
 Fri, 20 Aug 2021 03:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210818212912.396794-1-richard.henderson@linaro.org>
 <20210818212912.396794-2-richard.henderson@linaro.org>
In-Reply-To: <20210818212912.396794-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 11:38:54 +0100
Message-ID: <CAFEAcA9J03VBAXvvB11me3hUZZ0RjopbQSyrL+UpM+2GE7bPdg@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] tcg/arm: Remove fallback definition of __ARM_ARCH
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 22:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> GCC since 4.8 provides the definition and we now require 7.5.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I assume clang provides this too...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


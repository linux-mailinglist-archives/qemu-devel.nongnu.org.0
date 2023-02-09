Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0206690720
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 12:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ51K-0005JU-I6; Thu, 09 Feb 2023 06:23:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ51I-0005JG-UR
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:23:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQ51H-0001FH-2m
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 06:23:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v18-20020a17090ae99200b00230f079dcd9so5602463pjy.1
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sb01PK28yrxED/OT9BB/QXvhwzXKmz+6cTYlY1LGV5U=;
 b=OdmJ0TCgqkcmUpnRDWaQL9WhhtzxnE7jVb61mF6qG3aZj0Fc/BYIGCuL/2xWFb5CVG
 N2bgn3D65WWo5nO8Trv+8MvzJko4g1kV6PNjnhPtMohaDW5f+oYz2qcbCo9ZrqgIMSJQ
 bcePsgSFXSU93o6mdOB2jLKTbw9mSm+c/IK57KxWfMM7bCFStjzRXE61rmWO+lEeLQOM
 uf0e/EVSAXI+bHFIjteIf00jbhjeIRTJtCv3GgmYHHIUibma/R3N3fxJfQn61wDxldmW
 1f5J08EwZg1Ub9seyj/eOxfzBNseoAg+GQ8uEHszZlyvpGrS2qHRdZuDWY3NjQ92z2VR
 q8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sb01PK28yrxED/OT9BB/QXvhwzXKmz+6cTYlY1LGV5U=;
 b=j6VlqRHVhfoABC5PhDitSVDMCZ7wILwlEYUmOrfxCsWj5DFoNrd11ZP6yoZnSXe+A9
 vfR4GauccYTlonOqjg8xko2Y0qNHnVAGXAV7qmA6QoWJRlFegzumGJjin0GzEeD0HG3s
 i4WcY3khVy0PrpSCa8jb4BPSVQpGUmctni7XNyZe06/x9ABCmgxGAOeGjGCnvo/e38Rj
 UsHGLjEu2zYKzmwK1K7F0NO3vhYnweIr4RnUrRenKBEiL8F60N22bdFfIRN5Bew4lMm7
 c+ndv0IwY4V7R1lYgtmqSeop4uEuwo6o9WmbgpwRNt9/wdDHqq3bvmHg+hqKPFxmvUQU
 31Wg==
X-Gm-Message-State: AO0yUKUqoAwwVhYzIGq+a7CoUrULHDZfeV5RmQeXCe2SgC74kfMbsf4X
 1rHB0y4Fz2BeL80hvcY9CBqTRlY1alA99xomX8GGOKI15SnaYw==
X-Google-Smtp-Source: AK7set/TemDTNPQTBz7yc9L+3X/djekF1GZdrTL/xMyAH3C8z8JGKYCvOBG7uhsogo75iAERoj5cLYDNMCH+a6PfMUY=
X-Received: by 2002:a17:902:6b88:b0:199:1458:6c67 with SMTP id
 p8-20020a1709026b8800b0019914586c67mr2930335plk.28.1675941793064; Thu, 09 Feb
 2023 03:23:13 -0800 (PST)
MIME-Version: 1.0
References: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20230208091422.1243084-1-kbastian@mail.uni-paderborn.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Feb 2023 11:23:01 +0000
Message-ID: <CAFEAcA__8r6cVaaqQ++Uf9LLt9fndcQP7jewrEm8qUj+R71fFQ@mail.gmail.com>
Subject: Re: [PULL 00/12] tricore queue
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 8 Feb 2023 at 09:14, Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> The following changes since commit 969d09c3a6186c0a4bc8a41db0c1aba1c76081fc:
>
>   Merge tag 'pull-aspeed-20230207' of https://github.com/legoater/qemu into staging (2023-02-07 20:13:38 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/bkoppelmann/qemu.git tags/pull-tricore-20230208
>
> for you to fetch changes up to 6e34f54d88184b25db4fbc4dd1665d9be1a9e21c:
>
>   tests/tcg/tricore: Add test for ld.h (2023-02-08 10:02:46 +0100)
>
> ----------------------------------------------------------------
> tricore insn bugfixes for qemu 8.0
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM


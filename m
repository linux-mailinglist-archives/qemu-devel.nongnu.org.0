Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD03DA6F3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:57:59 +0200 (CEST)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m97Tx-0004Qg-QY
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97SU-0003ST-HF
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:56:26 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m97SS-0003I4-TM
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:56:26 -0400
Received: by mail-ed1-x52f.google.com with SMTP id da26so8651278edb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GX6C+z4Gp1774SIk9qsj2EZpm0J0in1V4oJLtkiO+C8=;
 b=PWaYuUjCVpMU5LeK/YUxmokhszVcrFTtwJQOabcCUknfgJlYy0BMwBoSLubDyaBWjI
 QVqo18hKJvOWD7L7Wi6d9sow8e+vNTg1E6ylaBWRZtDWqbfbbuF1pUPUtCCzrDe59VZN
 WUE06C9kmaLBJ+u3yr6KqbnbnkqnwCny1QxrU+GdSVpdUAefGlsQKtTHvRsDsWdnaXNt
 0YN3EYA+tQws4mHisd4TmWvc7PEMLKVpP/YADECvV9kjfqNtU3sb4P/1/HMY9IhoJAlz
 qmAPOvIJQBZKhoJKalV/joknN/qP7byw6Di1p4EswDWjp1D4SYFO0c3MTmi744KeAiF3
 wzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GX6C+z4Gp1774SIk9qsj2EZpm0J0in1V4oJLtkiO+C8=;
 b=X8tscAt76QXXkWdA9kBFxdi4YF1rTVweLyrJ1cWwyIhiLy/gosTSNUCvOQYg34xoYb
 Z6ihbg6NN+7MsPQRcpCZkZ0Dn1MDo2Nax42XSIrPMTs3oKQPI3jxHHd991qw994Sf0Ni
 UeOUcxqvyoFbhr1keCUF9mvDiEG71YyJDSTg1t+YqXIhSq/6oYjWsc0ZsT76dWNM25du
 HoC8MkpkB4LCkotYubq8CzUOhRZzNXPXKqOZORdCks2Pz6r0kCmdki0XbJYBcAvCqN+3
 aDpS1oclzXoTnRd43TiHuZJ5PMq4P6lI2RvsEpR7mthg51sxPlKfY69vhEMYbZmvrQqY
 FwsQ==
X-Gm-Message-State: AOAM531+F1XzI+jOWiz56fba7EU9fEI1PJGF1b/RPhGJDABv65/4hKTn
 pCNkW72nmWyzKZLDQ7Noje6xABExrpqCdkbX7ge5Cg==
X-Google-Smtp-Source: ABdhPJxxkbGpfGCUsVjyT9V8aqmzgkXTU/RJiaYoh9ByQVnHkq59FGd6y1duzRBlG8CN1g8zF0XXgZQoGRjDtLVAUXE=
X-Received: by 2002:a05:6402:697:: with SMTP id
 f23mr6442139edy.44.1627570582918; 
 Thu, 29 Jul 2021 07:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-17-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 15:55:40 +0100
Message-ID: <CAFEAcA_b2+KA4w0ny3cdtnuySBUQLFoZ_Yix9oEhOw4zABZJAQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 16/43] target/xtensa: Implement
 do_unaligned_access for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 02:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.c    |  2 +-
>  target/xtensa/helper.c | 30 +++++++++++++++---------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

The xtensa kernel has a CONFIG_XTENSA_UNALIGNED_USER option to
make the kernel silently fix up unaligned userspace accesses,
and most of the defconfigs for xtensa set it to 'y'.

-- PMM


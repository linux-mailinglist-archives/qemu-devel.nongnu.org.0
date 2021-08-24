Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73F3F6696
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 19:25:13 +0200 (CEST)
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIaAi-0004lG-OV
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 13:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIa9n-00040C-Ne
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:24:15 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIa9m-00026h-6C
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 13:24:15 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn28so32814630edb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=55QrkNacCKmzM2MykPKBPQp+tTFq+ASSkw2OYB2DG8c=;
 b=iskyKbENgc+u6CRoTeqMjga83d2qLJgnn0JgdzDef3uUsFDf8ayMpOBYvTp7F6Z6Hw
 nRQ9coyvq2qK1GdqFpPk068qOko5p8UIx3soU66aJiBRZnSJ20rFseRe+mdTJJzSPsNX
 fctKhJV4iTUEdu2y+Ig/d7E9sk38Ezf7UzxHjrus6o4faZslFKCzBfeu+WxX2wl9lt3j
 w2B5deQPYDkOp8YfTKs71aDuSYgWUKJFHtuCNU3jfNdpiMRwDw3rH6j0stuXp3aWkjBe
 CFmsI7oRwfBwJVYvBYmBgE3/wYOvTp+zYuljzvHjyFUu3gnw1lp6nKLzA0aM6sCS42lT
 9wbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=55QrkNacCKmzM2MykPKBPQp+tTFq+ASSkw2OYB2DG8c=;
 b=sz20EMPxFVrkXimJVDOz8wjjDdksKs8yjS/M5XJzU64puIeJ19KTYpa4+OdmedX5rX
 rfkeoWsKFLd3rTtxEurPuW/uhVBhRxGi5ghPFddenZq9RFze9y6BaSsLljUgxXt/dvEU
 dMdq1toOxewCdmfund7VpA9OgZ8uRN52cMoSEqKM5Idm39xuYmOaFfbfMx7NvRKa94N2
 ks1xWFm5elLcLC/fka5gMOGr8jdR8NFLAktoUhCXW9LFRj9txxgDHarqSpw11RYTWSpy
 FtrIyngiF3oXeGUrNnhNZIctfGTpEYICYRM9lYG0FWjVIfDnPMYJHEmhYt5UXeRTiRXJ
 GP2A==
X-Gm-Message-State: AOAM531rXJqtjL3BZ+/ysUZb+Rc/y99CCF/vbAbcDCZx4ZOJUZxT1T3L
 1q4S1M/plp0SkMavt9dxI2kvr/vpX5PDFIsT6InprA==
X-Google-Smtp-Source: ABdhPJypf+b0A36BfnK5vu//533t7GkgZFK4aDznyxGEmt8fym/7c9rMBkKEYQ29fIiFOamggzlZudxZte+UEVfjS8w=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr40584753edw.44.1629825851861; 
 Tue, 24 Aug 2021 10:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-27-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 18:23:24 +0100
Message-ID: <CAFEAcA8t1nVrg6qXXy_ri2yfeX8KdBy=rv7iJH_A0vaTUL1+jA@mail.gmail.com>
Subject: Re: [PATCH v2 26/30] linux-user/riscv: Use force_sig_fault,
 force_sigsegv_for_addr
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 22 Aug 2021 at 04:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the new functions instead of setting up a target_siginfo_t
> and calling queue_signal.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/riscv/cpu_loop.c | 36 +++++++-----------------------------
>  1 file changed, 7 insertions(+), 29 deletions(-)

usual commit message nit, otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


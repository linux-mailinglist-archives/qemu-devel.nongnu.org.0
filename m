Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 061823F635F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:52:07 +0200 (CEST)
Received: from localhost ([::1]:38246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZeg-00067D-4C
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZRL-0001ZU-Rb
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:38:19 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIZRJ-0004k6-M8
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 12:38:19 -0400
Received: by mail-ed1-x529.google.com with SMTP id cn28so32613480edb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 09:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhEADbFDOv90Wb4uf1HyMSWbgpfpZmzUTdJgt6KLvnQ=;
 b=YGRXzFZFC1SNGmm/9Pw01mIAjUlDeuWGWQg9fw5RGasqgQ2/M+A6UI4ET7jd13c0f1
 ufBXv2kPGFXrdilZTlSG9D6QVhBox79V0LoNcVCKt49FU8+NJq3IB6p5gBUImA6vPgm+
 vCmjgr6shoHDHD476dPh/ffq1YiDILGtwE8g5fXrXYT9FADcWSf7KEMVVh5MBYOblVxt
 gYP40481NyVY1RS/VRYRC0UnKnvdTX5CZLFmdIx2PgxfP++lYND1YJFOJcRa0A0DV7Pg
 3dq/Vzqc0rbsvkfl9Mwhg7HzJVA7gdOTJUTY1cZbcQHl1N279BhDAxvqqk5YZT3971H5
 UCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhEADbFDOv90Wb4uf1HyMSWbgpfpZmzUTdJgt6KLvnQ=;
 b=ctAmD8cghuB6swvRtwiqeGBVdAd0d35/VmUOAymAPg6bxlWefYAMbQ5y3H+LzIogkA
 S+I5lpQmTSLdPlLkNfYwp8gOTBVqURAOgN6cc/Eb6ED+pL7HDIhAIcEyF6wmzdiLEJtN
 MUY2tuN+MNYzr6AYmBRIBKkfWaVASUxhI8Rua87MBh/SJ1PoPJRyHIcJKwItIhxJUVLK
 eslo8w1kya+S2/5MaU2xWgHXljPvGtLPY6MYDXbsGcAruTN7ysidGC+UeGyCWeUemFKY
 xVrVwBK8DpxXSw4HILsAkOAAOJIiVBE4/GqrMkv2z4m9TnS1YQPdf7CGgMBUSVyP+/GQ
 XLfA==
X-Gm-Message-State: AOAM533vXwjyw+xT52UatQ+D14Iecu12yC7BccR2QbPIR1j66oB89j9M
 qMmVNZKndihHdL7KUonOneZMDgOMeQE7hyVHQRRNcQ==
X-Google-Smtp-Source: ABdhPJxuqRFhVQeZsCEU/D2GHWW4HmtOVSknSKehVcAFoqQ68W3e9MGku+QkXSlU5ST0tbD822zIjz/T273+pFI8sT8=
X-Received: by 2002:aa7:c0c6:: with SMTP id j6mr33080480edp.146.1629823096225; 
 Tue, 24 Aug 2021 09:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210822035537.283193-1-richard.henderson@linaro.org>
 <20210822035537.283193-17-richard.henderson@linaro.org>
In-Reply-To: <20210822035537.283193-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 17:37:29 +0100
Message-ID: <CAFEAcA-cBwn1OnSxD4+PXe6_LeZkB+v4pais+v8it88Y96dZGw@mail.gmail.com>
Subject: Re: [PATCH v2 16/30] linux-user/hppa: Set FPE_CONDTRAP for COND
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
> This si_code was changed in 75abf64287cab, for linux 4.17.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h  | 1 +
>  linux-user/hppa/cpu_loop.c | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 55ccc6ae03..f9efbffe0c 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -688,6 +688,7 @@ typedef struct target_siginfo {
>  #define TARGET_FPE_FLTINV      (7)  /* floating point invalid operation */
>  #define TARGET_FPE_FLTSUB      (8)  /* subscript out of range */
>  #define TARGET_FPE_FLTUNK      (14) /* undiagnosed fp exception */
> +#define TARGET_FPE_CONDTRAP    (15) /* trap on condition */
>  #define TARGET_NSIGFPE         15

We don't use TARGET_NSIGFPE, but we should either update it
as the kernel did in 75abf64287cab, or just delete it.
(We don't have the equivalent NSIGTRAP, NSIGBUS, etc for the
other si_codes, so maybe deleting is the simplest option. If you
want to put a preceding patch that just deletes our TARGET_NSIGFPE
definition, you can have my r-by for that.)

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


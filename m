Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211EF5787D3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 18:53:15 +0200 (CEST)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDTze-0000sC-3u
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 12:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTxU-0007Qc-IW
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:51:00 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:40554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDTxQ-0005DB-AM
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 12:50:57 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31d85f82f0bso113754737b3.7
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 09:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ct0Z15FNXLKbsqmmmM9xtlhCN+n4WE8xbJvsRdMRDkU=;
 b=Zk1SH1064JkQ3FJ11kUxzK0AwERRMJOAmQwPbzl3syHox1R+4WBYdzVNkohaKFNXHJ
 TYsoueYbScDwu3QpzavZeuFTao41JTUZxixZe/2BLWpXKqo9vKgXFVO3aVyLJs1vztSE
 rcrP5VSi5g9YWzz6eHFPoevfZJDDef1PMGHWqhqlbw8MguzGmXDpv7tfPgg5ZNxk1ZEu
 yYS93pxhFwrX/ET2qJFxnhyR5QUO41Xgr5C93f/o1thjITGEbYiNIR1mbqYi/ZekVxUD
 hAc0wfQErIB+gC0MdC3MlalmyErd58NTOkrxCTiOeXXdLmbqmSmgong3lQmS0D+nvBJc
 /uNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ct0Z15FNXLKbsqmmmM9xtlhCN+n4WE8xbJvsRdMRDkU=;
 b=wvO+ABqN2L8+isp2HmSBzWJjgqVCyUkSZeucVEiJgm2Zs8lJq/bjrmhNPaHU7UALYC
 fO7EVFjzj0lqSa5IF/gcLLD+3pnFIwO2PncLhyNzk9VY4PmuBTtV9mHR62nyOqvw76dW
 lL0/8E2ap5d55S9C6wHzFl0mL0J/4suIjCKjTpVy7u6fMup3QZOfX2iREUXeBOP+CQ1V
 gWWtM/mannxDBmOrmAX6m4+i3eTMe0LEFVlAJATCjRlt10aN+8/yDCTb9TDwv+03eWwd
 H0tTp6AVM366hfGaIpqSXqi9QYZTzLScUrANR3Ksbrfo5bzoA1hyaJJbJylDvXH9uesH
 WLVg==
X-Gm-Message-State: AJIora+tGpnE6ChUTYRFdtt2SuGCYAcSkFfMk5cz49KfkZSH5+Evp4ct
 51I41MiE2TqV4ns10xYFXkayWSdMu1eP0J2NyXoEwA==
X-Google-Smtp-Source: AGRyM1s7sW8TrJccZpEV4OpUvH/X5CmsSaxG8J9SwWwmF/NDt0qBEnQTVW3/CnJ45/5bTTL1fxgmc6qSQmRAIAC9SFI=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr30218566ywg.329.1658163055132; Mon, 18
 Jul 2022 09:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <YtWNC56seiV6VenA@p100>
In-Reply-To: <YtWNC56seiV6VenA@p100>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 17:50:44 +0100
Message-ID: <CAFEAcA-ySRz=W43v594KShdg+4pPYxKEEAxHqzmz2jEwYHig_g@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user/hppa: Fix segfaults on page zero
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jul 2022 at 17:44, Helge Deller <deller@gmx.de> wrote:
>
> This program:
>
>     int main(void) { asm("bv %r0(%r0)"); return 0; }
>
> produces on real hppa hardware the expected segfault:
>
>     SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_MAPERR, si_addr=0x3} ---
>     killed by SIGSEGV +++
>     Segmentation fault
>
> But when run on linux-user you get instead internal qemu errors:
>
> ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
> Bail out! ERROR: linux-user/hppa/cpu_loop.c:172:cpu_loop: code should not be reached
> ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
> Bail out! ERROR: accel/tcg/cpu-exec.c:933:cpu_exec: assertion failed: (cpu == current_cpu)
>
> Fix it by adding the missing case for the EXCP_IMP trap in
> cpu_loop() and raise a segfault.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
> Changes:
>
> v2: Dropped the "+++" in the commit message - it confused b4 and git-am.
>     no functional changes.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


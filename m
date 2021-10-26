Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2BA43ABF3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 08:00:09 +0200 (CEST)
Received: from localhost ([::1]:39070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfFVI-0007Tj-6C
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 02:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFJL-0005P3-3T; Tue, 26 Oct 2021 01:47:47 -0400
Received: from mx2.freebsd.org ([96.47.72.81]:40173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1mfFJI-0001RQ-Vj; Tue, 26 Oct 2021 01:47:46 -0400
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 23D7E76BE3;
 Tue, 26 Oct 2021 05:47:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Hdgp00CQLz3Gtx;
 Tue, 26 Oct 2021 05:47:36 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id D2788CF92;
 Tue, 26 Oct 2021 05:47:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f178.google.com with SMTP id v17so12511770qtp.1;
 Mon, 25 Oct 2021 22:47:35 -0700 (PDT)
X-Gm-Message-State: AOAM5335wmJAL3FfINsF12yuV3FYnLq+20Qxo0FVauwrKG32JcNwiipT
 ZBuNIctcdXkdkNbbGd+sikwdlW7+dOTEpXwVubE=
X-Google-Smtp-Source: ABdhPJybxAbbdC4en7JVUNezuVKAfXaX0DgWSR+YELLcvp5iDnk+2+p1ayWwMtNgPWa7F/24s3zw3zVWbD/hxQq4fmw=
X-Received: by 2002:ac8:5846:: with SMTP id h6mr21715856qth.340.1635227255408; 
 Mon, 25 Oct 2021 22:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211019164447.16359-1-imp@bsdimp.com>
 <20211019164447.16359-9-imp@bsdimp.com>
In-Reply-To: <20211019164447.16359-9-imp@bsdimp.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 26 Oct 2021 00:47:24 -0500
X-Gmail-Original-Message-ID: <CACNAnaGBeDSiygq_Ky1gquAemObt=gduiqM7AyU45sPuUWpAAQ@mail.gmail.com>
Message-ID: <CACNAnaGBeDSiygq_Ky1gquAemObt=gduiqM7AyU45sPuUWpAAQ@mail.gmail.com>
Subject: Re: [PATCH 08/24] bsd-user/arm/target_arch_cpu.h: Implement data
 abort exceptions
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=96.47.72.81; envelope-from=kevans@freebsd.org;
 helo=mx2.freebsd.org
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stacey Son <sson@freebsd.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Olivier Houchard <cognet@ci0.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 19, 2021 at 11:45 AM Warner Losh <imp@bsdimp.com> wrote:
>
> Implement EXCP_PREFETCH_ABORT AND EXCP_DATA_ABORT. Both of these data
> exceptions cause a SIGSEGV.
>
> Signed-off-by: Klye Evans <kevans@FreeBSD.org>
> Signed-off-by: Olivier Houchard <cognet@ci0.org>
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/arm/target_arch_cpu.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
> index f22384676a..62d6ee89b6 100644
> --- a/bsd-user/arm/target_arch_cpu.h
> +++ b/bsd-user/arm/target_arch_cpu.h
> @@ -60,6 +60,17 @@ static inline void target_cpu_loop(CPUARMState *env)
>          case EXCP_INTERRUPT:
>              /* just indicate that signals should be handled asap */
>              break;
> +        case EXCP_PREFETCH_ABORT:
> +            /* See arm/arm/trap.c prefetch_abort_handler() */
> +        case EXCP_DATA_ABORT:
> +            /* See arm/arm/trap.c data_abort_handler() */
> +            info.si_signo = TARGET_SIGSEGV;
> +            info.si_errno = 0;
> +            /* XXX: check env->error_code */
> +            info.si_code = 0;
> +            info.si_addr = env->exception.vaddress;
> +            queue_signal(env, info.si_signo, &info);
> +            break;
>          case EXCP_DEBUG:
>              {
>
> --
> 2.32.0
>

Reviewed-by: Kyle Evans <kevans@FreeBSD.org>


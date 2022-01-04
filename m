Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5952F484867
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 20:19:08 +0100 (CET)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4pKs-0008Dn-K6
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 14:19:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4pJy-0007ZA-CI
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 14:18:10 -0500
Received: from mail-yb1-f176.google.com ([209.85.219.176]:33440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4pJw-000859-Qz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 14:18:10 -0500
Received: by mail-yb1-f176.google.com with SMTP id g80so67090621ybf.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 11:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UShFX6SDvydq1ILJoPeU9xNGcOgROnv4dC2HNPG87AY=;
 b=qQu99mjDojFkYJo5RiP9D75hHWWwNJpvY0QIjioifa+/NEnoxvgZBgxfSsqv4eamxX
 xMYksfABOSkYi76lYVEUCm7qYIO2D0LGkj/5xCf0+HGFfWCB/+OYFpiZ36RQouLal0SP
 j1QoJ3Vx6mcYNHqHWlioPvBevmPL1L3YtW8AlHdWG5jPXO2QCi4AxD8u0yajOLOgZ/U0
 uOr7cw/OsFLMuLB4nKkBz5J158giy0OLzS9Fc2fkNuOF1cIprOZUr6Tfr79/CqnMKKzS
 OiIgWu7FuP40Vd8fEX8shQC7I0WdOM1h3i3LMSUI5ru6HhpgC0AyG2DPzIiSfoCpjvog
 iSWw==
X-Gm-Message-State: AOAM532fwpLVk7fXDJyUiGCelCrHqI4m5YRyVk2hbyxx5e5WNmSlEEAC
 Y456hLV58uI29N+FqiHh8u9rjL+k6rPkpzZfCjA=
X-Google-Smtp-Source: ABdhPJwgDcetE/zF6N1Uz9e4Owomv2zvm8iAHD6dYuVjimdaYHfFTiX24tPxAPvm/iKU6b/RhrRj+wW/IwvnvvfBIFo=
X-Received: by 2002:a25:2f58:: with SMTP id v85mr38176854ybv.663.1641323887958; 
 Tue, 04 Jan 2022 11:18:07 -0800 (PST)
MIME-Version: 1.0
References: <20220104190454.542225-1-richard.henderson@linaro.org>
In-Reply-To: <20220104190454.542225-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 4 Jan 2022 20:17:56 +0100
Message-ID: <CAAdtpL5apyJx8cZJEUbBPXfQ9YT2viZ9WFjUcoznS5s5WvfmrA@mail.gmail.com>
Subject: Re: [PATCH] common-user: Fix tail calls to safe_syscall_set_errno_tail
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.219.176;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-yb1-f176.google.com
X-Spam_score_int: 5
X-Spam_score: 0.5
X-Spam_bar: /
X-Spam_report: (0.5 / 5.0 requ) FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 4, 2022 at 8:05 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For the ABIs in which the syscall return register is not
> also the first function argument register, move the errno
> value into the correct place.
>
> Fixes: a3310c0397e2

Using Laurent alias [*]:
Fixes: a3310c0397e ("linux-user: Move syscall error detection into
safe_syscall_base")

[*] https://lore.kernel.org/qemu-devel/6c69b3b6-f1f0-da38-d47a-dba01e33bd6a=
@redhat.com/

> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  common-user/host/i386/safe-syscall.inc.S   | 1 +
>  common-user/host/mips/safe-syscall.inc.S   | 1 +
>  common-user/host/x86_64/safe-syscall.inc.S | 1 +
>  3 files changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


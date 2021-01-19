Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154472FBB7D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:44:41 +0100 (CET)
Received: from localhost ([::1]:55534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tBQ-0004Ql-4b
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t72-0000h8-Nf
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:40:08 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1t71-0005Ua-2V
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:40:08 -0500
Received: by mail-ej1-x634.google.com with SMTP id r12so17753418ejb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZnIB0cQrL0/frwt9LtlR7FMX3ZWkOdtUnrey2BjF9M=;
 b=E23cipmsf6jXWKGCdf4QD/cwce0WquBO59YfZBgeIWLPVwa6Lh9IHwDxKf4RRkmM5G
 pH2fADwelMcdO4NOMXHoQAGmFIIS4jnUevR73McikvhkwpF6lQ+GLiMN3TQ27EO4kX6u
 XreFN0F2cTDhFFFxlqfxAfXJfeGl61ksu/VvLWMX/D4ZYgg609k9ah+oVSIs4fzmYPZd
 PSWaTnetYNWm0HtgF4+JiVxMpHMbmFfzT7PFudSgL+ph1UZhXinf6UYTk50GNOGUnbdg
 FcKjHemJCEwXt5dlKzLgXO8z4DSomkBQ7dn622KeJEwvXLIOFR+9JvRAWOKEJv7svTof
 RdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZnIB0cQrL0/frwt9LtlR7FMX3ZWkOdtUnrey2BjF9M=;
 b=tQiF79uzHFnvXngk9Fj0jW8qMjde9OuPZaV6i+87pjcnDm7IJJgQyIBUma8uN329PC
 YyIIp4zhImsdQc9bZVpAm9y/w9nzNCkxhJrmP/cfdAWL0VLNk1LXGUVP1HKWMZY37aX0
 rreNHpT3SrPttgyug1uwni3LsqmWZwWu4KxEKlk4Rgt6Yw1L4y1DkwVO/jPM1eJJmeqH
 /tPsLSpdDca1OpBpCXPtzb83sXHOxWs+ZsGlNFMqf7Zz9sZ0KZBE9L6s/G5oyw84+QML
 oZ+BPawUu48byhGFxETk2L5gydtZtG7eYiJKonybLldOIecn6t7Jh9XI2QXJ2Ho1R6sW
 fqEA==
X-Gm-Message-State: AOAM5321/pkHLYNMP4ULkxJRKbZ7NhXbA/QkcMHsFSGx4KP0Q8Ai8Rzr
 hMpRCdf7+eG++aVhQxFN4MtGb8rgVDpeq/VL/fhZ2cHYEdc=
X-Google-Smtp-Source: ABdhPJzjvn5jiioBmx4japkIRVYHuQZxhacw6929tLVG5yG+hpgaX48EFiv9onFu70KNAqud6gmjX1OQONdoO77EA5o=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr3515462ejt.56.1611070805764; 
 Tue, 19 Jan 2021 07:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-19-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 15:39:54 +0000
Message-ID: <CAFEAcA-3W6Kmqd2+5gPWDt-eDLzxGUQBwrgcWYx6FQEuS2tPGQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/22] tcg/riscv: Split out constraint sets to
 tcg-target-con-set.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM


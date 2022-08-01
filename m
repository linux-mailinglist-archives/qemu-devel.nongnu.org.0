Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2675865AC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 09:34:08 +0200 (CEST)
Received: from localhost ([::1]:52174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIPwF-00063Z-4D
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 03:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oIPrs-0003ec-O0
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:29:36 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oIPrr-0000FH-69
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 03:29:36 -0400
Received: by mail-pl1-x62d.google.com with SMTP id z19so9714626plb.1
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 00:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Ql3bDPfLQL6Wd89SpOq61uNcftF88Xzjx3Q77h2Wbp8=;
 b=j2rBUCDyA6loiVDG3hv2Glqq/PXbYrMdyfc4EkaQV8shbyJ9qZJK6cR/51mMN0cieR
 jUQukCwxKd2rlcMNYnDXtBblayTS9XkJWaEIq3zb6AwbCtAPF4XEd/kXM310aAi6VIj0
 8HccOtkVNidqohY7FzlthywaGbl3PGrZtRKFjIfm+/7CKEWflgDdY6kg8wyQog3NyZ7F
 Qmj7GDMYsmuijYgq6Zk1wiKsJ3yEoHKRLjsIsVVNP3MdrK13kgvvRsVPXEtQ9TOQ0UaS
 B6F7UqJeuA0fJV+ddCRCFDzOo7agW90NcQt6aKkYXP7s1DGdwzeh1mZzy9/jrUW4sFwk
 Apwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Ql3bDPfLQL6Wd89SpOq61uNcftF88Xzjx3Q77h2Wbp8=;
 b=la/RTSP4jVeteqO78pSRFYOZUV9/cUZoUFFjZFPIsl9vIVDoTkH4u/oyE4iCDRDnt1
 reo4zKGyb2gB6qnm4bXqxBaQ4zesLTCm9vbQPzZJzXjhEQk2YLVe/Kd39j2v0Bl/M8Bd
 4sFxlMJcdJrxvafCjsfyZ8MtZ0AIetR8BKc/MxFE9uIX1u5VgL19Mjm9Xh0FQOLj/AnQ
 py+W41wGoGcwcj87nk30mtq/4GGfp0sy0bkTb/L4h33QUoNYvvqUDS3vPYoHLAgMoPZ1
 k8DiAcEDKqr7ykgx0aWfE6UQtXCDSOIs9pU+oXM4RlU48sh3QDWnRquvzuQ4Q6ymw0eb
 I96w==
X-Gm-Message-State: ACgBeo07QYR+z+U6VM5BTiN2ooPSfp97j9LS5vepdusrT+O38U3GKR2X
 X7uLlfSk7XzY7sM/nyO6NJxPsbsLDF8+qPJP+0o=
X-Google-Smtp-Source: AA6agR7fqIEHTSmGhYbl627Ui0VF9jYm5J1ob0BQ//Ts/ZjmyqCPs/lYRgtQbz4uTEfDAoWNWRkyAT07BghwvIbWCXo=
X-Received: by 2002:a17:903:2291:b0:16e:cf55:5c72 with SMTP id
 b17-20020a170903229100b0016ecf555c72mr9154487plh.121.1659338973250; Mon, 01
 Aug 2022 00:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220729201942.30738-1-richard.henderson@linaro.org>
In-Reply-To: <20220729201942.30738-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Aug 2022 17:29:07 +1000
Message-ID: <CAKmqyKOjnmwEPPEeAi4U0zsKMG8MMd+WFEp4AEHTj=S5juHKog@mail.gmail.com>
Subject: Re: [PATCH for-7.1?] linux-user/riscv: Align signal frame to 16 bytes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Jul 30, 2022 at 6:19 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Follow the kernel's alignment, as we already noted.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1093
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  linux-user/riscv/signal.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index 296e39fbf0..eaa168199a 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -64,9 +64,7 @@ static abi_ulong get_sigframe(struct target_sigaction *ka,
>
>      /* This is the X/Open sanctioned signal stack switching.  */
>      sp = target_sigsp(sp, ka) - framesize;
> -
> -    /* XXX: kernel aligns with 0xf ? */
> -    sp &= ~3UL; /* align sp on 4-byte boundary */
> +    sp &= ~0xf;
>
>      return sp;
>  }
> --
> 2.34.1
>
>


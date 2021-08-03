Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 051E13DE645
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 07:40:42 +0200 (CEST)
Received: from localhost ([::1]:47752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAnAO-00028A-Jz
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 01:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mAn8c-0001Pq-Ms
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:38:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1mAn8Z-0005Ux-Pp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 01:38:50 -0400
Received: by mail-ed1-x532.google.com with SMTP id n2so27437362eda.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 22:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GRbL7gJTPu4/o1bR4FJgxPNi2WoCiNAuCCMY2Y9zkwI=;
 b=Dgcpbcr2reHtfkt9XqPXOovj9t2js8lkYzsANActZQkzCZSWJkiptwq19RbAAOSUUW
 TnTHvjCLELKKRKwonLwDJmhesOLyYCr3TowuaXw1hJh/BMV5OxkfvenqCxZgN4IV16I2
 US76wRhXSwQFJygceBIlTHehdN5E4Al5iq3TT/cff+iEIte/cYbe38lqzJphfvjTDG6S
 5i3vqQ9usErHPWbRwZN4aiIN8bvlr4nTpcMflBPwx7fvnbXmQMcWGOGzSCYQmcK3zzjq
 1bwJjQi70H44O1tykh/Ee78oMDw/W3PXvrcr31ntLAv6IuBV8GQ2wKTCz5z/eJ5MkX20
 blfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GRbL7gJTPu4/o1bR4FJgxPNi2WoCiNAuCCMY2Y9zkwI=;
 b=P5QaFb74MVtAuR1rRntQxjmbyvZjUig/BucFv4uwmvPw5My7F0/YPo2dw15sYxPrL5
 69Y2JSjHEkXKzF4KKlL41zXYU5a9KkhMfPmPwYPtinyEcvUkyDYQRwGEc632IbB92QUH
 kAIqawQIWIGoeB+jn8qWe2Ts3IyFTJ44PKwA+rNOUrd7p/mPIB84B1gswbm8lf5cWZOE
 YundkAGbmD22U8t/iyrUZ5gvQNNAq8abS3Yl+8TW6+zxEvq/8yCt+eKIpzGx4cakJuY7
 cXKSinCP172Qj+r2x6u8A4l+INyjp/UImugKiuRUk8b3nmcIz58eDr9C0YGNw+rSycQD
 Bj6g==
X-Gm-Message-State: AOAM533qubuopBn+tqfUPuYPfQpZOCQX00LwpjbkZvPeMcPi2uxGoLZc
 JCPLh7YPepHEcJJha+RPHR0E+/DC+pelgLX58gw=
X-Google-Smtp-Source: ABdhPJwEfY187Aaptq+52Dn2xsyfHwVV1pfCrZMOY7QWrb7YnqvYtSXXPOjNQU/jtENc0jZrBAmTzhmOpojOHT/KGDE=
X-Received: by 2002:a50:f1c7:: with SMTP id y7mr23566135edl.386.1627969125126; 
 Mon, 02 Aug 2021 22:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-20-richard.henderson@linaro.org>
In-Reply-To: <20210803041443.55452-20-richard.henderson@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 2 Aug 2021 22:38:33 -0700
Message-ID: <CAMo8BfLWK-F2AnszrM3V46Ty1vOHr+jQqyJV3WWhkES-KO1RuA@mail.gmail.com>
Subject: Re: [PATCH v2 19/55] target/xtensa: Implement do_unaligned_access for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 2, 2021 at 9:15 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/xtensa/cpu.c    |  2 +-
>  target/xtensa/helper.c | 30 +++++++++++++++---------------
>  2 files changed, 16 insertions(+), 16 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>
-- 
Thanks.
-- Max


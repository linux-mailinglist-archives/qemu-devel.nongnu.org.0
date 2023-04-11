Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6058F6DD450
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 09:34:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm8V5-0000mp-Rr; Tue, 11 Apr 2023 03:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm8Uv-0000iP-4v
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:33:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pm8Us-0004tM-Tx
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 03:33:00 -0400
Received: by mail-wr1-x433.google.com with SMTP id q29so6356293wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681198377; x=1683790377;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0jitfQHxNKlLLWjbKOA7rm6DntsIwrUYmpjynRS/uek=;
 b=Ct+oFjKklmde7aWgn06ia69rf49YnWZ5M6ykhxeu4X6WUpPuMrODVAHPNIuX1H7GlC
 1CHX8VSM+DLPkXFjEfWlqljq2oVeLy6+ut5+UEt55FT5/fJbVCLFnlZvPjZdbpeP7yCx
 hkDCOkc/PMX9a1fsZc/vSL2rNJDaZGJQ7ZC8f0EuE36yoSfH+d6DoLPeJWvhNoB+NUjI
 7bNkOkJpF9OKaOxk6jgtqC6Ns+LklMkpsaWrJn/o25QezZ3q9Pxjjt2mryDY+veyd41o
 bmthG3SdS7j1XXy+U6UI3XAVA7n8YHRDfF6sMUj1tu72hYv1BzeMT1NTBNxH451ZU7rX
 20oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681198377; x=1683790377;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0jitfQHxNKlLLWjbKOA7rm6DntsIwrUYmpjynRS/uek=;
 b=NQrlALcGrq/b0BdrfpcF2KIoKw0Ua0L9DM8yz4rWmtPlkWI20M9H/PVQIlp2Sq/lEs
 Dti3B8eK0FMVS/Gm7IYNGC05ERtgwKFmtwJQrtRernWG4KgMwz5dpLxApXpIoFfFn9bT
 2MvRzXFxDTf+9ECy4o4FcOs2eiF2KhyU9a1JHvarJsESPIFW3jM0JcqCxFtnoRhTVp8t
 KjgWpokSc6VfkYjIs+Ayv0U07DIG1rzBTXwcHh3FDSF8qdhbwYjjRy4b/rQbQJIoOMF9
 iOntFUVblnxp73MxElwjsO8IDTJ5j1EKOVrMfiuEyrPV+0BQDsNWpa5GB68U/7+X5hYi
 3MFg==
X-Gm-Message-State: AAQBX9dCLeAVRD8hksFWXpYWPb+WYB5q8e9TPdr4mOBS2tG7QZrWURKa
 Hr8NodfMLLZeno5wVAT9MGg3mA==
X-Google-Smtp-Source: AKy350aKUv8+aZ99dOPFkzti9Bxtt87xAGxcyArg8Py/ULurTqNc3kASqY0ick0rH8FfulhwnoEUJQ==
X-Received: by 2002:adf:f448:0:b0:2ef:bbd7:63ab with SMTP id
 f8-20020adff448000000b002efbbd763abmr7669076wrp.31.1681198377062; 
 Tue, 11 Apr 2023 00:32:57 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f6-20020adff986000000b002e52dfb9256sm6682692wrr.41.2023.04.11.00.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 00:32:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5AFE01FFB7;
 Tue, 11 Apr 2023 08:32:56 +0100 (BST)
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-5-philmd@linaro.org>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, kvm@vger.kernel.org, qemu-ppc@nongnu.org, Peter
 Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 04/10] hw/intc/arm_gic: Rename 'first_cpu' argument
Date: Tue, 11 Apr 2023 08:31:27 +0100
In-reply-to: <20230405160454.97436-5-philmd@linaro.org>
Message-ID: <87r0sqrhzr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> "hw/core/cpu.h" defines 'first_cpu' as QTAILQ_FIRST_RCU(&cpus).
>
> arm_gic_common_reset_irq_state() calls its second argument
> 'first_cpu', producing a build failure when "hw/core/cpu.h"
> is included:
>
>   hw/intc/arm_gic_common.c:238:68: warning: omitting the parameter name i=
n a function definition is a C2x extension [-Wc2x-extensions]
>     static inline void arm_gic_common_reset_irq_state(GICState *s, int fi=
rst_cpu,
>                                                                        ^
>   include/hw/core/cpu.h:451:26: note: expanded from macro 'first_cpu'
>     #define first_cpu        QTAILQ_FIRST_RCU(&cpus)
>                              ^
>
> KISS, rename the function argument.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/intc/arm_gic_common.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 9702197856..889327a8cf 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -235,12 +235,13 @@ static void arm_gic_common_realize(DeviceState *dev=
, Error **errp)
>      }
>  }
>=20=20
> -static inline void arm_gic_common_reset_irq_state(GICState *s, int first=
_cpu,
> +static inline void arm_gic_common_reset_irq_state(GICState *s,
> +                                                  int
> first_cpu_index,

I'd have gone for a shorter name like cidx maybe, naming things is hard.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>                                                    int resetprio)
>  {
>      int i, j;
>=20=20
> -    for (i =3D first_cpu; i < first_cpu + s->num_cpu; i++) {
> +    for (i =3D first_cpu_index; i < first_cpu_index + s->num_cpu; i++) {
>          if (s->revision =3D=3D REV_11MPCORE) {
>              s->priority_mask[i] =3D 0xf0;
>          } else {


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro


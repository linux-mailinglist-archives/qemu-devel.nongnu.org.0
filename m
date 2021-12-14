Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7723A4745CB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 16:02:51 +0100 (CET)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx9KM-0002Ri-KL
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 10:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx9Ae-000352-I9
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:52:48 -0500
Received: from [2a00:1450:4864:20::32e] (port=46642
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mx9Ac-0000E2-FW
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 09:52:48 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso13897097wmr.5
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 06:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=u06OXByVgCfYKnQvNzHQPf/YtBhKZFAGAnwNf7R79dU=;
 b=NIUDoq9M0qi5xMGG4l8Jgfz+sAIyyA1VYGAy+Yo9l1HMD+Vlve9IEDgzvjogm0FLrJ
 eN3EtUyYMO8Oio5Hi0OBiOhkhs2cBGwKbNzqrtmzrhavrfOPiIG9a5nB7d4Xg1Kf0DoU
 qwnkIyanDEKwfMqmouUmdRC7dmnZiMA+YlNPVKbNUcwvwAv1cCnEdoopkR+3KcnDZDTt
 MZJjyU9nSlNxj7EFGmhIgSylZjGhrw7a6cLg8HsPpPhSx3XlooEaV9ARHtggrn2imrC6
 0UBNPEGhOX3xx5wuRc4Z0BwusWMwLnQbrGfY7yibMcFApKFoNU9ouYOw+26Z9x3aEF7n
 deRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=u06OXByVgCfYKnQvNzHQPf/YtBhKZFAGAnwNf7R79dU=;
 b=V1cveUbusad0upcUt7i0OLMZFd+MCib1gfK8/pu+9OA0nKBu095akiUoRnHxYuDw+7
 BQZ3dZLnlIncROE65Pkcvqm8l0mYdj/oq8SV4SVMk208WbAw96+0Ul48TepUI81BKUCU
 r2BrEve4sI5ZxXDD92LENVmwn84umQTH1uaXQ9QDhOwyfiucOi8wWchS8z9Mgp4IUooW
 QnFvrjXWd1fEJsK/8imPoPXZTD/eChx0OGYprXMtIBcbWie8BTRhf0rGJ4/60YknrOks
 d/a4Ec3pnzZBtLcTHBdPG4rLsM1Gihn13nnuZjymghyUT474vqDdH9RXRx/V7IZ7kCZT
 tipA==
X-Gm-Message-State: AOAM531fTzFfs1Gt8TbAkaQbFax2DpAMCWIQv8FvdTxVAo3D6SXwntgc
 Wan0b3+d3ufaxkssxhKN9K+mVA==
X-Google-Smtp-Source: ABdhPJwOBWVmWSVaB7AytVghexXkDBO/COGfG1ZapNpb1Ve73brHnkTKbRUiHJjc1lo58yuns7qX7g==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr7722435wmk.50.1639493564650;
 Tue, 14 Dec 2021 06:52:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m17sm115014wrw.11.2021.12.14.06.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 06:52:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C34ED1FF96;
 Tue, 14 Dec 2021 14:52:40 +0000 (GMT)
References: <20211208231154.392029-1-richard.henderson@linaro.org>
 <20211208231154.392029-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 3/6] target/arm: Honor TCR_ELx.{I}PS
Date: Tue, 14 Dec 2021 14:47:32 +0000
In-reply-to: <20211208231154.392029-4-richard.henderson@linaro.org>
Message-ID: <877dc7i6h3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This field controls the output (intermediate) physical address size
> of the translation process.  V8 requires to raise an AddressSize
> fault if the page tables are programmed incorrectly, such that any
> intermediate descriptor address, or the final translated address,
> is out of range.
>
> Add an outputsize field to ARMVAParameters, and fill it in during
> aa64_va_parameters.  Pass the value to check_s2_mmu_setup to use
> instead of the raw PAMax value.  Test the descaddr as extracted
> from TTBR and from page table entries.
>
> Restrict descaddrmask so that we won't raise the fault for v7.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |  1 +
>  target/arm/helper.c    | 92 +++++++++++++++++++++++++++++-------------
>  2 files changed, 65 insertions(+), 28 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 27d2fcd26c..3e801833b4 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1032,6 +1032,7 @@ static inline uint32_t aarch64_pstate_valid_mask(co=
nst ARMISARegisters *id)
>   */
>  typedef struct ARMVAParameters {
>      unsigned tsz    : 8;
> +    unsigned ps     : 3;
>      unsigned select : 1;
>      bool tbi        : 1;
>      bool epd        : 1;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fab9ee70d8..568914bd42 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11003,7 +11003,7 @@ do_fault:
>   * false otherwise.
>   */
>  static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
> -                               int inputsize, int stride)
> +                               int inputsize, int stride, int outputsize)
>  {
>      const int grainsize =3D stride + 3;
>      int startsizecheck;
> @@ -11019,22 +11019,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, boo=
l is_aa64, int level,
>      }
>=20=20
>      if (is_aa64) {
> -        CPUARMState *env =3D &cpu->env;
> -        unsigned int pamax =3D arm_pamax(cpu);
> -
>          switch (stride) {
>          case 13: /* 64KB Pages.  */
> -            if (level =3D=3D 0 || (level =3D=3D 1 && pamax <=3D 42)) {
> +            if (level =3D=3D 0 || (level =3D=3D 1 && outputsize <=3D 42)=
) {
>                  return false;
>              }
>              break;
>          case 11: /* 16KB Pages.  */
> -            if (level =3D=3D 0 || (level =3D=3D 1 && pamax <=3D 40)) {
> +            if (level =3D=3D 0 || (level =3D=3D 1 && outputsize <=3D 40)=
) {
>                  return false;
>              }
>              break;
>          case 9: /* 4KB Pages.  */
> -            if (level =3D=3D 0 && pamax <=3D 42) {
> +            if (level =3D=3D 0 && outputsize <=3D 42) {
>                  return false;
>              }
>              break;
> @@ -11043,8 +11040,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool =
is_aa64, int level,
>          }
>=20=20
>          /* Inputsize checks.  */
> -        if (inputsize > pamax &&
> -            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
> +        if (inputsize > outputsize &&
> +            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
>              /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.=
  */
>              return false;
>          }
> @@ -11090,17 +11087,19 @@ static uint8_t convert_stage2_attrs(CPUARMState=
 *env, uint8_t s2attrs)
>  }
>  #endif /* !CONFIG_USER_ONLY */
>=20=20
> +/* This mapping is common between ID_AA64MMFR0.PARANGE and TCR_ELx.{I}PS=
. */
> +static const uint8_t pamax_map[] =3D {
> +    [0] =3D 32,
> +    [1] =3D 36,
> +    [2] =3D 40,
> +    [3] =3D 42,
> +    [4] =3D 44,
> +    [5] =3D 48,
> +};

I note that the IPS encoding includes b110 (6) for 52 bits or 4PB
addressing. I guess that gets introduced later.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


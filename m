Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3913F1AD1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:43:45 +0200 (CEST)
Received: from localhost ([::1]:59868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiKe-0003FE-Re
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiIg-00010u-Ok
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:41:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiIf-0005t1-20
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:41:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gr13so13040733ejb.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Zfur643o1ACOiDICbxUWdVXA/wTCxhPbgbWj4h2t6s=;
 b=NrjiztVOwaWnsRk+3qbVKFClGIyGBJJC8brT1msO3rM7A43DRViEIsaBr6t3F28gaW
 J55ftSR3BCxxeddADnewTvpG4bVMinxGtsBawY5R8zXuNqigA0tdadJKQJ67XSx9qcJU
 vWh4cEwZRxczyZedn++aDX/auURNPS0fLNJxW3/mw6egjbRvyPqQ+wxoyGeTB1y1n8gq
 yF3OQ1Nt9A0aMpeUDghe+EjcS9n/YhLhxqY2haWRSsKGMJ+LWSfyfv2GvSxGKorztqWr
 NBhdu75N+iPXjboW5uOjuRjLsVXs+7MmAfQMZ3rUYaFcHdkWTpKgUf7v1mlN3hnhMPuG
 DR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Zfur643o1ACOiDICbxUWdVXA/wTCxhPbgbWj4h2t6s=;
 b=YKBhy+QFeX5k1xfojNzRKT1hCv+lhCWTxEo6VTnS2RPT2aLEp/vfVqpKLwGfmkKjUn
 YsoQMW+Cc2rWwkHe1FyRJds64ulbCjf2qjtPDWrxQE/iPivukXrHIPUD6XHL+jNL0uKp
 iCVfhfpfp7gT4lT0obJVmskXawj9jzLgD4XV+0MHOyUkRL+Ek336XKdAziZNKo8QXWSP
 QaQrMEmPUgK622T/5eehVg+ufIV/cb4lXslLVCtprbDNwlSEfkTRRQM8RkIipnUDRzmF
 JCZY0BxUhyGekJFV+1J0BTpD255E4/P8qmRid7es3ZRYO3jSae0d6rdOUJ3qpakpf4Cb
 yRbw==
X-Gm-Message-State: AOAM530dYm848uMPNw5LMuIucy0bHuDdNtwqgZMtSdZPiP0hZWAx5ibN
 dIRb3G6wRMKBfQjZk0nhGxGiasJCe0D5bCj6OueSjd5au/Y=
X-Google-Smtp-Source: ABdhPJzczUZOeUsGYuc3bh5f4UipnixjAlEFHfmm1XU9kKpo4VQBiZMKC4BowS8+LCb61JxRZUn8egrM7GyURGSTwwU=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr15835594ejb.4.1629380499314; 
 Thu, 19 Aug 2021 06:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:40:53 +0100
Message-ID: <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Aug 2021 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNDEFINED and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>  static void arm_post_translate_insn(DisasContext *dc)
>  {
>      if (dc->condjmp && !dc->base.is_jmp) {
> @@ -9500,7 +9504,25 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      CPUARMState *env = cpu->env_ptr;
>      unsigned int insn;
>
> -    if (arm_pre_translate_insn(dc)) {
> +    /* Singlestep exceptions have the highest priority. */
> +    if (arm_check_ss_active(dc)) {
> +        dc->base.pc_next += 4;
> +        return;
> +    }
> +
> +    if (dc->base.pc_next & 3) {
> +        /*
> +         * PC alignment fault.  This has priority over the instruction abort
> +         * that we would receive from a translation fault via arm_ldl_code
> +         * (or the execution of the kernelpage entrypoint).
> +         */
> +        gen_exception_insn(dc, dc->base.pc_next, EXCP_UDEF,
> +                           syn_pcalignment(), default_exception_el(dc));
> +        dc->base.pc_next = QEMU_ALIGN_UP(dc->base.pc_next, 4);
> +        return;
> +    }
> +
> +    if (arm_check_kernelpage(dc)) {
>          dc->base.pc_next += 4;
>          return;
>      }
> @@ -9570,7 +9592,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      uint32_t insn;
>      bool is_16bit;
>
> -    if (arm_pre_translate_insn(dc)) {
> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {


Is it not possible to get a misaligned PC in the Thumb case ?

>          dc->base.pc_next += 2;
>          return;
>      }

-- PMM


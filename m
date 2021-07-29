Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66FC3DA49D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 15:46:37 +0200 (CEST)
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96Mu-0001bx-8q
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 09:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m96Lf-0000fc-0V
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:45:19 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m96Ld-0005bm-7Q
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 09:45:18 -0400
Received: by mail-ej1-x62f.google.com with SMTP id go31so10791358ejc.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 06:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CTYvGkU9ZIsESGVvu4HdH2ownxO1cRnQ7sZzqn3fnyM=;
 b=YKTnHVrovokAAyfDlfqA/YhTxpCgBm2oD4AqdwRAHswBW/G+4wf4WJPPYUustgchyJ
 0DylGTJSEHSN0trMwNhOyw95AEL7J+oLObs64oaSpv3cLsZFC7qQ9rj4wCb3ZtkzhkaO
 +DNGDXBdQd8zOyxMN3ul8A1DuVku+DlBeMGQKqb7aJAQJlyEIZWlcC7z4iCmG58+YniL
 oRNDtl9bJL0Q3hP84TFMpVEmnEOxORtz8IuMCoxvILDL+o75Vb6H2mjbGfdNvoajwfsj
 BJ5SLs7xqdnX6pjA1yAhuJsbg1eFxNrJ1qiFqHG3DjbUUYMvSxF2HzA31MAo6oqooFaL
 yDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CTYvGkU9ZIsESGVvu4HdH2ownxO1cRnQ7sZzqn3fnyM=;
 b=FWHMLEUdJOOJYN/FkV3ZvFYQBhiYw0nCzKjkxK+IYIUS3pjuGrnDlGxhy0CFj4r2Hb
 d6mUFeDYUZCwduk5x+97vXqN3NFyy1+WBYcM7DCTWB+8AflHLC/PN+uWbhjJOb9VcQ+M
 WY95tP0a+R+FVRBoIlRVQC5nTQO1bBgFnM4FSVi1D7AP6YkOnIfRWMlw8jEUrqYtDaqZ
 8t6ndjmiOcs/3q1fZZIt+EtdyeeG+Zk9CBn14TRIQNRwzqkoVFCzjq9IuSEslfe85KFf
 KZoI9eaUzYswzDezYlqXGx+nojtSUy5MdAWMHwRbeMaRKrkD3F7xZZTO1LYSkw3bNIgi
 z+6A==
X-Gm-Message-State: AOAM5338MZp87TebZ30UzplyaYzQe+aMFKPjCKJLkLIbyOMeSsiZzHTZ
 Y8w943tFuDzIh0FofywTiKDmPJSTKDyLAGPaPseKQA==
X-Google-Smtp-Source: ABdhPJw56a0+nudH8c9cDA4o9A1ckV5qxqpoNsY0tENM54cYVB0SF3D3FwjoQcfKS7UyO+E8xM2oqWTI1Oi+EWPqHFo=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr4792071ejz.250.1627566315507; 
 Thu, 29 Jul 2021 06:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-8-richard.henderson@linaro.org>
In-Reply-To: <20210729004647.282017-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Jul 2021 14:44:33 +0100
Message-ID: <CAFEAcA-SHZbfEppKBZxVw3+t4VRSRfN7yA4PNNHX9LQ=OkKhjw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 07/43] target/ppc: Set fault address in
 ppc_cpu_do_unaligned_access
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 01:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We ought to have been recording the virtual address for reporting
> to the guest trap handler.
>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/excp_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index a79a0ed465..0b2c6de442 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -1503,6 +1503,8 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
>      CPUPPCState *env = cs->env_ptr;
>      uint32_t insn;
>
> +    env->spr[SPR_DAR] = vaddr;
> +

Is this the right SPR for all PPC variants? For instance the
kernel's code in arch/powerpc/kernel/exceptions-64e.S looks
in SPRN_DEAR, which is our SPR_BOOKE_DEAR or SPR_40x_DEAR.

-- PMM


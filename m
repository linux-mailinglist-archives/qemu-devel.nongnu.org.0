Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8A36F543A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:14:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8Z9-0000Ld-H0; Wed, 03 May 2023 05:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pu8Z4-0008Mt-8V
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:14:23 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1pu8Z2-0006Yx-Mo
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:14:22 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f3331f928cso30219185e9.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683105258; x=1685697258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R/v/5578I+S3Crmtq0JIaHpyxyBUFP1tU/u2+Dgdt90=;
 b=J7FKujiZmG4VjwD7aaVOpXBupeuoYlui2mJx95KDwjNlJSpXqS+W9Tztf/LhzwvstY
 jcpORa1fKKnYDlSr/QrMkhictT6yQrcMyhfax7+YOF1SCmKdOBvPuHUYbFm3IzoRMD0q
 66crNjs5pOxNlt6Hfo8RiWOjGbC3jerK/oHmlNTKq+KMJtYhOAkStv1VF5MisPGcPMtC
 C2KmX5c0GCgrM68reHHNwhVKgRZLtYs/UHRrBzyU8VSaX5gRw7mUh1Vxt//Ymakx4xDl
 L4WB4X3hh64Y2vUMV4K8un3kkgo6SUKkmCnJSIEs98U+vDsaCXNboqFcxuG+kamotBtU
 bnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105258; x=1685697258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R/v/5578I+S3Crmtq0JIaHpyxyBUFP1tU/u2+Dgdt90=;
 b=X+paIpzZJOlfg+MEQQ4aDYQGlVMjMQkiBVnuUwLSYl3huXDr/JX3AOeCBS26FQp/mT
 JB+3tOLguMEUP+/Js+ya89UYSFGxAWUVucEon4gPWUJF8ylqaRlNucQQfNAfg4wGTTBo
 QN56p1wF89vJfjKsHG4GDWpaR9worLX+RCkGE6gd5NxCF9K4hm1Oww0Qb9cnYaoGoyhd
 VJyp+p8TGksThzeEJJ0Rnqtnm1NY5Fx5zCYFuN9/fOeFEhVab7Yryw9Z0gN3+hq2ytnG
 i1Dfu6JEZgkh0WZzOog7JO3IyH6bY/IH6KIu0OVtn7K8LflLw33r+LPo4kYK7emDuk7q
 /YNg==
X-Gm-Message-State: AC+VfDzyHajH/+EEk7BiMSG+CyJEm8akOJHxGnjV+1BbPiY4DGmPY135
 tdF4ighFVNrzmcLMPbzwVuM=
X-Google-Smtp-Source: ACHHUZ6UZ1zaLJe6vboTg/B8odSiPOsxnKi7tS2fvd5fFMY+FQ6oHCAWevKS8ENFU4UuilpaLoOWrw==
X-Received: by 2002:a7b:ca53:0:b0:3f0:a08e:811b with SMTP id
 m19-20020a7bca53000000b003f0a08e811bmr14317681wml.13.1683105258127; 
 Wed, 03 May 2023 02:14:18 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 p4-20020a1c7404000000b003f1739a0116sm1255349wmc.33.2023.05.03.02.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 02:14:17 -0700 (PDT)
Date: Wed, 3 May 2023 10:14:17 +0100
From: Stafford Horne <shorne@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Linux OpenRISC <linux-openrisc@vger.kernel.org>
Subject: Re: [PATCH 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Message-ID: <ZFIl6db3isktCOk8@antec>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-4-shorne@gmail.com>
 <933ff5d8-3875-34ac-9bc4-ed06f74efad7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <933ff5d8-3875-34ac-9bc4-ed06f74efad7@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 08:37:31AM +0100, Richard Henderson wrote:
> On 5/2/23 19:57, Stafford Horne wrote:
> > OpenRISC defines tininess to be detected before rounding.  Setup qemu to
> > obey this.
> > 
> > Signed-off-by: Stafford Horne <shorne@gmail.com>
> > ---
> >   target/openrisc/cpu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> > index 0ce4f796fa..cdbff26fb5 100644
> > --- a/target/openrisc/cpu.c
> > +++ b/target/openrisc/cpu.c
> > @@ -22,6 +22,7 @@
> >   #include "qemu/qemu-print.h"
> >   #include "cpu.h"
> >   #include "exec/exec-all.h"
> > +#include "fpu/softfloat-helpers.h"
> >   #include "tcg/tcg.h"
> >   static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
> > @@ -90,6 +91,10 @@ static void openrisc_cpu_reset_hold(Object *obj)
> >       s->exception_index = -1;
> >       cpu_set_fpcsr(&cpu->env, 0);
> > +    set_default_nan_mode(1, &cpu->env.fp_status);
> > +    set_float_detect_tininess(float_tininess_before_rounding,
> > +                              &cpu->env.fp_status);
> 
> You don't mention the nan change in the commit message.

Right, and I am not sure I need it.  Let me remove it and run tests again.  I
was just adding it as a few other architectures did who set
float_tininess_before_rounding.

Will clean this up.


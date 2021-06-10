Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5D93A2CA9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:16:31 +0200 (CEST)
Received: from localhost ([::1]:33364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKXu-0007LQ-MF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:16:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrKWQ-0005pJ-Je
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:14:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrKWK-0008O8-G6
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:14:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id ba2so31229299edb.2
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HL1gAye5FRm2nsVhpIwvGwC0atwl+wocu77Jo4xdVe4=;
 b=AAX5p6P7Bjr6pyd1HF41+vYAWS0lrqawbhcwVxmO6ha9d8yzaFRh83BO6BId0UpGEh
 qAkhLnJc5LZxh2WKRvZ+NizFym0nqMuGLwlWQZVrlUQsAwPM+M2GEcv1VT4WR/8Z5942
 Ad2JaB7V7XKsa8Z8epwEvIBd9+wlhw0EjSz2tuczp+WqRRdzT+0rhqbptDv+sV4Q2iK6
 PFTxgO4OOo9NX1gBql4i73n/njo7VrS+q9UmAhaRzyxxHTFCuwtPKliqOi4/OYdFqyt0
 lLDqP7DphZSnERQwTPP7Vxf8BGgSEpJ5KA2XMLYaYHs5DgOkh63JpN8DS2qvCDs1P5Eh
 nqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HL1gAye5FRm2nsVhpIwvGwC0atwl+wocu77Jo4xdVe4=;
 b=Kub3BVweH0OgUdJZhCWqI/HAQBJZB/4MyvPw1AOM50EkFZoIJTuF8ApafWuSIU1jDb
 cpMW77O7kPyse1tZADpSwEZ4UX5RJwZc+0nNaN+Hhmf3xyxEImfWCkBwWZf2PgFaMrZl
 EbdAxGHk71BJWwnSePsu8gj+94t2u7v7ALcY/qUvXpLrRxpKntluJq2vzTSk/LhJy3TD
 Xv232wLrDKrYPD0iKyZml7IVFWVNyPy9wOJZBPc7BX+PyNw5LK9TnSKbniO6uBnVlPkN
 NewjkSy5jqum/bHc+E4UZklLNQDoCh7Oz8luyzFKYiO+rY0lxEOAkMM3sD8noGvxx82B
 EMTA==
X-Gm-Message-State: AOAM531lXCCdZ+5wwzayrW2IOr6ac4LES/6gRY8kjNjNQZABqCSJc8MD
 4hLvKD6CLclkkHkPQwpJ0/jDOozQ/jI+Ewzpqm/GUQ==
X-Google-Smtp-Source: ABdhPJy+6QylH4CPpKHUtzzCoRLT2wUBLj2nOoXmTE92ievUkC6dbdQqWVezDmrIJCRXi5oFIduiiaG2bHtlSOL0aiw=
X-Received: by 2002:a05:6402:1216:: with SMTP id
 c22mr4700170edw.36.1623330890064; 
 Thu, 10 Jun 2021 06:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
In-Reply-To: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 14:14:16 +0100
Message-ID: <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
Subject: Re: tb_flush() calls causing long Windows XP boot times
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Jun 2021 at 14:02, Programmingkid <programmingkidx@gmail.com> wr=
ote:
>
> Hi Richard,
>
> There is a function called breakpoint_invalidate() in cpu.c that calls a =
function called tb_flush(). I have determined that this call is being made =
over 200,000 times when Windows XP boots. Disabling this function makes Win=
dows XP boot way faster than before. The time went down from around 3 minut=
es to 20 seconds when I applied the patch below.
>
> After I applied the patch I ran several tests in my VM's to see if anythi=
ng broke. I could not find any problems. Here is the list my VM's I tested:
>
> Mac OS 10.8 in qemu-system-x86_64
> Windows 7 in qemu-system-x86_64
> Windows XP in qemu-system-i386
> Mac OS 10.4 in qemu-system-ppc
>
> I would be happy if the patch below was accepted but I would like to know=
 your thoughts.

>  cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/cpu.c b/cpu.c
> index bfbe5a66f9..297c2e4281 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -253,7 +253,7 @@ static void breakpoint_invalidate(CPUState *cpu, targ=
et_ulong pc)
>       * Flush the whole TB cache to force re-translation of such TBs.
>       * This is heavyweight, but we're debugging anyway.
>       */
> -    tb_flush(cpu);
> +    /* tb_flush(cpu); */
>  }
>  #endif

The patch is clearly wrong -- this function is called when a CPU breakpoint
is added or removed, and we *must* drop generated code which either
(a) includes code to take the breakpoint exception and now should not
or (b) doesn't include code to take the breakpoint exception and now should=
.
Otherwise we will incorrectly take/not take a breakpoint exception when
that stale code is executed.

As the comment notes, the assumption is that we won't be adding and
removing breakpoints except when we're debugging and therefore
performance is not critical. Windows XP is clearly doing something
we weren't expecting, so we should ideally have a look at whether
we can be a bit more efficient about not throwing the whole TB
cache away.

thanks
-- PMM


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2B45EDD0
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:23:00 +0100 (CET)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqaFn-0000b4-J8
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:22:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqZup-0001jZ-L8
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 07:01:21 -0500
Received: from [2a00:1450:4864:20::333] (port=43821
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqZul-0000DV-Cb
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 07:01:19 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so6635977wmc.2
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 04:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9GxEI1vtoWe+8hXlrHfAqdKMoXfGC3gPsbnvjhUZexw=;
 b=cXCn/4K7XJrSjlYhwCyeIkgFRxkgVb05jLvp1vtdgl8iYZxt9HpG/p2HMZveN1nnyN
 PElQws9hUI5Tfaf0GSytUd07fmeg4oQLleClIJS29Av/whUEu9kxssJItNwYIysCGIIg
 X/J1N82ijR6Xzf3mFPhK3kxFAsfVcz8c4m1Oqod355Fn9iFHh+xMaU4OgDH5Ouhs9ya4
 LdHv6ASim5f9nQU0dSWBskslIkU56+llzZ/esAc4ErsRx5l7Z38FoZ09k9DyxIQKmPfV
 8GSpjLBX7pj/8j8Gqb4I/L/kplcj0ZnAtlrB+47OT17tDC4lByedyQxwuN43YkjsYdA9
 /Uaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9GxEI1vtoWe+8hXlrHfAqdKMoXfGC3gPsbnvjhUZexw=;
 b=29CZvSqn4Owths24sahSLpp9y5bH7V+q1rLz1Yixo4j/Z6LUIedmXDOTXBbvBAqqIZ
 v4O0txLoYAX1TK1ogDiNuQKkZGb7prqb+/L3Qi0oVQ01pfQPZMDsBLWZyt5EJVUEwwWN
 EUbTB2DVHcM/gEL5JxHsy2UTI8Q+Rg4Drnc5If45z3EFKcej0RhmnQ5TW0bxRSMja8St
 0aRxOuq/SOZXWuuJHgxp7ve1/fqyymj7kme+pMI7epOrjIq4hGP89WxM46x0RFOF7wvQ
 mMEkvNiW1e/Kb1CLIsA4c/v+qW4fK6zmsT2hgW9aTFLJPDW5nytiiWV3sk9kXFDnoyc9
 1E5w==
X-Gm-Message-State: AOAM530G/rqnGgKjk08BDxmixweI06uOT2tcRmCJXFBjJccngruVkDBi
 X8yZANloRKw/NNOpDQA9GOtAxw==
X-Google-Smtp-Source: ABdhPJw35xWODQx/TUgcDO9MjhlOBnw5yYVb9qa1K0Eys7feDBhAXD/GTkdmIe4B/3x/lDabPHHCbA==
X-Received: by 2002:a1c:23d2:: with SMTP id j201mr15346737wmj.76.1637928070373; 
 Fri, 26 Nov 2021 04:01:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h2sm5204759wrz.23.2021.11.26.04.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 04:01:09 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6F2FE1FF96;
 Fri, 26 Nov 2021 12:01:08 +0000 (GMT)
References: <20211124202005.989935-1-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] hw/intc/arm_gicv3: Update cached state after LPI
 state changes
Date: Thu, 25 Nov 2021 15:37:53 +0000
In-reply-to: <20211124202005.989935-1-peter.maydell@linaro.org>
Message-ID: <877dcvf7nf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The logic of gicv3_redist_update() is as follows:
>  * it must be called in any code path that changes the state of
>    (only) redistributor interrupts
>  * if it finds a redistributor interrupt that is (now) higher
>    priority than the previous highest-priority pending interrupt,
>    then this must be the new highest-priority pending interrupt
>  * if it does *not* find a better redistributor interrupt, then:
>     - if the previous state was "no interrupts pending" then
>       the new state is still "no interrupts pending"
>     - if the previous best interrupt was not a redistributor
>       interrupt then that remains the best interrupt
>     - if the previous best interrupt *was* a redistributor interrupt,
>       then the new best interrupt must be some non-redistributor
>       interrupt, but we don't know which so must do a full scan
>
> In commit 17fb5e36aabd4b2c125 we effectively added the LPI interrupts
> as a kind of "redistributor interrupt" for this purpose, by adding
> cs->hpplpi to the set of things that gicv3_redist_update() considers
> before it gives up and decides to do a full scan of distributor
> interrupts. However we didn't quite get this right:
>  * the condition check for "was the previous best interrupt a
>    redistributor interrupt" must be updated to include LPIs
>    in what it considers to be redistributor interrupts
>  * every code path which updates the LPI state which
>    gicv3_redist_update() checks must also call gicv3_redist_update():
>    this is cs->hpplpi and the GICR_CTLR ENABLE_LPIS bit
>
> This commit fixes this by:
>  * correcting the test on cs->hppi.irq in gicv3_redist_update()
>  * making gicv3_redist_update_lpi() always call gicv3_redist_update()
>  * introducing a new gicv3_redist_update_lpi_only() for the one
>    callsite (the post-load hook) which must not call
>    gicv3_redist_update()
>  * making gicv3_redist_lpi_pending() always call gicv3_redist_update(),
>    either directly or via gicv3_redist_update_lpi()
>  * removing a couple of now-unnecessary calls to gicv3_redist_update()
>    from some callers of those two functions
>  * calling gicv3_redist_update() when the GICR_CTLR ENABLE_LPIS
>    bit is cleared
>
> (This means that the not-file-local gicv3_redist_* LPI related
> functions now all take care of the updates of internally cached
> GICv3 information, in the same way the older functions
> gicv3_redist_set_irq() and gicv3_redist_send_sgi() do.)
>
> The visible effect of this bug was that when the guest acknowledged
> an LPI by reading ICC_IAR1_EL1, we marked it as not pending in the
> LPI data structure but still left it in cs->hppi so we would offer it
> to the guest again.  In particular for setups using an emulated GICv3
> and ITS and using devices which use LPIs (ie PCI devices) a Linux
> guest would complain "irq 54: nobody cared" and then hang.  (The hang
> was intermittent, presumably depending on the timing between
> different interrupts arriving and being completed.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Interestingly this also triggers an extra IRQ in v4 of my kvm-unit-test
ITS patches. However it works with v3 which was more limited in the
excising of the test:

v3:

--8<---------------cut here---------------start------------->8---
modified   arm/gic.c
@@ -732,21 +732,17 @@ static void test_its_trigger(void)
 			"dev2/eventid=3D20 does not trigger any LPI");
=20
 	/*
-	 * re-enable the LPI but willingly do not call invall
-	 * so the change in config is not taken into account.
-	 * The LPI should not hit
+	 * re-enable the LPI. While "A change to the LPI configuration
+	 * is not guaranteed to be visible until an appropriate
+	 * invalidation operation has completed" hardware that doesn't
+	 * implement caches may have delivered the event at any point
+	 * after the enabling. Check the LPI has hit by the time the
+	 * invall is done.
 	 */
 	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
 	stats_reset();
 	cpumask_clear(&mask);
 	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=3D20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
-	stats_reset();
-	cpumask_clear(&mask);
 	cpumask_set_cpu(3, &mask);
 	its_send_invall(col3);
 	wait_for_interrupts(&mask);
--8<---------------cut here---------------end--------------->8---

v4:

--8<---------------cut here---------------start------------->8---
modified   arm/gic.c
@@ -732,34 +732,22 @@ static void test_its_trigger(void)
 			"dev2/eventid=3D20 does not trigger any LPI");
=20
 	/*
-	 * re-enable the LPI but willingly do not call invall
-	 * so the change in config is not taken into account.
-	 * The LPI should not hit
+	 * re-enable the LPI. While "A change to the LPI configuration
+	 * is not guaranteed to be visible until an appropriate
+	 * invalidation operation has completed" hardware that doesn't
+	 * implement caches may have delivered the event at any point
+	 * after the enabling. Check the LPI has hit by the time the
+	 * invall is done.
 	 */
-	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
-	stats_reset();
-	cpumask_clear(&mask);
-	its_send_int(dev2, 20);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, -1, -1),
-			"dev2/eventid=3D20 still does not trigger any LPI");
-
-	/* Now call the invall and check the LPI hits */
 	stats_reset();
-	cpumask_clear(&mask);
-	cpumask_set_cpu(3, &mask);
+	gicv3_lpi_set_config(8195, LPI_PROP_DEFAULT);
 	its_send_invall(col3);
-	wait_for_interrupts(&mask);
-	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=3D20 pending LPI is received");
-
-	stats_reset();
 	cpumask_clear(&mask);
 	cpumask_set_cpu(3, &mask);
 	its_send_int(dev2, 20);
 	wait_for_interrupts(&mask);
 	report(check_acked(&mask, 0, 8195),
-			"dev2/eventid=3D20 now triggers an LPI");
+			"dev2/eventid=3D20 triggers an LPI");
=20
 	report_prefix_pop();
=20
--8<---------------cut here---------------end--------------->8---

I think my v3 was correct and the v4 is too aggressive as I was chasing
a regression in the QEMU code.

> ---
> I think this is now a proper fix for the problem. Testing
> definitely welcomed... The commit message makes it sound like a bit
> of a "several things in one patch" change, but it isn't really IMHO:
> I just erred on the side of being very verbose in the description...
> ---
>  hw/intc/gicv3_internal.h   | 17 +++++++++++++++++
>  hw/intc/arm_gicv3.c        |  6 ++++--
>  hw/intc/arm_gicv3_redist.c | 14 ++++++++++----
>  3 files changed, 31 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index a0369dace7b..70f34ee4955 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -463,7 +463,24 @@ void gicv3_dist_set_irq(GICv3State *s, int irq, int =
level);
>  void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
>  void gicv3_redist_process_lpi(GICv3CPUState *cs, int irq, int level);
>  void gicv3_redist_lpi_pending(GICv3CPUState *cs, int irq, int level);
> +/**
> + * gicv3_redist_update_lpi:
> + * @cs: GICv3CPUState
> + *
> + * Scan the LPI pending table and recalculate the highest priority
> + * pending LPI and also the overall highest priority pending interrupt.
> + */
>  void gicv3_redist_update_lpi(GICv3CPUState *cs);
> +/**
> + * gicv3_redist_update_lpi_only:
> + * @cs: GICv3CPUState
> + *
> + * Scan the LPI pending table and recalculate cs->hpplpi only,
> + * without calling gicv3_redist_update() to recalculate the overall
> + * highest priority pending interrupt. This should be called after
> + * an incoming migration has loaded new state.
> + */
> +void gicv3_redist_update_lpi_only(GICv3CPUState *cs);

good commenting ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e


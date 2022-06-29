Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9E560553
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 18:07:40 +0200 (CEST)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6aE6-0001sw-RE
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 12:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6aAp-0007Hp-Na
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 12:04:15 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o6aAb-00079i-0B
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 12:04:15 -0400
Received: by mail-ej1-x633.google.com with SMTP id lw20so33576157ejb.4
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 09:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=kSJHpSy1kq/oPRh92xNBhfaI2n5dqITd1LpbGFIB4z8=;
 b=RqIMzuoICNwUoXE7sIt+EoJJcQRu7hu9leAPzPeVUGW/6i0z2fiG4BGWc2jXY5x1Xh
 oeBF4x/fEWS6yV7rYLFmeSgPqiL22Y79vq3Vj+uOWKFhOIhwLTGKrLlOIguXhkoDMJ6b
 zQmzYJTDD3xCLDKO4+buaZhxz07pa9K/rYTwuZ6GpobIhMzxDcHwE0haEtevT/MwHgLS
 xCTe2Wf4lVIuTpO9eBSdrf/1qrLIzxF+ILELkXEFlsX2oeOcxP30z9tyELY+LsRyhYHP
 oUjLHWPxVpXd75Ycmosm6w61MY89fuHwL66BWcKWVRfbmZxt9o0CTFzuvZ4w/tGRONDo
 pN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=kSJHpSy1kq/oPRh92xNBhfaI2n5dqITd1LpbGFIB4z8=;
 b=tiNGpoF9fNp+qgHB9+VhAzRTGRRQYDl3SmtipK78R86G8k26zt2niNE7WY+DYTkrDK
 Ajbmp5OMCtR3FB3ULoTBszhpslN8t5lnK3keNedzZLTWp/D/AOofe5x4IngNcpiFAlMI
 SJsgPSUyOCOcwdUW+9gTfoueO8i3HCiNmuQ8mmjuuEnNxwhhr+dunu5ZNAnaW9shp9KL
 xvud9UEFGaRuOJek2WAa8+1OSOgfJ7xANsOoNsuW4ZmDhbs+ocDvK/wyzvT1KpGMiW1D
 QYbW9TtxcNcB2GmZio2sYho81mCXhNktgPfJYM8w3OlkWOMHCXO+QO2Rri1/CWXuvWsI
 G6hQ==
X-Gm-Message-State: AJIora9zgTr8v07j1qf12sYuce/WM0N/6eBNH0sh0cx893MMrUrORYB+
 3H0r2E4eJrx0uy0sg10aPRWUuw==
X-Google-Smtp-Source: AGRyM1ucU2w4IuySZy2rLsTNIdz6lr1cN60gNbaWUUVPtBj7HQelXx1w1XyxDV+ToccQFliIGWbOAg==
X-Received: by 2002:a17:907:7678:b0:726:9d66:8f0a with SMTP id
 kk24-20020a170907767800b007269d668f0amr4186503ejc.76.1656518638768; 
 Wed, 29 Jun 2022 09:03:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a17090613c500b00722fb3c99bcsm7880342ejc.203.2022.06.29.09.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 09:03:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4D4A51FFB7;
 Wed, 29 Jun 2022 17:03:56 +0100 (BST)
References: <111e5b6c-41a7-89a4-b4d2-2eda1a295ffa@linux.ibm.com>
 <dd5f1753-ff56-f248-9863-b39739fb6093@eldorado.org.br>
 <cf38218a-6e13-8024-8e08-fcdd74faa5a8@linux.ibm.com>
 <87h744keg7.fsf@linaro.org>
 <348a8b91-6d91-7429-615b-c0e3d23e4fce@linux.ibm.com>
 <8735fojukm.fsf@linaro.org>
 <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
User-agent: mu4e 1.7.27; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>
Cc: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: Slowness with multi-thread TCG?
Date: Wed, 29 Jun 2022 17:01:01 +0100
In-reply-to: <44596e63-1631-ee12-231c-15be9c914a74@linux.ibm.com>
Message-ID: <87mtdvh2xf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


Frederic Barrat <fbarrat@linux.ibm.com> writes:

> On 29/06/2022 00:17, Alex Benn=C3=A9e wrote:
>> If you run the sync-profiler (via the HMP "sync-profile on") you can
>> then get a breakdown of which mutex's are being held and for how long
>> ("info sync-profile").
>
>
> Alex, a huge thank you!
>
> For the record, the "info sync-profile" showed:
> Type               Object  Call site                     Wait Time (s)
> Count  Average (us)
> -------------------------------------------------------------------------=
-------------------------
> BQL mutex  0x55eb89425540  accel/tcg/cpu-exec.c:744           96.31578
> 73589937          1.31
> BQL mutex  0x55eb89425540  target/ppc/helper_regs.c:207        0.00150
> 1178          1.27
>
>
> And it points to a lock in the interrupt delivery path, in
> cpu_handle_interrupt().
>
> I now understand the root cause. The interrupt signal for the
> decrementer interrupt remains set because the interrupt is not being
> delivered, per the config. I'm not quite sure what the proper fix is
> yet (there seems to be several implementations of the decrementer on
> ppc), but at least I understand why we are so slow.

That sounds like a bug in the interrupt controller emulation. It should
not even be attempting to cpu_exit() and set cpu->interrupt_request
(which are TCG internals) unless the IRQ is unmasked. Usually when
updates are made to an emulated IRQ controller you re-calculate the
state and decide if an interrupt needs to be asserted to QEMU.

> With a quick hack, I could verify that by moving that signal out of
> the way, the decompression time of the kernel is now peanuts, no
> matter the number of cpus. Even with one cpu, the 15 seconds measured
> before was already a huge waste, so it was not really a multiple-cpus
> problem. Multiple cpus were just highlighting it.
>
> Thanks again!
>
>   Fred


--=20
Alex Benn=C3=A9e


Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C2E45AB3F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:29:32 +0100 (CET)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpaXq-0005cm-DX
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:29:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpaWo-0004iD-AA
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 13:28:26 -0500
Received: from [2a00:1450:4864:20::32e] (port=46783
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpaWl-0003YB-EF
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 13:28:26 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso2377024wmr.5
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 10:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gFBviJkf2gsFfb5wTFhl30BpsexzhR+TsOcfDO3dXL0=;
 b=YXirgU0/ou0RUS7/LnvoKSDJdX90L+FUozkH3HXDV4EIPqQsx5GhLKGxXidjnIX/PD
 rgYXIlXYRlfkW75FZ5VOaqsmFWuc+q3vpKfNXERiNC3XMPcf3kWRvxdFjXh79t1GkOcV
 kr2RL1sZiPONWEDe3NOrAPaOt3RSwWRkpI0k+AfZbo+hMuOfTrhgTfSl9KHJkoI5tS3c
 YXON/+w80qmxQKO2WJ6xDN5Nli2m3NT/Y6LsQMlqFugcLRCjpoSCsSiks/8Qa9rk3cE5
 wIuarDmdpG/sxipE2xKgFfKa7I22ht133YILiwDcwHpNzKqiRPozbOKpjpW3Gc4EriOB
 BnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gFBviJkf2gsFfb5wTFhl30BpsexzhR+TsOcfDO3dXL0=;
 b=C0uVF8bMZoaz9co149VcYgFpkY2J3a3duBW6Y4CYryQ/bWX8CPPMBaeVmNgsDysJGB
 E0rpVfvco6S56jI3mW/sqGewMmGO0EZp4F0wWoKUil6Y+hXKrc7qkQjeO7FeMxxp4oyg
 v3KQL8+UbkJmqblzlMeG7/MouQOrv/ECz5t5BfDLBH4dTShRdsn+uOrn0mRW+61qFOYx
 Q8CKYgO/tlnHMi+okxGViIYP4gAaY5uGLut2I2L053+MjO4iBsX9oJpE10hex39KG+V0
 1lTqS7VHIRLrrfszt902qn/gBxw5URxPnyukDvC5OOpGzkN7Z45NvZeVziafptlZWPcQ
 XQkw==
X-Gm-Message-State: AOAM532VVoPXXWLDjvIzjOSRLnvfRvPtc93OAmpAC6S628kABLaRsH1O
 CUTjhjVEGpCdEuxGtbOUFfYv1A==
X-Google-Smtp-Source: ABdhPJyKmc/kV2pN6mgAFr6GtFuDCOdyzblDPeLPB2G6qBVNAOyBLjjKCPODKcxdgxd3sdRykTZFGQ==
X-Received: by 2002:a7b:ce16:: with SMTP id m22mr5711815wmc.137.1637692101373; 
 Tue, 23 Nov 2021 10:28:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a22sm1893612wme.19.2021.11.23.10.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 10:28:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7CC541FF96;
 Tue, 23 Nov 2021 18:28:19 +0000 (GMT)
References: <20211123171031.975367-1-peter.maydell@linaro.org>
 <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-6.2] hw/intc/arm_gicv3: Update cached state after
 acknowledging LPI
Date: Tue, 23 Nov 2021 18:27:56 +0000
In-reply-to: <CAFEAcA8XMtAHKY=saAajLc2b03_PHGi+G=iioEpeetuS3Hh5yg@mail.gmail.com>
Message-ID: <87k0gyg20s.fsf@linaro.org>
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 23 Nov 2021 at 17:10, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> In gicv3_redist_lpi_pending() we update cs->hpplpi to indicate the
>> new highest priority pending LPI after changing the requested LPI
>> pending bit.  However the overall highest priority pending interrupt
>> information won't be updated unless we call gicv3_redist_update().
>> We do that from the callsite in gicv3-redist_process_lpi(), but not
>> from the callsite in icc_activate_irq().  The effect is that when the
>> guest acknowledges an LPI by reading ICC_IAR1_EL1, we mark it as not
>> pending in the data structure but still leave it in cs->hppi so will
>> offer it to the guest again.
>>
>> The effect is that if we are using an emulated GICv3 and ITS and
>> using devices which use LPIs (ie PCI devices) then Linux will
>> complain "irq 54: nobody cared" and then hang (probably because the
>> stale bogus interrupt info meant we never tried to deliver some other
>> real interrupt).
>
> Hmm; this is definitely a bug, but maybe it's not the cause of
> the symptoms listed above -- I've just seen them again even
> with this fix. I'll keep digging...

Hmm interesting - does this affect the kvm-unit-tests for GICv3?

>
> -- PMM


--=20
Alex Benn=C3=A9e


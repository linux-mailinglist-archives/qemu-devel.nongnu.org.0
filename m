Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8D675819
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 16:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsxt-0006UD-IJ; Fri, 20 Jan 2023 10:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIsxU-0006Su-CX; Fri, 20 Jan 2023 10:05:36 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pIsxS-0005Kn-Ef; Fri, 20 Jan 2023 10:05:36 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 15FC220E1A49;
 Fri, 20 Jan 2023 07:05:31 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 15FC220E1A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674227132;
 bh=elH2j3FzwLK+36vk2YP34H0obRMagMhuc0Bi/drEt8A=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=lRnhX6YQaGo/zCEDSP3ra6nj4b3LAcUI2GTguT3YycICRTZMaXrP+wGoCgGxtMSep
 aueCsezFpKdFnG9Ov2c0Guv5f3KTH7fZvwmVR+TDg0DKmmSqLE1+N4/cN2KwxFOI00
 ar2nytVC6EbEKngzQ6pCKyXyjcPF0+ES0M/a7iHw=
Message-ID: <c6e830e6-f8a4-7166-08d5-fde1edc5a296@linux.microsoft.com>
Date: Fri, 20 Jan 2023 16:05:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: eiakovlev@linux.microsoft.com
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 2/4] hw/char/pl011: implement a reset method
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
 <CAFEAcA-0sUwRy_cME7TtrcV_oh9CEkRr1P2W6BC+=uscAyt+8Q@mail.gmail.com>
 <b139bb17-4a1e-b393-d06f-67adc3310f46@linux.microsoft.com>
 <CAFEAcA-4ZAcJ9noAM=zPWDunFXcq_gwwG50D1ro=8+HunZFunA@mail.gmail.com>
In-Reply-To: <CAFEAcA-4ZAcJ9noAM=zPWDunFXcq_gwwG50D1ro=8+HunZFunA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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



On 1/20/23 12:45 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 19 Jan 2023 at 21:57, Evgeny Iakovlev
> <eiakovlev@linux.microsoft.com> wrote:
> >
> >
> > On 1/19/2023 14:27, Peter Maydell wrote:
> >> On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
> >> <eiakovlev@linux.microsoft.com> wrote:
> >>> PL011 currently lacks a reset method. Implement it.
> >>>
> >>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> >>> ---
> >>>    hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
> >>>    1 file changed, 26 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> >>> index 329cc6926d..404d52a3b8 100644
> >>> --- a/hw/char/pl011.c
> >>> +++ b/hw/char/pl011.c
> >>> @@ -397,11 +397,6 @@ static void pl011_init(Object *obj)
> >>>        s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
> >>>                                    ClockUpdate);
> >>>
> >>> -    s->read_trigger = 1;
> >>> -    s->ifl = 0x12;
> >>> -    s->cr = 0x300;
> >>> -    s->flags = 0x90;
> >>> -
> >>>        s->id = pl011_id_arm;
> >>>    }
> >>>
> >>> @@ -413,11 +408,37 @@ static void pl011_realize(DeviceState *dev, Error **errp)
> >>>                                 pl011_event, NULL, s, NULL, true);
> >>>    }
> >>>
> >>> +static void pl011_reset(DeviceState *dev)
> >>> +{
> >>> +    PL011State *s = PL011(dev);
> >>> +    int i;
> >>> +
> >>> +    s->lcr = 0;
> >>> +    s->rsr = 0;
> >>> +    s->dmacr = 0;
> >>> +    s->int_enabled = 0;
> >>> +    s->int_level = 0;
> >>> +    s->ilpr = 0;
> >>> +    s->ibrd = 0;
> >>> +    s->fbrd = 0;
> >>> +    s->read_pos = 0;
> >>> +    s->read_count = 0;
> >>> +    s->read_trigger = 1;
> >>> +    s->ifl = 0x12;
> >>> +    s->cr = 0x300;
> >>> +    s->flags = 0x90;
> >>> +
> >>> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
> >>> +        qemu_irq_lower(s->irq[i]);
> >>> +    }
> >> Reset should never touch outbound qemu_irq lines.
> >> (The other end of the line will also reset and will end
> >> up in the correct "as if the input is 0" state.)
> >
> >
> > Really? I saw this reset happening on other devices in hw/char (don't
> > remember which ones specifically), so i though it is needed.
> 
> A few devices mess with their IRQ line in a reset handler;
> this is a bug but usually one you can get away with. Some
> devices use the newer "three phase reset" approach which
> does allow you to change IRQ line state in the 'hold' phase.
> But generally the standard is not to touch the IRQ line if
> its reset state would be 'low'. You only need to do odd
> things for the rare case where an IRQ line is supposed to
> be taken high on reset.
> 
> (The reason for the "no touching IRQs in reset" rule is that
> there's no ordering on device reset, so if you raise an
> IRQ line in your reset handler, you don't know if the
> device on the other end has already reset and thus will
> correctly deal with the 0->1 transition it sees, or if
> it has not yet reset and is about to undo the effects of
> that 0->1 transition. 3-phase reset lets devices split
> their reset handling up, so you know that if you do something
> with an IRQ line in the 'hold' phase that the device you're
> talking to has definitely already done its 'enter' phase.
> Though 3-phase reset is pretty new, so a lot of devices
> don't use it yet, and I have a fairly strong suspicion
> that there are still some issues with the design that we
> will need to iron out as we make more use of it.)

I see. Thanks a lot for explaining.

> 
> thanks
> -- PMM
> 


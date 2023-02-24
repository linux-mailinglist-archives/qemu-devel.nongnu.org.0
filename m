Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BD46A1CAF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXlq-0000LB-2T; Fri, 24 Feb 2023 08:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVXln-0000Iy-Aq; Fri, 24 Feb 2023 08:05:51 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pVXll-00056u-Ax; Fri, 24 Feb 2023 08:05:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 36C46746705;
 Fri, 24 Feb 2023 14:05:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F2FCF7466FF; Fri, 24 Feb 2023 14:05:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F17D074645F;
 Fri, 24 Feb 2023 14:05:43 +0100 (CET)
Date: Fri, 24 Feb 2023 14:05:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, philmd@linaro.org, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/5] hw/audio/via-ac97: Basic implementation of audio
 playback
In-Reply-To: <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
Message-ID: <62f3e9a1-f360-b525-7d1e-f57ccc8dca9e@eik.bme.hu>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <f84b42b8e811c6a0ddb23139fdfd654c8cc4f09c.1677004415.git.balaton@eik.bme.hu>
 <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
 <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Just for some motivation, this is what we want to make possible for more 
people with QEMU 8.0: https://youtu.be/YY9RExl4VDI

This would need at least my SM502 patches and fixing the IRQ routing in 
the VT8231 (this test was with my series for that, I'll ask testing 
Bernhard's version the same way once I get it and rebase my patches on 
it). AmigaOS can use ES1370 so the via-ac97 patches are not that important 
now but the other patches would be needed. I hope users won't have to wait 
until September to try this.

While AmigaOS runs on sam460ex now, that versiion is much slower due to 
the limited PPC440 that doesn't have AltiVec and also due to some issues 
on the real platform it has to do more synchronisation which slows it 
down. The pegasos2 version runs much better and has a better chance to get 
it to work with KVM on PPC host so this would be a big improvement even if 
there would be more bugs to fix in upcoming releases but we'll never find 
those unless people can start using it and report them. More people are 
interested but less are able to compile and test from git repos and depend 
on binary distros instead.

Regards,
BALATON Zoltan


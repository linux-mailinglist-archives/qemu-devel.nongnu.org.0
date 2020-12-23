Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC51F2E1AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 11:32:48 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ks1Rn-0006jl-91
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 05:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks1QR-0005ll-7c; Wed, 23 Dec 2020 05:31:23 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:43144
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks1QP-0007Ao-6G; Wed, 23 Dec 2020 05:31:22 -0500
Received: from host86-184-125-210.range86-184.btcentralplus.com
 ([86.184.125.210] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ks1QH-00080u-Tm; Wed, 23 Dec 2020 10:31:18 +0000
To: BALATON Zoltan <balaton@eik.bme.hu>, Guenter Roeck <linux@roeck-us.net>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <93a88d8e-89d0-96d4-15bc-47edfc68b5d8@eik.bme.hu>
 <5fb9653-ac95-ecfb-229e-848bdebd839c@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2e2c1337-0d23-29fb-3b5e-cd45ee862052@ilande.co.uk>
Date: Wed, 23 Dec 2020 10:31:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5fb9653-ac95-ecfb-229e-848bdebd839c@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.184.125.210
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: Problems with irq mapping in qemu v5.2
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.521,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/12/2020 22:23, BALATON Zoltan via wrote:

> I've just remembered that for sam460ex we had this commit: 484ab3dffadc (sam460ex: 
> Fix PCI interrupts with multiple devices) that changed that mapping for that machine 
> so I guess you got the exception with the bamboo board then. I'm not sure though that 
> similar fix is applicable fot that or even that this fix is correct for sam460ex but 
> appears to work so far.

FWIW you might want to review this commit: as Peter noticed it is possible to lose 
interrupts here since if one PCI interrupt is already asserted and then another comes 
along, the second PCI interrupt will unintentionally clear the first which could 
cause problems.

You probably want to keep the 4 separate PCI interrupts but feed them into an OR IRQ, 
the output of which gets fed into the UIC. Have a look at 
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05503.html for the sun4m 
variant of this based upon Peter's original example.


ATB,

Mark.


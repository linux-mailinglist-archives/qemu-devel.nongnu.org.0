Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A735669E336
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:18:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUOk-0006c5-D3; Tue, 21 Feb 2023 10:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUUOb-0006V6-Pn; Tue, 21 Feb 2023 10:17:33 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pUUOW-0005tw-JW; Tue, 21 Feb 2023 10:17:31 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A812B746FEB;
 Tue, 21 Feb 2023 16:17:24 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 74443746FCF; Tue, 21 Feb 2023 16:17:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 72BC0746F32;
 Tue, 21 Feb 2023 16:17:24 +0100 (CET)
Date: Tue, 21 Feb 2023 16:17:24 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 QEMU Developers <qemu-devel@nongnu.org>, qemu-ppc <qemu-ppc@nongnu.org>
Subject: Re: hw/ppc/mac_newworld: Problem with Uninorth IRQ lines
In-Reply-To: <a728cf1f-49b5-ef09-cd68-57179a44438e@linaro.org>
Message-ID: <7643199d-5380-d5b9-572a-7b38167e5252@eik.bme.hu>
References: <a728cf1f-49b5-ef09-cd68-57179a44438e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1794874283-1676992644=:88485"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1794874283-1676992644=:88485
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 21 Feb 2023, Philippe Mathieu-Daudé wrote:
> The mac99 machines use the same PIC input IRQs for the Uninorth
> output IRQs:
>
> 379     if (PPC_INPUT(env) != PPC_FLAGS_INPUT_970) {
> 380         /* Uninorth AGP bus */
> 381         for (i = 0; i < 4; i++) {
> 382             qdev_connect_gpio_out(uninorth_agp_dev, i,
> 383                                   qdev_get_gpio_in(pic_dev, 0x1b + i));
> 384         }
> 385
> 386         /* Uninorth internal bus */
> 387         for (i = 0; i < 4; i++) {
> 388             qdev_connect_gpio_out(uninorth_internal_dev, i,
> 389                                   qdev_get_gpio_in(pic_dev, 0x1b + i));
> 390         }
> 391     }
>
> Did you mean to use an OR gate here?

This probably does not matter as these PCI busses are not used at all, 
they are just there to match real hardware but on QEMU everyting is 
connected to the 3rd PCI bus (which is actually the second numbered 
between the two others above, but OpenBIOS only knows about that PCI bus 
and does not care about the AGP and internal PCI buses so in practice 
these IRQs likely never raised so probably does not really matter where 
they are connected now).

Regards,
BALATON Zoltan
--3866299591-1794874283-1676992644=:88485--


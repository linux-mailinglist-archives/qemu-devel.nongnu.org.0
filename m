Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F252428AC9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:32:37 +0200 (CEST)
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZsbk-0006em-9i
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZsaZ-0005pP-Hg
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:31:24 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:12127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZsaW-0002Os-Kk
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 06:31:22 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3A52B748F51;
 Mon, 11 Oct 2021 12:31:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 1940C748F4B; Mon, 11 Oct 2021 12:31:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 17E747475FA;
 Mon, 11 Oct 2021 12:31:17 +0200 (CEST)
Date: Mon, 11 Oct 2021 12:31:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
In-Reply-To: <20211011093758.kpjpw2htfvcra5mb@sirius.home.kraxel.org>
Message-ID: <1afcbf3-37cf-b7fa-b6cd-e37592956bac@eik.bme.hu>
References: <20211005132041.B884E745953@zero.eik.bme.hu>
 <20211011093758.kpjpw2htfvcra5mb@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Philippe M-D <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Oct 2021, Gerd Hoffmann wrote:
> On Tue, Oct 05, 2021 at 03:12:05PM +0200, BALATON Zoltan wrote:
>> This device is part of a superio/ISA bridge chip and IRQs from it are
>> routed to an ISA interrupt set by the Interrupt Line PCI config
>> register. Change uhci_update_irq() to allow this and use it from
>> vt82c686-uhci-pci.
>
> Hmm, shouldn't this logic be part of the superio bridge emulation?

But how? The ISA bridge does not know about PCI and PCI does not know 
about ISA. UHCI is a PCIDevice and would raise PCI interrupts. Where and 
how could I convert that to ISA interrupts? (Oh and ISA in QEMU is not 
Qdev'ified and I don't want to do that as it's too much work and too much 
to break that I can't even test so if an alternative solution involves 
that then get somebody do that first.) This patch puts the irq mapping in 
the vt82xx specific vt82c686-uhci-pci.c which in the real chip also 
contains the ISA bridge so in a way it's part of the superio bridge 
emulation in that this uhci variant is part of that chip model.

Regards,
BALATON Zoltan


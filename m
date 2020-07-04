Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C53214770
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 18:36:51 +0200 (CEST)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrl9m-0005Ls-00
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 12:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrl2d-0003X0-0L; Sat, 04 Jul 2020 12:29:27 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:17663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jrl2a-0002j6-NK; Sat, 04 Jul 2020 12:29:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 5BB5674632B;
 Sat,  4 Jul 2020 18:29:21 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 35C39746307; Sat,  4 Jul 2020 18:29:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 342AB7456F8;
 Sat,  4 Jul 2020 18:29:21 +0200 (CEST)
Date: Sat, 4 Jul 2020 18:29:21 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 02/26] hw/ppc/sam460ex: Add missing 'hw/pci/pci.h' header
In-Reply-To: <20200704144943.18292-3-f4bug@amsat.org>
Message-ID: <alpine.BSF.2.22.395.2007041828051.92265@zero.eik.bme.hu>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-3-f4bug@amsat.org>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1440222869-1593880161=:92265"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1440222869-1593880161=:92265
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 4 Jul 2020, Philippe Mathieu-Daudé wrote:
> This file uses pci_create_simple() and PCI_DEVFN() which are both
> declared in "hw/pci/pci.h". This include is indirectly included
> by an USB header. As we want to reduce the USB header inclusions
> later, include the PCI header now, to avoid later:
>
>  hw/ppc/sam460ex.c:397:5: error: implicit declaration of function ‘pci_create_simple’; did you mean ‘sysbus_create_simple’? [-Werror=implicit-function-declaration]
>    397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
>        |     ^~~~~~~~~~~~~~~~~
>        |     sysbus_create_simple
>  hw/ppc/sam460ex.c:397:5: error: nested extern declaration of ‘pci_create_simple’ [-Werror=nested-externs]
>  hw/ppc/sam460ex.c:397:32: error: implicit declaration of function ‘PCI_DEVFN’ [-Werror=implicit-function-declaration]
>    397 |     pci_create_simple(pci_bus, PCI_DEVFN(6, 0), "sm501");
>        |                                ^~~~~~~~~
>  hw/ppc/sam460ex.c:397:32: error: nested extern declaration of ‘PCI_DEVFN’ [-Werror=nested-externs]
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/sam460ex.c | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 1a106a68de..fae970b142 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -38,6 +38,7 @@
> #include "hw/usb/hcd-ehci.h"
> #include "hw/ppc/fdt.h"
> #include "hw/qdev-properties.h"
> +#include "hw/pci/pci.h"
>
> #include <libfdt.h>
>
>
--3866299591-1440222869-1593880161=:92265--


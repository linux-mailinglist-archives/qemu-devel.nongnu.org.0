Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F152E8F47
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 02:52:14 +0100 (CET)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwF2b-0003Ir-NG
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 20:52:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwF1Z-0002ln-Tx; Sun, 03 Jan 2021 20:51:09 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:63206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kwF1Y-0007Nj-4d; Sun, 03 Jan 2021 20:51:09 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B0761747616;
 Mon,  4 Jan 2021 02:51:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7F51C74760B; Mon,  4 Jan 2021 02:51:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7DEBA747602;
 Mon,  4 Jan 2021 02:51:04 +0100 (CET)
Date: Mon, 4 Jan 2021 02:51:04 +0100 (CET)
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v2 2/3] sam460ex: Remove FDT_PPC dependency from
 KConfig
In-Reply-To: <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
Message-ID: <41b3af5a-2f2b-41eb-98f1-909e80b26ff@eik.bme.hu>
References: <cover.1609413115.git.balaton@eik.bme.hu>
 <a55cd539835084bd322695c483273dc4b144ccbc.1609413115.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Thu, 31 Dec 2020, BALATON Zoltan via wrote:
> Dependency on FDT_PPC was added in commit b0048f76095
> ("hw/ppc/Kconfig: Only select FDT helper for machines using it") but
> it does not seem to be really necessary so remove it again.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
> v2: Do not remove PPC405, reworded commit message
>
> hw/ppc/Kconfig | 1 -
> 1 file changed, 1 deletion(-)
>
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index 8548f42b0d..f1e1be208e 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -64,7 +64,6 @@ config SAM460EX
>     select SMBUS_EEPROM
>     select USB_EHCI_SYSBUS
>     select USB_OHCI
> -    select FDT_PPC
>
> config PREP
>     bool

Something is still not right with this, I've noticed that a few other 
boards also have this option selected but they don't need fdt.o that's 
gated by this option in meson.build. That fdt.o is only needed by PSERIES 
and POWERNV but removing FDT_PPC from other boards I get:

../hw/ppc/sam460ex.c:43:10: fatal error: libfdt.h: No such file or directory
  #include <libfdt.h>

so apparently this switch also pulls in the necessary CPPFLAGS or libfdt 
dependency. Is there a separate switch for that or we can only get it with 
fdt.o. Not a big deal just not trivial why we need an option that at first 
sight select a source file which we don't need. I think I'll drop this 
patch for now when resending the series.

Regards,
BALATON Zoltan


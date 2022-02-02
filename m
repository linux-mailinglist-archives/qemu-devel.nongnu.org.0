Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39224A78FF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:52:57 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFLgW-00087l-Hc
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:52:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFK6f-0006sd-0n
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:11:50 -0500
Received: from mout.gmx.net ([212.227.17.20]:53581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nFK6b-0007C7-Op
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 13:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643825501;
 bh=Mok29ZziIN0GM4qHTBe87uxsYIF7fnCoRHTKkZDpW7M=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=FOw7nQLmHVylZhbU1Uf9iX1bxpaj5RT/UqXzJEb5tHRBkAVVIquh3fMoJ9g5mVNhU
 L7J0e3fY3Qq5YaRJn2wpQseVYFq9sS5EYmLyvvaLLM+PsvF/9VFlOpoxMc+AHEa53P
 tP5YrIldUYgsFBXT9Tfzms2+MiVWQzA1SdCRTmNc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.163.171]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH5Q-1mest72nee-00cl0H; Wed, 02
 Feb 2022 19:11:41 +0100
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 2/6] hw/hppa: Allow up to 16 emulated CPUs
Date: Wed,  2 Feb 2022 19:11:35 +0100
Message-Id: <20220202181139.124485-3-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202181139.124485-1-deller@gmx.de>
References: <20220202181139.124485-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B0YzbjqMXvDY9fzEd2MwTDki/9mC/t7oog101RtACg9EvwfQ3Z4
 tQYAUg6l5b8liuyUU+mNju4NBiQAm2DZ79XnkOQvJksbLMWQrQNyleKMk+PzG3sYA2pqaIz
 FQncJ0BZoBqtAWz7qqIraG4ir4e7up6cmACjFxmy9iHds1T5bV84yJnGLCGfR49al6Fs+Xe
 yFPfouKvp3k9tJGegcAeA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:stIHB5Q6R1E=:Gh8xDKSuWxhSNVC/zauoUH
 p6c6mA1QWjn4fN1wE+tDjCIO0Q6Rhy5sTjEqB8jTK34vxE0CjcHQCRv6X5801FPFHJLOMRZle
 bStALgc8qRbRs8NwEVz/VIfYBp+Sp218hgKw+pXFMDW6jT2XVTiXzPbqAXEdZ0e1jvBiHGwZY
 33bdkr4jVJV2qIJtA0xFi0Kt/CKuYsZIHEf8ny/Cakt58/cLoLMZHtuSpAmwOr+QRbe3OZEuV
 NlY4CIsNqQlQmPrspUS3la7LywnIv5dsnzjR4UbctoEuRicKdK0wdfaIWWGwawVjtB99XRuxQ
 ijENyE04mua0Tcd/JANA0/2WOvg2lhvS1zkDox2WoM0b79rZ6xLvjw4GevSsmjQQOJbNGEkP4
 g4vuY18S0zkhMpoWIK9UgrgaSrV39kJPHpLlq+WqL/Q4Hh6j8bXWyohwvU3ci00uenzpx6zOO
 QBUbnsCpIwFTdpaNpy7gF06o6uzRappw8E8yQcGkCL9ypdq436PNp1UWDgIZabXTeqkGVwNbQ
 pQYWl7NbJMzkoAVQP24Ho2oHLv7B8atFFwHADohafUoSdmB0Fe52pDYpOCb/sPyQG9o8WPiEK
 bt0cbIYe9UEmCq79X7UOqAZwyKg4KXKTX0pPpQb1K7m13Lyio81BKQywLvxQFu/qMmUThyCRf
 gt08aqLpqC4PB1RzrtZlOehJeaAmmOps7zLxhYz5XyxSE6PdDV6XyCULpvCq4KHEaWyKE8fX8
 CNeIia85zMxeRqJdpRcZAyczgshNsT/xOkaoumn65S4WAb55isMx/iCEl298D05nCjnU6kNxZ
 ZWQD2a8ftnl15TbulkUlYu6C+RKjXS/QHkk5PIaAmXTgkWMK60OqyE3a/rQBoOZAhmF77Ne9V
 jK5vOC9Jl4NWcIRPWmndDDkPO2Ls3WqXfwQDs0XcGTy5pTCi8CZBjJwWH8yu0RH5RDKsUP9Ni
 M8G/GNiRem8agtUnaIkTKGCS8tIhSg8KspJwVdhkY8L7sTrq5lU9xrmTdI2NCD3pKqdEiE8N3
 j00G271Nt7tqQB4ZODOM/Es3v1Vu0F33Ol12L9JAjkouxzRc/VyWxphAkeBuH/9BCSF/kTN6A
 2wrG0+iDwQpZcY=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This brings the hppa_hardware.h file in sync with the copy in the
SeaBIOS-hppa sources.

In order to support up to 16 CPUs, it's required to move the HPA for
MEMORY_HPA out of the address space of the new 16th CPU.
The new address of 0xfffff000 worked well for Linux and HP-UX, while
other addresses close to the former 0xfffbf000 area are used by the
architecture for local and global broadcasts.

The PIM_STORAGE_SIZE constant is used in SeaBIOS sources and
is relevant for the TOC/NMI feature.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
=2D--
 hw/hppa/hppa_hardware.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/hppa_hardware.h b/hw/hppa/hppa_hardware.h
index bc258895c9..5edf577563 100644
=2D-- a/hw/hppa/hppa_hardware.h
+++ b/hw/hppa/hppa_hardware.h
@@ -25,7 +25,7 @@
 #define LASI_GFX_HPA    0xf8000000
 #define ARTIST_FB_ADDR  0xf9000000
 #define CPU_HPA         0xfffb0000
-#define MEMORY_HPA      0xfffbf000
+#define MEMORY_HPA      0xfffff000

 #define PCI_HPA         DINO_HPA        /* PCI bus */
 #define IDE_HPA         0xf9000000      /* Boot disc controller */
@@ -43,9 +43,10 @@
 #define PORT_SERIAL1    (DINO_UART_HPA + 0x800)
 #define PORT_SERIAL2    (LASI_UART_HPA + 0x800)

-#define HPPA_MAX_CPUS   8       /* max. number of SMP CPUs */
+#define HPPA_MAX_CPUS   16      /* max. number of SMP CPUs */
 #define CPU_CLOCK_MHZ   250     /* emulate a 250 MHz CPU */

 #define CPU_HPA_CR_REG  7       /* store CPU HPA in cr7 (SeaBIOS internal=
) */
+#define PIM_STORAGE_SIZE 600	/* storage size of pdc_pim_toc_struct (64bit=
) */

 #endif
=2D-
2.34.1



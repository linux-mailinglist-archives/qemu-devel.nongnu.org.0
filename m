Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A8A4A51C8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 22:42:48 +0100 (CET)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEeRj-0003xQ-8X
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 16:42:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeL5-0004Sr-TY
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:55 -0500
Received: from mout.gmx.net ([212.227.15.15]:47283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nEeKm-0000vz-Dl
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 16:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643664931;
 bh=E0s+5klfwdgnhBhxRxf32dWsuDGlyx27vWMS1xf+dXs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZIR8rIKOe8X18B7/Ij0M51vBKuJV11VZ2piyQim3/WqF9OC0tzJn0dInmcNNUD/SU
 xtmTExZTCTbRt1CrBTCE6tXvE+nmRXsTH3QOfpLrwHvqtm56nY+nCtaZEX3LrTowYH
 u4mQ1D9j1Hyw++UdyTMxS5TrRhJvT9lhi9aWAnRE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.183.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1mycqr39gE-00JM8v; Mon, 31
 Jan 2022 22:35:31 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 2/6] hw/hppa: Allow up to 16 emulated CPUs
Date: Mon, 31 Jan 2022 22:35:25 +0100
Message-Id: <20220131213529.17404-3-deller@gmx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131213529.17404-1-deller@gmx.de>
References: <20220131213529.17404-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2lq4Fh6zymcyFrzg16XLpmAyBDDQE1+3XCLnH6SSnPfV2fY9ojk
 HQUJVNE9M9EKBlJWttSOA6erMR6oz5riOyzBaDWWe/hKblQz6LdSvq1D9jRy00UZY3oyJUj
 H6dmzzyuyNTon6frfxH09lqpie3WJOJEQ0SWTRUHvbQYAEwTDTOxKyKiQ/SBX3f5CO6s/Mq
 Cw1an/N7r8iJ0VhdHjMPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kGy2dmzRVQ8=:vIQ48RUcQAX9/HQImw18Lz
 W1/eRmUPk6h3GgtbkRR1E39WKohHlWf6WUXjGqT461UFnPXqYwdpaG8sw2zqp+msiLpjwerfg
 MUlQrFdQxof2ls9pryFHhS7jCHaMIU5BioyKZOBwLTBwxorLpmAtM4aYb8zROuGG8VgHhwP6y
 K/31rfukvcJTNlZOhZFPL9rFe2unydN1+rj+apg6M3/Ccr6kuOixwsoLvP3p3A/fhg/T64bru
 D2+wCmpWgut+Y0N4MrKXUM95LQFpt4VTimLUkEkJ/9j3WDdm3Kl9vQjYHCVdeOaa18/iMAwvb
 cut25KKXPhzWOr5ukuF4g0Cmgs2VS0pDcCSyVmN8VQaz7+5E2E0WRT7X7DrO1W5LC5VcjZrxi
 bQQ/qlNYVrVe/iVwv1P9RtGYAKV7eQrxM+pawZKrChp8rvOZ5E35nFuFeXM/roNO4TBEXuaqb
 9nFkt/N/mSm14YS8aMLYxiJMKEM0iFrEGaMEeY4ItA06/teSJlT2bHXGaY9+S9C3progEq4xX
 9fMZH/T8lRptEbeGEmih5v6cS2vhvCuo35D4G9EcIN5u6AgOUvZLsBYJvyxPz7arrMLzSA2H6
 H+dw/FYCSadpxxVxnMygy1xPl6XdVdI5ZH4IadmkjX/Cez6WF7w1gTyKyLhX4+ZS6XTrEECod
 Rym9ssIPuiAXHhKUvIV7okyBROo3L0WI2sok2dt3C12e0l2xupLxD+l3Y/DsvoD32S3/HdYHf
 tHbEgvI5jC0CbhgY/6Nsiyn/fkIdfW9Cu6qmOr/0Fet91oK8idj8pfYYu6L6HDtD7yjFL1XTc
 RHMenzRsqHP+++vwu5PxYbR1AfPDHVLBYt2pqFJyyPVjQbf3C4WCQQd+k+Cz5l8mnls2Pg0Yl
 1AuU3juy00W2NlB4nXdNEhW087btge3j6uUMp044buvzH9dPkYW1i+j9lTDF5Lk+96vc/ws4c
 9BEW7Ob+iUfrx5zriL2rPpjGdQifEgSxXfQ9PcFJnF2hFym8DNonm+7/Fh5/iuz4sXLSCPCqI
 Zvj+jeAR9skxdj5N5sclBj72ZFlFjqIOKq3svGYh4u9sAUF7vH/2GP9h8PdKkHnHh+yBdnJMF
 qmMjoM2pWRGehc=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This brings the hppa_hardware.h file in sync with the copy in the
SeaBIOS-hppa sources.

In order to support up to 16 CPUs, it's required to move the HPA for
MEMORY_HPA out of the address space of the 16th CPU.

Signed-off-by: Helge Deller <deller@gmx.de>
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



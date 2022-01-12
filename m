Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0830548CD7D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:13:47 +0100 (CET)
Received: from localhost ([::1]:60904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7kwE-0007h4-3a
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:13:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1n7kqK-0003YV-B3
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:07:40 -0500
Received: from mout.gmx.net ([212.227.17.22]:45323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1n7kqH-0000el-Cf
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:07:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642021652;
 bh=w4MFO5ZyTm+Isv8Di/mnNe8weQfdH3nRtzeJMrEFs7o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=BsejITMArBd/FHHzBU9pv667qxqKdZQpqaK77eWPD4BVn1pgdZKQb8tvmb072D5mC
 cUlkrMdagL8vsg9SJz+UbEJG5AagSze+pUU2wgyuonR6CiATS880OPbTFFsLwj0NY/
 36KRyUNSFvl4+jN4hgeydDRyAfktJkbtdVTitszQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.184.198]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3siG-1mPrT20MEa-00zlmj; Wed, 12
 Jan 2022 22:07:32 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 2/5] hw/hppa: Allow up to 16 emulated CPUs
Date: Wed, 12 Jan 2022 22:07:27 +0100
Message-Id: <20220112210730.292775-3-deller@gmx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112210730.292775-1-deller@gmx.de>
References: <20220112210730.292775-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AAPDBnuyRf88NRFIfbtW1ZV6gSCRH/l5EtzqhJlgCt0t48xiU5E
 7aZhk67pEf1vXTT/SABf9Rmk1U+XuA1HSRWwfl4ohb0X/ca88dVUzKhslkcVbi5MYRMhJGy
 YLbPNKqSnxiH+9tLKvZv4a4GbbEuUz4hXbaDZk1bu5BrWqdO7MpZDh3F63wHmtACdlYmcrK
 R0CgGbslSzbq5fHF4EZfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tjEdHDV5PKE=:dM1q7qfh4Pz4mhxR/2xVq/
 mHleVJQCp4IB/x1FaekeCep2rSGvhkEhTQq4Fod76Jlf11UZA9ZDSAKRDo6KGFFL7Z4WwdS9j
 I1dPEhxOo1YVkozUQSc9U5wkEWYNkA0SEMHnzADuKPkfhpCCu+mNbM6vzpEXsMHDAT9FDmeAw
 xJnxCCFi8hAU8eB39qzbRWtB2AVww9bW7MdilwfX+3YFL53u7PmA1LOKDAaS9JMlXyOtoPwA0
 Q/8Xa5/jLxjE/HiJ7rDEdZjOgLcpkDRHhsJKJe3ozAABsmnxaNPgO5fO8f60nTZwJS5IcBH2y
 cJSwsJrrqL6Zn0n93nzhjdC5yTq/S0EyhhW5a+M31+OSpfDkOi8sSOHtvNGGTZ2IXCNrVQ0c4
 I6Y68ybcOygjLfhA3zq4KwKuEP7r/eYG3J+yxziwbMxtRYebu4i93SZofttLTVMwJy9pQ4qsM
 ZMqz0e9+9UTYoX/f9IhsnOMa4H1rznLELfCIcxv9YMLEBDm2CsCbfRDqlxf8ndmql6Ix8vI1I
 HvnuOQnQo6aIxSto2KMFe2bmIAIGkLWgeO6BiE7PfUbvp9YirPzT8Onb6jtyizEvZfpA69QKG
 JmKUSFCeUDc2hQMkN9iD2LCMUIsDtwrdcGcLH2an0tubjwgI8LW751dl5EtWLCCVgssJN1Zlb
 JdxvZvSF/BgpbAd2WMzBcJk1Caz1e7v+kJ3GAx/xaH3qJww/YrGhfpfacYK0/tz8ioSQpwde/
 5/G7VX48YltsOOasDmpvPHJGE0dXh6QxVu1intpOWNFNgvwaWxZu++e03eSBM3vk/bHysmyH0
 psZwKAqYKYtWv/Hx2Wzd2ANqsxwHjzUFTI8AGpwBNbH3yqArNr2BCs+IQkAWZA2Kia5t2MBGt
 kR5i7mFfKdxaXPKEIqWkcLBZcwnGx8p2vOHXWdOrGrXOD00brwBAXqsfL60eYIWxZB4gRXKSE
 DbSmAp4AzEZSZc9bMluFGc20DGlJg6Gx9Q7TsilFiofvJNust8FO3vMhLuCy9Klbpw7roYBN3
 qILptVOJ5iaKLSlWzSOz8Ti82oEV8Yb1IiW68Gv9LqPibdnuNRYHBvsUvXZGyMm9kPmMZ1XkA
 e+R8X3lDfs9Pxk=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>
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
2.31.1



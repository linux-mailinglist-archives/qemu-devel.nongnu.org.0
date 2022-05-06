Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5F051D0ED
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 07:53:37 +0200 (CEST)
Received: from localhost ([::1]:33338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmquG-00065j-Mb
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 01:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1nmqsK-0004wJ-Go; Fri, 06 May 2022 01:51:36 -0400
Received: from ozlabs.ru ([107.174.27.60]:47968)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1nmqsI-0004Ax-AM; Fri, 06 May 2022 01:51:35 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 2269480152;
 Fri,  6 May 2022 01:51:27 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
Subject: [RFC PATCH qemu] spapr/docs: Add a few words about x-vof
Date: Fri,  6 May 2022 15:51:24 +1000
Message-Id: <20220506055124.3822112-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alternative small firmware needs a few words of what it can and
absolutely cannot do; this adds those words.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
index d9b65ad4e850..4c98a94f9add 100644
--- a/docs/system/ppc/pseries.rst
+++ b/docs/system/ppc/pseries.rst
@@ -32,14 +32,42 @@ Missing devices
 Firmware
 ========
 
+The pSeries platform in QEMU comes with 2 firmwares:
+
 `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
 implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
 Configuration) Firmware: Core Requirements and Practices
 <https://standards.ieee.org/standard/1275-1994.html>`_.
 
+SLOF performs bus scanning, PCI resource allocation, provides the client
+interface to boot from block devices and network.
+
 QEMU includes a prebuilt image of SLOF which is updated when a more recent
 version is required.
 
+VOF (Virtual Open Firmware) is a minimalistic firmware to work with
+``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
+shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
+
+VOF does not have device drivers, does not do PCI resource allocation and
+relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
+to PCI resource assignment. It is ideal to use with petitboot.
+
+Booting via ``-kernel`` supports the following:
++-------------------+-------------------+------------------+
+| kernel            | pseries,x-vof=off | pseries,x-vof=on |
++===================+===================+==================+
+| vmlinux BE        |     ✓             |     ✓            |
++-------------------+-------------------+------------------+
+| vmlinux LE        |     ✓             |     ✓            |
++-------------------+-------------------+------------------+
+| zImage.pseries BE |     x             |     ✓¹           |
++-------------------+-------------------+------------------+
+| zImage.pseries LE |     ✓             |     ✓            |
++-------------------+-------------------+------------------+
+Notes:
+¹ must set kernel-addr=0
+
 Build directions
 ================
 
-- 
2.30.2



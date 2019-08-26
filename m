Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 966269D1B3
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 16:33:23 +0200 (CEST)
Received: from localhost ([::1]:53668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2G3e-0006iH-77
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 10:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42795)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpt-0004Yh-QN
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpr-0000Pl-AO
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:19:09 -0400
Received: from nsstlmta14p.bpe.bigpond.com ([203.38.21.14]:36512)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1i2Fpo-0000J3-NC
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:19:07 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep14p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141901.HKEE1555.nsstlfep14p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:19:01 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeosggvrhhtohesihhgrghlihgrrdgtohhmqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440DDB10B5; Tue, 27 Aug 2019 00:19:00 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:37 +1000
Message-Id: <c715521dfd61c48283fd34794286fa1eb2ce9fe8.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.14
Subject: [Qemu-devel] [PATCH 11/19] hw/ipack: Declare device little or big
 endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Alberto Garcia <berto@igalia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if ununsed, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-delcare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/ipack/tpci200.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ipack/tpci200.c b/hw/ipack/tpci200.c
index f931d4df62..c90fabab7c 100644
--- a/hw/ipack/tpci200.c
+++ b/hw/ipack/tpci200.c
@@ -526,7 +526,7 @@ static void tpci200_write_las3(void *opaque, hwaddr addr, uint64_t val,
 static const MemoryRegionOps tpci200_cfg_ops = {
     .read = tpci200_read_cfg,
     .write = tpci200_write_cfg,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid =  {
         .min_access_size = 1,
         .max_access_size = 4
@@ -540,7 +540,7 @@ static const MemoryRegionOps tpci200_cfg_ops = {
 static const MemoryRegionOps tpci200_las0_ops = {
     .read = tpci200_read_las0,
     .write = tpci200_write_las0,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid =  {
         .min_access_size = 2,
         .max_access_size = 2
@@ -550,7 +550,7 @@ static const MemoryRegionOps tpci200_las0_ops = {
 static const MemoryRegionOps tpci200_las1_ops = {
     .read = tpci200_read_las1,
     .write = tpci200_write_las1,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid =  {
         .min_access_size = 1,
         .max_access_size = 2
@@ -560,7 +560,7 @@ static const MemoryRegionOps tpci200_las1_ops = {
 static const MemoryRegionOps tpci200_las2_ops = {
     .read = tpci200_read_las2,
     .write = tpci200_write_las2,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid =  {
         .min_access_size = 1,
         .max_access_size = 2
@@ -570,7 +570,7 @@ static const MemoryRegionOps tpci200_las2_ops = {
 static const MemoryRegionOps tpci200_las3_ops = {
     .read = tpci200_read_las3,
     .write = tpci200_write_las3,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid =  {
         .min_access_size = 1,
         .max_access_size = 1
-- 
2.23.0



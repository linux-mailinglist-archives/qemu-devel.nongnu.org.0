Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D113501F
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 21:04:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYEjb-0003bo-0T
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 15:04:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgt-0002HU-VN
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mark.cave-ayland@ilande.co.uk>) id 1hYEgt-0007n5-1F
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 15:01:47 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:54814
	helo=mail.default.ilande.uk0.bigv.io)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEgs-0007lR-RP; Tue, 04 Jun 2019 15:01:46 -0400
Received: from host81-158-188-206.range81-158.btcentralplus.com
	([81.158.188.206] helo=kentang.home)
	by mail.default.ilande.uk0.bigv.io with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
	(envelope-from <mark.cave-ayland@ilande.co.uk>)
	id 1hYEfy-00013x-Re; Tue, 04 Jun 2019 20:00:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-stable@nongnu.org,
	david@gibson.dropbear.id.au
Date: Tue,  4 Jun 2019 20:01:14 +0100
Message-Id: <20190604190115.8053-5-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
References: <20190604190115.8053-1-mark.cave-ayland@ilande.co.uk>
X-SA-Exim-Connect-IP: 81.158.188.206
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
Subject: [Qemu-devel] [PATCH for-stable 4/5] target/ppc: Fix vsum2sws
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Blanchard <anton@ozlabs.org>

A recent cleanup changed the pre zeroing of the result from 64 bit
to 32 bit operations:

-        result.u64[i] = 0;
+        result.VsrW(i) = 0;

This corrupts the result.

Fixes: 60594fea298d ("target/ppc: remove various HOST_WORDS_BIGENDIAN hacks in int_helper.c")
Signed-off-by: Anton Blanchard <anton@ozlabs.org>
Message-Id: <20190507004811.29968-9-anton@ozlabs.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/int_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 162add561e..6bd1d32b1d 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2030,7 +2030,7 @@ void helper_vsum2sws(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     for (i = 0; i < ARRAY_SIZE(r->u64); i++) {
         int64_t t = (int64_t)b->VsrSW(upper + i * 2);
 
-        result.VsrW(i) = 0;
+        result.VsrD(i) = 0;
         for (j = 0; j < ARRAY_SIZE(r->u64); j++) {
             t += a->VsrSW(2 * i + j);
         }
-- 
2.11.0



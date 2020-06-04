Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF491EDD7B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 08:47:26 +0200 (CEST)
Received: from localhost ([::1]:44242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgjev-00052p-8r
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 02:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jgjaG-00051E-Dn
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 02:42:36 -0400
Received: from ozlabs.org ([203.11.71.1]:41657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jgjaF-0000nU-FC
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 02:42:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49cx6C5g18z9sTL; Thu,  4 Jun 2020 16:42:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1591252947;
 bh=GLsLYxc2PjN1+1LUp/caZlHg/ICb1byIBHQiQsQcEYs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W8Kv2kcJEBAFmJoDP+vTL9By+ABtQfLK6JmmGaHLX6tIzL5W2/9l/QRbfbhHOUbHP
 CTbYKe0Apa1qwVZvgTcbXrm2uuqkBArsHd6M9L45z4M54DtVXdZA6z9TSEsjVSSiIN
 jhOZjlTBJmXlJMHJGv1jmtHbwcFnnhmZObzyyYNY=
From: David Gibson <david@gibson.dropbear.id.au>
To: rth@twiddle.net, pbonzini@redhat.com, ekabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 6/9] target/i386: sev: Remove redundant cbitpos and
 reduced_phys_bits fields
Date: Thu,  4 Jun 2020 16:42:16 +1000
Message-Id: <20200604064219.436242-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200604064219.436242-1-david@gibson.dropbear.id.au>
References: <20200604064219.436242-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 02:12:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: brijesh.singh@amd.com, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SEVState structure has cbitpos and reduced_phys_bits fields which are
simply copied from the SevGuestState structure and never changed.  Now that
SEVState is embedded in SevGuestState we can just access the original copy
directly.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/sev.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 9e8ab7b056..d25af37136 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -41,8 +41,6 @@ struct SEVState {
     uint8_t build_id;
     uint32_t policy;
     uint64_t me_mask;
-    uint32_t cbitpos;
-    uint32_t reduced_phys_bits;
     uint32_t handle;
     int sev_fd;
     SevState state;
@@ -378,13 +376,13 @@ sev_get_me_mask(void)
 uint32_t
 sev_get_cbit_position(void)
 {
-    return sev_guest ? sev_guest->state.cbitpos : 0;
+    return sev_guest ? sev_guest->cbitpos : 0;
 }
 
 uint32_t
 sev_get_reduced_phys_bits(void)
 {
-    return sev_guest ? sev_guest->state.reduced_phys_bits : 0;
+    return sev_guest ? sev_guest->reduced_phys_bits : 0;
 }
 
 SevInfo *
@@ -713,22 +711,19 @@ sev_guest_init(const char *id)
     host_cpuid(0x8000001F, 0, NULL, &ebx, NULL, NULL);
     host_cbitpos = ebx & 0x3f;
 
-    s->cbitpos = object_property_get_int(OBJECT(sev), "cbitpos", NULL);
-    if (host_cbitpos != s->cbitpos) {
+    if (host_cbitpos != sev->cbitpos) {
         error_report("%s: cbitpos check failed, host '%d' requested '%d'",
-                     __func__, host_cbitpos, s->cbitpos);
+                     __func__, host_cbitpos, sev->cbitpos);
         goto err;
     }
 
-    s->reduced_phys_bits = object_property_get_int(OBJECT(sev),
-                                        "reduced-phys-bits", NULL);
-    if (s->reduced_phys_bits < 1) {
+    if (sev->reduced_phys_bits < 1) {
         error_report("%s: reduced_phys_bits check failed, it should be >=1,"
-                     " requested '%d'", __func__, s->reduced_phys_bits);
+                     " requested '%d'", __func__, sev->reduced_phys_bits);
         goto err;
     }
 
-    s->me_mask = ~(1UL << s->cbitpos);
+    s->me_mask = ~(1UL << sev->cbitpos);
 
     devname = object_property_get_str(OBJECT(sev), "sev-device", NULL);
     s->sev_fd = open(devname, O_RDWR);
-- 
2.26.2



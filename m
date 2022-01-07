Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAADC487B83
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 18:36:12 +0100 (CET)
Received: from localhost ([::1]:41334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5t9v-0000vM-QH
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 12:36:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5swA-0005Bh-50
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:58 -0500
Received: from [2a00:1450:4864:20::331] (port=36496
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5sw3-0007tc-4L
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 12:21:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so5836021wmk.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=QPaQb/WJdcDDdEPvSwDWxqflQibLtPJdH7ehjP+AciI=;
 b=eOzFPvENla0g605TcpIcJssUwJvVl7aP2WYuOaJ0m7kAnlbNlKtZlp5TWancrsYsrC
 Cx9Sd2laXxbi0j7onhec1lBDdwYa+bb7XlTTaldUY8SBtSQ1RhHfNeAM0D0bUW8R4wDn
 QDZQKM66XFZ06JyTvwD1IhLMc8Q9Sd4DSLB/BSv2d9v7f1Z9qYGNzqtzJFAX1amJ9oTv
 gjgq2/+OQbPBZ3/lb9Yj08izmzE7UbT0rIqHITE6ANk4ijuNqg5Zl1CRdzt2JfKBDXCz
 EyfZtG8KbapWEtMLyyVhDJVlnQx+90CQwYqfvu9NYPa0t0cHvuP0EsmFSnqOEnSLMbhY
 EBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QPaQb/WJdcDDdEPvSwDWxqflQibLtPJdH7ehjP+AciI=;
 b=jevM0uZWh1xxYfCjkWFQMYawVwYiu7E01jhlMmIwdd6LqtVDMIVNb1XHruVtks5Ajt
 Jo8QL+9ga4YTZqJ6RaRuvcIRp0Zo2BIxEYWya+8RG66vwvn+VwVEJ75r926vzUpJCr1a
 L9Ssnp0ffkRUUnuGgUYlTljVi5YfYg9h4RFXwyIhmAPq8VHhzynJZjlOCiazxE7Mtk1v
 JixBJm2fzSudHISWcYKXUsmmqTUUOs6lxF2MMWRNTvDgoqGMbPvmMUEjirWJhZ9PdHwH
 /tLu0aLrq7kTmM835IG3R3pkeGQ1VOYTljl38t0krcu0IqIQOUFDoidO02uPxwYxYntp
 imDg==
X-Gm-Message-State: AOAM5338hlOoJw/AKhaN2fev4ahNN5tZ2i0jAq3ggD8l1D1QnDadlQ0U
 ySAvmkOKp1eNjCI1Cp2Mcrqzyt4eEOtssg==
X-Google-Smtp-Source: ABdhPJwqJ50xmmgLMcG53JGnzWe4PM2iT6WDKaQSfkO6EaBKMnt8NCMxMI69Wocvyz9qIXpT0MBXIA==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr11982566wmc.118.1641576109910; 
 Fri, 07 Jan 2022 09:21:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id i6sm6060219wrf.79.2022.01.07.09.21.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:21:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL
 define
Date: Fri,  7 Jan 2022 17:21:32 +0000
Message-Id: <20220107172142.2651911-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220107172142.2651911-1-peter.maydell@linaro.org>
References: <20220107172142.2651911-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The GITS_TYPE_PHYSICAL define is the value we set the
GITS_TYPER.Physical field to -- this is 1 to indicate that we support
physical LPIs.  (Support for virtual LPIs is the GITS_TYPER.Virtual
field.) We also use this define as the *value* that we write into an
interrupt translation table entry's INTTYPE field, which should be 1
for a physical interrupt and 0 for a virtual interrupt.  Finally, we
use it as a *mask* when we read the interrupt translation table entry
INTTYPE field.

Untangle this confusion: define an ITE_INTTYPE_VIRTUAL and
ITE_INTTYPE_PHYSICAL to be the valid values of the ITE INTTYPE
field, and replace the ad-hoc collection of ITE_ENTRY_* defines with
use of the FIELD() macro to define the fields of an ITE and the
FIELD_EX64() and FIELD_DP64() macros to read and write them.
We use ITE in the new setup, rather than ITE_ENTRY, because
ITE stands for "Interrupt translation entry" and so the extra
"entry" would be redundant.

We take the opportunity to correct the name of the field that holds
the GICv4 'doorbell' interrupt ID (this is always the value 1023 in a
GICv3, which is why we were calling it the 'spurious' field).

The GITS_TYPE_PHYSICAL define is then used in only one place, where
we set the initial GITS_TYPER value.  Since GITS_TYPER.Physical is
essentially a boolean, hiding the '1' value behind a macro is more
confusing than helpful, so expand out the macro there and remove the
define entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/gicv3_internal.h | 26 ++++++++++++++------------
 hw/intc/arm_gicv3_its.c  | 30 +++++++++++++-----------------
 2 files changed, 27 insertions(+), 29 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 63de8667c61..5a63e9ed5ce 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -354,28 +354,30 @@ FIELD(MAPC, RDBASE, 16, 32)
 #define L2_TABLE_VALID_MASK       CMD_FIELD_VALID_MASK
 #define TABLE_ENTRY_VALID_MASK    (1ULL << 0)
 
-/**
- * Default features advertised by this version of ITS
- */
-/* Physical LPIs supported */
-#define GITS_TYPE_PHYSICAL           (1U << 0)
-
 /*
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
  * ITE Lower 8 Bytes
  *   Bits:    | 49 ... 26 | 25 ... 2 |   1     |   0    |
- *   Values:  |    1023   |  IntNum  | IntType |  Valid |
+ *   Values:  |  Doorbell |  IntNum  | IntType |  Valid |
  * ITE Higher 4 Bytes
  *   Bits:    | 31 ... 16 | 15 ...0 |
  *   Values:  |  vPEID    |  ICID   |
+ * (When Doorbell is unused, as it always is in GICv3, it is 1023)
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
-#define ITE_ENTRY_INTTYPE_SHIFT        1
-#define ITE_ENTRY_INTID_SHIFT          2
-#define ITE_ENTRY_INTID_MASK         MAKE_64BIT_MASK(2, 24)
-#define ITE_ENTRY_INTSP_SHIFT          26
-#define ITE_ENTRY_ICID_MASK          MAKE_64BIT_MASK(0, 16)
+
+FIELD(ITE_L, VALID, 0, 1)
+FIELD(ITE_L, INTTYPE, 1, 1)
+FIELD(ITE_L, INTID, 2, 24)
+FIELD(ITE_L, DOORBELL, 26, 24)
+
+FIELD(ITE_H, ICID, 0, 16)
+FIELD(ITE_H, VPEID, 16, 16)
+
+/* Possible values for ITE_L INTTYPE */
+#define ITE_INTTYPE_VIRTUAL 0
+#define ITE_INTTYPE_PHYSICAL 1
 
 /* 16 bits EventId */
 #define ITS_IDBITS                   GICD_TYPER_IDBITS
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 88f4d730999..15eb72a0a15 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -156,12 +156,11 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
                                         MEMTXATTRS_UNSPECIFIED, res);
 
         if (*res == MEMTX_OK) {
-            if (ite.itel & TABLE_ENTRY_VALID_MASK) {
-                if ((ite.itel >> ITE_ENTRY_INTTYPE_SHIFT) &
-                    GITS_TYPE_PHYSICAL) {
-                    *pIntid = (ite.itel & ITE_ENTRY_INTID_MASK) >>
-                               ITE_ENTRY_INTID_SHIFT;
-                    *icid = ite.iteh & ITE_ENTRY_ICID_MASK;
+            if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
+                int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
+                if (inttype == ITE_INTTYPE_PHYSICAL) {
+                    *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
+                    *icid = FIELD_EX32(ite.iteh, ITE_H, ICID);
                     status = true;
                 }
             }
@@ -342,8 +341,6 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    IteEntry ite;
-    uint32_t int_spurious = INTID_SPURIOUS;
     bool result = false;
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
@@ -400,16 +397,16 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
          */
     } else {
         /* add ite entry to interrupt translation table */
-        ite.itel = (dte_valid & TABLE_ENTRY_VALID_MASK) |
-                    (GITS_TYPE_PHYSICAL << ITE_ENTRY_INTTYPE_SHIFT);
-
+        IteEntry ite = {};
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
         if (ignore_pInt) {
-            ite.itel |= (eventid << ITE_ENTRY_INTID_SHIFT);
+            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, eventid);
         } else {
-            ite.itel |= (pIntid << ITE_ENTRY_INTID_SHIFT);
+            ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
         }
-        ite.itel |= (int_spurious << ITE_ENTRY_INTSP_SHIFT);
-        ite.iteh = icid;
+        ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+        ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
         result = update_ite(s, eventid, dte, ite);
     }
@@ -1237,8 +1234,7 @@ static void gicv3_arm_its_realize(DeviceState *dev, Error **errp)
                        "gicv3-its-sysmem");
 
     /* set the ITS default features supported */
-    s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL,
-                          GITS_TYPE_PHYSICAL);
+    s->typer = FIELD_DP64(s->typer, GITS_TYPER, PHYSICAL, 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, ITT_ENTRY_SIZE,
                           ITS_ITT_ENTRY_SIZE - 1);
     s->typer = FIELD_DP64(s->typer, GITS_TYPER, IDBITS, ITS_IDBITS);
-- 
2.25.1



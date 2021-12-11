Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 744744715A2
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:23:02 +0100 (CET)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7xV-0004Gr-It
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:23:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mh-0004yZ-FQ
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:52 -0500
Received: from [2a00:1450:4864:20::42f] (port=35659
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mc-0006Dv-B9
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id k9so2540411wrd.2
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2QysQTQAWSazy2o5oN/Juze7nEenPNm5O/YPOxLtXE=;
 b=gNHJePsNhRr7hcGcxPbTSEK8kKRsPIWZXgNLOv4dDIml4JSV5Z4pUiw1N4Dl47Ov/W
 /lB4hk0w3abtaHPJkoqwNY/rtIRdcz/BhAHd02qjU4L03tU0xrZ1u6eiSTGsWsllXISA
 iV5XgGZ0SWq+g3rjh4GTBZX2ZZIqOc7WEC0KpgDtVJshAE/TAXYIPoUs4ulxJx1xMKOo
 qrdep4N6yP+gzQKfsiT2wVgj2D9uDAAKvIwXiP89qTMxb005hek95ajmGYyYcrwb7o1P
 1ewqOCe5CepnvoevLx4/jylnOBxwouawe3mijuYs6xEwNynNzeg4BDel57KtEESnvSvQ
 6/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2QysQTQAWSazy2o5oN/Juze7nEenPNm5O/YPOxLtXE=;
 b=p1fUwWNTM3OGKkRUqxesJ0tHESu3hhk113wzQnnFKxIcVe9yZ+3nN8FOOdlheg+BhR
 uXst8dP9uRpIp9dREmyyFDRn+hkY51C5d7cobaKjmsoKwLY/KITeWGmcpiRrMyeK2etL
 SX1K5h6oT4GD4oGbJLmvIGftkwXgw+YAWt+7CpNCXE7wxj3bL7LGU/J8b1wiYbU8I5A/
 7UHNyqPWHC1kCacnLYv1Ni+jFbioXZGI0hoFHmTzrK97jyulquo090dcvHrxVK3gv2l2
 +6Gwvy6Ja4O3CFuFRLSApPka/5FjNg7/4i08NzwxALuKcJoex315D3nAosfeISvSV0iW
 dEHg==
X-Gm-Message-State: AOAM533/Kgdt6Ccf717isIKGwvnZyCGWK7SG76X8h0pj4VnuYSvbCih1
 CptjSjZ/+6Ubdn+pxLXowFURPQ==
X-Google-Smtp-Source: ABdhPJwwVSkPac+SZ0hpPEEn6OwFZnV7nMnrmFvZ3U7HS5uo5cig5K0Gh9aMSVFVU5W9K4vC/n57mg==
X-Received: by 2002:adf:d082:: with SMTP id y2mr21907560wrh.214.1639249904962; 
 Sat, 11 Dec 2021 11:11:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/26] hw/intc/arm_gicv3_its: Don't misuse GITS_TYPE_PHYSICAL
 define
Date: Sat, 11 Dec 2021 19:11:17 +0000
Message-Id: <20211211191135.1764649-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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



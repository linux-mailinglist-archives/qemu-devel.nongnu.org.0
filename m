Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07F4AD88C
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 14:15:18 +0100 (CET)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHQKt-0007RO-Vx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 08:15:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOrT-000163-05
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:44 -0500
Received: from [2a00:1450:4864:20::436] (port=40815
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHOqx-0002LD-Sg
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:40:19 -0500
Received: by mail-wr1-x436.google.com with SMTP id s18so30187247wrv.7
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xfspF6EAoKjns9Lx2RLE19pfQhU8M3s3hFNN5x9GJpc=;
 b=is0L+Ko+xtPghWNztjUtbpDpYWWYEIoCvHw8aOv6pkBOV5q9O1srLl1InLPPMUInFM
 XWw6umYnlf84edcQmrctgrMwAoLdkEba3Wqcn/DpfeasKd0ohs1LsTujSQcxVjJp70Hn
 b7fyV7EBjl0WcIkaqAM2yGjG7cBsUK6U9gdWXbIcvf2L7rgrzgaZNI7pnYWWWr/S0A+u
 Mh/yNyqLxO38IZP9TqeJeCU2Ir5uq08FbHcy9SMQ//jcK3XBM7/rhJVUZnbI+HwkYFPj
 N4gCEFO719/UAQ0mIA3173q/3qaWV6BEh8nIkj8B4QjVINQ4/HoTFDYX9e03FviJ/Dc+
 OyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xfspF6EAoKjns9Lx2RLE19pfQhU8M3s3hFNN5x9GJpc=;
 b=WP81f8wTVWTOqyR9spoTf7LaA3WjciFsP2wUjRWookYBU/U4LLFtfXeK/YJmaGvxZg
 CVSeELpVv/CZB/g4MF01rLKR5J1iQj1ZEbUhFoD+7SPo3NCtRtHBnWoISm8bgWxtaf73
 AgeRtWeTmW/fY9FybIV9CSWtRsPG4QZEeNAa81B+DZuept+zBT1xF9EsxhaZAx6V3Asz
 h4NUJWVuJqgaKtE+wjSW8pzSGTa9tLzmb7M0Ck/eJI199RcqMKtMuuTcJClgkPfWMHUT
 60US4Kg2pFaDtHzSmP9I2jmDgASzVP8OrafyfD0U9SgKoW7by2YNUTZSJySqApRmQqj5
 IjBw==
X-Gm-Message-State: AOAM532hzGnRwHuXf/+EsngjNgkxI0FH/0CjHkXLmY9T8C3bsA7H0aT3
 7FmdgYjDbGbD/6BsJefJtkKBhEcEUx74QA==
X-Google-Smtp-Source: ABdhPJwoIMFxflaO9zbLTHFH3pjGL8hkGsCNFeBODpcH/rev41SiZRNdl4hVd78LcRTp/5kr79PcMw==
X-Received: by 2002:a5d:64e9:: with SMTP id g9mr3210636wri.341.1644320410689; 
 Tue, 08 Feb 2022 03:40:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id r11sm4245199wrt.28.2022.02.08.03.40.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 03:40:10 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/39] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
Date: Tue,  8 Feb 2022 11:39:40 +0000
Message-Id: <20220208113948.3217356-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208113948.3217356-1-peter.maydell@linaro.org>
References: <20220208113948.3217356-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

In get_ite() and update_ite() we work with a 12-byte in-guest-memory
table entry, which we intend to handle as an 8-byte value followed by
a 4-byte value.  Unfortunately the calculation of the address of the
4-byte value is wrong, because we write it as:

 table_base_address + (index * entrysize) + 4
(obfuscated by the way the expression has been written)

when it should be + 8.  This bug meant that we overwrote the top
bytes of the 8-byte value with the 4-byte value.  There are no
guest-visible effects because the top half of the 8-byte value
contains only the doorbell interrupt field, which is used only in
GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
cancel each other out.

We can't simply change the calculation, because this would break
migration of a (TCG) guest from the old version of QEMU which had
in-guest-memory interrupt tables written using the buggy version of
update_ite().  We must also at the same time change the layout of the
fields within the ITE_L and ITE_H values so that the in-memory
locations of the fields we care about (VALID, INTTYPE, INTID and
ICID) stay the same.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220201193207.2771604-7-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h | 19 ++++++++++---------
 hw/intc/arm_gicv3_its.c  | 28 +++++++++++-----------------
 2 files changed, 21 insertions(+), 26 deletions(-)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 60c8617e4e4..2bf1baef047 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -370,22 +370,23 @@ FIELD(MOVI_2, ICID, 0, 16)
  * 12 bytes Interrupt translation Table Entry size
  * as per Table 5.3 in GICv3 spec
  * ITE Lower 8 Bytes
- *   Bits:    | 49 ... 26 | 25 ... 2 |   1     |   0    |
- *   Values:  |  Doorbell |  IntNum  | IntType |  Valid |
+ *   Bits:    | 63 ... 48 | 47 ... 32 | 31 ... 26 | 25 ... 2 |   1     |  0    |
+ *   Values:  | vPEID     | ICID      | unused    |  IntNum  | IntType | Valid |
  * ITE Higher 4 Bytes
- *   Bits:    | 31 ... 16 | 15 ...0 |
- *   Values:  |  vPEID    |  ICID   |
- * (When Doorbell is unused, as it always is in GICv3, it is 1023)
+ *   Bits:    | 31 ... 25 | 24 ... 0 |
+ *   Values:  | unused    | Doorbell |
+ * (When Doorbell is unused, as it always is for INTYPE_PHYSICAL,
+ * the value of that field in memory cannot be relied upon -- older
+ * versions of QEMU did not correctly write to that memory.)
  */
 #define ITS_ITT_ENTRY_SIZE            0xC
 
 FIELD(ITE_L, VALID, 0, 1)
 FIELD(ITE_L, INTTYPE, 1, 1)
 FIELD(ITE_L, INTID, 2, 24)
-FIELD(ITE_L, DOORBELL, 26, 24)
-
-FIELD(ITE_H, ICID, 0, 16)
-FIELD(ITE_H, VPEID, 16, 16)
+FIELD(ITE_L, ICID, 32, 16)
+FIELD(ITE_L, VPEID, 48, 16)
+FIELD(ITE_H, DOORBELL, 0, 24)
 
 /* Possible values for ITE_L INTTYPE */
 #define ITE_INTTYPE_VIRTUAL 0
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b94775fd379..48eaf20a6c9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -173,14 +173,12 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
 {
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
+    hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
-    address_space_stq_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
-                         sizeof(uint32_t))), ite.itel, MEMTXATTRS_UNSPECIFIED,
-                         &res);
+    address_space_stq_le(as, iteaddr, ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res == MEMTX_OK) {
-        address_space_stl_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
-                             sizeof(uint32_t))) + sizeof(uint32_t), ite.iteh,
+        address_space_stl_le(as, iteaddr + 8, ite.iteh,
                              MEMTXATTRS_UNSPECIFIED, &res);
     }
     if (res != MEMTX_OK) {
@@ -196,16 +194,12 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     AddressSpace *as = &s->gicv3->dma_as;
     bool status = false;
     IteEntry ite = {};
+    hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
-    ite.itel = address_space_ldq_le(as, dte->ittaddr +
-                                    (eventid * (sizeof(uint64_t) +
-                                    sizeof(uint32_t))), MEMTXATTRS_UNSPECIFIED,
-                                    res);
+    ite.itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, res);
 
     if (*res == MEMTX_OK) {
-        ite.iteh = address_space_ldl_le(as, dte->ittaddr +
-                                        (eventid * (sizeof(uint64_t) +
-                                        sizeof(uint32_t))) + sizeof(uint32_t),
+        ite.iteh = address_space_ldl_le(as, iteaddr + 8,
                                         MEMTXATTRS_UNSPECIFIED, res);
 
         if (*res == MEMTX_OK) {
@@ -213,7 +207,7 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
                 int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
                 if (inttype == ITE_INTTYPE_PHYSICAL) {
                     *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
-                    *icid = FIELD_EX32(ite.iteh, ITE_H, ICID);
+                    *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
                     status = true;
                 }
             }
@@ -412,8 +406,8 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, true);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, icid);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
 
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
@@ -688,8 +682,8 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, new_icid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, new_icid);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
-- 
2.25.1



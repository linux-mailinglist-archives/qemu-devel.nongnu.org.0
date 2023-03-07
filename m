Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011186AD824
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRRs-0007aL-5Q; Tue, 07 Mar 2023 02:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRp-0007ZT-V4
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRn-0005Oy-HP
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1pgIMDDbhOsVgEl98MWZHQ5TiRLmX782i+akPCOlJR4=;
 b=YGvpwRUlRBwTLXaTN776Bx5JRKPSth1rq4jlVkuc44RA38B3MuR4jJJTpiwfxD9dD6n7FZ
 HwKg9T3hduOkCh/1PNmsO2XA2FjRimkNGse/AplgFi7RDtjN29B5Zl9MZTdyEG3tKaTg6D
 hWoVYOiOKBh4dkrxzTy+Xk+zob2sN64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-CVrNw3oFMoC-fDZNyfTI_A-1; Tue, 07 Mar 2023 02:09:17 -0500
X-MC-Unique: CVrNw3oFMoC-fDZNyfTI_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 510FE802DD4;
 Tue,  7 Mar 2023 07:09:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5FED040C10FA;
 Tue,  7 Mar 2023 07:09:15 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 07/51] e1000e: Mask registers when writing
Date: Tue,  7 Mar 2023 15:07:32 +0800
Message-Id: <20230307070816.34833-8-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

When a register has effective bits fewer than their width, the old code
inconsistently masked when writing or reading. Make the code consistent
by always masking when writing, and remove some code duplication.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 76 ++++++++++++++++++++++------------------------------
 1 file changed, 32 insertions(+), 44 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 1cafc38..e6fc85e 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2447,7 +2447,11 @@ e1000e_set_fcrtl(E1000ECore *core, int index, uint32_t val)
         core->mac[index] = val & (BIT(num) - 1);                     \
     }
 
+E1000E_LOW_BITS_SET_FUNC(4)
+E1000E_LOW_BITS_SET_FUNC(6)
+E1000E_LOW_BITS_SET_FUNC(11)
 E1000E_LOW_BITS_SET_FUNC(12)
+E1000E_LOW_BITS_SET_FUNC(13)
 E1000E_LOW_BITS_SET_FUNC(16)
 
 static void
@@ -2619,22 +2623,6 @@ e1000e_mac_ims_read(E1000ECore *core, int index)
     return core->mac[IMS];
 }
 
-#define E1000E_LOW_BITS_READ_FUNC(num)                      \
-    static uint32_t                                         \
-    e1000e_mac_low##num##_read(E1000ECore *core, int index) \
-    {                                                       \
-        return core->mac[index] & (BIT(num) - 1);           \
-    }                                                       \
-
-#define E1000E_LOW_BITS_READ(num)                           \
-    e1000e_mac_low##num##_read
-
-E1000E_LOW_BITS_READ_FUNC(4);
-E1000E_LOW_BITS_READ_FUNC(6);
-E1000E_LOW_BITS_READ_FUNC(11);
-E1000E_LOW_BITS_READ_FUNC(13);
-E1000E_LOW_BITS_READ_FUNC(16);
-
 static uint32_t
 e1000e_mac_swsm_read(E1000ECore *core, int index)
 {
@@ -2928,7 +2916,19 @@ static const readops e1000e_macreg_readops[] = {
     e1000e_getreg(LATECOL),
     e1000e_getreg(SEQEC),
     e1000e_getreg(XONTXC),
+    e1000e_getreg(AIT),
+    e1000e_getreg(TDFH),
+    e1000e_getreg(TDFT),
+    e1000e_getreg(TDFHS),
+    e1000e_getreg(TDFTS),
+    e1000e_getreg(TDFPC),
     e1000e_getreg(WUS),
+    e1000e_getreg(PBS),
+    e1000e_getreg(RDFH),
+    e1000e_getreg(RDFT),
+    e1000e_getreg(RDFHS),
+    e1000e_getreg(RDFTS),
+    e1000e_getreg(RDFPC),
     e1000e_getreg(GORCL),
     e1000e_getreg(MGTPRC),
     e1000e_getreg(EERD),
@@ -3064,16 +3064,9 @@ static const readops e1000e_macreg_readops[] = {
     [MPTC]    = e1000e_mac_read_clr4,
     [IAC]     = e1000e_mac_read_clr4,
     [ICR]     = e1000e_mac_icr_read,
-    [RDFH]    = E1000E_LOW_BITS_READ(13),
-    [RDFHS]   = E1000E_LOW_BITS_READ(13),
-    [RDFPC]   = E1000E_LOW_BITS_READ(13),
-    [TDFH]    = E1000E_LOW_BITS_READ(13),
-    [TDFHS]   = E1000E_LOW_BITS_READ(13),
     [STATUS]  = e1000e_get_status,
     [TARC0]   = e1000e_get_tarc,
-    [PBS]     = E1000E_LOW_BITS_READ(6),
     [ICS]     = e1000e_mac_ics_read,
-    [AIT]     = E1000E_LOW_BITS_READ(16),
     [TORH]    = e1000e_mac_read_clr8,
     [GORCH]   = e1000e_mac_read_clr8,
     [PRC127]  = e1000e_mac_read_clr4,
@@ -3089,11 +3082,6 @@ static const readops e1000e_macreg_readops[] = {
     [BPTC]    = e1000e_mac_read_clr4,
     [TSCTC]   = e1000e_mac_read_clr4,
     [ITR]     = e1000e_mac_itr_read,
-    [RDFT]    = E1000E_LOW_BITS_READ(13),
-    [RDFTS]   = E1000E_LOW_BITS_READ(13),
-    [TDFPC]   = E1000E_LOW_BITS_READ(13),
-    [TDFT]    = E1000E_LOW_BITS_READ(13),
-    [TDFTS]   = E1000E_LOW_BITS_READ(13),
     [CTRL]    = e1000e_get_ctrl,
     [TARC1]   = e1000e_get_tarc,
     [SWSM]    = e1000e_mac_swsm_read,
@@ -3106,10 +3094,10 @@ static const readops e1000e_macreg_readops[] = {
     [WUPM ... WUPM + 31]   = e1000e_mac_readreg,
     [MTA ... MTA + 127]    = e1000e_mac_readreg,
     [VFTA ... VFTA + 127]  = e1000e_mac_readreg,
-    [FFMT ... FFMT + 254]  = E1000E_LOW_BITS_READ(4),
+    [FFMT ... FFMT + 254]  = e1000e_mac_readreg,
     [FFVT ... FFVT + 254]  = e1000e_mac_readreg,
     [MDEF ... MDEF + 7]    = e1000e_mac_readreg,
-    [FFLT ... FFLT + 10]   = E1000E_LOW_BITS_READ(11),
+    [FFLT ... FFLT + 10]   = e1000e_mac_readreg,
     [FTFT ... FTFT + 254]  = e1000e_mac_readreg,
     [PBM ... PBM + 10239]  = e1000e_mac_readreg,
     [RETA ... RETA + 31]   = e1000e_mac_readreg,
@@ -3132,19 +3120,8 @@ static const writeops e1000e_macreg_writeops[] = {
     e1000e_putreg(LEDCTL),
     e1000e_putreg(FCAL),
     e1000e_putreg(FCRUC),
-    e1000e_putreg(AIT),
-    e1000e_putreg(TDFH),
-    e1000e_putreg(TDFT),
-    e1000e_putreg(TDFHS),
-    e1000e_putreg(TDFTS),
-    e1000e_putreg(TDFPC),
     e1000e_putreg(WUC),
     e1000e_putreg(WUS),
-    e1000e_putreg(RDFH),
-    e1000e_putreg(RDFT),
-    e1000e_putreg(RDFHS),
-    e1000e_putreg(RDFTS),
-    e1000e_putreg(RDFPC),
     e1000e_putreg(IPAV),
     e1000e_putreg(TDBAH1),
     e1000e_putreg(TIMINCA),
@@ -3155,7 +3132,6 @@ static const writeops e1000e_macreg_writeops[] = {
     e1000e_putreg(TARC1),
     e1000e_putreg(FLSWDATA),
     e1000e_putreg(POEMB),
-    e1000e_putreg(PBS),
     e1000e_putreg(MFUTP01),
     e1000e_putreg(MFUTP23),
     e1000e_putreg(MANC),
@@ -3220,6 +3196,18 @@ static const writeops e1000e_macreg_writeops[] = {
     [TADV]     = e1000e_set_16bit,
     [ITR]      = e1000e_set_itr,
     [EERD]     = e1000e_set_eerd,
+    [AIT]      = e1000e_set_16bit,
+    [TDFH]     = e1000e_set_13bit,
+    [TDFT]     = e1000e_set_13bit,
+    [TDFHS]    = e1000e_set_13bit,
+    [TDFTS]    = e1000e_set_13bit,
+    [TDFPC]    = e1000e_set_13bit,
+    [RDFH]     = e1000e_set_13bit,
+    [RDFHS]    = e1000e_set_13bit,
+    [RDFT]     = e1000e_set_13bit,
+    [RDFTS]    = e1000e_set_13bit,
+    [RDFPC]    = e1000e_set_13bit,
+    [PBS]      = e1000e_set_6bit,
     [GCR]      = e1000e_set_gcr,
     [PSRCTL]   = e1000e_set_psrctl,
     [RXCSUM]   = e1000e_set_rxcsum,
@@ -3259,11 +3247,11 @@ static const writeops e1000e_macreg_writeops[] = {
     [WUPM ... WUPM + 31]     = e1000e_mac_writereg,
     [MTA ... MTA + 127]      = e1000e_mac_writereg,
     [VFTA ... VFTA + 127]    = e1000e_mac_writereg,
-    [FFMT ... FFMT + 254]    = e1000e_mac_writereg,
+    [FFMT ... FFMT + 254]    = e1000e_set_4bit,
     [FFVT ... FFVT + 254]    = e1000e_mac_writereg,
     [PBM ... PBM + 10239]    = e1000e_mac_writereg,
     [MDEF ... MDEF + 7]      = e1000e_mac_writereg,
-    [FFLT ... FFLT + 10]     = e1000e_mac_writereg,
+    [FFLT ... FFLT + 10]     = e1000e_set_11bit,
     [FTFT ... FTFT + 254]    = e1000e_mac_writereg,
     [RETA ... RETA + 31]     = e1000e_mac_writereg,
     [RSSRK ... RSSRK + 31]   = e1000e_mac_writereg,
-- 
2.7.4



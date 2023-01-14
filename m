Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDCF66A910
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:02:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXir-0000Mv-Va; Fri, 13 Jan 2023 23:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiS-0000Cj-Ko
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:26 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXiM-0005Jn-5G
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:00:22 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o18so3091749pji.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQAThEFT+OOf4M3xlMKLI4kuAC9hcUfjxpclwetq4QM=;
 b=HZhoXe7q3UMxTgctU7VDHLJ9bkoJnwO5yh/jgRzD3dCfkFpcoYitp/nemAsdB8ccpi
 jM60Fj3sDeInHye6nTgZc2S+GodYYuxGpVXHGJ4EHZ5HRTZx//dmBVKuV8zDSzrTDCab
 rQqrv2NMk24YO+wKB9fhq3nb818KqdpI9feR7RRakd7gEQkEFvPhTq9enynCCvI6k+TC
 54SJ29mpdNTMfdF96gtpElD11W6UHdsefoUEJc62Vr2eGyZClBXSw+i/Sd1ik7mzsuWe
 dCSru+lvdxYNgKZ5Lq0oeS9FMj1TQXP+9/zvsTrtjwC5f/dsdVPV6l15iExXP22yQmdT
 8pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQAThEFT+OOf4M3xlMKLI4kuAC9hcUfjxpclwetq4QM=;
 b=1hofFE5Jgi2mjqGyPHofNGy90QfI2lU0AgTvSecAN5HdTd0hzgHXbDGXTG8luvuIbh
 lYtA8GR8aVYC6qjk7g+Zs4BHrTW4kuVqAEeDuohWhtNfTsK89stR9EHwsQnWZzaYAKss
 0mXR230mPpHhHpi9tmaHZ9Gv+zLhXeKrTZ7A3UNwAy4RjrN1DzTiPN4RRXKTNLi14YDZ
 nTxzUguXrXosiuEv5lWB5CH/wqE/DJIEKz8m4rfTNaonMkpg2Gzjo5CRdQDiNAFySNZ8
 4sr6nIyT2l7HnOSRwlPzOSjfnuCA/99UJYofjpgnAZ3D+YOTmv8iQA1w3jVZyDpCtgqS
 hM4w==
X-Gm-Message-State: AFqh2kpW+3IwKjKEV9BP/mnnu2ySI/aCLl/ViGADRwelLp3F4mkXkInR
 W+aWy76GGGmCYfjhjWyqT9N1RA==
X-Google-Smtp-Source: AMrXdXvYK+qE6FmACZ6u3shiLGiBj2Vu/eT24XyLlp6paR2jDnUthTbCBPyPFhcwsisYAbwcQMJyWQ==
X-Received: by 2002:a17:903:2111:b0:194:3fa4:3f46 with SMTP id
 o17-20020a170903211100b001943fa43f46mr11255320ple.29.1673668806142; 
 Fri, 13 Jan 2023 20:00:06 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a170902868f00b00189fdadef9csm910894plo.107.2023.01.13.20.00.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:00:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 06/19] e1000e: Mask registers when writing
Date: Sat, 14 Jan 2023 12:59:06 +0900
Message-Id: <20230114035919.35251-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114035919.35251-1-akihiko.odaki@daynix.com>
References: <20230114035919.35251-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

When a register has effective bits fewer than their width, the old code
inconsistently masked when writing or reading. Make the code consistent
by always masking when writing, and remove some code duplication.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 94 +++++++++++++++++++-------------------------
 1 file changed, 40 insertions(+), 54 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 181c1e0c2a..e6fc85ea51 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2440,17 +2440,19 @@ e1000e_set_fcrtl(E1000ECore *core, int index, uint32_t val)
     core->mac[FCRTL] = val & 0x8000FFF8;
 }
 
-static inline void
-e1000e_set_16bit(E1000ECore *core, int index, uint32_t val)
-{
-    core->mac[index] = val & 0xffff;
-}
+#define E1000E_LOW_BITS_SET_FUNC(num)                                \
+    static void                                                      \
+    e1000e_set_##num##bit(E1000ECore *core, int index, uint32_t val) \
+    {                                                                \
+        core->mac[index] = val & (BIT(num) - 1);                     \
+    }
 
-static void
-e1000e_set_12bit(E1000ECore *core, int index, uint32_t val)
-{
-    core->mac[index] = val & 0xfff;
-}
+E1000E_LOW_BITS_SET_FUNC(4)
+E1000E_LOW_BITS_SET_FUNC(6)
+E1000E_LOW_BITS_SET_FUNC(11)
+E1000E_LOW_BITS_SET_FUNC(12)
+E1000E_LOW_BITS_SET_FUNC(13)
+E1000E_LOW_BITS_SET_FUNC(16)
 
 static void
 e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
@@ -2621,22 +2623,6 @@ e1000e_mac_ims_read(E1000ECore *core, int index)
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
@@ -2930,7 +2916,19 @@ static const readops e1000e_macreg_readops[] = {
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
@@ -3066,16 +3064,9 @@ static const readops e1000e_macreg_readops[] = {
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
@@ -3091,11 +3082,6 @@ static const readops e1000e_macreg_readops[] = {
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
@@ -3108,10 +3094,10 @@ static const readops e1000e_macreg_readops[] = {
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
@@ -3134,19 +3120,8 @@ static const writeops e1000e_macreg_writeops[] = {
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
@@ -3157,7 +3132,6 @@ static const writeops e1000e_macreg_writeops[] = {
     e1000e_putreg(TARC1),
     e1000e_putreg(FLSWDATA),
     e1000e_putreg(POEMB),
-    e1000e_putreg(PBS),
     e1000e_putreg(MFUTP01),
     e1000e_putreg(MFUTP23),
     e1000e_putreg(MANC),
@@ -3222,6 +3196,18 @@ static const writeops e1000e_macreg_writeops[] = {
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
@@ -3261,11 +3247,11 @@ static const writeops e1000e_macreg_writeops[] = {
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
2.39.0



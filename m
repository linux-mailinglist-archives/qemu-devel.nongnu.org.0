Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02612666F28
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuLw-0003IH-CX; Thu, 12 Jan 2023 04:58:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLs-0003Gp-KY
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:28 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLq-0004OL-TQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:28 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so5152167pjl.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qQAThEFT+OOf4M3xlMKLI4kuAC9hcUfjxpclwetq4QM=;
 b=XtgDVcoHPZk/f4ENE4qp+ojor8xSDx0Y38m/6+BJBvCR25IKy1Fc0Qj84+ssXFp11t
 E+sPryKxHugUi7zm6YA7nxjD8jijoogNIrtQMkdj0NuP4tQVCsRNkvF55Gvk5p7tFPSV
 FyYV8o9QWYYgAn4wRWB2VkrLB0PWnb4A5IFugF2qdmkAuAzgoI6PgVN0yViEb2mpjuVb
 sWf/GdtqGClb8FTtPQwfSdqGxxVgSIIsRpW8stgGnfjP3bpHttqiKo2qQ8e2aujDCnm1
 9AGSF6yOK9edItLu2zH/AhksA/GFja1epo66F6yB4Y1QVgvizqbDB6fRBuFY/ljCj/EC
 cEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qQAThEFT+OOf4M3xlMKLI4kuAC9hcUfjxpclwetq4QM=;
 b=6L0CGZXMoSKKLaed/yr1oLz+McBN49l71KJYW4Qp4Fxua5O/DOw/c6JMWfgcB/Liks
 xQHGj8k0hP73vAwYhQGm+pBwKSMNGM0i/pp3u5/ZImgxVeyN7RIG6g8JVGPlW/KXYjcP
 2nBmAUWuc0HiiGhP3sWQNIGM2iiVGpqq6nm3XTBHNvCWGVix/43IUehTBKm9clOLkiwS
 SBVeJl0j3bcW2Ri1hJsh9DG3pY7gNOnzWYdGwdjG7RutFjcwOgjx2OceA5eWtqxFl8v3
 v7Uyl3CtsrpxjJlkea/2+hTONb7hfucOdyFMh1HMM1vwKfk6xR/t8plTKO0StVli59Z2
 Mq2Q==
X-Gm-Message-State: AFqh2krqfwZ4Kj8LcjOxWV5zlnq62NYvg5EU9LKpM9ZPp4wWSGlgf9XH
 T1sZnjccEKkye4M94tqTzxMAS5euHhJaH+5x
X-Google-Smtp-Source: AMrXdXt2BorrtoKuL10iKoNCwcrl3xHjPPtpl2SNVxx9H4mu4TbjMYdwqA4lGxtiPd5auBvc5ncXaA==
X-Received: by 2002:a05:6a20:a881:b0:b5:ff32:85b5 with SMTP id
 ca1-20020a056a20a88100b000b5ff3285b5mr11096572pzb.54.1673517505549; 
 Thu, 12 Jan 2023 01:58:25 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:25 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 06/31] e1000e: Mask registers when writing
Date: Thu, 12 Jan 2023 18:57:18 +0900
Message-Id: <20230112095743.20123-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



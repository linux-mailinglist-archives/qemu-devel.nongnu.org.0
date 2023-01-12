Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8A666F18
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:09:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuLu-0003HM-Os; Thu, 12 Jan 2023 04:58:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLn-0003FX-18
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:23 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuLl-0004Ie-AS
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:58:22 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 cx21-20020a17090afd9500b00228f2ecc6dbso2152286pjb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lT52SNTCc/nCtQQU9cPkHF54P9O33LrcFrFzX4jErFo=;
 b=vVpEuubfBgOkWmsun4WaDRLLdfBd6QEpSCU2zgZ7myQNT0Gmj58dziwmKiEbD7VByw
 /cW3o75cifzKPt8C5H4l5inZxWLVs2ul8dbAOyQDSIW+hYKYQd2ac4usTF9EPLKKBqWX
 WsGTt5SLgZTIgq4yxAg1rU36Bwb014h89STAbxgStye97ZGwHYKy4qDOITZwXnoOhGDT
 LhxTgv7QS4bafpadQLXCLsjqVA48De3nQN/fIbJz6lxzyLgixkdPVWEepfP6hvW0cAoA
 hprz1F/4RELZK0T23Ze/6u7u1qsFk0xesm/8c8AetkHSAoMXOOrK3ImIyt4pK7fFsZ2M
 HhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lT52SNTCc/nCtQQU9cPkHF54P9O33LrcFrFzX4jErFo=;
 b=N6Yuolr4DyhZwi2jo2Fh/9lNsZ9XVi587+rpAiL6hlfF6QK53K1Oybut6lNAoOxZnp
 dFSot+e/EjHsqxQk723yWnA6kFKb8HTJWXajjwU0tqeUCYTvlURjFigr9w5xg4YaNqxw
 9RA3+GmaSwayENFN5c+fIKpiNgG5vlhTM/CrVCponKNYubIlCFIAnntYPPCp9vUSm5vV
 eO3WOsMjTz6wHye0g03bHi5/o3l59AxGgvvpiu0wl7tfZ1tXYLFm4zFINovz6JLTGCsV
 8xQuspLNxWk4rgqBVNfXZRXdBRA5Jw7Avfy1xoiyDm0mTanaJw7oaqcsGmR3OOz3Iz4d
 pn4g==
X-Gm-Message-State: AFqh2koeAhNhRiKyxnCw1BNWX37y3RTUIekK2q/BxuiziAzRSj28g7N2
 4c0QHQe5dw/UNzkBFfkOsUdcAA==
X-Google-Smtp-Source: AMrXdXsI6Gk9fKY4iZLVoi/MOQOtvpLDONdO8EOD323UeNZ0FZqKcv3Gjg41ZkOcP/SHVq8SctegOg==
X-Received: by 2002:a17:90a:c58b:b0:226:18ca:b53d with SMTP id
 l11-20020a17090ac58b00b0022618cab53dmr6257256pjt.41.1673517500703; 
 Thu, 12 Jan 2023 01:58:20 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:58:20 -0800 (PST)
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
Subject: [PATCH 05/31] e1000: Mask registers when writing
Date: Thu, 12 Jan 2023 18:57:17 +0900
Message-Id: <20230112095743.20123-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
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
 hw/net/e1000.c | 84 +++++++++++++++++++-------------------------------
 1 file changed, 31 insertions(+), 53 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 246e7670a8..7c28200cab 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -1062,30 +1062,6 @@ mac_readreg(E1000State *s, int index)
     return s->mac_reg[index];
 }
 
-static uint32_t
-mac_low4_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0xf;
-}
-
-static uint32_t
-mac_low11_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0x7ff;
-}
-
-static uint32_t
-mac_low13_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0x1fff;
-}
-
-static uint32_t
-mac_low16_read(E1000State *s, int index)
-{
-    return s->mac_reg[index] & 0xffff;
-}
-
 static uint32_t
 mac_icr_read(E1000State *s, int index)
 {
@@ -1138,11 +1114,17 @@ set_rdt(E1000State *s, int index, uint32_t val)
     }
 }
 
-static void
-set_16bit(E1000State *s, int index, uint32_t val)
-{
-    s->mac_reg[index] = val & 0xffff;
-}
+#define LOW_BITS_SET_FUNC(num)                             \
+    static void                                            \
+    set_##num##bit(E1000State *s, int index, uint32_t val) \
+    {                                                      \
+        s->mac_reg[index] = val & (BIT(num) - 1);          \
+    }
+
+LOW_BITS_SET_FUNC(4)
+LOW_BITS_SET_FUNC(11)
+LOW_BITS_SET_FUNC(13)
+LOW_BITS_SET_FUNC(16)
 
 static void
 set_dlen(E1000State *s, int index, uint32_t val)
@@ -1196,7 +1178,9 @@ static const readops macreg_readops[] = {
     getreg(XONRXC),   getreg(XONTXC),   getreg(XOFFRXC),  getreg(XOFFTXC),
     getreg(RFC),      getreg(RJC),      getreg(RNBC),     getreg(TSCTFC),
     getreg(MGTPRC),   getreg(MGTPDC),   getreg(MGTPTC),   getreg(GORCL),
-    getreg(GOTCL),
+    getreg(GOTCL),    getreg(RDFH),     getreg(RDFT),     getreg(RDFHS),
+    getreg(RDFTS),    getreg(RDFPC),    getreg(TDFH),     getreg(TDFT),
+    getreg(TDFHS),    getreg(TDFTS),    getreg(TDFPC),    getreg(AIT),
 
     [TOTH]    = mac_read_clr8,      [TORH]    = mac_read_clr8,
     [GOTCH]   = mac_read_clr8,      [GORCH]   = mac_read_clr8,
@@ -1214,22 +1198,15 @@ static const readops macreg_readops[] = {
     [MPTC]    = mac_read_clr4,
     [ICR]     = mac_icr_read,       [EECD]    = get_eecd,
     [EERD]    = flash_eerd_read,
-    [RDFH]    = mac_low13_read,     [RDFT]    = mac_low13_read,
-    [RDFHS]   = mac_low13_read,     [RDFTS]   = mac_low13_read,
-    [RDFPC]   = mac_low13_read,
-    [TDFH]    = mac_low11_read,     [TDFT]    = mac_low11_read,
-    [TDFHS]   = mac_low13_read,     [TDFTS]   = mac_low13_read,
-    [TDFPC]   = mac_low13_read,
-    [AIT]     = mac_low16_read,
 
     [CRCERRS ... MPC]     = &mac_readreg,
     [IP6AT ... IP6AT + 3] = &mac_readreg,    [IP4AT ... IP4AT + 6] = &mac_readreg,
-    [FFLT ... FFLT + 6]   = &mac_low11_read,
+    [FFLT ... FFLT + 6]   = &mac_readreg,
     [RA ... RA + 31]      = &mac_readreg,
     [WUPM ... WUPM + 31]  = &mac_readreg,
     [MTA ... MTA + 127]   = &mac_readreg,
     [VFTA ... VFTA + 127] = &mac_readreg,
-    [FFMT ... FFMT + 254] = &mac_low4_read,
+    [FFMT ... FFMT + 254] = &mac_readreg,
     [FFVT ... FFVT + 254] = &mac_readreg,
     [PBM ... PBM + 16383] = &mac_readreg,
 };
@@ -1241,26 +1218,27 @@ static const writeops macreg_writeops[] = {
     putreg(PBA),      putreg(EERD),     putreg(SWSM),     putreg(WUFC),
     putreg(TDBAL),    putreg(TDBAH),    putreg(TXDCTL),   putreg(RDBAH),
     putreg(RDBAL),    putreg(LEDCTL),   putreg(VET),      putreg(FCRUC),
-    putreg(TDFH),     putreg(TDFT),     putreg(TDFHS),    putreg(TDFTS),
-    putreg(TDFPC),    putreg(RDFH),     putreg(RDFT),     putreg(RDFHS),
-    putreg(RDFTS),    putreg(RDFPC),    putreg(IPAV),     putreg(WUC),
-    putreg(WUS),      putreg(AIT),
-
-    [TDLEN]  = set_dlen,   [RDLEN]  = set_dlen,       [TCTL] = set_tctl,
-    [TDT]    = set_tctl,   [MDIC]   = set_mdic,       [ICS]  = set_ics,
-    [TDH]    = set_16bit,  [RDH]    = set_16bit,      [RDT]  = set_rdt,
-    [IMC]    = set_imc,    [IMS]    = set_ims,        [ICR]  = set_icr,
-    [EECD]   = set_eecd,   [RCTL]   = set_rx_control, [CTRL] = set_ctrl,
-    [RDTR]   = set_16bit,  [RADV]   = set_16bit,      [TADV] = set_16bit,
-    [ITR]    = set_16bit,
+    putreg(IPAV),     putreg(WUC),
+    putreg(WUS),
+
+    [TDLEN]  = set_dlen,   [RDLEN]  = set_dlen,       [TCTL]  = set_tctl,
+    [TDT]    = set_tctl,   [MDIC]   = set_mdic,       [ICS]   = set_ics,
+    [TDH]    = set_16bit,  [RDH]    = set_16bit,      [RDT]   = set_rdt,
+    [IMC]    = set_imc,    [IMS]    = set_ims,        [ICR]   = set_icr,
+    [EECD]   = set_eecd,   [RCTL]   = set_rx_control, [CTRL]  = set_ctrl,
+    [RDTR]   = set_16bit,  [RADV]   = set_16bit,      [TADV]  = set_16bit,
+    [ITR]    = set_16bit,  [TDFH]   = set_11bit,      [TDFT]  = set_11bit,
+    [TDFHS]  = set_13bit,  [TDFTS]  = set_13bit,      [TDFPC] = set_13bit,
+    [RDFH]   = set_13bit,  [RDFT]   = set_13bit,      [RDFHS] = set_13bit,
+    [RDFTS]  = set_13bit,  [RDFPC]  = set_13bit,      [AIT]   = set_16bit,
 
     [IP6AT ... IP6AT + 3] = &mac_writereg, [IP4AT ... IP4AT + 6] = &mac_writereg,
-    [FFLT ... FFLT + 6]   = &mac_writereg,
+    [FFLT ... FFLT + 6]   = &set_11bit,
     [RA ... RA + 31]      = &mac_writereg,
     [WUPM ... WUPM + 31]  = &mac_writereg,
     [MTA ... MTA + 127]   = &mac_writereg,
     [VFTA ... VFTA + 127] = &mac_writereg,
-    [FFMT ... FFMT + 254] = &mac_writereg, [FFVT ... FFVT + 254] = &mac_writereg,
+    [FFMT ... FFMT + 254] = &set_4bit,     [FFVT ... FFVT + 254] = &mac_writereg,
     [PBM ... PBM + 16383] = &mac_writereg,
 };
 
-- 
2.39.0



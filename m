Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F99F6E2284
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:45:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHpB-0006dA-6K; Fri, 14 Apr 2023 07:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHnH-0005FD-9v
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:48 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHn8-0001ta-2K
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:38 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 pm7-20020a17090b3c4700b00246f00dace2so10423011pjb.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472420; x=1684064420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qdSW6mRO8YWgMZEMpu/HXCWDuVvbxmy3W0iClpo2dEQ=;
 b=HXCmMDlofhCrPSjvOhCvJdaZs6UWLy9znCcMscrdiMwtGZQOezy8LCLL8H+HBiQEDQ
 oEbffdUeQyWz2d+58PguwblCvqHLt0ujd2/RxVUXUpxHRTPdaJrBJ5jOYk0oIHkkULJC
 WF11YklrnBJ6SqB0TlRRxje0nNoIIcfuKKDQsCUaiowz8sr4+0PMP+AUIphmmXYPfJ9A
 bXkQkomrslfq9b0nGo5LVKLos/lNPV+W+9LIc4j0iQXu2Z6/tMs2wr2poKtB770gtToo
 Mt3//WsBb9rVu6bB6LsEjkqcJDjxZvBOkA3Ujem9QPllbwEYnP1oVdbEdHM4K1eoh8WF
 AQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472420; x=1684064420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qdSW6mRO8YWgMZEMpu/HXCWDuVvbxmy3W0iClpo2dEQ=;
 b=Ewhg1XIzhOKNPiffUs9DFphoNBkhY0RqFIUihesOPUJoP3pJCz6P6fV2w2RJ6yL2zD
 Ffu4dIwwaCvu2aH24ShOEwu4CIX8vC/7qXo2xhfB5291qHDgUpndOujpuRWbdY1wKdgV
 k7tR97SBtlImMbWf7Bd0iOn5XissBWHRZ9CAPVJzimodrMM6ViNyJ19xX2x2GxNhkdEk
 daCCFu5siIDsHI9vECtJzJNUSHwAWB9dLKGotYuv9AYQcYLE8+dcYYh4XyzH2bu4nGXk
 MnjHFpR3BM0DnNlOrzcK2XFU6jtmGcFDnKAkfPgQIluCZ2Dhl3AsewY8tcnO2iX1wwjU
 GLug==
X-Gm-Message-State: AAQBX9dzLmTJxxMruS0eNeCqs3FgRuJd5iBWDJuIrHag2TTLXIiM74Dd
 XRl+EFp36HuLzSLa92rukuXtbA==
X-Google-Smtp-Source: AKy350ZOpe1VjWDEu98pyjs2J8To2vmX0cRlSLrKfo4zixBZ8fKuIb9f4wIYIvUjfokD/VnlcGVI3g==
X-Received: by 2002:a17:90b:3807:b0:23d:31c3:c9a4 with SMTP id
 mq7-20020a17090b380700b0023d31c3c9a4mr5078973pjb.26.1681472420412; 
 Fri, 14 Apr 2023 04:40:20 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:20 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 37/40] igb: Implement Tx timestamp
Date: Fri, 14 Apr 2023 20:37:34 +0900
Message-Id: <20230414113737.62803-38-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 7 +++++++
 hw/net/igb_regs.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c716f400fd..38b53676d4 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -614,6 +614,13 @@ igb_process_tx_desc(IGBCore *core,
                 tx->first_olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
                 tx->first = false;
             }
+
+            if ((cmd_type_len & E1000_ADVTXD_MAC_TSTAMP) &&
+                (core->mac[TSYNCTXCTL] & E1000_TSYNCTXCTL_ENABLED) &&
+                !(core->mac[TSYNCTXCTL] & E1000_TSYNCTXCTL_VALID)) {
+                core->mac[TSYNCTXCTL] |= E1000_TSYNCTXCTL_VALID;
+                e1000x_timestamp(core->mac, core->timadj, TXSTMPL, TXSTMPH);
+            }
         } else if ((cmd_type_len & E1000_ADVTXD_DTYP_CTXT) ==
                    E1000_ADVTXD_DTYP_CTXT) {
             /* advanced transmit context descriptor */
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index b88dc9f1f1..808b587a36 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -322,6 +322,9 @@ union e1000_adv_rx_desc {
 /* E1000_EITR_CNT_IGNR is only for 82576 and newer */
 #define E1000_EITR_CNT_IGNR     0x80000000 /* Don't reset counters on write */
 
+#define E1000_TSYNCTXCTL_VALID    0x00000001 /* tx timestamp valid */
+#define E1000_TSYNCTXCTL_ENABLED  0x00000010 /* enable tx timestampping */
+
 /* PCI Express Control */
 #define E1000_GCR_CMPL_TMOUT_MASK       0x0000F000
 #define E1000_GCR_CMPL_TMOUT_10ms       0x00001000
-- 
2.40.0



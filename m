Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F666E22A8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:52:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHoP-0005dl-CD; Fri, 14 Apr 2023 07:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmY-0004C4-OZ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:58 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmW-0001ZC-HU
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:58 -0400
Received: by mail-pj1-x102e.google.com with SMTP id v9so23394746pjk.0
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472394; x=1684064394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e/RxHNbOb4Qup91wLluM6CqwqH0nGru8lBAdIN2L69c=;
 b=yFq5I6pVXcq/8in7IxA2knjaYi83EpL9x5VSMk0UHGX8gwWtPDSES1F974ejZ5cvbp
 hOBdhtpnk9wELP1U7XBA6WeqbzyTRO3GA2tiLWFW5jlj2LGHcYBscGU8bGNS6byrMTp1
 C4T1P6Gew4qG9oqWZxo1Ktw0OmtSBU9zfCyA8TRitgK+gY+WbjkDd6tIEPIl4Pw3JLZu
 29LxW85/TSpdaQp8Au08eKC2vlKy0K70KYVBeE9vlAZ2dYCA5/BISOeUJKDMkwFPYrXk
 2Gy7UlLEEsR4CJIZQnpB5oXfPCjDHxjqhr/oHeZNLX2bp8nHXJaL0S1W9u0c+cJjKyDK
 UkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472394; x=1684064394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e/RxHNbOb4Qup91wLluM6CqwqH0nGru8lBAdIN2L69c=;
 b=J4XP+3jjYuMBUp02Ai+5HAT+jpjiFeFMyK6UmGo0EIgt/R/K08auF0n/N6nbX9tFYs
 MXMjOpnNtHeVaU9coauN0dUj9yt+nSGvvOsrUH+9bo9+VTIrCdYtE9nzqeOZWVEba8Hb
 XYEkczdBnzsMsL7rXCNmft080l5NZFktmRHsi2YcL2NcOUZu1ZJQBDfl9Q02C+bJjMlK
 hN3hT3qlFLWsetCeHcKfwLGhGqjrEhtH9ffzoDMA9FC6YdrCg/h+vlU+hLeZ7rlzt8e5
 vymIuGBrzvQsMZkAKjwEIJ/hsd9MY2wAed/ZnzfY+zMMQt1E4oH5OFrZqYONf2vWiJrW
 lnrw==
X-Gm-Message-State: AAQBX9fKD2WfHhZwX4eBizYeyipI/lS2jqDRw12i1QQMJuPED4ov38Zx
 cxdeYYaLCDK9ES5LztWHZSm6SA==
X-Google-Smtp-Source: AKy350apGDcBJDNIdiHVijnQUQkXCwLL3vwgMAqdIs5o5plQ7aTBpL4x8y3+J2x6IEkiAWNRePThew==
X-Received: by 2002:a17:90a:ea88:b0:247:2c78:df79 with SMTP id
 h8-20020a17090aea8800b002472c78df79mr3581601pjz.35.1681472394237; 
 Fri, 14 Apr 2023 04:39:54 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:54 -0700 (PDT)
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
Subject: [PATCH 29/40] igb: Implement MSI-X single vector mode
Date: Fri, 14 Apr 2023 20:37:26 +0900
Message-Id: <20230414113737.62803-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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
 hw/net/igb_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 429b0ebc03..2013a9a53d 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1870,7 +1870,7 @@ igb_update_interrupt_state(IGBCore *core)
 
     icr = core->mac[ICR] & core->mac[IMS];
 
-    if (msix_enabled(core->owner)) {
+    if (core->mac[GPIE] & E1000_GPIE_MSIX_MODE) {
         if (icr) {
             causes = 0;
             if (icr & E1000_ICR_DRSTA) {
@@ -1905,7 +1905,12 @@ igb_update_interrupt_state(IGBCore *core)
         trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
                                             core->mac[ICR], core->mac[IMS]);
 
-        if (msi_enabled(core->owner)) {
+        if (msix_enabled(core->owner)) {
+            if (icr) {
+                trace_e1000e_irq_msix_notify_vec(0);
+                msix_notify(core->owner, 0);
+            }
+        } else if (msi_enabled(core->owner)) {
             if (icr) {
                 msi_notify(core->owner, 0);
             }
-- 
2.40.0



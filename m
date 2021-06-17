Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D3E3AB349
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:09:05 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqpU-0001XG-P9
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbc-0000hi-PQ
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:44 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqbb-0005bO-7x
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:54:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id c9so6465151wrt.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZIk02rN/B58vn5urmzzUKpoCipYBcMsvK06nQVHHKc=;
 b=Eod+vIGg0cefzbDAOmaG80IrmsQew7M/iFFJFdmySSzwXU1bWnVriMOQI3QCzHjzCp
 sumFcLDTAYycWJgr2DMzEVusqSwefYJkhl1+Lsz8337tfy8Jazr2e2Rqv4pTq/Zrx1+H
 kHmR8Cr+CPASulG7v1izv3dyYZUKrXqzEpUg820lpG+ONIDCY+27lsYueb31OelN9cSs
 0vHJJXeSVv6twpZLDXc2CzOLLqSxCeQl3xXoOZSQ2c+YwXEiWOP/p+S1cwpczedMJEVP
 oPJCoi3zutESkYnN4zQvurI8lwiacEsH2aVzehVMT/tYVFIqBDF+Pu1CEDyGV/h5YNyS
 ZeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xZIk02rN/B58vn5urmzzUKpoCipYBcMsvK06nQVHHKc=;
 b=Lvcfc4cygdY3o66UHkYxQAWWjdvnlsHaZUtzNuvd+/RlJRX0G7GwGaBE2dxKKcP8Y9
 ZwBghIhOiWpz2kxcyrsVNFXYlpNpSv0wzyFzLWTofXdMJxcqj5HXUHe/k6KVXYM6f0ap
 YwGJTGaiFcpG2hk2DG6/mB9PsROQYrixQBGcJ2XwFdGp13BKy8RLYGfTYl9xxL4XIZSf
 M9NYBMwNQWHFm/iZhD2iPNw6ngcmrvTQyEmkoN8ZJ0LMKVkKB8pc1PqyMtBIBuhOlDNn
 gXbQAArLyoUa/q3QDtNE5HXodSPkhBbuci7T7n+msRD/bkVpcat/vw+Zn6aVuK52N7la
 F/xg==
X-Gm-Message-State: AOAM532T3B76bgiklLP864yW6JlWKzXVOXGmrT3v7wzxAvk/uOK8L+mZ
 dxGrANNsg4gqxihQiUoe+gtsl58fWoP0/g==
X-Google-Smtp-Source: ABdhPJzHz030wgO5q/NyLw7VsKK26ZNlHoQRcL27P0GVkSrHAzBdFThYw3FX6sMmf7awBhiqePwbiw==
X-Received: by 2002:a5d:460e:: with SMTP id t14mr5287910wrq.149.1623930881572; 
 Thu, 17 Jun 2021 04:54:41 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p11sm5131344wrx.85.2021.06.17.04.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:54:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 14/15] hw/i2c: Extract i2c_do_start_transfer() from
 i2c_start_transfer()
Date: Thu, 17 Jun 2021 13:53:33 +0200
Message-Id: <20210617115334.2761573-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow further simplications, extract i2c_do_start_transfer()
from i2c_start_transfer(). This is mostly the same function,
but the former is static and takes an enum argument.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i2c/core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/core.c b/hw/i2c/core.c
index 6639ca8c2e0..5483bf95a3e 100644
--- a/hw/i2c/core.c
+++ b/hw/i2c/core.c
@@ -114,8 +114,11 @@ bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
  * protocol uses a start transfer to switch from write to read mode
  * without releasing the bus.  If that fails, the bus is still
  * in a transaction.
+ *
+ * @event must be I2C_START_RECV or I2C_START_SEND.
  */
-int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
+static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
+                                 enum i2c_event event)
 {
     I2CSlaveClass *sc;
     I2CNode *node;
@@ -157,7 +160,7 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
 
         if (sc->event) {
             trace_i2c_event("start", s->address);
-            rv = sc->event(s, is_recv ? I2C_START_RECV : I2C_START_SEND);
+            rv = sc->event(s, event);
             if (rv && !bus->broadcast) {
                 if (bus_scanned) {
                     /* First call, terminate the transfer. */
@@ -170,6 +173,13 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
     return 0;
 }
 
+int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
+{
+    return i2c_do_start_transfer(bus, address, is_recv
+                                               ? I2C_START_RECV
+                                               : I2C_START_SEND);
+}
+
 void i2c_end_transfer(I2CBus *bus)
 {
     I2CSlaveClass *sc;
-- 
2.31.1



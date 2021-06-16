Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6473AA122
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:20:26 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYHB-0002c8-TZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBz-0003GM-28; Wed, 16 Jun 2021 12:15:03 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:44775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltYBx-000647-BW; Wed, 16 Jun 2021 12:15:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id f2so3302979wri.11;
 Wed, 16 Jun 2021 09:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YnpC7skv5DHlC3FSHAcwV7gYnTT6SGeWYmONsyLMX7o=;
 b=U5uFFXrmFtFFjMKEeqShBc9WfToviVZLjgbgBoqIyAGpSlHZtRpiLMM0iriDBgFQzt
 cMwMdXSVbmzdk8RWge+lRqdkdeN4lpe0fhEdEEDgxhy/lsayVCH2EyziNR9A0rZR38T4
 HLSia8GhrZKIfV5+UfIJ18ByCxZSd4SWWjcyYheDahNBk1uN4ISgi+jGLOxprQGD8nSq
 kQXS5gWU7HWwbhYSyzDtmGLuXujf2u0VHOqoefpKO3vbNi5QQIXTw3QxmzTZobL/X126
 cxUfk/zkEMnaAwnoheu1x358yyyBjv+twwjyhy8Gq2AnFe08hTvnAXoJ9i6xTIsl8NE5
 vyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YnpC7skv5DHlC3FSHAcwV7gYnTT6SGeWYmONsyLMX7o=;
 b=t8viu87pYayVm3CgCGpGNekrHjHtkTuUkzYKc2dSn/eQd7XwiI0t6cMYMh861CLBwz
 cTu1/lXeu4moaLBWSfWUd8bNS7ZwwvRm5nkaNAbxmcXqqI29GeJlzhQ7PtZq5aPK8UpG
 mQXhpeMSKa9ziKTkCGIIJkNHRjcWxOmruObbU0sEMkxwFbpGFxevxp6B8tilhqFQ95Z4
 cp0XKrNVDDYMPQF2Ik1OwcmeCc4vCqqaT0ZgTXV6Fm4oFNaxEbmDrRkI8tmruWxx9tyY
 i7ZcQ0/P1rWdtCCzXqihJHdCjC52XEMFxvVhru+PELSiEXJ8V88IoP6IuqdDLTpJ7CYR
 ljSw==
X-Gm-Message-State: AOAM531BQdkX03HhKijEcpEem6OoEYGxqXb6YGWXZG4+wDHvEudGx3FO
 z6sJeNa1Rvz4Pf4y0VV/l4BwooBisCI/cA==
X-Google-Smtp-Source: ABdhPJyCuvQerzDa/gdwo6sxV9DH8UybXciVgOuTuI/Fyc6mpfF0UiFmhZfn4TG7F6tPw1ux3Tdwbg==
X-Received: by 2002:adf:f648:: with SMTP id x8mr200267wrp.215.1623860099030;
 Wed, 16 Jun 2021 09:14:59 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t4sm2632791wru.53.2021.06.16.09.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:14:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT
 cases
Date: Wed, 16 Jun 2021 18:14:13 +0200
Message-Id: <20210616161418.2514095-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To allow further simplifications in the following commits,
start copying WRITE_I2C code to the READ_I2C, and READ_I2C_MOT
to WRITE_I2C_MOT. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/auxbus.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 148b070ce4a..9cc9cf3be32 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -133,6 +133,26 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      * Classic I2C transactions..
      */
     case READ_I2C:
+        is_write = cmd == READ_I2C ? false : true;
+        if (i2c_bus_busy(i2c_bus)) {
+            i2c_end_transfer(i2c_bus);
+        }
+
+        if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+            ret = AUX_I2C_NACK;
+            break;
+        }
+
+        ret = AUX_I2C_ACK;
+        while (len > 0) {
+            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+                ret = AUX_I2C_NACK;
+                break;
+            }
+            len--;
+        }
+        i2c_end_transfer(i2c_bus);
+        break;
     case WRITE_I2C:
         is_write = cmd == READ_I2C ? false : true;
         if (i2c_bus_busy(i2c_bus)) {
@@ -163,6 +183,39 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
      *  - We changed the address.
      */
     case WRITE_I2C_MOT:
+        is_write = cmd == READ_I2C_MOT ? false : true;
+        ret = AUX_I2C_NACK;
+        if (!i2c_bus_busy(i2c_bus)) {
+            /*
+             * No transactions started..
+             */
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+                break;
+            }
+        } else if ((address != bus->last_i2c_address) ||
+                   (bus->last_transaction != cmd)) {
+            /*
+             * Transaction started but we need to restart..
+             */
+            i2c_end_transfer(i2c_bus);
+            if (i2c_start_transfer(i2c_bus, address, !is_write)) {
+                break;
+            }
+        }
+
+        bus->last_transaction = cmd;
+        bus->last_i2c_address = address;
+        while (len > 0) {
+            if (i2c_send_recv(i2c_bus, data++, is_write) < 0) {
+                i2c_end_transfer(i2c_bus);
+                break;
+            }
+            len--;
+        }
+        if (len == 0) {
+            ret = AUX_I2C_ACK;
+        }
+        break;
     case READ_I2C_MOT:
         is_write = cmd == READ_I2C_MOT ? false : true;
         ret = AUX_I2C_NACK;
-- 
2.31.1



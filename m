Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1569D045
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:06:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7kN-0002UG-NV; Mon, 20 Feb 2023 10:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7k0-00024M-J5
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:06:11 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jy-0008VO-DZ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:06:08 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t13so1467229wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qkM29ZYnS80tOuTl6ndvH0Cr2j3m8kabXDaXkwn7EWs=;
 b=xV0y1/nXiJXWfsgXH359JNNC1H61ZrNTma9hfWvppEhSx3TrrIB3NA+T0u0DfoJq9Q
 wTxmtTBiXERCPC1cX0rj3CenoO2V11GEtWpN61Rfo9XAJFJk+LVRKmFNHJMHn2ZyT+1C
 PiMoEFzMV6/aH7vM27DCiMxLjBcjBXSoKQSJ6LBSS3W0ke2jl6dffJOM8khHiF1WWorK
 VVAV7Iq8r+9aMaCGG50aWJByqYd3xtRT21FVC9A6lLt6vQ3R/mtOx5zrp0jn6WRhAvhJ
 tXqCfklNEydlZQjVHVHP/o1BSgy3ENXSN1SfNtJJuFLiUo6Zx5ya1LNu5CzjWKOFEh4t
 mmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkM29ZYnS80tOuTl6ndvH0Cr2j3m8kabXDaXkwn7EWs=;
 b=uoUlw4orzE3Fbg/1WgSCCAV0qWcoPjlEhYMsILhKGPLcPQtlrnZYAoH2rTbCG1nD9A
 UDdlpHWnaC+GLHo8FA6ff7Dmz77axT7+6SlMGTu4JeJJwwka7jEjtqjUwC6DL8VNAJU0
 K8VNLoNvAkxD/Yhgjnb29XBPwuPzrmThUxphM5CO0m/B1UwFZwyc/Cl8+CUF/sjOWPhe
 Ke6kVbKdGdEqTXgaOuCfX6UzlxVKX1TaZmAg9T1a8IVqKpBl/07U38sOjCaMrGKUk1Cy
 MEvKzyIsQXxGSYyY2Gbkk13T8TL0hYNrWLpolBMIKEfXKQpGCBmkVXfCop8v/fzd7w9o
 FLmA==
X-Gm-Message-State: AO0yUKWGDVlHwv34ocMY3DPdd/QsqwZA3surMw5Bv63yoPLKL8P0UlBr
 Q7SZGdsd65tE6F/CutDWKiQ7odzbyGQetluD
X-Google-Smtp-Source: AK7set+ZQetSGsq8kf85jT4wjshhQOk6OFSxAKh4s69hJtKvpOlaO0KxjTOCUha+vSv6CreEQih36w==
X-Received: by 2002:a5d:4610:0:b0:2c5:98f2:5b16 with SMTP id
 t16-20020a5d4610000000b002c598f25b16mr3257738wrq.1.1676905562416; 
 Mon, 20 Feb 2023 07:06:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfce09000000b002c5493a17efsm12617632wrn.25.2023.02.20.07.06.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:06:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 9/9] hw/usb/u2f-passthru: Use QOM type-safe cast conversion
 macros
Date: Mon, 20 Feb 2023 16:05:15 +0100
Message-Id: <20230220150515.32549-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Use the QOM cast macros to avoid accessing internal fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/u2f-passthru.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/usb/u2f-passthru.c b/hw/usb/u2f-passthru.c
index fc93429c9c..b99c0b622f 100644
--- a/hw/usb/u2f-passthru.c
+++ b/hw/usb/u2f-passthru.c
@@ -299,7 +299,7 @@ static void u2f_passthru_recv_from_host(U2FPassthruState *key,
     if (transaction->resp_size >= transaction->resp_bcnt) {
         u2f_transaction_close(key, cid);
     }
-    u2f_send_to_guest(&key->base, packet);
+    u2f_send_to_guest(U2F_KEY(key), packet);
 }
 
 static void u2f_passthru_read(void *opaque)
@@ -316,9 +316,10 @@ static void u2f_passthru_read(void *opaque)
 
     ret = read(key->hidraw_fd, packet, sizeof(packet));
     if (ret < 0) {
+        USBDevice *udev = USB_DEVICE(key);
         /* Detach */
-        if (base->dev.attached) {
-            usb_device_detach(&base->dev);
+        if (udev->attached) {
+            usb_device_detach(udev);
             u2f_passthru_reset(key);
         }
         return;
-- 
2.38.1



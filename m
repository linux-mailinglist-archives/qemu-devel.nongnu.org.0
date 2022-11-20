Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BDD631491
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 15:02:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owksW-0001M5-P8; Sun, 20 Nov 2022 09:01:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1owksU-0001Ld-Hr
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 09:00:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kfir@daynix.com>) id 1owksS-0003z1-TR
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 09:00:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso11015111wme.5
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 06:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fXr2yIflE9cM49dRguvSTfU6A0v+R6OEUzqbThGVfWk=;
 b=Kwg2YLrfhTxtzg4pKlnEp6s1bIiAMG737eK6Y6MP1c+tanfTw4t2bAP2Elb5ufo1qH
 vO0i+z4PFGnJmmGfA0h5IJfShs2Rn/h1yntugouMaBB9r0siCRLjcYTWkKdLZDy0UHOG
 92xStgDN0HxhHREta1IJbnPdhUc7wfuX8RZHl/ubG7PEY/a098NVNnX41y9O72lat9E2
 lOtgg1/aDxVZ78QdtnR21abGzf9+9a5sw3YOaduLny4hvo7qDy96O1ezxusKcHy4B71+
 /RXYkf2nR8b+4sDwtGUEkZT6SUSGsgvaQtt4LV67pVmLZ7odMMJjNpS+zRpnn4KJJoER
 1rkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fXr2yIflE9cM49dRguvSTfU6A0v+R6OEUzqbThGVfWk=;
 b=s4kagjIl9IAwYv/YlWpZ8IAs23JpqCeqpMgU8KIP1LlBHl8WlW/idIieBx4IELVshi
 CFSEZVsQARQByTtQ6k1Cb2WNHS4jP0VXfmBPmQwXMoj74241znxwejI0m1shbRJY92ej
 KRoRh5jV233NYYabyBGRW4t3v4B0XlkvWWAeXsTJTH4HoKOVqLOO9IMm1Oo4hAcPdyuI
 KW4aWtIrtNYFW+FFRcSlrS30ESgVHE7xaObCu21qsHeLHUQmnorePRQ+Gz3igMI9AW9A
 euuHnkNs4Sd3hG2jYjgNTvqRuXYXvz4i5AB9syqv+vj3x87kRncq+uflQ4PsHiyHRauM
 fwOA==
X-Gm-Message-State: ANoB5plrDEGuQVGaAQtLW+Cu9lXeRy5XaHyZIfp8JHW1xA1g2qkmtfAS
 b2bhrrYxZhvHTWW20HWAGJmw+8XP0QnFEA==
X-Google-Smtp-Source: AA0mqf7R/MCzOZRYZM/gW5SlexZqF1HyhdQo30vYOWXckOzlon3jUF76KGjIb4Y8ihIRyC/7GmG3VA==
X-Received: by 2002:a05:600c:42d2:b0:3cf:c907:a05a with SMTP id
 j18-20020a05600c42d200b003cfc907a05amr13152864wme.177.1668952854274; 
 Sun, 20 Nov 2022 06:00:54 -0800 (PST)
Received: from bark.. (bzq-84-110-34-91.static-ip.bezeqint.net. [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id
 d5-20020adffbc5000000b002417e7f0685sm10432310wrs.9.2022.11.20.06.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 06:00:53 -0800 (PST)
From: Kfir Manor <kfir@daynix.com>
To: qemu-devel@nongnu.org, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Cc: Yan Vugenfirer <yan@daynix.com>
Subject: [PATCH 2/2] qga:/qga-win: skip getting pci info for USB disks
Date: Sun, 20 Nov 2022 16:00:44 +0200
Message-Id: <20221120140044.752503-3-kfir@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120140044.752503-1-kfir@daynix.com>
References: <20221120140044.752503-1-kfir@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::332;
 envelope-from=kfir@daynix.com; helo=mail-wm1-x332.google.com
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

Skip getting PCI info from disks type USB and give them an empty PCI address instead.

Signed-off-by: Kfir Manor <kfir@daynix.com>
---
 qga/commands-win32.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index a645480496..14c43b3de5 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -878,10 +878,14 @@ static void get_single_disk_info(int disk_number,
      * if that doesn't hold since that suggests some other unexpected
      * breakage
      */
-    disk->pci_controller = get_pci_info(disk_number, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        goto err_close;
+    if (disk->bus_type == GUEST_DISK_BUS_TYPE_USB) {
+        disk->pci_controller = get_empty_pci_address();
+    } else {
+        disk->pci_controller = get_pci_info(disk_number, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            goto err_close;
+        }
     }
     if (disk->bus_type == GUEST_DISK_BUS_TYPE_SCSI
             || disk->bus_type == GUEST_DISK_BUS_TYPE_IDE
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F301FB50F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:54:14 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCyb-0000tB-5T
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQd-0003XX-6A; Tue, 16 Jun 2020 10:19:11 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQb-0006xa-ME; Tue, 16 Jun 2020 10:19:06 -0400
Received: by mail-oi1-x241.google.com with SMTP id a3so19413326oid.4;
 Tue, 16 Jun 2020 07:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V65H2WdSRAK88T/KlWVxHCbmRYaYQ8jXFvHNXk1Yflo=;
 b=IqK+GgBfugP2I9f499pW7yQGZ38XltjSJqKnyK0ifqook8dGH8YYUIbyM+8QQUE+WB
 6Agzebnwjg91MF63/sugbUc5CBG786oAco60IXZ1SqRobpuhTWtSYCYfP2vBILR0hmTr
 XxLGOFVcwbg861dcTrEtjuyZGTVS3IlUuABrKPwU8ZOA3525TQ32BNH7dSQVwO7MZvzu
 Q+l269QzLYnwl3Jw2Asbm4nVXNe5kGmP3XsIdLkHq5W2Nuvr8tP6+l8EmKPd5JBm/UJY
 Ra6av29Vss5ayTejvw1aIyFg6MQBbQzAfsCYsYKthjGIz5JlmJsaZExX1k6KkPho0XAQ
 Yacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V65H2WdSRAK88T/KlWVxHCbmRYaYQ8jXFvHNXk1Yflo=;
 b=ZtzBPt5Iu4JtJjd7iz3kJreSdwXsiIiXfqAtkbdT8vMxLJ8olvW/0UPfwA5WzzGasL
 p26ZIaFrJtyGdNd2N8b5wHJhtFIk/8GL0bV+oE95xd6hqsIfmrXOOtm+6LMlxoVueiXQ
 KTXm054AJOPi2eEKG2nywR/XeyaTdybQb/JlKYSk1TeZKyBgdye/4n/kTSUvSEKTeYvh
 CS8AacBD5pLAnB6+RZ1/R7sHqnpQ1ZBvnMM3d1Zvy1vkIFIYFP5AGuYJZSjja5ZaX9b3
 xrQ4PrYOg/BxeqOvow80COTYU4RFtPfDDl/BDz5/N9JCnTACupK98rVJD6gCYVwsRm2s
 HTBg==
X-Gm-Message-State: AOAM530ImqTk+kSJwNs7WTbAmZXpdUGbrKsey58Pksm39nbqbs9e5VXO
 mjOWmwheT7wiLgN7gt5YUC73HqQx
X-Google-Smtp-Source: ABdhPJxXvPvCpe6jZK/n7n+7m6vnoY7vO9GPDffgmQ7b8YPZxKIj3ZeyyCDufiUf3GjJbnZlh4COuQ==
X-Received: by 2002:aca:ad88:: with SMTP id w130mr3664364oie.103.1592317141901; 
 Tue, 16 Jun 2020 07:19:01 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id g2sm2963099oou.0.2020.06.16.07.19.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:00 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 57/78] compat: disable edid on correct virtio-gpu device
Date: Tue, 16 Jun 2020 09:15:26 -0500
Message-Id: <20200616141547.24664-58-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

Commit bb15791166c1 ("compat: disable edid on virtio-gpu base
device") tried to disable 'edid' on the virtio-gpu base device.
However, that device is not 'virtio-gpu', but 'virtio-gpu-device'.
Fix it.

Fixes: bb15791166c1 ("compat: disable edid on virtio-gpu base device")
Reported-by: Lukáš Doktor <ldoktor@redhat.com>
Tested-by: Lukáš Doktor <ldoktor@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Message-id: 20200318093919.24942-1-cohuck@redhat.com
Cc: qemu-stable@nongnu.org
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
(cherry picked from commit 02501fc39381c4dabaf6becdd12c2a4754c3847c)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index aa63231f31..1872263bf0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -37,7 +37,7 @@ GlobalProperty hw_compat_4_0[] = {
     { "secondary-vga",  "edid", "false" },
     { "bochs-display",  "edid", "false" },
     { "virtio-vga",     "edid", "false" },
-    { "virtio-gpu",     "edid", "false" },
+    { "virtio-gpu-device", "edid", "false" },
     { "virtio-device", "use-started", "false" },
     { "virtio-balloon-device", "qemu-4-0-config-size", "true" },
     { "pl031", "migrate-tick-offset", "false" },
-- 
2.17.1



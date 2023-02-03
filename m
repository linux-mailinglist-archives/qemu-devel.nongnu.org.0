Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17A968A156
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Vt-0007yJ-UK; Fri, 03 Feb 2023 13:10:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Va-0007kc-8i
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:59 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0VW-0008GN-H9
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:56 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso4506401wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
 b=m1WjmgwMPOsNtLA5YA0t19cIA3HGnEQVECoOhLU6AGpzzoZQbcGqpC0JvenMkr52s3
 +nXpucNnq828lAZTK+n3yA3GMjt4hoBXVPrlEm8NOds3KrxM6x63NJxhDptUlqTEof2H
 5Pv9svm6Qdyjxjr7FFrxZ1nUGGg6V2EOysUSqxPFc+SlY3JDuIsbW9K0ftIHSjOWo2Aj
 rAQv87SvACTrrEY82Ch7p3q9Dij2pnj6OQfJAUI0Wyo4cV9hc/bCA3j25ofvY9GVqEDV
 m375OaiEzlgiKCsxl/n5c5MDU5+Tc9HIYlEZ9iH8QtFK3YcukSCoVH5tWdwmnCyVnyar
 nezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HN76CBKBfX1G0l+y+g6vAhVD6/TboUIvvYwPXW3Iexo=;
 b=CFdS5j7GjiAPPul47O2tQSpVDPIbFSzStr+vzT3998aniwZ7y3W8wxKL5+sn47g2Ib
 P4qiuwXbXyG2foXXr0M7dq7FCE1kx7A4pQ7jaaooMzkUZcvXqj3Df0axrckLvigFU7KU
 W6WZa5lYcMpYfFAA72bz4ELr8YnVfT2hZrxUmcD7sVngm0ivRTEdUt9zmt/r3HNVphM+
 prJd5+sYHlame2+zKn46KGHOedtsBi94DHrhJwEaY5Dj9EGONk2T/JtmQHpqRtyXzlu7
 F6SDT2vQ0Q15djwVCPki0TN0txsti03CR8SI/EzRpWmnCMN4D8HWECfH/M0DUuIH1CM7
 L8dg==
X-Gm-Message-State: AO0yUKUwefJlQDacl45WK8EXypjo7ENyxGM2ipsYbhx9qYKOA3fihJF8
 iPB9FyLZY5ha8hBpPNEr/MMP0ieHKXx4c36I
X-Google-Smtp-Source: AK7set9ZxRRFo1CGOLjJgso2lFux2GQWoL4HdyvxVNVLGANu3XJ/bTjpWeRz06io18MYKc5dhIxKLg==
X-Received: by 2002:a1c:f307:0:b0:3dc:50be:9206 with SMTP id
 q7-20020a1cf307000000b003dc50be9206mr11541740wmq.4.1675447792935; 
 Fri, 03 Feb 2023 10:09:52 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x9-20020a5d4449000000b002c3cf230b60sm2184162wrr.73.2023.02.03.10.09.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [RFC PATCH 07/19] hw/scsi: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:02 +0100
Message-Id: <20230203180914.49112-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/scsi-bus.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ceceafb2cd..a8003126c4 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -347,11 +347,7 @@ SCSIDevice *scsi_bus_legacy_add_drive(SCSIBus *bus, BlockBackend *blk,
         object_unparent(OBJECT(dev));
         return NULL;
     }
-    if (!object_property_set_bool(OBJECT(dev), "share-rw", share_rw, errp)) {
-        object_unparent(OBJECT(dev));
-        return NULL;
-    }
-
+    qdev_prop_set_bit(dev, "share-rw", share_rw);
     qdev_prop_set_enum(dev, "rerror", rerror);
     qdev_prop_set_enum(dev, "werror", werror);
 
-- 
2.38.1



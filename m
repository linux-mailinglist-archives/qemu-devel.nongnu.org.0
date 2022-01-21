Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C549665F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 21:36:40 +0100 (CET)
Received: from localhost ([::1]:57180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB0eF-0007vp-Iw
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 15:36:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB0Z1-0005Pa-4L
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:15 -0500
Received: from [2607:f8b0:4864:20::c30] (port=35683
 helo=mail-oo1-xc30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nB0Yl-00036N-V2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:31:14 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 p4-20020a4a8e84000000b002e598a51d60so353743ook.2
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 12:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=45sOJG5NRyboqAdKNRFrVL0uJSO9Dgn0h/Fh85ePAmk=;
 b=oQYZmxxTwa925icorEtVk67JlZQZsyN7cXl+IgITtD4HUkoT+BJuJhenxPU4RBV72D
 sFH6YLjB8qaVg3n0L12my/z4Jg3+JPj2XRD1fDbdSAJ2d/M9xUVw5dhmzQJxHMEo4PTs
 JACrPad63LLtHgTHUX7F6PBOFWCK2y/HSh3jft0jotyyqCiJSr+v7b+oNI3cScqh+ppz
 +7H7iS7B2WnuyJd4P20dKQAAGn284ledMCAk2EE8+7P5lmHlD8Y1T2nbsYlugpp9hpxd
 8jd0aR6tlMjF2J4+4fkwU9mONc1W3FNL33U5y0BrG0oKv9cnDfzaKiISFihdv/kFlHb1
 Nlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=45sOJG5NRyboqAdKNRFrVL0uJSO9Dgn0h/Fh85ePAmk=;
 b=hUnZMulA1Kxegnq+GhprH8B8CdjuMV5QG8MANQglh8TFni/RedxNUOOrxhMpuzcJG4
 qMAGkh7rbzn5tjKsq8Zy3786vtQjSfEzwXh7fvKnJDT9Z/dk6sL4nImhJJEsKDDdye6X
 cWlISLlHqCkhmiydjvwV29ePmQkdiBsPEs5gdGUk8IlHoKGMBF9Q2ECQDX/PBpZ6Ggdi
 slDW8+z0ooaaDpiAwT/aw7mG9seDu5rcEBqsf1bGcYbKqv/KPZe5eCX+EAjLEG/xQy4B
 kjd4LAGRn38RmCjws+4EGtu3ytTUSrl6ncoTKB3OO2c8EEJqr2R4ocaFAVYoDJ3kCkZx
 iTIQ==
X-Gm-Message-State: AOAM532ABi2c4NIsO36s+9diwx58Ntr4l5tegiWloQzE9oIproUBwFkZ
 jcxYpn/WLOMA2UsO0OGwKgxyhkxZMd4=
X-Google-Smtp-Source: ABdhPJwiTZIaih/2n3SBfkYZ7jGc+4f3jbTjndUSy7qmX0HCsH69K0TX5G/UVv92EWP1jP0iHGUmoQ==
X-Received: by 2002:a4a:ad05:: with SMTP id r5mr3672783oon.40.1642797009062;
 Fri, 21 Jan 2022 12:30:09 -0800 (PST)
Received: from rekt.ibmuc.com ([191.8.61.226])
 by smtp.gmail.com with ESMTPSA id ay14sm1908822oib.5.2022.01.21.12.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 12:30:08 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/core/fw-path-provider: turn
 fw_path_provider_get_dev_path() static
Date: Fri, 21 Jan 2022 17:29:51 -0300
Message-Id: <20220121202952.24763-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121202952.24763-1-danielhb413@gmail.com>
References: <20220121202952.24763-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, pbonzini@redhat.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is used only by fw_path_provider_try_get_dev_path() in the
same file.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/core/fw-path-provider.c    | 4 ++--
 include/hw/fw-path-provider.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/core/fw-path-provider.c b/hw/core/fw-path-provider.c
index 4840faefd1..4bcf4e7e34 100644
--- a/hw/core/fw-path-provider.c
+++ b/hw/core/fw-path-provider.c
@@ -19,8 +19,8 @@
 #include "hw/fw-path-provider.h"
 #include "qemu/module.h"
 
-char *fw_path_provider_get_dev_path(FWPathProvider *p, BusState *bus,
-                                    DeviceState *dev)
+static char *fw_path_provider_get_dev_path(FWPathProvider *p, BusState *bus,
+                                           DeviceState *dev)
 {
     FWPathProviderClass *k = FW_PATH_PROVIDER_GET_CLASS(p);
 
diff --git a/include/hw/fw-path-provider.h b/include/hw/fw-path-provider.h
index 8e1d45651c..9ef50ebe4a 100644
--- a/include/hw/fw-path-provider.h
+++ b/include/hw/fw-path-provider.h
@@ -36,8 +36,6 @@ struct FWPathProviderClass {
     char *(*get_dev_path)(FWPathProvider *p, BusState *bus, DeviceState *dev);
 };
 
-char *fw_path_provider_get_dev_path(FWPathProvider *p, BusState *bus,
-                                    DeviceState *dev);
 char *fw_path_provider_try_get_dev_path(Object *o, BusState *bus,
                                         DeviceState *dev);
 
-- 
2.34.1



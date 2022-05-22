Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E135305E8
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 22:46:13 +0200 (CEST)
Received: from localhost ([::1]:49306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nssSq-0006yN-JF
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 16:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssQy-0004b1-W6; Sun, 22 May 2022 16:44:17 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssQx-0008Px-DY; Sun, 22 May 2022 16:44:16 -0400
Received: by mail-ej1-x635.google.com with SMTP id f21so11261517ejh.11;
 Sun, 22 May 2022 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ylCjogea0jWtmYCFYepyEfou1aCUj4CqclhqM1wzag4=;
 b=j2g63YMuiS8gamKqquXjWGnOM8lYoMD50H7b6wR6enqmly5dtJajQSGoMbkaf9XA5N
 kkSDDr+ObiDk2EYpytn1sEd5GS/DhKOFyZb1JVd1wKtR64nz6LjJrH8/7FJPPQ4v27yT
 8gOnRUlFn2F13tOUbGRj4F7ZkQNv7GAJjuIM/ii+5DbzevLcyqa8KtiKJa2NOdhW848z
 /9B4kypJEKXyfoQZzs0N36R5xvBgFFfVMXqdEvqfUqYerkR2edGPVyNVWO2L8AV9spAv
 K+3PzHZq42Fuda8AZJSRdAAOvW9zINO9YGJ1RWjq2QFc3JQyU5+CnHrOw2mFlT3+/3LM
 prhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylCjogea0jWtmYCFYepyEfou1aCUj4CqclhqM1wzag4=;
 b=StpQTk0XNCktlXIpcF5cQyDsCVEym1Lz1Qw0/v1v7cmR0rfHzfaLMNnimt3sfcsVwo
 iZgRKhuKMlpW/yEiaE5VzsLiK3nrUD+bU+SaCjBbRtDncTvKAnwaNVEjXswxOmlTVo6P
 58HIS4eFyiYItXp+xRTr5/zczBbSOEt63N7bDoyHtJDPiZeMA0TGawpqB5ZjwEHBal21
 3VxvDRHWJ9fYE4eU3eYizMAdDqmE4k53Mw9pa2mwwjlZ8DYNS9cqHubvMrke+tT47NyU
 QiZfETbWcDYz05+ttHnISfNcy5pYksrRgoY2uQT3RR9HQIPxCtEDdl+2bSuttcmxHng8
 QWPA==
X-Gm-Message-State: AOAM532aarUWyVjIJWCrtialbRvLXsBL9nU+8e2VM9dweCkI5n/nXX4l
 RKBNOwTJS1ee0ezt3aPRfKF2a8SMLjA=
X-Google-Smtp-Source: ABdhPJzYxfOK8xQfYCqcgX3nFpSbUlIPlv0zbQzLp3rsNhmmC9pmrcGY1eGAyyYeAzae3DycEKulEQ==
X-Received: by 2002:a17:907:971b:b0:6fe:c0f8:457a with SMTP id
 jg27-20020a170907971b00b006fec0f8457amr6091801ejc.760.1653252253573; 
 Sun, 22 May 2022 13:44:13 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1709063f4800b006f4c82c2b12sm5533968ejj.19.2022.05.22.13.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 13:44:13 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 1/3] hw/i386/microvm-dt: Force explicit failure if
 retrieving QOM property fails
Date: Sun, 22 May 2022 22:43:45 +0200
Message-Id: <20220522204347.10438-2-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522204347.10438-1-shentey@gmail.com>
References: <20220522204347.10438-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New code will be added where this is best practice. So update existing code
as well.
---
 hw/i386/microvm-dt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 9c3c4995b4..fde74819f2 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -32,6 +32,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
+#include "qapi/error.h"
 #include "sysemu/device_tree.h"
 #include "hw/char/serial.h"
 #include "hw/i386/fw_cfg.h"
@@ -187,8 +188,8 @@ static void dt_add_ioapic(MicrovmMachineState *mms, SysBusDevice *dev)
 static void dt_add_isa_serial(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "ns16550";
-    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", NULL);
-    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);
+    uint32_t irq = object_property_get_int(OBJECT(dev), "irq", &error_fatal);
+    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", &error_fatal);
     hwaddr size = 8;
     char *nodename;
 
-- 
2.36.1



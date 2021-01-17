Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B14582F94ED
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 20:36:39 +0100 (CET)
Received: from localhost ([::1]:37886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Dqo-0000Jc-Lr
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 14:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg9-0007ra-8q; Sun, 17 Jan 2021 14:25:39 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l1Dg7-0005F3-Iz; Sun, 17 Jan 2021 14:25:36 -0500
Received: by mail-wm1-x334.google.com with SMTP id m187so5480459wme.2;
 Sun, 17 Jan 2021 11:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gddpL1/dTBK1hhWCBYVWNUJWRgr6oC/oPS+FjqFdg/8=;
 b=MEj8ltNQAsGz6HhkTJgapNBfe0IqX1RUk87fpo+4ZlDjM4zgtCwgkEp9nUF+pxxhY5
 sbyps4aVG5XlxrBzXquYrG2TR2iiSM/PNhQkbTXhFF5W3NawOAc/6X5Be2TNMXrnKtNk
 QX5ZXm/JIPt+jd5VS/tC8RnG0RWuxJ9lh64ISrq5awvS34PUSg/uElvpNEVBJmjlhEdg
 sX2E+eYmia7cJDGxZSYaeKK/cFW+qVUgVfEpK9X9ZlVXG1WEwTd457arKjZpJNcyEoxf
 kYHOJmt554sLczGB2utJUktB12+lAFG5uYhb/oksuibma+K8nJyjTR4Jw+oWWbgiq5Ts
 u/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gddpL1/dTBK1hhWCBYVWNUJWRgr6oC/oPS+FjqFdg/8=;
 b=EfJl9tznZJeNSaWXRQGePu5mTSLX+nSspYiUi2/i1z6iuT9T/SoOK3ccHl7XVXCLEN
 UuQWLwc4XhqKK18QumRG49s7Q0Iii0Qckm+tRfJBRv+MZEDGPGxFbGeJ+TZDmumEAoyD
 G3FxWcQrHO5hhRVqmdTEcOoz630rKoLxlX3D4twVfd0gcqqLJqzwOmAump4TEadWu0YB
 AhpXtY7btcLN7IQpu2+LhJRC5XR1z2hhrJW3Ty6SE5n6dCPBdDrCabcRWrS08/9BlV5n
 sMTjXKfPpjO9dEKA4KYY8+zQOWjFXncav0J7fa0KUbW8jUhgevSQ+OptLQZw0WtDicTm
 Sp9Q==
X-Gm-Message-State: AOAM5328r8Gjs/8BHjrQ241aaWDidtebeJVSjPyHexv81aM8rc5vLJ4X
 dsGg3onsgYV8+hCniM9UIAI=
X-Google-Smtp-Source: ABdhPJxPlULh+KbAeGjEMtbR6PISEiUMYiKcem1wR8wu4GDx4AmpPY28PzPGjyFikBnjS0d0AvzZzQ==
X-Received: by 2002:a05:600c:2a47:: with SMTP id
 x7mr15892217wme.145.1610911533975; 
 Sun, 17 Jan 2021 11:25:33 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z63sm22476855wme.8.2021.01.17.11.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 11:25:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH v2 08/20] hw/cpu/a9mpcore: Mark the device with no
 migratable fields
Date: Sun, 17 Jan 2021 20:24:34 +0100
Message-Id: <20210117192446.23753-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117192446.23753-1-f4bug@amsat.org>
References: <20210117192446.23753-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device doesn't have fields to migrate. Be explicit
by using vmstate_qdev_no_state_to_migrate.

Add a more descriptive comment to keep a clear separation
between static property vs runtime changeable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/cpu/a9mpcore.h | 3 ++-
 hw/cpu/a9mpcore.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/cpu/a9mpcore.h b/include/hw/cpu/a9mpcore.h
index e0396ab6af7..234ac13be2c 100644
--- a/include/hw/cpu/a9mpcore.h
+++ b/include/hw/cpu/a9mpcore.h
@@ -25,10 +25,11 @@ struct A9MPPrivState {
     SysBusDevice parent_obj;
     /*< public >*/
 
+    /* Properties */
     uint32_t num_cpu;
-    MemoryRegion container;
     uint32_t num_irq;
 
+    MemoryRegion container;
     A9SCUState scu;
     GICState gic;
     A9GTimerState gtimer;
diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index d03f57e579b..2e1d2d46b5b 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -175,6 +175,7 @@ static void a9mp_priv_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->realize = a9mp_priv_realize;
+    dc->vmsd = vmstate_qdev_no_state_to_migrate;
     device_class_set_props(dc, a9mp_priv_properties);
 }
 
-- 
2.26.2



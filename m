Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C533B735C
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:40:44 +0200 (CEST)
Received: from localhost ([::1]:46996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDyj-0003Ih-VU
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lyDwj-0001iL-Pq
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:38:37 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1lyDwh-0003TQ-3G
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 09:38:37 -0400
Received: by mail-lj1-x22f.google.com with SMTP id f13so31151411ljp.10
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 06:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6WRkFi/q2R4P5DyHa1JaAhoHY3UvtMt9aEPs/MjG0T4=;
 b=Xc2YxPuQriIm7XXYxxFYuZqfIA1nEzRolzLIXxxazd2D84HDXxBZ7qMwfPpZ7+zv9G
 wztrpnpwzGESI/KyZF6sxIBG4+Oni/MlUTjuLkfEKpt2VDuuiEDBw/3VskzohkpttQ90
 IXeYXTd+m8Ecjial8rOpDK42ks1fkPsr41Yu3hbmQf7EUrZWI+USnv5BTOxWIoowwHUZ
 i9THERb1mLs+IyfctBzQJBP5ZRfaqq5sZCp24Ij6rkFYqSBiRo+Ne3svqSTHJ+cL1/6o
 nz88rWNFzQZZd8oVpAgJxYwRJSoIzgSt7SJMMsGOodCYRaH9JX7LQKaPNV4mCu2ll2EZ
 JlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6WRkFi/q2R4P5DyHa1JaAhoHY3UvtMt9aEPs/MjG0T4=;
 b=eYQwpjkW9/Oaphz1sMiPbG9pZWdFjjZh7KpebcN2r4Ged+tOTwhB2UyK3RD0Taeeu6
 IyVETqwMEQ9UgyW2xz42D70Qpv/NvW0c2m7j3zRDIGUjkjVDP3KnPC0hLJvjKLc++dyk
 l5bGe3WX4VY43O1uGbHGbLxLyUbJK1FHLKiVnTHneDhspI0/fNuhU1DqJ190drIATQnI
 f8nxVDxmhP7UzpagdvNCDIc1/fYU1DYex4yTua6xQ3ZiCx2JwySw7IZ5u7YEp4rUMFQH
 RrZhyD29yA7dVPl/frsxnhKkkdkG8G0nWSGDnuScHuABHAtOoTAlLFZRsXtnfoeGQDTZ
 8CaA==
X-Gm-Message-State: AOAM5333nsXgYeRz7WI/gRHDvH8YPlBHlOzBVnTX+k1Ujwv0i3d13mTX
 P87Fpa5paHsfq3Ytchd72yIWw6MWRhGLjZOY
X-Google-Smtp-Source: ABdhPJz+nfWONCvxMNpbH//f/kVIoJ8LMv5QtQs6BWBNkpi1u0fBNKOiwI1Nc4GVJrKpPHWplP4Tbw==
X-Received: by 2002:a2e:1452:: with SMTP id 18mr4154760lju.4.1624973912679;
 Tue, 29 Jun 2021 06:38:32 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id c16sm1628164lfi.18.2021.06.29.06.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 06:38:32 -0700 (PDT)
From: Arkadiy <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trace: add hardware interrupt calls tracing
Date: Tue, 29 Jun 2021 16:38:23 +0300
Message-Id: <20210629133823.9908-1-arkaisp2021@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: NDNF <arkaisp2021@gmail.com>, pbonzini@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: NDNF <arkaisp2021@gmail.com>

Adds hardware interrupt call tracing. This is necessary to debugging Qemu and
virtual devices. It was decided to use function names. This allow us tracing
IRQ without global code changes.
There was an attempt to use device names, but appeared the problem:
it wasn't always possible to find out the name of the calling device or
the receiver. For example GSI is not a device in Qemu.
Hence, there will be a gap in the interrupt chain.

Signed-off-by: NDNF <arkaisp2021@gmail.com>
---
 hw/core/irq.c          | 28 ++++++++++++++++------
 hw/core/qdev.c         | 20 ++++++++++------
 hw/core/trace-events   |  3 +++
 include/hw/irq.h       | 54 ++++++++++++++++++++++++++++--------------
 include/hw/qdev-core.h | 32 ++++++++++++++++++-------
 5 files changed, 97 insertions(+), 40 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 8a9cbdd556..ee32b58cec 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -26,6 +26,9 @@
 #include "hw/irq.h"
 #include "qom/object.h"
 
+
+#include "trace.h"
+
 DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
                          TYPE_IRQ)
 
@@ -35,18 +38,24 @@ struct IRQState {
     qemu_irq_handler handler;
     void *opaque;
     int n;
+    const char *targetFunc;
 };
 
-void qemu_set_irq(qemu_irq irq, int level)
+void qemu_set_irq_with_trace(qemu_irq irq, int level, const char *callFunc)
 {
     if (!irq)
         return;
 
+    const char *targetFunc = irq->targetFunc;
+    trace_irq_tracker(callFunc, targetFunc, irq->n, level);
     irq->handler(irq->opaque, irq->n, level);
 }
 
-qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler handler,
-                           void *opaque, int n)
+/*Tracking irq function*/
+
+qemu_irq *qemu_extend_irqs_with_trace(qemu_irq *old, int n_old,
+                                      qemu_irq_handler handler, void *opaque,
+                                      int n, const char *targetFunc)
 {
     qemu_irq *s;
     int i;
@@ -56,17 +65,19 @@ qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler handler,
     }
     s = old ? g_renew(qemu_irq, old, n + n_old) : g_new(qemu_irq, n);
     for (i = n_old; i < n + n_old; i++) {
-        s[i] = qemu_allocate_irq(handler, opaque, i);
+        s[i] = qemu_allocate_irq_with_trace(handler, opaque, i, targetFunc);
     }
     return s;
 }
 
-qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int n)
+qemu_irq *qemu_allocate_irqs_with_trace(qemu_irq_handler handler, void *opaque,
+                                        int n, const char *targetFunc)
 {
-    return qemu_extend_irqs(NULL, 0, handler, opaque, n);
+    return qemu_extend_irqs_with_trace(NULL, 0, handler, opaque, n, targetFunc);
 }
 
-qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n)
+qemu_irq qemu_allocate_irq_with_trace(qemu_irq_handler handler, void *opaque,
+                                      int n, const char *targetFunc)
 {
     struct IRQState *irq;
 
@@ -74,10 +85,13 @@ qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n)
     irq->handler = handler;
     irq->opaque = opaque;
     irq->n = n;
+    irq->targetFunc = targetFunc;
 
     return irq;
 }
 
+/*Tracking irq function*/
+
 void qemu_free_irqs(qemu_irq *s, int n)
 {
     int i;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a..e621de506d 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -450,17 +450,20 @@ static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
     return ngl;
 }
 
-void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
+/*Tracking irq function*/
+
+void qdev_init_gpio_in_named_with_opaque_with_trace(DeviceState *dev,
                                          qemu_irq_handler handler,
-                                         void *opaque,
-                                         const char *name, int n)
+                                         void *opaque, const char *name,
+                                         int n, const char *target)
 {
     int i;
     NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
 
     assert(gpio_list->num_out == 0 || !name);
-    gpio_list->in = qemu_extend_irqs(gpio_list->in, gpio_list->num_in, handler,
-                                     opaque, n);
+    gpio_list->in = qemu_extend_irqs_with_trace(gpio_list->in,
+                                                gpio_list->num_in, handler,
+                                                opaque, n, target);
 
     if (!name) {
         name = "unnamed-gpio-in";
@@ -476,11 +479,14 @@ void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
     gpio_list->num_in += n;
 }
 
-void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n)
+void qdev_init_gpio_in_with_trace(DeviceState *dev, qemu_irq_handler handler,
+                                  int n, const char *target)
 {
-    qdev_init_gpio_in_named(dev, handler, NULL, n);
+    qdev_init_gpio_in_named_with_trace(dev, handler, NULL, n, target);
 }
 
+/*Tracking irq function*/
+
 void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
                               const char *name, int n)
 {
diff --git a/hw/core/trace-events b/hw/core/trace-events
index 360ddeb2c8..a2a09d597f 100644
--- a/hw/core/trace-events
+++ b/hw/core/trace-events
@@ -34,3 +34,6 @@ clock_disconnect(const char *clk) "'%s'"
 clock_set(const char *clk, uint64_t old, uint64_t new) "'%s', %"PRIu64"Hz->%"PRIu64"Hz"
 clock_propagate(const char *clk) "'%s'"
 clock_update(const char *clk, const char *src, uint64_t hz, int cb) "'%s', src='%s', val=%"PRIu64"Hz cb=%d"
+
+# irq.c
+irq_tracker(const char *call_function, const char *target_function, int number, int level) ": callFunction = %s, targetFunction = %s, n = %i, level = %i"
diff --git a/include/hw/irq.h b/include/hw/irq.h
index dc7abf199e..dfcdff14a1 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -5,40 +5,58 @@
 
 #define TYPE_IRQ "irq"
 
-void qemu_set_irq(qemu_irq irq, int level);
+/*Tracking irq define*/
 
-static inline void qemu_irq_raise(qemu_irq irq)
-{
-    qemu_set_irq(irq, 1);
-}
+#define qemu_set_irq(irq, level) \
+    qemu_set_irq_with_trace(irq, level, __func__)
 
-static inline void qemu_irq_lower(qemu_irq irq)
-{
-    qemu_set_irq(irq, 0);
-}
+#define qemu_irq_raise(irq) \
+    qemu_set_irq(irq, 1)
 
-static inline void qemu_irq_pulse(qemu_irq irq)
-{
-    qemu_set_irq(irq, 1);
+#define qemu_irq_lower(irq) \
     qemu_set_irq(irq, 0);
-}
+
+#define qemu_irq_pulse(irq) \
+    do { \
+        qemu_set_irq(irq, 1); \
+        qemu_set_irq(irq, 0); \
+    } while (0)
+
+#define qemu_allocate_irqs(handler, opaque, n) \
+    qemu_allocate_irqs_with_trace(handler, opaque, n, #handler)
+
+#define qemu_allocate_irq(handler, opaque, n) \
+    qemu_allocate_irq_with_trace(handler, opaque, n, #handler)
+
+#define qemu_extend_irqs(old, n_old, handler, opaque, n) \
+    qemu_extend_irqs_with_trace(old, n_old, handler, opaque, n, __func__)
+
+/*Tracking irq define*/
+
+/*Tracking irq function*/
+
+void qemu_set_irq_with_trace(qemu_irq irq, int level, const char *callFunc);
 
 /* Returns an array of N IRQs. Each IRQ is assigned the argument handler and
  * opaque data.
  */
-qemu_irq *qemu_allocate_irqs(qemu_irq_handler handler, void *opaque, int n);
+qemu_irq *qemu_allocate_irqs_with_trace(qemu_irq_handler handler, void *opaque,
+                                        int n, const char *targetFunc);
 
 /*
  * Allocates a single IRQ. The irq is assigned with a handler, an opaque
  * data and the interrupt number.
  */
-qemu_irq qemu_allocate_irq(qemu_irq_handler handler, void *opaque, int n);
-
+qemu_irq qemu_allocate_irq_with_trace(qemu_irq_handler handler, void *opaque,
+                                      int n, const char *targetFunc);
 /* Extends an Array of IRQs. Old IRQs have their handlers and opaque data
  * preserved. New IRQs are assigned the argument handler and opaque data.
  */
-qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler handler,
-                                void *opaque, int n);
+qemu_irq *qemu_extend_irqs_with_trace(qemu_irq *old, int n_old,
+                                      qemu_irq_handler handler, void *opaque,
+                                      int n, const char *targetFunc);
+
+/*Tracking irq function*/
 
 void qemu_free_irqs(qemu_irq *s, int n);
 void qemu_free_irq(qemu_irq irq);
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa..f6f4642ac3 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -557,6 +557,20 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
 
 /*** Device API.  ***/
 
+/*Tracking irq define*/
+
+#define qdev_init_gpio_in(dev, handler, n) \
+    qdev_init_gpio_in_with_trace(dev, handler, n, #handler)
+
+#define qdev_init_gpio_in_named_with_opaque(dev, handler, opaque, name, n) \
+    qdev_init_gpio_in_named_with_opaque_with_trace(dev, handler, opaque, name, \
+                                              n, #handler)
+
+#define qdev_init_gpio_in_named(dev, handler, name, n) \
+    qdev_init_gpio_in_named_with_trace(dev, handler, name, n, #handler)
+
+/*Tracking irq define*/
+
 /**
  * qdev_init_gpio_in: create an array of anonymous input GPIO lines
  * @dev: Device to create input GPIOs for
@@ -574,7 +588,8 @@ BusState *qdev_get_child_bus(DeviceState *dev, const char *name);
  * See qdev_get_gpio_in() for how code that uses such a device can get
  * hold of an input GPIO line to manipulate it.
  */
-void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
+void qdev_init_gpio_in_with_trace(DeviceState *dev, qemu_irq_handler handler,
+                                  int n, const char *target);
 /**
  * qdev_init_gpio_out: create an array of anonymous output GPIO lines
  * @dev: Device to create output GPIOs for
@@ -622,11 +637,10 @@ void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
  * @name: Name of the GPIO input (must be unique for this device)
  * @n: Number of GPIO lines in this input set
  */
-void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
+void qdev_init_gpio_in_named_with_opaque_with_trace(DeviceState *dev,
                                          qemu_irq_handler handler,
-                                         void *opaque,
-                                         const char *name, int n);
-
+                                         void *opaque, const char *name,
+                                         int n, const char *target);
 /**
  * qdev_init_gpio_in_named: create an array of input GPIO lines
  *   for the specified device
@@ -634,11 +648,13 @@ void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
  * Like qdev_init_gpio_in_named_with_opaque(), but the opaque pointer
  * passed to the handler is @dev (which is the most commonly desired behaviour).
  */
-static inline void qdev_init_gpio_in_named(DeviceState *dev,
+static inline void qdev_init_gpio_in_named_with_trace(DeviceState *dev,
                                            qemu_irq_handler handler,
-                                           const char *name, int n)
+                                           const char *name, int n,
+                                           const char *target)
 {
-    qdev_init_gpio_in_named_with_opaque(dev, handler, dev, name, n);
+    qdev_init_gpio_in_named_with_opaque_with_trace(dev, handler, dev,
+                                                   name, n, target);
 }
 
 /**
-- 
2.17.1



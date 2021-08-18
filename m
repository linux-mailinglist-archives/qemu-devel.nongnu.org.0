Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3456C3F0BFF
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:42:49 +0200 (CEST)
Received: from localhost ([::1]:50608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRSa-0006nI-6Q
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9s-0007Mc-O6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:28 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR9r-0002lR-5P
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:23:28 -0400
Received: by mail-pg1-x52b.google.com with SMTP id r2so3321049pgl.10
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hlGCWa0qcgLrvcDvhZ/cxV3hMg29OCBmykjODrlctgY=;
 b=E0HZVwUnRJn1o8M8GC9gh/xoUuVeQZnH5zalIMmZ0KZnTweMMJI2r7j7HnnnMwhOk0
 dljtLgc42xmBWXHD0YbYEbPVbeTN8Bgey04R20iuHWxgAtPFOpuOftVElNLTp4vR6TaB
 U/ODsqcc86z+5E3/VXZtcG5Q9e9jwZVcBUrNLCS0nAhRCY3sZWxyDtP9LWzJp5c+ROZF
 kmCZKY6j0lOs5pf1Stg5yexkgJOTNHw/hyJBn0bwB8qSA4CgQlFY7Sc+wSWeGPa9wU0X
 icH0Pxrxm1+elaoRK7aY0VWctG1alyzwwIVSC7tcM+ohJjTw60NtzQhXrUa6H/wkey8K
 JI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hlGCWa0qcgLrvcDvhZ/cxV3hMg29OCBmykjODrlctgY=;
 b=QOhEFY5aV6BSgKMFeHguqp3TXDcoVzP0b3bFnBwhzLboRgNa0/gN/ZbGJhbQoKewj/
 3q78G+pQtOlTZCVFxbpGEblHAMh7ueg8EuvLAJabw72lGZKjoVCUKG6u7Fu5Y+/G87Av
 mM9nfvLda54Y3cXvEtNUVwT8KFga4Oikz1ulWU34NwZP1bBPCKtW2wPW1WJK7t32nPOY
 Fn9fkHWbtWfQs7+zD+ppkRKPH7EI5iVtf3WcNnGnySkHX2SMbs6mh1BJOkJwH1ehEAbS
 TpoyNzOIl5X7gbLec0ysUMxEqvQxfPjUUYKTjqLKdDAB9qWbfb6ana7J0/aMCqAe/a3j
 wj+g==
X-Gm-Message-State: AOAM533eje07wfmTUBUSL62CQNnIPzlZgnizRzPpbYdEQ9OqANwZNRnm
 biNPEYUsurFRjGZj8iU4Gp4NaubX5jduSg==
X-Google-Smtp-Source: ABdhPJxAp1BcpjnuCmFyhOzR1kET6YASS36OgG4CsWcK7vXHpZaabcY9U1++t1BNfSFAAiBXwuNjjA==
X-Received: by 2002:a65:508a:: with SMTP id r10mr10372523pgp.96.1629314605907; 
 Wed, 18 Aug 2021 12:23:25 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id w82sm569302pff.112.2021.08.18.12.23.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:23:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 51/66] hw/core/cpu: Add prctl-unalign-sigbus property for
 user-only
Date: Wed, 18 Aug 2021 09:19:05 -1000
Message-Id: <20210818191920.390759-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Actually disabled for now.  Will enable for each cpu that
supports the feature.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/core/cpu-user.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index 62037e8669..23786865cb 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -11,12 +11,27 @@
 
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
+#include "hw/qdev-properties.h"
 #include "cpu-common.h"
 
 /*
  * This can't go in hw/core/cpu-common.c because that file is compiled only
  * once for both user-mode and system builds.
  */
+static Property cpu_useronly_props[] = {
+    /*
+     * Create a memory property for softmmu CPU object, so users can wire
+     * up its memory. The default if no link is set up is to use the
+     * system address space.
+     */
+#if 0
+    DEFINE_PROP_BOOL("prctl-unalign-sigbus", CPUState,
+                     prctl_unalign_sigbus, false),
+#endif
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 void cpu_class_init_props(DeviceClass *dc)
 {
+    device_class_set_props(dc, cpu_useronly_props);
 }
-- 
2.25.1



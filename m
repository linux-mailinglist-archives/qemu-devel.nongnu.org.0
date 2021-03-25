Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D53495C7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:39:21 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPS4u-0002PD-Kb
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRzA-0005E7-PN
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPRz1-00055o-Js
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:33:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3349514wml.2
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 08:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HBUJPboo8vzvo+P46JoUkwrV2UGz/XowQ0iwB317xoU=;
 b=Vyomhw+uoEfnfc3INjXZvtatCkD9AZ+Opmpsxz4Ayz/lLNEIW23EKRXk5T+AQcKtIb
 oMWueOa/vaUXwMvD/5CHV8KKyCE2NJlc+BsowTrWsdSLzwn3ESUK9y1aYkvqJQGyOyFA
 jXVwzjoc4O2IlTeSX0lF//lvZI3Az9T8M7PfZyyp3eL1dzHkS45wwUruJnuE/70oiuXT
 fX3GDMQAb6gpso2j7dxTiHurmQiztMgt1W7yKwKyweskstdeFeeBeU2X7nodJs1JEAI+
 NKifyw9k57osxYpHsHjrgvnEn9dNH/NYFfoiketadgZVI5iD9yRQ4ZOTsOkr0FgQganA
 dEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HBUJPboo8vzvo+P46JoUkwrV2UGz/XowQ0iwB317xoU=;
 b=riEQ+1DjIqz5tHooxVMx9xg1RwLQTFCOe+V1QjtdmEyGsZ1V12Rz00HPIuV+WGVsWL
 W0ROAujqwR+2Xn2oylU9ai7qzPPQevbd5sxc3X+FrHWvCsq+Mo/IhOCNuOYyTRyUJJCU
 JWMfSHoI9SJ3fb0jYmZMctHoBJGqbP5Iaq7OyBpJaAMGSToucEdTzV5GrrepK/3YqsTz
 V3n8h0EF3CFalKnK7FJcrpeWWnwKa3N2xGlc+2TXHkurV8Jo+qmUnAORM0hCUnWHi8Sf
 B9d86VfPc8Jsn68GHqAITKWX0pkJoSf+oSwEcLjeFce0IUPQCJVylRfcaUaHwHu4pA4e
 gqww==
X-Gm-Message-State: AOAM531S+H8/9BNQ96cvvSzmOH3YL/Z0dIJQxXwzm/T6LtUwm1yknl1u
 f+8uE2+2fSQXWXcXACcLaowWhA==
X-Google-Smtp-Source: ABdhPJzbIjFaXH+PiAma1oF124FAcfjBh54b/wQPMTih7fzU40B+sBAel7eItBrzRnVQjMFZ9euK/A==
X-Received: by 2002:a1c:f305:: with SMTP id q5mr8524371wmq.96.1616686394040;
 Thu, 25 Mar 2021 08:33:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g11sm8004580wrw.89.2021.03.25.08.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 08:33:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 1/4] include/hw/boards.h: Document
 machine_class_allow_dynamic_sysbus_dev()
Date: Thu, 25 Mar 2021 15:33:07 +0000
Message-Id: <20210325153310.9131-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
References: <20210325153310.9131-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function machine_class_allow_dynamic_sysbus_dev() is currently
undocumented; add a doc comment.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/boards.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 4a90549ad85..27106abc11d 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -36,7 +36,21 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
 
+/**
+ * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
+ * @mc: Machine class
+ * @type: type to whitelist (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Add the QOM type @type to the list of devices of which are subtypes
+ * of TYPE_SYS_BUS_DEVICE but which are still permitted to be dynamically
+ * created (eg by the user on the command line with -device).
+ * By default if the user tries to create any devices on the command line
+ * that are subtypes of TYPE_SYS_BUS_DEVICE they will get an error message;
+ * for the special cases which are permitted for this machine model, the
+ * machine model class init code must call this function to whitelist them.
+ */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
+
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
  * returns migratable MemoryRegion provided by backend.
-- 
2.20.1



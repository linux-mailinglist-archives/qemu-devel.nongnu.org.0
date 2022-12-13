Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 482DD64B543
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 13:36:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p54WB-0001Kk-3E; Tue, 13 Dec 2022 07:36:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54Vz-0001G0-Vx
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p54Vy-00063Q-6d
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 07:36:07 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m19so8171822wms.5
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 04:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kaPjbKdMr76WDvODBflVFVeFIfBaQyO5rZm5rUBpNuw=;
 b=O2ot/k263FnLwr6J9y4vgJFRt8gHLPGH+hYoc+NkfvsmnefXlPnGZlKV8VaoDFYsl2
 tn4cJPrjWf4augfmgq/yh0o+PlrKquNKGxM+vgRAO/pBZE4l5MZ84gzT313lx8kTdwHV
 K6FxQulbeRmrkFTTBqGMFUcyGs7iCYU5rNySfLLa/9pwV0TyJUgHwk7niUza6Riz0S4E
 exNt9PaeK9U176+7vydCwwzvZPiJ41xLFN5PRFEM6K/4lqmnr+M/uc8DzjHVI5S0MNyE
 fNme6kL5jj1uCRkbMgT1tQ1KaxfYfrrr6h9aQJTHxFSoxa8k6RLI2cKkO5Sr1fugKJtF
 8g0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kaPjbKdMr76WDvODBflVFVeFIfBaQyO5rZm5rUBpNuw=;
 b=OiOABViGl4ECJv3jxWPUZXJk6Sa9muAX0g26bNLgopD7W9AYciDUvXhbYSsOnmfRZe
 ZrBmg6sZj5PVRnSC/OLNQwl3GjVxjzy+Oei60NQByohPWs/A+C7dhydAChHemqxwgdDB
 /gco42OQwRTfIx1rPWTKQD9bFxZ8upuVk5H4eENhWtl993oZyanAy9otkHudQTt2Ascp
 xgwhD/A0R8x0HQAgTRNEMjAiHZZ3q1EDcVAAz1C7nXV1+swmbTdbiqRXRg+0XHn0dMXH
 +WYRHYRULGxbpZMZxeZY1rpVoOf9oAigwkDm6dAmhak5I25KeVBR0mtioqeZGFts4Ual
 ODuw==
X-Gm-Message-State: ANoB5pnbStD764BP0WXs12wg6gieP/ScePuVLCQeMhjnHTJxD+vFOdBT
 rib7iU9t+dkBgaDW9s9NDbQxv8/+c+t9Bgil1B0=
X-Google-Smtp-Source: AA0mqf6vaK+43TBHB5IP98FncgtiD9SnBheWSw4weMDQLfnluEzaSymwtarl0qzMsoQxR8wgtmqdTQ==
X-Received: by 2002:a05:600c:4e46:b0:3d1:c8c8:fc0 with SMTP id
 e6-20020a05600c4e4600b003d1c8c80fc0mr15296436wmq.10.1670934964621; 
 Tue, 13 Dec 2022 04:36:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c4fc300b003cfbbd54178sm3375484wmq.2.2022.12.13.04.36.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Dec 2022 04:36:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 2/4] hw/ppc/vof: Do not include the full "cpu.h"
Date: Tue, 13 Dec 2022 13:35:48 +0100
Message-Id: <20221213123550.39302-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213123550.39302-1-philmd@linaro.org>
References: <20221213123550.39302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

"vof.h" doesn't need the full "cpu.h" to get the target_ulong
definition, including "exec/cpu-defs.h" is enough.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ppc/vof.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
index f8c0effcaf..d3f293da8b 100644
--- a/include/hw/ppc/vof.h
+++ b/include/hw/ppc/vof.h
@@ -9,7 +9,7 @@
 #include "qom/object.h"
 #include "exec/address-spaces.h"
 #include "exec/memory.h"
-#include "cpu.h"
+#include "exec/cpu-defs.h"
 
 typedef struct Vof {
     uint64_t top_addr; /* copied from rma_size */
-- 
2.38.1



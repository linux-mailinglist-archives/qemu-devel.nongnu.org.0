Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFEC652345
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:59:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e2t-0006d5-2S; Tue, 20 Dec 2022 09:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2n-0006YX-DS
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:37 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2l-0004hc-Ut
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:37 -0500
Received: by mail-wr1-x42a.google.com with SMTP id m14so11971892wrh.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F7rSi5GEIaRyq3At2o8uQZxqXo1Ikt+p25AbGddVS60=;
 b=aTuNGlA9d1569Np6TRMiLGFNJNqY0Nnzh+YUdRS9jjSSMJo3DPHm++aNfd5yPo8HDa
 nNsFdQTtwNrzuEhr0mqgqSwt8ijS8X6O0sZ8zX4IkYXC2zXtErinEzG9UPMvOXc7UjaE
 uOlkN8KfT3hiTUBUVfLr1GtNJo/Vce5dr1nyD+cyuZwjHAiUVOwzwJGwzh54pgTTltAj
 YDdjPa9m0qMOqQDguP5PApXGZ6brLUR9xnYyZ8+S+NslqhJL0C9paY+U0r5wlZrg6Lqw
 MqitEIMMiUx4ShK87CuvMBZWEORUNj20rhYlvOA2/JpFa+HcXnjl/38t4vrIquHbRguj
 1nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7rSi5GEIaRyq3At2o8uQZxqXo1Ikt+p25AbGddVS60=;
 b=udVRewwfXbrmSKO5nc4/CVJaX/dtTMXUFabsCTqTDWlOQwVa3WqkUQ1fT6VTGiyBW2
 rt8AKHk9k8YcoGgepqhllHRgdeop02vmCc7LH5rzI31wplAjhZWNYyolaLNzecrc4y/W
 pWpGkvJtyAqL8kUnqaqK43mPK+300v9MWZV2VSKd+1YEAiyV46qL3PAC5FKnSc4qYkQA
 RBA/3R2ykVNHsUKOobfu3CwFEah5GHppoZ80RDgRx3elF8dM36e4Pn6NIfs12VRwvJvc
 zNu1UDQhxhmB5h3ZEipw543lbyj8ztjlXfZBokg9rBnGu+qoa8Eoz9VCAxqQb+AAKyN0
 rc/g==
X-Gm-Message-State: ANoB5pk1zOwZwcbVR006peORCBE6ac6Ju7HCXeE84wrVjm1S/CgGbljl
 yanLd4M5Iea6eglDBmDmWxVs1xNKHkJfXMPJa3Q=
X-Google-Smtp-Source: AA0mqf6lKpe6TMg5CnPyfHJOwVNWDBjK/bEdPntm5e+wy0YJFhczimpIQSKF2NSP+SrYr958gBdH1g==
X-Received: by 2002:a5d:6dc3:0:b0:247:4802:9435 with SMTP id
 d3-20020a5d6dc3000000b0024748029435mr27310214wrz.5.1671548194413; 
 Tue, 20 Dec 2022 06:56:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e34-20020a5d5962000000b00267e918d1ecsm1248570wri.24.2022.12.20.06.56.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:56:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] target/i386: Restrict qapi/qapi-events-run-state.h to
 system emulation
Date: Tue, 20 Dec 2022 15:56:21 +0100
Message-Id: <20221220145625.26392-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
References: <20221220145625.26392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

shutdown / powerdown / suspend_disk / resume / watchdog
are events irrlevant to user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index 0ac2da066d..dcce27bac1 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -18,12 +18,12 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/qapi-events-run-state.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "sysemu/runstate.h"
 #include "kvm/kvm_i386.h"
 #ifndef CONFIG_USER_ONLY
+#include "qapi/qapi-events-run-state.h"
 #include "sysemu/hw_accel.h"
 #include "monitor/monitor.h"
 #endif
-- 
2.38.1



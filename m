Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 145014715B9
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:33:09 +0100 (CET)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw87I-0008GQ-6Z
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:33:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mo-00050l-Vv
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:12:00 -0500
Received: from [2a00:1450:4864:20::32b] (port=47025
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mi-0006GL-PC
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:58 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso8944598wmr.5
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svyDuO08plqqfke9+oyDo+51L/6esQWi/ZoR3/dgCe0=;
 b=a3k3KJWuEzvy1ztXgvlmCp4M6VN0cT4u0EzIb7X7ypAZ/kazvYKVN6Iea4o4C47BSe
 O8BP86150gTusj9Y2rITLpBKph03k7B+W9oorGVVyTPHjN0JdTIz2SC4AhVvkXrVfg7v
 FKj7eXin6J5URrNIUTagcXV0aAUZlqk3tnrl39xoR/obH1RchlqlAQVj7+Buo8UiFyWF
 kyXnJy7IbiDkILdAa74DK1rIqoqkqNylrUWqnZ+gtfS9OzGmTofY4l5P4mzT/sXexhNE
 BaFa1QkdqamgeBRtWN+IJAefhnb1qQcjkm2ASsfe+BkM3O5N5arQkhE0fq7UA6km5m91
 GXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svyDuO08plqqfke9+oyDo+51L/6esQWi/ZoR3/dgCe0=;
 b=5z7xB4AwE1kLd1GCnyzECUjYIs7WB65G+eyhZPWuBJNCLw0HJpc4tVY5/vekORkzBx
 Xh/a9zZLYy2/as8nru0DirnnuNnPoPuCw39yX6FmEsDDWDU345Yj5qRHw1l5w2EnfAiD
 c/IbHbllgbn2DajOBvy7CKuERStCfQKmrdfjzvFnQ+bX/9gqwA+MwHFb0Nfhr9mIz1eh
 z/Dn/SpY3nPA3g5t1dxyjDZ0CHVvY2vzmUyRfQdq4fqcDcfI5VNRfaTLF8g4D0vc+yEv
 Pwj9/tqixMnwu2fL+fYChz9wGuBL2J2Zycar4ELe5Ps2AbAf2PH8xICUHfMge4JQbELd
 hrsQ==
X-Gm-Message-State: AOAM532qKS9g9GDmLyIAPz7XsKK5+lBlgUeKS/iS2QVUu1oFQkhVxzfd
 YY6qpuA6E8dOYcIpgojIa1DTgA==
X-Google-Smtp-Source: ABdhPJx/gsv2aHjPQvNoag23Tf4OW+HcMBUI4fXiJ4a3VR4+NuWF46mpDQIaJRRd25Um6WRpL6pHmw==
X-Received: by 2002:a1c:a982:: with SMTP id
 s124mr20854494wme.191.1639249911294; 
 Sat, 11 Dec 2021 11:11:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 18/26] hw/intc/arm_gicv3_its: Fix handling of
 process_its_cmd() return value
Date: Sat, 11 Dec 2021 19:11:27 +0000
Message-Id: <20211211191135.1764649-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

process_its_cmd() returns a bool, like all the other process_ functions.
However we were putting its return value into 'res', not 'result',
which meant we would ignore it when deciding whether to continue
or stall the command queue. Fix the typo.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e6b380f663c..32cf18c10af 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -676,10 +676,10 @@ static void process_cmdq(GICv3ITSState *s)
 
         switch (cmd) {
         case GITS_CMD_INT:
-            res = process_its_cmd(s, data, cq_offset, INTERRUPT);
+            result = process_its_cmd(s, data, cq_offset, INTERRUPT);
             break;
         case GITS_CMD_CLEAR:
-            res = process_its_cmd(s, data, cq_offset, CLEAR);
+            result = process_its_cmd(s, data, cq_offset, CLEAR);
             break;
         case GITS_CMD_SYNC:
             /*
-- 
2.25.1



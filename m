Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0602484BDF
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 01:48:51 +0100 (CET)
Received: from localhost ([::1]:39606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4uTx-0000Bc-Pd
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 19:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMP-0005Cd-Qa
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:02 -0500
Received: from [2607:f8b0:4864:20::1036] (port=33536
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4uMM-0005fC-Nh
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 19:41:00 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 g11-20020a17090a7d0b00b001b2c12c7273so2534929pjl.0
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 16:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YcPV3VwSDfshYOTe7weRDXAZxBZo/GP8+IJKpZqZQJU=;
 b=s2VfolWq3b3H2u0VfbQEvQzNjrQYFtvwehOlgKhi39cHOKCB5gXoyEj3TVV51Ouctc
 D0JQ85pX3/3ATU7NTTSn1uV5oNhphGWZOAz4EybTFVqRkU7VIWudzcsMYgsd+JqikmQp
 nWtmE6IVqeXqki6NlG93158i+NMj7ZZWoJxmDlYajN/afwzTJ/75OC4uD4Bc1ALdr/J5
 9HSav6dn/XWaCzEowVC18vqtcmtLNRm3rMxJZkHqlOAxIeVp1lsWk/zUMJ7BGLPRi/Mz
 Jn7fN59LzhDRJIskgS7bYskF/A1j+ZmeCXLM/zusAUb5sBL9Wb0NHjvRWLs2KnwNuDD4
 FkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YcPV3VwSDfshYOTe7weRDXAZxBZo/GP8+IJKpZqZQJU=;
 b=01TQDfRsd8xVG6doOsvIdhbEIWy+DpYIwu2yCBhnW+bu1AzRZMnTqqyT3Y0qJ5JHbJ
 MR6VhqTjNuKVafkGxzqAps2Qxa+zyiiwNXJi7ms8unh/F9kSUoefD1eVhJ+6GcwhuEqw
 6cOs6FUHV+OvwEY4/scgf2+pSoTLHhhoUoo63ODrlbKcV56sBLJIRjJXjP21ZIW0hcWM
 c0bbVAEWBrxLFA/VXAI0ICez6XnmEsY2Q1uqOkziSmJa4WN5kI+yCmEKJbm+PrfeKuQM
 U6UVGupe2EB4KE2VwVl90PH+AjeCvNA9IPS+KL/Uw1BBWuM5yHrUErgljFHLwU6aoMRm
 6Krg==
X-Gm-Message-State: AOAM531yFRSupmL3HVYB+iwZUmkZ+fjzdYK+k5mxXUm6urKrryC3Ytfs
 Kqau/HAad2eZI63vc9Z9GncJxwDJo+7mTw==
X-Google-Smtp-Source: ABdhPJxkqCmahfY2L1fcYyJZKPzZE9/7UWSjfG2pkj4kDRpxJ4U9C/fFsVijLxbu86gsdBQeoEcnkw==
X-Received: by 2002:a17:90b:38c1:: with SMTP id
 nn1mr1132529pjb.65.1641343257374; 
 Tue, 04 Jan 2022 16:40:57 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k3sm35312356pgq.54.2022.01.04.16.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 16:40:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] sysemu: Cleanup qemu_run_machine_init_done_notifiers()
Date: Tue,  4 Jan 2022 16:40:53 -0800
Message-Id: <20220105004054.587588-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220105004054.587588-1-richard.henderson@linaro.org>
References: <20220105004054.587588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Xiaoyao Li <xiaoyao.li@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaoyao Li <xiaoyao.li@intel.com>

Remove qemu_run_machine_init_done_notifiers() since no implementation
and user.

Fixes: f66dc8737c9 ("vl: move all generic initialization out of vl.c")
Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220104024136.1433545-1-xiaoyao.li@intel.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/sysemu/sysemu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 8fae667172..b9421e03ff 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -16,7 +16,6 @@ extern bool qemu_uuid_set;
 void qemu_add_exit_notifier(Notifier *notify);
 void qemu_remove_exit_notifier(Notifier *notify);
 
-void qemu_run_machine_init_done_notifiers(void);
 void qemu_add_machine_init_done_notifier(Notifier *notify);
 void qemu_remove_machine_init_done_notifier(Notifier *notify);
 
-- 
2.25.1



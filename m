Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AC65F18D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTMR-0000wV-Cm; Thu, 05 Jan 2023 11:44:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMC-0000kk-S1
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:47 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTM7-00072G-Bx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:40 -0500
Received: by mail-wm1-x32c.google.com with SMTP id ja17so28450082wmb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5phcJn3+aOzp5t3SfXhX01zMS188rkd4iS8jVPL2LkE=;
 b=cme+eRrfbRSg4csUk3Lp05wb4dzOo1sKBE0qYX+J4WSopS3IXVUP7+pvOnBAq7hJQC
 h1rx/wZMoO9xdCsAuRujK5T9sGvpcGPRPfe1P1ImLpeXxN2mtUO8hFJL+if7HXGBgtfj
 1VrqzYrB5Lga9Pz2YJu5fEUoc1Cv9/jXeL5XaZVFf+ufPBe8uoilk6feZmPQ24xEcWMt
 2/D7QdfiAbqA9JFJy/OpjBCvTzc7xF9XbaYsptU1wUDyqKxQ+s/3r4bpajIc7jg/8CaI
 uG+cWPW6iOsLiP+HOLEOty6f8EWp1IpP7nBt84vdpf/5hmw3Z42RJFuOXy0Tev3nO8Lz
 pF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5phcJn3+aOzp5t3SfXhX01zMS188rkd4iS8jVPL2LkE=;
 b=UsfsSKYsx/ZD/YQXtVGhvabYBoFmidNdGTdbKhSuKym/IraqOZg8bQHc3ED8S+IpFo
 OY/Kt3nh48ixlFXN7GCWfQwjyCHE//0KpKs+Ec+KTohuRQPRm7lRJE6aEnYUDZ8xRnk0
 CRzOl752o314yPvrd35XffYFW6td+tpW7F8RltzxLA8kO1liPF1ITSja4qM8/84QWyA8
 tKO8qsOTrKO0qByBVuIx+adGyxmzWzCxBAj1bJWsRb8TkPpsTgNg0Hv2QGV+fTMkr9s7
 dq2T+bPBbw4gS5ja7XtGbTySh1ZgiR2/UgqzF1gzelicmn09fB1TqPu+AzSR6Td1LgMU
 vG9A==
X-Gm-Message-State: AFqh2kr2m70jq5F0Lfi7cicdFxGb+Zd25hH/30KRqpZLcPdlwGbAEPOR
 eCEfBRXONNERP9PgH/u3kHu4uQtulAt/0yRf
X-Google-Smtp-Source: AMrXdXvEO/DW+Brz6skmMD1v0ol5DK45vEhqw7BvAmb28JltJE0HUifENmP5V2nsfTVlLgQxMXMNdg==
X-Received: by 2002:a05:600c:18a1:b0:3d2:3ec4:7eed with SMTP id
 x33-20020a05600c18a100b003d23ec47eedmr40233937wmp.10.1672937078665; 
 Thu, 05 Jan 2023 08:44:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/34] target/arm: cleanup cpu includes
Date: Thu,  5 Jan 2023 16:44:06 +0000
Message-Id: <20230105164417.3994639-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
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

From: Claudio Fontana <cfontana@suse.de>

Remove some unused headers.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-id: 20221213190537.511-7-farosas@suse.de
[added back some includes that are still needed at this point]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c   | 1 -
 target/arm/cpu64.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f99f749b295..5f63316dbf2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -26,7 +26,6 @@
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 2cf2ca4ce5a..0e021960fb5 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,13 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "qemu/module.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#endif
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "kvm_arm.h"
-- 
2.25.1



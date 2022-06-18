Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B455039C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 11:06:53 +0200 (CEST)
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2UPs-0005gC-BR
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 05:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o2UKj-0004Zf-6E; Sat, 18 Jun 2022 05:01:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1o2UKf-0002bY-Qv; Sat, 18 Jun 2022 05:01:31 -0400
Received: by mail-pj1-x102a.google.com with SMTP id p5so303586pjt.2;
 Sat, 18 Jun 2022 02:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=63cavFc5cxjvfePJTjWfXSGCWx+MupVUzl1XIVF5GEw=;
 b=Ydh08QN68JZJXUcHfV7ObXi6L4hWXU9PIuqRb+QSAOo5Iw6Ilvg53mDOXIUToPHa0T
 D9ALNxIZ4tMVPCpVbiOpnnfMwHlzY0Vw6hB5XCZRF1cvwY88AvdlltjW2X2fUIqyNlBy
 s0fu9fAJngf/ruidYt0YQ4jWnG0atPpdk/+tJTau0r75fP7cZgopFXnYmnrMWgRTD4r9
 szYbXxFaDjogpJhwHze0zj9fj9Gmm7QC9psHXQK+rHxtepG6R5yvJvfNt3KphXe1ltzl
 6F0sNS+Vb6zeG+FB+XDiwkFwsTF/sZlOTUPk21NPaWb/Wa9+O0EwpJv9xp0UDYeC4JOw
 fyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=63cavFc5cxjvfePJTjWfXSGCWx+MupVUzl1XIVF5GEw=;
 b=PeEj0jp7qh5htrb9/4Q8YvdOMZxtCAtwVa3Jtqn6AabObEsj6YBW0X/Dx3fBo9MgIN
 890b7pX1QZO2kmFyAumJVaQe+ejL3GMrrhg7cCpgKvVY1rFLO5hjjAW24yaqzSF93FwZ
 AvPr6pbf7prhTROyASPs1EvWVPkqMBK/IHm5Q1wI/P9pvMTxnd9JZq/mD2bIPXUCDDEV
 yPPnXDRQd9uYHwgyfgM6k4dq7xiiYbDX+tVUicVJsrZ2Q8gC1niEKf+xhbgzipn06NEV
 6PtBwTb34zWw+4DRuitN0rBLTARxtRDG35zinC8AkisJdW0eyA42ka+BwIa2CgiiotI+
 dYrw==
X-Gm-Message-State: AJIora9QD6khUAvUrzZKZd/EJ3FKfljBcR0K0+fxjrR2KTCXxGEp+OeX
 0ZJqGlMxpsIvOed0j4vGVKo=
X-Google-Smtp-Source: AGRyM1tzjxIF0ZF2wBAlNvDqDdJWM00uc5uBfnNO3q4+zSzF2l3VuhryPFcTYAD70nAWJobFrKbV8A==
X-Received: by 2002:a17:90b:314a:b0:1e8:5362:5620 with SMTP id
 ip10-20020a17090b314a00b001e853625620mr15377190pjb.9.1655542884662; 
 Sat, 18 Jun 2022 02:01:24 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a17090a530400b001e0cc5b13c6sm6783622pjh.26.2022.06.18.02.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 02:01:23 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] aspeed/hace: Add missing newlines to unimp messages
Date: Sat, 18 Jun 2022 18:31:14 +0930
Message-Id: <20220618090114.3158904-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_hace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 4b5997e18fad..731234b78c4c 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -340,12 +340,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
 
         if ((data & HASH_HMAC_MASK)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: HMAC engine command mode %"PRIx64" not implemented",
+                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
                           __func__, (data & HASH_HMAC_MASK) >> 8);
         }
         if (data & BIT(1)) {
             qemu_log_mask(LOG_UNIMP,
-                          "%s: Cascaded mode not implemented",
+                          "%s: Cascaded mode not implemented\n",
                           __func__);
         }
         algo = hash_algo_lookup(data);
-- 
2.35.1



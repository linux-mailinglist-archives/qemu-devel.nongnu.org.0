Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94FC6E09A5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 11:04:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmsrP-0002Ve-96; Thu, 13 Apr 2023 05:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmsrN-0002VI-93
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:03:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pmsrK-0002PT-OJ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 05:03:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id i3so4154449wrc.4
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 02:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681376593; x=1683968593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E2zGkve97e91x2bkPadRX9CztuBzi4WySCG3mqozErw=;
 b=QVIEsPlJE73ePjAULqzdoRBQJyJPbvK5dmLt4XpGgp2EO0dY3veR8Ly/FK+KFhpw12
 aHatMFq6oyFqbbJe9/x/bcR9/xRfj2EPi0ACxW+VWnhAV31T4jlPacWQ0KkGBhQOkDHl
 Vu/fRHNxntx+UP+uGGFqtq9ReegXOITMq0UI6rmBG+DTlVERTED/KKjSyS7i2ufrqy0g
 pkpXkYZT0WtW+xFEphJmJLtUiGoO5iFc4h+YthRG7HhojqS8mNg6RCwfaPzMRCyYch8I
 eOesugDl2Oe/U6s6OcFrtPtMtycaLZc/+vAN6cB/uku0CclPnIJBOZeM7oikR18rmHt4
 lnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376593; x=1683968593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E2zGkve97e91x2bkPadRX9CztuBzi4WySCG3mqozErw=;
 b=IMwu/VoeOWuZslrMH1gWnMyhelMFZZqGfWsitHzoXZX9rW2jpY14yLhEwrEtID681l
 w0kGbifDQX8MbbM93koeAyEtBDkUfTqxEAW4GCVL/byckbnV/VYvYeIMn4bY8YbF9Bf9
 wv0qLYma+SQf969sZQ3zSQMtLh97iIcuHUmEpSp/PfusezmIxwa5pog9HliqQub6Dhlk
 xiqLd7HhKoG8Rbc4UMyFroREKw+BZaAww5a98eY2j3u4fcdigbSaIp3GzcXXIm3iv/xP
 or0XTpEgX4vegTm+kRew/m8DyalPtW+g9GGNvxwoPHdHrqKcetmjpMSivnu7GOMaQEPw
 hDog==
X-Gm-Message-State: AAQBX9dIk0TsXEX/2hnYy//Z0li07GgBnqKtR7dKLgoLKi3fmqSP4BD3
 wlwP1QU23i6CfAYKjskHt4U+3g==
X-Google-Smtp-Source: AKy350Y6V8JOQgSwFUFzUMyYhvGbz8HD105BuFxp1RSej08vUVumja+5WCh+hblnS2HwG6y15vty0Q==
X-Received: by 2002:a5d:4bd2:0:b0:2f5:dad1:41a4 with SMTP id
 l18-20020a5d4bd2000000b002f5dad141a4mr846173wrt.6.1681376593119; 
 Thu, 13 Apr 2023 02:03:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s15-20020adfeb0f000000b002c55306f6edsm823880wrn.54.2023.04.13.02.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:03:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 65C731FFB7;
 Thu, 13 Apr 2023 10:03:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH] softmmu/vl: fix typo for PHASE_MACHINE_INITIALIZED
Date: Thu, 13 Apr 2023 10:03:10 +0100
Message-Id: <20230413090310.1197548-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

Otherwise people might get confused grepping for
MACHINE_PHASE_INITIALIZED and find nothing refers to it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ea20b23e4c..1b76fbb656 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2509,7 +2509,7 @@ static void qemu_init_board(void)
     /* process plugin before CPUs are created, but once -smp has been parsed */
     qemu_plugin_load_list(&plugin_list, &error_fatal);
 
-    /* From here on we enter MACHINE_PHASE_INITIALIZED.  */
+    /* From here on we enter PHASE_MACHINE_INITIALIZED.  */
     machine_run_board_init(current_machine, mem_path, &error_fatal);
 
     drive_check_orphaned();
-- 
2.39.2



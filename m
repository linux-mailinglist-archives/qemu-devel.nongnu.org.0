Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9FE59180F
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 03:12:28 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMfhT-0000cR-Vu
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 21:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffn-0004yg-Lq
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:43 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1oMffm-0003GP-4u
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 21:10:43 -0400
Received: by mail-pl1-f178.google.com with SMTP id w14so2077897plp.9
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 18:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=TEHd4ZAuJdnbR0WlQ9ufodDYz6/UkNFQZuqgmJr3GAU=;
 b=FVW3yb46ofpNUyfojZ5JNeROMa6s2ZePXfdZXMsttG7Mkn7arS9DLv1niQttexxfLh
 HvfMejvqWddQwDuVgQ/+HyURLFGvMb4anKcIw969SvbWEZ4RNceZMRLJ6bbDL63e3Q+u
 eZy+7dmdI1zoBz/y6iOxnsg7UWkw9yxFSviBuKSGlIuJ+E8xVcBMalwA7KeTbn0mgcPH
 b8sszgSgy+O1jsQ2RWj4lQikAvh5B33wVyel9UfwUeGQwc+EuA9tn1NvZEscXzMfCbxq
 wzsCzwkl0iqOdhV1MwnGrwnX37vjDjj7DTgYSKonv082mpQXLuArIrRri8xFDmT+Xh0V
 7AdQ==
X-Gm-Message-State: ACgBeo2QDO+jQnIT2WF29EMOKqS/Gi8pv2kFUSXJdOtyNIBt1/bGq6fb
 BEzqYQqIDgj8VKXxFMS3k84oqaTsujoOpw==
X-Google-Smtp-Source: AA6agR4E9ncsVoCsLS26Pxwi3nINyeF1ONwhIdjEaLN2vQ/C/HP0l+CFAYu+l9yS1+lZIyB/KNZDeQ==
X-Received: by 2002:a17:902:b70c:b0:171:407c:e1bd with SMTP id
 d12-20020a170902b70c00b00171407ce1bdmr6562243pls.33.1660353040808; 
 Fri, 12 Aug 2022 18:10:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:642:4c09:6206:ddeb:f971:2f4c:7f03])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170902c94a00b0016dcfedfe30sm2440976pla.90.2022.08.12.18.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:10:40 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/3] vl: on -loadvm set run state to "restore-vm"
Date: Fri, 12 Aug 2022 18:10:30 -0700
Message-Id: <20220813011031.3744-3-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20220813011031.3744-1-j@getutm.app>
References: <20220813011031.3744-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.178; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f178.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This allows us to differentiate between a fresh boot and a restore boot.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 softmmu/runstate.c | 1 +
 softmmu/vl.c       | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 1e68680b9d..fa3dd3a4ab 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -76,6 +76,7 @@ typedef struct {
 
 static const RunStateTransition runstate_transitions_def[] = {
     { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
+    { RUN_STATE_PRELAUNCH, RUN_STATE_RESTORE_VM },
 
     { RUN_STATE_DEBUG, RUN_STATE_RUNNING },
     { RUN_STATE_DEBUG, RUN_STATE_FINISH_MIGRATE },
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 706bd7cff7..29586d94ff 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3131,6 +3131,9 @@ void qemu_init(int argc, char **argv, char **envp)
                 add_device_config(DEV_DEBUGCON, optarg);
                 break;
             case QEMU_OPTION_loadvm:
+                if (!loadvm) {
+                    runstate_set(RUN_STATE_RESTORE_VM);
+                }
                 loadvm = optarg;
                 break;
             case QEMU_OPTION_full_screen:
-- 
2.28.0



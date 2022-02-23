Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3654C0E69
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 09:42:30 +0100 (CET)
Received: from localhost ([::1]:36224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMnED-0004HN-6v
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 03:42:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMn8V-0003C3-6T
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:36:36 -0500
Received: from [2a00:1450:4864:20::629] (port=35774
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMn8S-00055b-HV
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 03:36:34 -0500
Received: by mail-ej1-x629.google.com with SMTP id qk11so50898001ejb.2
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 00:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHTbVHymlp+oeiezUYqjs6aXsv/+OHGyUtl0USzH210=;
 b=DQoxJh1tlsdxHl4E5XKSCnaxcKGoUxHe4EvLNqpuiLZAgm56tknhzivUbFjwTyQEzl
 hWpMh82Wv6yuIBjPPcY7xNY0ZqFflfOwvy2Ysy8Tv02xlQ/EnZ8B/jnqP4Ov0Os+elbW
 0mBzDtv+usdc1lgD94HiyizHEIPpmJdYjirvQaw4NwXyNAUILNklgI+918ESQbmwTrON
 eaRuAHjZGgNGYZQ9l619s0fmR82inRdUfnbPFBBHuuJ7EI/wugfiDv+XoC+AL73d+Ovo
 Ghp0V7oUTdZj8OUCTFYHYJT9942GrZRWTpJW4f47w8ptsTSrcp1PwSAPLPWmKQ4afrAl
 6R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=pHTbVHymlp+oeiezUYqjs6aXsv/+OHGyUtl0USzH210=;
 b=yZoV2MuaIqoFd2LUByyhG3bUy34yZ12Dzt5KQ+loXpzpB2ZjEQEJ+P6yB4X1b2M7dI
 jdJlM1+dIsfEPD644hmh5SpQvztauhaprvUeBt8IzofsAqkFnxNlbw5sEshRiK6T4h2A
 NhENDe5dW97iqRUyrtRuerPUUGsCFqv56JKtY5x/vYOcT/F4AZBTpEvNgZirxg7kMnIB
 bInEymesVic7FdtaHMeo8VDQzwgdjwN2b/nLBsh3DZEdeE5er03pD5wn4uuTXHT7s4zz
 O0x0YUnUbQbg09afuH0w5MSDmULK9rNTeOAs77tWJvkcbXZi5eyRjrBPBQbb1DUlIpXO
 I3aA==
X-Gm-Message-State: AOAM531vYYkKm4vR3ufMPig+8XqMX2NLPpuqsWQf6h+XN1EKWFTrr75W
 pNo6abME7tVDmjY4ffDT+oKmFcb3flc=
X-Google-Smtp-Source: ABdhPJzMWinLQ9/yQjoyChykLDHb2Fv+4m62iWw+VBZetxdAt3Lhbv9imy2+zG+UMzUwqcksdI0d9g==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id
 4-20020a170906310400b006ce6b85ecc9mr21740317ejx.339.1645605390156; 
 Wed, 23 Feb 2022 00:36:30 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w4sm11484995edc.73.2022.02.23.00.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 00:36:29 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] thread-posix: optimize qemu_sem_timedwait with zero timeout
Date: Wed, 23 Feb 2022 09:36:28 +0100
Message-Id: <20220223083628.231589-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Longpeng\(Mike\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this case there is no need to call pthread_cond_timedwait; the
function is just a trywait and waiting on the condition variable would
always time out.

Based-on: <20220222090507.2028-1-longpeng2@huawei.com>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-thread-posix.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
index f2ce47d36b..89c23f1d64 100644
--- a/util/qemu-thread-posix.c
+++ b/util/qemu-thread-posix.c
@@ -282,8 +282,12 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
     compute_abs_deadline(&ts, ms);
     qemu_mutex_lock(&sem->mutex);
     while (sem->count == 0) {
-        rc = qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
-                                    __FILE__, __LINE__);
+        if (ms == 0) {
+            rc = false;
+        } else {
+            rc = qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
+                                        __FILE__, __LINE__);
+        }
         if (!rc) { /* timeout */
             break;
         }
-- 
2.34.1



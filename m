Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847C84141D1
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:28:45 +0200 (CEST)
Received: from localhost ([::1]:35558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvkK-00040t-Jj
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWu-0001Mf-6t
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:52 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWr-0007Y2-UU
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:51 -0400
Received: by mail-io1-xd35.google.com with SMTP id d18so1869752iof.13
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C+QUksFYJBVgzYVm/3aEzfq4ZdDqNAp+FTVgi1Z07d4=;
 b=UND0PXOiiOFNGWcBVQESCGuvGjd77AUEEOK2v1aAKyc6yUGrbYEPrjb5g7VNbWoGwf
 dTHla6Fu2aVEatoldAuAZLSzEV+uD7PAnL7b/aZ8U6brWkk9ukBA6p2g4xNta+4MjCWG
 eYwbAcu7gniSlpwXuBvaGmjpl6BgZEc87l94mN/O768Ncm1rNKNKxSP3NlOMlqKaS4uB
 D1NVV9HwDmFuPX2vCfCoPN3nfmz0tbh6qRiuCloQ2v2IIqv38TdT5tehnj4ZUFdSJTla
 yoCITVZtoqJ83CjJtAKjN/bHiiGVO+jfJAOHV8vXG44opHRP2Rbi3zzqATbKLjnawllX
 94hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C+QUksFYJBVgzYVm/3aEzfq4ZdDqNAp+FTVgi1Z07d4=;
 b=lCm6ELpOD7L0BU3u+l9OUqd8Qu/8OVBtfJrWdUrAWaFT5hBSACKp9u1UTLs1HUlZUq
 I+OUGGEzMAR4NdOMFGG1gzR4khJ4ZIyRl7Shg7Nrw/njtSXW+jXlLBuxDP3uPvM7W+ri
 +093gB+HJgdzGS2dqUwfPsdMeEcNsyy/gkZPVpFny0+i9D6g4/syj0M6/gNIrsKLcTVJ
 XgwV6JCk0kl0YhLaCAhZ6LbQJ4mKe+CBAdHryhcGAYhK9EuddY8i2pxCj9bRDwKijLCV
 /05RYjPQIhZuzK4jH0ZhlaNq+2zbuEfErlVXtRKvTAfQuh9Hzq+8QVBevcgEMIm9dKXn
 dwfw==
X-Gm-Message-State: AOAM533rwQrsnUQjT/uf+yxiYC9dLqAXW4Gpig8TkXWD4oMtu/+N/B5B
 6xgxZPIP4d0AhnAdtO00eC+0diC34pTWJEXML0s=
X-Google-Smtp-Source: ABdhPJwAstGHcrqu/qTRxMuZ8Q77dy+HQQeyTR75bgAMB9DR+Wdqnk4wKb79/XlM/mWRQ/MXkZdj+g==
X-Received: by 2002:a5d:8b8d:: with SMTP id p13mr3045906iol.216.1632291288638; 
 Tue, 21 Sep 2021 23:14:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/14] bsd-user: Remove used from TaskState
Date: Wed, 22 Sep 2021 00:14:33 -0600
Message-Id: <20210922061438.27645-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The used field of TaskState is write only. Eliminate it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/main.c | 1 -
 bsd-user/qemu.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 48643eeabc..ee84554854 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -210,7 +210,6 @@ void init_task_state(TaskState *ts)
 {
     int i;
 
-    ts->used = 1;
     ts->first_free = ts->sigqueue_table;
     for (i = 0; i < MAX_SIGQUEUE_SIZE - 1; i++) {
         ts->sigqueue_table[i].next = &ts->sigqueue_table[i + 1];
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 22fc3a6c30..431c5cfc03 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -92,7 +92,6 @@ typedef struct TaskState {
 
     struct TaskState *next;
     struct bsd_binprm *bprm;
-    int used; /* non zero if used */
     struct image_info *info;
 
     struct emulated_sigtable sigtab[TARGET_NSIG];
-- 
2.32.0



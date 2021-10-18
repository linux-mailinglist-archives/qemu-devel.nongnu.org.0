Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA764323A2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:17:46 +0200 (CEST)
Received: from localhost ([::1]:36048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVKb-0004n0-GZ
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV97-0007l8-2W
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:55 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:40594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8w-00084q-8V
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:52 -0400
Received: by mail-io1-xd2e.google.com with SMTP id x1so16870517iof.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dKXTIcJctOXE/jsCcOkT7BJa9rm6vlffSX8NI3ogMM=;
 b=TXTxRLKNqyLBRUAUKk6/CPiBnScfy4Ss1Vb+l8vDqUDaWf/x5H0rTLdS4QTzvwbe5g
 Iowkl/+38OOsMy2yBtzXoBCpyL/VkxUdm35KQ9QQBkWpvMcLhfK25cxEg8BNXcVBVxRW
 qrQdlRlQXmrEh0ZHAJWj9CtwWEWgnpd8WBOtWOawbrHdhpVab9TU3DMWACbguqywRiVO
 43e1iXImAo6+2ZRicvBQS8k4lHYObmK5rTjCXa7OuTcOahL0iQ7zFjTD790NooN+uHgO
 uAjDGSIDH851rXbquaNrFve9qix9Vdpjb2YNm0+txEW231/tXjCUw+tcePe2nuIEa17w
 DNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dKXTIcJctOXE/jsCcOkT7BJa9rm6vlffSX8NI3ogMM=;
 b=eNp4E0mNhT/PySseMvpr5ZcMA/ukCwMSJI/2fJ+VFVPUdQ3Aj8wKCPTDO2ROHFG0KY
 vsuKaLIybX4m7Y0NB9rwBayVgPrZwJFgRQgIroTs74C+ycZtmjvu3lhWRA2vhI/VMm/l
 hBuLffLHgwjEX6pc8H+fVf4N+1WgS0ubI974BRrSRtDA3TKeLkrqoLUU99xDlbje3jkZ
 Hdiuh5Met11g0C7oDzxmhv5I70LX0avbgsEqzP9Urfw7n+MZ2lqBY8Ks0TPSqccd4wKk
 i1MccrITvGQbHEYFtFV0x6xQtI3EhGEhHjs6jFFhh0UDlsgzsMj/7MlmxFi5dPISCU6j
 MPIw==
X-Gm-Message-State: AOAM532nHdGW2fZfY38wx+wibBcRYc7+MwMWuW8Wr9vnJMqksr6T/QLD
 fxCMMJ0AvhzM6u8OJTveUwjC5IK3gEdVgQ==
X-Google-Smtp-Source: ABdhPJyc8jICMGvYRj2aYyS487+LpOqznX6oof8Se1cnGZnIhESY33Fgg564o71VSNsqHxyuPiHvzA==
X-Received: by 2002:a05:6602:2e08:: with SMTP id
 o8mr15291207iow.10.1634573133390; 
 Mon, 18 Oct 2021 09:05:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:32 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/23] bsd-user: Remove used from TaskState
Date: Mon, 18 Oct 2021 10:04:54 -0600
Message-Id: <20211018160458.1976-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'used' field in TaskState is write only. Remove it from TaskState.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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
index 3b8475394c..c1170f14d9 100644
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



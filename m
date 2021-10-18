Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C27E432782
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:22:43 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcYDa-0004dL-EE
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtf-0008R6-VK
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:08 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtb-0001xX-Id
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:02:07 -0400
Received: by mail-il1-x132.google.com with SMTP id l7so2644031iln.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dKXTIcJctOXE/jsCcOkT7BJa9rm6vlffSX8NI3ogMM=;
 b=Xa/xZRAdxg3Ps4yxMAf9i3Qx+riEAsB7zzJulNrByDaCHQ0xDF2ApWMnAQ0oESMhoI
 HBylhO+tEarMED2YPBSY4/XV5qtvHLbff+Nwz8+62WWu+7c74FjIpw4uhpvH0SGyiK6l
 340gEImFW87fO1bPfBWWSnrYGUiMhvYTxPgkEb0wsJUhZbOiZM950sSXK5M7P0Sv7U6K
 l3B6CrMxiPhlXTVko5Ap0PXQsyEw9odOTziB7vhjH75ik1S4F831wEeypCp7I+gx879e
 PfiEDd+IVgEvtg67tuJbybfeE4IkR242KVwN+cznjBp0weoib/8jzex/bxgL0HxclJFn
 WWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dKXTIcJctOXE/jsCcOkT7BJa9rm6vlffSX8NI3ogMM=;
 b=4fKoyy0A/3yvYm6unkw+EFRpSYqU2wLnvEPxrz8TPwIlQptybPwK2YDOBq1FsQDqp+
 KuxPyOsa/bXrUyc/+YDO0IqAtR52yZ5QfXLU9M6ohdR5HKUUqFqhszAYtSUOS7ETdpTD
 H8fcHdW7ihRMXFcUdJ1rTwybTVX0H9hGKcobIinY4EvK54RNR61SRtou4mmGmNUwwmT2
 Q2Je/t63qLl/534KiJsYvnRmKx8x/2I/mZCi3OwPS4Ft9l8j2A2xf7Jv52uY4vB3gdrB
 afPJ+nxMGZt32yE6zuzmr6RJgpm4G4U5/+F33JABkO0E2xjUQSgDtFLOpBCWi4fS64uv
 /AgA==
X-Gm-Message-State: AOAM533TFw5pPGvunjuj1l7yDQ1l4wRlfa+Jfpe1QYGtUTmkaHk+n78k
 DErsRPx1GMkgPCV6Dc5uVHEbFofW8jUYvw==
X-Google-Smtp-Source: ABdhPJyn8qGBCUqOtRX+FI3Thwl0y7SMJguI+XAmy9Jyi8ffNC0JAEwE5YNbNX156/EfIIwPNns9RQ==
X-Received: by 2002:a05:6e02:194d:: with SMTP id
 x13mr15493780ilu.266.1634583721974; 
 Mon, 18 Oct 2021 12:02:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:02:01 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/23] bsd-user: Remove used from TaskState
Date: Mon, 18 Oct 2021 13:01:11 -0600
Message-Id: <20211018190115.5365-20-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



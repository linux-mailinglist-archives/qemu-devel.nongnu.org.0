Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD75543E71
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 23:19:53 +0200 (CEST)
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz35k-0004on-Qo
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 17:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz335-00017W-7G
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:07 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:36856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nz333-00069Q-DO
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 17:17:06 -0400
Received: by mail-io1-xd2a.google.com with SMTP id s26so10390437ioa.3
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 14:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NavSdPo8FT9tgL7O1y4GHz2cTUNr6cPjcE/aghh8Xno=;
 b=IquNK5G5FFh1OEyf/hdIdsolRlAE0fMrY2i1W8EnXHYm6u33Fm+2Y47mvXjbtvrvT8
 O8JEj4O5UaQ5PjDecIM9M/uezzUi4xxjGuYQGUPhQtnXd1rM7EBnBgem1SrdFT3ilvJ3
 DwZv88Fw3wZa38mo2kWGbPOCd+CyPxbQgK8DVqdYtjzhwn/ORwM0FzQW0/B9jC354ih5
 xWd/HDGaPQUY+p6PJsFWkVkWJFy1m5zrSL09w9qOH8jfBko0yEd5rCJAg3dlPyfW9q0F
 hRfp3su+pdMez+0eCgml+ThyupbvUYKpcyUKPJsyQ128lPFYcUrArDzyNxvgPu/UeHg/
 I04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NavSdPo8FT9tgL7O1y4GHz2cTUNr6cPjcE/aghh8Xno=;
 b=mHhH3axqkSXjSBxoL9HyzFGQIK9qi+R7Qnwvlr62Xl4/KOolAxa42Mi2YzUWudJ6vP
 lLsQtmT3VUQUH4uKrHdZB9x+iODRudfH1XhgmQXVvxPmZ97Zz1/w4mSQLzA3qYNZrzqv
 G4r1MoAs4KmvZ5eJWImzDxD31WS8rNvTiw/RJ8wjzIumvSs6QeQBDleBc426fiSc2YJR
 Xl/ADqAl3JyfPYkLDNeKcyrIU6zqBMGhRS5MK6ta0tdJLOE8Ld+xLO++R8CVHECOnEzD
 LCzpnIPC3hJRVI/5K/MLf70CMj9APy0pEbeExX9aJOprwgqHbHbkeYXTq9w1sRf6bp1w
 euoA==
X-Gm-Message-State: AOAM532YMXjRQlPGyM6Plogtb96TMcZ5WTSMSWC6FkTPjqMqoqSvjLJE
 uJXQtoveyYR47xRhkXj3/NM8jeisdTlW5w==
X-Google-Smtp-Source: ABdhPJxQDGfsh69rGVLxuZsfCaDqxrH+7RE/1W7zW6PSD14zbPFCKFMvyDFv0YI/9tapUuWYVI9LuQ==
X-Received: by 2002:a05:6638:381c:b0:331:b4c2:1f93 with SMTP id
 i28-20020a056638381c00b00331b4c21f93mr8619980jav.185.1654723024085; 
 Wed, 08 Jun 2022 14:17:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k29-20020a02661d000000b0032ead96ee5csm8418552jac.165.2022.06.08.14.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 14:17:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@freebsd.org, Warner Losh <imp@bsdimp.com>,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH v2 2/6] bsd-user/freebsd/os-syscall.c: unlock_iovec
Date: Wed,  8 Jun 2022 15:17:07 -0600
Message-Id: <20220608211711.56158-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220608211711.56158-1-imp@bsdimp.com>
References: <20220608211711.56158-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Releases the references to the iovec created by lock_iovec.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 67851937a8f..52093d479d8 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -175,6 +175,20 @@ fail2:
     return NULL;
 }
 
+void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
+        int count, int copy)
+{
+    struct target_iovec *target_vec;
+
+    target_vec = lock_user(VERIFY_READ, target_addr,
+                           count * sizeof(struct target_iovec), 1);
+    if (target_vec) {
+        helper_unlock_iovec(target_vec, target_addr, vec, count, copy);
+    }
+
+    g_free(vec);
+}
+
 /*
  * do_syscall() should always have a single exit point at the end so that
  * actions, such as logging of syscall results, can be performed.  All errnos
-- 
2.33.1



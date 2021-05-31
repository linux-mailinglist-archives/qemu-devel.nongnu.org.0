Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40562395533
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 08:04:10 +0200 (CEST)
Received: from localhost ([::1]:41538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnb21-0007yE-CK
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 02:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnaph-0005je-Pg
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapf-0003xG-BD
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so272018pjz.3
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGM0A3xANIWNJBynR8wWOFO7oOccgAc2f90y4T8qD0s=;
 b=lWcbnTCu1XnMF/sAdZu9PEmwL8HywlKELa15k/0rh/ijHGQjFohDZugWqxMnDVSNDX
 zyO19G+NGe/9KuuMyQN40eQMd5TtWWwVTVSYnvRQX6WrfLX6nO3OJ7g3rpRmK6gO7pp3
 BvGdRrEQrwecKf28PW8B1rl/yK7FFLRDMiE5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGM0A3xANIWNJBynR8wWOFO7oOccgAc2f90y4T8qD0s=;
 b=bSXsZ0qQByoM81QQ8IMQzXJFYUSnEkvuot4b8GLMUCiPrCpfex1Yykwcizr0+2drK2
 17EWv6fy5mH1qcvtLpkIzzStQEWEUTM3ZsMQF7steP4YCgextbFMUVWGPy3NPVjksGxO
 RVlda3QISyfYN6G99TCafWKNsciUJQwagEgmCii2XAa2H8Rgk1M/zIHd+WO7ro1E8QfL
 h+nR36XcDnKW47Q7uuiXaFbNQxRc6kVozfSJCZc79K5/m66S8MfR4CU+TYUJkmcXPpGi
 mvIONgwvwkXoODmJTcO1+isXUenzZq/lYWC+ts7gVFGhrzlAYw25DItEtka+NEl2+fGJ
 cKAQ==
X-Gm-Message-State: AOAM530BkiM6OE+dQVavmwAHyRXwHLLaztRCc5ZzpOUnbTdYyL1Skb8z
 x6keZMF3dqA9VPzWFsaoHRFQgi6pJbPO1Q==
X-Google-Smtp-Source: ABdhPJyLpSjjwl6iUoESmDC4ZQT5BH1cefRcv1jHgk8e/4nB1my5tnNOju/b6ucDQRSeBzJQhqPvbA==
X-Received: by 2002:a17:902:9f83:b029:f6:5c3c:db03 with SMTP id
 g3-20020a1709029f83b02900f65c3cdb03mr19260040plq.2.1622440281902; 
 Sun, 30 May 2021 22:51:21 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:21 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 11/11] linux-user: always assume preserve_argv0 for now
 [!MERGE]
Date: Mon, 31 May 2021 14:50:18 +0900
Message-Id: <20210531055019.10149-12-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=yamamoto@midokura.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just because the kernel I'm using is not new enough.

[!MERGE] because this is specific to my environment and
would break others.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/main.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/linux-user/main.c b/linux-user/main.c
index be604a84f9..a3d8b7788f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -726,7 +726,38 @@ int main(int argc, char **argv, char **envp)
     /*
      * get binfmt_misc flags
      */
+#if 0
     preserve_argv0 = !!(qemu_getauxval(AT_FLAGS) & AT_FLAGS_PRESERVE_ARGV0);
+#else
+/*
+ * my kernel doesn't have the following commit. this is a crude workaroud.
+
+commit 2347961b11d4079deace3c81dceed460c08a8fc1
+Author: Laurent Vivier <laurent@vivier.eu>
+Date:   Tue Jan 28 14:25:39 2020 +0100
+
+    binfmt_misc: pass binfmt_misc flags to the interpreter
+
+    It can be useful to the interpreter to know which flags are in use.
+
+    For instance, knowing if the preserve-argv[0] is in use would
+    allow to skip the pathname argument.
+
+    This patch uses an unused auxiliary vector, AT_FLAGS, to add a
+    flag to inform interpreter if the preserve-argv[0] is enabled.
+
+    Note by Helge Deller:
+    The real-world user of this patch is qemu-user, which needs to know
+    if it has to preserve the argv[0]. See Debian bug #970460.
+
+    Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+    Reviewed-by: YunQiang Su <ysu@wavecomp.com>
+    URL: http://bugs.debian.org/970460
+    Signed-off-by: Helge Deller <deller@gmx.de>
+
+ */
+    preserve_argv0 = true;
+#endif
 
     /*
      * Manage binfmt-misc preserve-arg[0] flag
-- 
2.21.1 (Apple Git-122.3)



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B711B5BE757
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:41:41 +0200 (CEST)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadVM-0001u7-Px
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:41:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZh-0001Vx-Lt
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:59 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZf-00053f-LD
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:56 -0400
Received: by mail-pl1-x630.google.com with SMTP id iw17so1963295plb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Jt136OWsjti3Zpu3h4MXfORTFkV12nnDiDA1HXBO+Xk=;
 b=E/2vQAkyGF4Fz4XkDMYm7Xm66TNx1VIYbCcCf4g8nhXRgA/Q7pD9AbNbrtiifryHru
 zWKy2Tr277+tvxsiX+qndf1DABa1ny+CZwpuEYG9f/0pxO/fIuN7WAmIjJnGMjvSq7cB
 QjF6dqatgkIJxN9XFZ8g3VKl7IqgCkMQDVP2sns+eJL3RNHEoI0vGvzvyw5LeV+wwnlp
 bJLQgzmQvkBoKO1wuXim3RF9zl1B3FuwgpK8xG9Z239L6e+/kxM0SAU9742+ivcVkXwU
 fUYyVlKeyEJhjMHUsjVCjLoTe7AzGu2guq8r139yLcGtw0erAfx48p1WrsI4DCAMSiYK
 Z98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Jt136OWsjti3Zpu3h4MXfORTFkV12nnDiDA1HXBO+Xk=;
 b=MzWSK049INC0ht13phXXIflax3uXL67+R4WHg67Bpxo0nIhkS8UB0TP99lz3tRWOHU
 Jy7Cwq3uz7iHOzhj+BR4/02QtY2ixvq7qurIC8cYzIX0VCj2VcHXuoNa7S5R6vFPcdrI
 v9V6MDkxr/dp5p4PSMgZjVmOgjhvDVb5vO/y31v4d2aIZKPCWO5DZPRxMJFEr6iRryg9
 gGxL4yldNJGukwRyAjZhnEMlZVI8pEOoLHn7jQwKib0TR9RC0gTIA4ax/aKL9iaZyVUv
 gzCCAapIgKP85FBmFzxTckaaZnbyLHcDOI8WTEIRpvzQMc7CMDX6oqGckmL1wa+nZyx2
 D7IA==
X-Gm-Message-State: ACrzQf3jA1n5ZwMbQjGG5H6MnRlZWScuGIwSlp5YtQKQ5ENo8JlgHHvn
 v/Hc2IOJzx/JpYcXhnOU5aDEXId5hiI=
X-Google-Smtp-Source: AMsMyM5qoOuwyLoV9iQxA+wL0iWPNeGw5oC5ZV4yBkJ22MZX31YGHXDJ8wg2YAixl/N488JqPIh1kg==
X-Received: by 2002:a17:90b:1c07:b0:200:9728:b8cd with SMTP id
 oc7-20020a17090b1c0700b002009728b8cdmr3215995pjb.139.1663670034210; 
 Tue, 20 Sep 2022 03:33:54 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:53 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 38/39] tests/qtest: Enable qtest build on Windows
Date: Tue, 20 Sep 2022 18:31:58 +0800
Message-Id: <20220920103159.1865256-39-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Now that we have fixed various test case issues as seen when running
on Windows, let's enable the qtest build on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- new patch: "tests/qtest: Enable qtest build on Windows"

 tests/qtest/meson.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 455f1bbb7e..ceab141824 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -1,6 +1,5 @@
-# All QTests for now are POSIX-only, but the dependencies are
-# really in libqtest, not in the testcases themselves.
-if not config_host.has_key('CONFIG_POSIX')
+# Build all QTests for POSIX and Windows
+if not config_host.has_key('CONFIG_POSIX') and not config_host.has_key('CONFIG_WIN32')
   subdir_done()
 endif
 
-- 
2.34.1



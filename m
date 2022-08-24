Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D296759F803
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:43:32 +0200 (CEST)
Received: from localhost ([::1]:49026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnr9-0006r0-VQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuN-00040m-5O
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:47 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuL-0001Z8-I1
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id f21so16511832pjt.2
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ZMTvAyZuMin22FzdWCyxbO3Nu5c2nRBEHD5FUVRQ7yc=;
 b=Y01zgjERpQES6bO6YeaIYqLerOel2Luq/wOKifwLKj70Fzj/fwLs+4HFsvoyaY1F5r
 UaxOEl8bYlJSK2o2AyULTuON9ethgWmP8PYG6n+8orAw2wWLTvkq+GcNaT3V/4lCh98k
 qmNKSVPryPBZbeKD2lDtxkA0uN15p/oWvYH61i343EbUhlEOZ9SzMEZL9YTwKELcjasY
 E52ujwxgnF+tefJZ1ZMXXdkSvqzqDW61dOOEdguQ84GtYZDy/rNy+4jjUrb3OQKN6skK
 KxI/XZeRqlvY2pwUq3/CYR0PQ6unO8MNBCCvtRO5Y+q0DD9bYMuQ67NzVz7UE7ZYGoL9
 5iOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZMTvAyZuMin22FzdWCyxbO3Nu5c2nRBEHD5FUVRQ7yc=;
 b=kHeAbBVAkNziuS81iLYlucwRnA3c4zQSORo7HkRtLPaxHVg3omRl8cIbg8tq67vUfI
 xvM2EsHtgeFyI38vWpSCl4rOiR4nvEVEAIBh6r+1X4+ed1LngEknLKaysTx5LcPz8yQ8
 Zl1t91E3Eq9TctUIF0sZfWqZTtoLjgM765W46/3nyg75KhSJQ5fb9QNlJ134uJx3l7DG
 6ONLm5bGwQPTtopri0k1kNUh7SFOE0k6DZlUkmFS2rwYOhfENydVhmCXRueTQgs0zeCe
 jklWAQljEl6r5cYrq2QHeSC0NqSIipZabLdTbrdtsMIdNxOwiUVUoX1TcsE7dSzxFonE
 FRhw==
X-Gm-Message-State: ACgBeo1KW/duWGcwjSfmtgp1kje6IPcX+kIEt7G8zC6YfHf93jGJxI5Y
 I4btZjw5vBaJUZVtRG/K05WfdhIR6eI=
X-Google-Smtp-Source: AA6agR5JY7gv4+4mKWYWp2YARd9r4xpdqubJztnuKLZdTxq5H6A3di7v7WAz8bRgrt4ggvsrJQzD+A==
X-Received: by 2002:a17:90a:17e1:b0:1f2:2ff2:6cae with SMTP id
 q88-20020a17090a17e100b001f22ff26caemr7495766pja.196.1661334164143; 
 Wed, 24 Aug 2022 02:42:44 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 26/51] tests/qtest: libqtest: Move global_qtest definition
 back to libqtest.c
Date: Wed, 24 Aug 2022 17:40:04 +0800
Message-Id: <20220824094029.1634519-27-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Commit dd2107497275 ("tests/libqtest: Use libqtest-single.h in tests that require global_qtest")
moved global_qtest to libqtest-single.h, by declaring global_qtest
attribute to be common and weak.

This trick unfortunately does not work on Windows, and building
qtest test cases results in multiple definition errors of the weak
symbol global_qtest, as Windows PE does not have the concept of
the so-called weak symbol like ELF in the *nix world.

Let's move the definition of global_qtest back to libqtest.c.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqtest-single.h | 2 +-
 tests/qtest/libqtest.c        | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest-single.h b/tests/qtest/libqtest-single.h
index 4e7d0ae1dc..3294985d7b 100644
--- a/tests/qtest/libqtest-single.h
+++ b/tests/qtest/libqtest-single.h
@@ -13,7 +13,7 @@
 
 #include "libqtest.h"
 
-QTestState *global_qtest __attribute__((common, weak));
+extern QTestState *global_qtest;
 
 /**
  * qtest_start:
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 34744ace7c..909583dad3 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -65,6 +65,8 @@ struct QTestState
     GList *pending_events;
 };
 
+QTestState *global_qtest;
+
 static GHookList abrt_hooks;
 static struct sigaction sigact_old;
 
-- 
2.34.1



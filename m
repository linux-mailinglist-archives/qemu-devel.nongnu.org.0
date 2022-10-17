Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E1F600E35
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 13:53:47 +0200 (CEST)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okOgk-0004Yi-5x
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 07:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okOaE-0003uR-JZ
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:47:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okOaC-0000YY-P2
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 07:47:01 -0400
Received: by mail-pl1-x62c.google.com with SMTP id n7so10546074plp.1
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sz39aI+8kIgh6asFIG5zn5AtcqBaxTiIVgi7IhMIlFg=;
 b=eozwNccRqJIxNPv22TtrU3n4ATteqbOb4AF0cej29H/9fVs6L/AXM8y+nlAGGEeebx
 LBr3GIMBFCVNjXu473kT3z+OD2cTMHwxOZgG3tpowsSZCkUJMoJ2ne6hfuKwoDaDlEK3
 AWVPI6VpbYSoAk5kmsmGsayQMvRzKYlfxUicE/M0gvLt0yoHsylMUjGZGPTaK73YufyL
 qLmGV9KxWqohzem2zBpqr52kAg+dlDKOPWg73BxgSqhQIw6bSU2lzcwMafPX1U5MpFIh
 OFJes+ruryZXxxNhQY6zH8UKskam0wxRPoNYQS84WGtDSIoYPwHesa/ReswRW4/EdlKT
 v+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sz39aI+8kIgh6asFIG5zn5AtcqBaxTiIVgi7IhMIlFg=;
 b=qbVhrBFN4FuHPjlCKEIkbGhIAAhb4hWh0w+Z5HI6GZXf5vq7ZQDeWHvKIviYlU6CZs
 EumJEaBtjPOYbKz/RvLH/ZcnHgigVVxNyHjTrK7WkMEvKn/m7Uuxr6nI5cMyuv6G1D9x
 ifIyTucAnJCLUtTW7Dok0eaWnGhPFaF2o5dnGx0NlH4uDtj6DyYqbpOQpIFRn6rj3E7r
 hYX/0j9i01moeBKcn/w4Bhcx+9k/GqMrvaHU6dJIzb2WW6C9Aej2Zv2dHK4ASMRMkE0R
 tZGbgKbTBT+VCjxZYlvNeWp0r0eeys41Xm4/QNIVmmUQ6Mtnt3lnF4yUQqX9JeNSiQmY
 8g7g==
X-Gm-Message-State: ACrzQf3CKsGdjpz3pvTGnc05jdbtjyuJHgE3TxFYtf/ntn+A5R1mfxbD
 4YuUaZ8Y5WbfSq0SfyYnGIXUBJn8qF8c5g==
X-Google-Smtp-Source: AMsMyM4dq9nhKZOAddx82AJe3zuDZ8MLCqgmWfacDbc2HdWB0ihuACRzwvmDDHrzEilTg4pvSSn9uw==
X-Received: by 2002:a17:903:120d:b0:179:d027:66f0 with SMTP id
 l13-20020a170903120d00b00179d02766f0mr11570743plh.61.1666007219190; 
 Mon, 17 Oct 2022 04:46:59 -0700 (PDT)
Received: from ubuntu.. ([65.20.73.185]) by smtp.gmail.com with ESMTPSA id
 c28-20020aa7953c000000b0053725e331a1sm6870382pfp.82.2022.10.17.04.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 04:46:58 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Shengjiang Wu <shengjiang.wu@windriver.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 2/2] tests/qtest: vhost-user-test: Fix
 [-Werror=format-overflow=] build warning
Date: Mon, 17 Oct 2022 19:46:47 +0800
Message-Id: <20221017114647.2226535-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017114647.2226535-1-bmeng.cn@gmail.com>
References: <20221017114647.2226535-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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

When tmpfs is NULL, a build warning is seen with GCC 9.3.0.
It's strange that GCC 11.2.0 on Ubuntu 22.04 does not catch this,
neither did the QEMU CI.

Reported-by: Shengjiang Wu <shengjiang.wu@windriver.com>
Fixes: e6efe236c1d1 ("tests/qtest: vhost-user-test: Avoid using hardcoded /tmp")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/vhost-user-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index e8d2da7228..819b87df3c 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -571,7 +571,7 @@ static TestServer *test_server_new(const gchar *name,
 
     tmpfs = g_dir_make_tmp("vhost-test-XXXXXX", &err);
     if (!tmpfs) {
-        g_test_message("g_dir_make_tmp on path (%s): %s", tmpfs,
+        g_test_message("g_dir_make_tmp on path (%s): %s", g_get_tmp_dir(),
                        err->message);
         g_error_free(err);
     }
-- 
2.34.1



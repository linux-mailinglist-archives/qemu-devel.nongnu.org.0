Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7C59F738
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:14:49 +0200 (CEST)
Received: from localhost ([::1]:37544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnPN-0003Cz-2R
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmul-0004Og-5m
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmuj-0001h0-Ki
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:10 -0400
Received: by mail-pf1-x434.google.com with SMTP id y127so13001004pfy.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=0zcu0n9LW86iNDYo0FnxWs0JURAtkjxHBse1nGh+orQ=;
 b=jAwRr3TJdj3E6aVSq0FR8RTUwDndv30CUAf843Oedit4lvZXFumH0KMAJ9Qme4LYFI
 tX9CMpf4P09Nef4WvMHk6ma6jrQf1SzyWdjhGUbxjgnGJYcAP+ktcc8tuB5qFWSU5OUa
 pUdBm4AA1a1uOB6K8sVoE4qBg/3BvmOcCqF0+jBIHUwNKhP1hWXJIA9BR/ofgh2dgg1p
 vwXMLh4dQVv8kcvkOx/CPKagLBsdNY7h9wex1EyF4PJ9QFCJ1jz5aR89X6JOSCfl2WOY
 fiqbbAQ9JPiSzD3j7umzxAiRpx6HvbExhd+DUdH1Y3Lr9YUeWrsBMw5AUS1FRdvJvrXQ
 wm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=0zcu0n9LW86iNDYo0FnxWs0JURAtkjxHBse1nGh+orQ=;
 b=rqTYVsDjhZM/GqNrPltV7tqvnHmZaaIFHP9yINqSzJjsLJ33DhpVZoFVuwTttuWV9E
 Uj9v7IULFrzGAK1u1mGpNXsGuKIdMUcMo9UjZilZ91MmoC11GfhqsyeXapiUv92hdj4x
 3FrLbn7X/JtW7ZsF3cT7Lj9/94Qe9BkPM8V+DNr1aUIhqbpbpGHChN+wGmecXDFj/KJe
 ZeUdNgpM6t0mXWGxBcccB48/y/wY1LxMQhLT7PKt9xje4sj5z1DZQKeuBAoB/18EtoaE
 Tr6KteFekajMNU/K8lYcYktz/Iicy/enCMESBUIsjMuXc6d9oP1RcrkUe6LV5SHRhjYZ
 eKxg==
X-Gm-Message-State: ACgBeo0ADgJvGe/CxKvlpZPe5TQ+HaL6rWLwqER6xewOb7X07XEkB9Bj
 cvI52fzZQwp75hre8EEMCUfL9ofwMpU=
X-Google-Smtp-Source: AA6agR5q/NqyG0wSZNYTpwWW43l0RKmfKOF48j5KkwZP3MokFVf/vXIjLwIsga03EQJpzZXl++xalA==
X-Received: by 2002:a63:5912:0:b0:42a:dcc6:210d with SMTP id
 n18-20020a635912000000b0042adcc6210dmr7470279pgb.50.1661334187964; 
 Wed, 24 Aug 2022 02:43:07 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:07 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 36/51] tests/qtest: machine-none-test: Use double quotes to
 pass the cpu option
Date: Wed, 24 Aug 2022 17:40:14 +0800
Message-Id: <20220824094029.1634519-37-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x434.google.com
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

From: Bin Meng <bin.meng@windriver.com>

Single quotes in the arguments (e.g.: -cpu 'qemu64,apic-id=0') are
not removed in the Windows environment before it is passed to the
QEMU executable. Such argument causes a failure in the QEMU CPU
option parser codes.

Change to use double quotes which works fine on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/machine-none-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index f92fab479f..31cc0bfb01 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -81,7 +81,7 @@ static void test_machine_cpu_cli(void)
                 " add it to cpus_map\n", arch);
         return; /* TODO: die here to force all targets have a test */
     }
-    qts = qtest_initf("-machine none -cpu '%s'", cpu_model);
+    qts = qtest_initf("-machine none -cpu \"%s\"", cpu_model);
 
     response = qtest_qmp(qts, "{ 'execute': 'quit' }");
     g_assert(qdict_haskey(response, "return"));
-- 
2.34.1



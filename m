Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06340559CAB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:52:31 +0200 (CEST)
Received: from localhost ([::1]:48562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kfe-0003VS-4a
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4keK-0001xi-Pq
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:51:08 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4keI-0000Vz-N0
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 10:51:08 -0400
Received: by mail-pj1-x1033.google.com with SMTP id p5so3023586pjt.2
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 07:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=so1aZRcDpyrdxlBJDv3CBb5TATsqmUYPZ6aYDaBQuyc=;
 b=Sj69NyUd10aZ75SzMSjwR9/5emTydK25Hg9vAB8r2kdgXoFYvh9KSrruWz9QxnL5/i
 cSX1R+of3iNdQTnbpfsXmL3P1S0SJKJSdHx9+sMaWGB2z4CE7wBWej1bsNy7907XiTO3
 z35XW49fwVsBH2HQ8cQCXAqi6pCSkJxb5HgtmeA4VoC3vTXEnLPvcTcKdtGVp8+5mSgb
 D0886HIfcbSjorfWGJhk3dAMwnEg+S2ZVdW7pDO3VytQy+PMd242YdqBBfHqPIsbc4q1
 oklj+pzomjfHOZ9IqlnJEVK0NU1dybtr/tQUEmC6PfqumrVQHq5jfCe6ZFLwtoLc4MkP
 uvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=so1aZRcDpyrdxlBJDv3CBb5TATsqmUYPZ6aYDaBQuyc=;
 b=3FbtGmtuBo1aUEBBpnJviqMIbQD7o0D1+MBBY/nDA7jvk1obcrWbJ3hqpqVu/Q1Fba
 Sjp8CjG6i26GuBYtqpIzEvcfipGAe/7yv7PdsSygHGh0VEVh/6J9DIK6Cw4jdaAJZFZ7
 6n7JJIVk9MNILNciCh18WRQHSriHHYtSdcMQn7uTLMEd13YBfiGh8JX3sBd4iKYoxQ58
 pIVcT4ruxycM42b6H6KQPTmBYrfwG1RGc9CIBH0hKxCDA6j1VIZR7XwIRkT6kDQADXHA
 Na6hrpq5hnyJ1NJ0R7RqGm+8cy0bKrg5ADfGz4O5tPvdpOJTRNV8oWxHrqvODuYgKf+j
 PcIg==
X-Gm-Message-State: AJIora94ks/9c5Rr0IvJJcwfmkeVg3+I973xULQaL1CXy3LY9oYpxGzt
 jrkqqC98sp2tDJIGTL5l+6I=
X-Google-Smtp-Source: AGRyM1uX6zVs/Gc/Mo7D1O1DfXo7EqvFZtNEQtjdxdPGwjt03akGZ9PmAKVS9nGHIYhoYsezUsV7OA==
X-Received: by 2002:a17:90a:f485:b0:1ea:8f31:fd4b with SMTP id
 bx5-20020a17090af48500b001ea8f31fd4bmr4435213pjb.102.1656082265021; 
 Fri, 24 Jun 2022 07:51:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170902ee5400b001690a7df347sm1921125plo.96.2022.06.24.07.51.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 07:51:04 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v8 4/4] module: Use bundle mechanism
Date: Fri, 24 Jun 2022 23:50:39 +0900
Message-Id: <20220624145039.49929-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220624145039.49929-1-akihiko.odaki@gmail.com>
References: <20220624145039.49929-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1033.google.com
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

Before this change, the directory of the executable was being added to
resolve modules in the build tree. However, get_relocated_path() can now
resolve them with the new bundle mechanism.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 util/module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 6bb4ad915a1..8ddb0e18f51 100644
--- a/util/module.c
+++ b/util/module.c
@@ -274,7 +274,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
     }
     dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
-    dirs[n_dirs++] = g_strdup(qemu_get_exec_dir());
 
 #ifdef CONFIG_MODULE_UPGRADES
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
-- 
2.32.1 (Apple Git-133)



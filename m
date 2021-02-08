Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C336631424B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:52:28 +0100 (CET)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ESJ-0006l8-Ri
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCJ-0002sZ-NT
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:43 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40447)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCF-00063L-QY
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o24so42222wmh.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6i9W6OOUOf+/H2AgjkKfRW+CSfY5qPrCTrtVFBIN+NA=;
 b=bGRLDat7YmehzyXmbYcs2xjOIumBX+sJhUbKkeqa7nAvQLiec9mow4C3GUID+beRbj
 n0EbTcOTzY8YWJIy4xhoGldU701ZakaaYi+8y6Tiu1umYmmrpd0mt2fFDs6CY29ytWbL
 ryDOh57gEITDwxzav3Hp7kTBD0LStC0bhrbFYtkNm0uKrtgrbHthNOxt3tdjZbmOOkSs
 dJOJ/njfMwoxr7S30Mret1WxAKKQW/QWpLlc1uQM5DFePy/ucDYhvZgJUqa8bOXGGsUq
 eT7S2GhnubHwFLN6giefMAcQcodTO5YHpCRBaO1bzOyjEVwypRpBEadT9m4QsrfNhlbr
 3dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6i9W6OOUOf+/H2AgjkKfRW+CSfY5qPrCTrtVFBIN+NA=;
 b=mFKia7eZHcSBlqXwJswz7RQyRIccacTZA2KnvWrDfXDqLsvDr9Ah310KGtP/o1qtCV
 UM0a32S2A3EhSJ9L1YQEWYbP9Dj4glk8Cw7C80rb3Dby22UHqi7/cb8mRUbAwkmH/8bg
 2KLhky55rN9Pr/q0Nqmjh4DFvo4AtRwClByggA0Zqc4E1EdiJVtzuhSbpHvBQG/IamtG
 DphF9m+/PdHMnMIbllWMsV8Sq+++JDXAJOX1BCAgt/5KrGpHUGim3qvyVP17pZuk8n8A
 rW7R1aNLa+LWeAuq0EHTdMnYJibGG+yTyOZO6ZPwSsDscVsmG1iQzwxR12VrBvFlbhPf
 4Rlw==
X-Gm-Message-State: AOAM531qsIuTS5zAMgYKEsnwwuKnNHGQWVRxx5SAFvXFIo+Lwnbh5hWU
 xsqnKVELLLevptUwMM4TsaNjqwojkYnO6A==
X-Google-Smtp-Source: ABdhPJyLgnpnkurvyBh/PKAgub1APy2s7L0KkzZHSeDvnNOdXuFGseI3yhaTzXADHKREp3RHvv7GEQ==
X-Received: by 2002:a1c:7f83:: with SMTP id a125mr35645wmd.141.1612808618486; 
 Mon, 08 Feb 2021 10:23:38 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/46] fuzz: enable dynamic args for generic-fuzz configs
Date: Mon,  8 Feb 2021 19:22:50 +0100
Message-Id: <20210208182331.58897-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

For some device configurations, it is useful to configure some
resources, and adjust QEMU arguments at runtime, prior to fuzzing. This
patch adds an "argfunc" to generic the generic_fuzz_config. When
specified, it is responsible for configuring the resources and returning
a string containing the corresponding QEMU arguments. This can be useful
for targets that rely on e.g.:
 * a temporary qcow2 image
 * a temporary directory
 * an unused TCP port used to bind the VNC server

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210117230924.449676-2-alxndr@bu.edu>
---
 tests/qtest/fuzz/generic_fuzz.c         | 10 +++++++++-
 tests/qtest/fuzz/generic_fuzz_configs.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index deb74f15be..ee8c17a04c 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -933,12 +933,20 @@ static GString *generic_fuzz_cmdline(FuzzTarget *t)
 
 static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
 {
+    gchar *args;
     const generic_fuzz_config *config;
     g_assert(t->opaque);
 
     config = t->opaque;
     setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
-    setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    if (config->argfunc) {
+        args = config->argfunc();
+        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_free(args);
+    } else {
+        g_assert_nonnull(config->args);
+        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+    }
     setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index aa4c03f1ae..51e69c6e42 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -16,6 +16,7 @@
 
 typedef struct generic_fuzz_config {
     const char *name, *args, *objects;
+    gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
 } generic_fuzz_config;
 
 const generic_fuzz_config predefined_configs[] = {
-- 
2.29.2




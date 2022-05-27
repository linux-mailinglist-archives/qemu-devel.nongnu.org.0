Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090D5365AE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:07:47 +0200 (CEST)
Received: from localhost ([::1]:47762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nucV8-0005qe-HD
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:07:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8D-0002fc-6h
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc8B-0003rY-L6
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:44:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f23-20020a7bcc17000000b003972dda143eso4775330wmh.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4ZfyQsK+jLR+M+g/m37Lnp4AtCadWbvQiM1EvX9WTo=;
 b=DObNlR7xnYMKdtAo9Y9ZtNrKhNTkVDfVe4Q3OFsh8X3/eZI8eD5F4J38Y7VMQYB5sX
 1UIK8cVKsVK1QibTQu92mkh7Hpu5N2rLllRwKIpT6JGNBsoG6dTu1P4C3WkWZ/UHbEwN
 hO7AbmJizLJ0BqO20asv8S4lMPCHv+DK8vGzJHClFHXtnfR3Lijw5KnIGE0Sb0t7SSgG
 rfbAqXh+cWxx6f9F433mKzexjeQxVyYcUa7mtHfZ4lNQEmsmyqFwemBWGdkKeTmFOdld
 i8vSaNesyPoFJPf8RFvt4m1CL5r8e+jz2eh1Lb27uKWPEAli3cpumIjQNoDUIbzGb1G4
 iyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4ZfyQsK+jLR+M+g/m37Lnp4AtCadWbvQiM1EvX9WTo=;
 b=NyBVj3K9MBffgiRGy6cU/bbPD0pxuaCLSSYXkEe99dsAcjq9gByZb+VGBz4nZ98vLC
 pDBHxG/ORBPd4YI6WyUkQ3KXkY6q9rZ0Vet8dWackFgXEhZEJEi/2u1HCsSDXLXvTGYN
 OMmRFBzopvQhc3wIgPP2cNb6E+MERHz24ID/mI/1Ctp+UAwW3ZduNRKQAZgzGaIEmTQL
 0SHDIg+YqeBQZZqE0ylmPiyOAQ9EyAuyo7oBvYYBwEmPCkdJZaos32UdHNST3aGcbY7t
 shjSAidbcxGe7L1r/oZ8c+K/BJMOOcsrWvPb2564hHQMq1h5Y7wgeXIaXIyhtxlABu4s
 biew==
X-Gm-Message-State: AOAM530brUVLK7V9iad9NmNhxFSqrCwHmwtjXtVWwFZbz/7unPfgspqX
 gUs4LSGUd/Q+lHI0ON4zCa4m1g==
X-Google-Smtp-Source: ABdhPJwT3fN6bEAAKDp5QteW3DNi2mZsqP4iJAtGgvH6cvLfme0GM/IIV+NnazVBD4xmiNSUIdnQQg==
X-Received: by 2002:a05:600c:2e14:b0:397:5a83:6578 with SMTP id
 o20-20020a05600c2e1400b003975a836578mr7535176wmf.201.1653666242196; 
 Fri, 27 May 2022 08:44:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d584b000000b0020d106c0386sm1990433wrf.89.2022.05.27.08.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:43:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3034B1FFC7;
 Fri, 27 May 2022 16:36:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 15/33] build: do a full build before running TCG tests
Date: Fri, 27 May 2022 16:35:45 +0100
Message-Id: <20220527153603.887929-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Paolo Bonzini <pbonzini@redhat.com>

TCG tests need both QEMU and firmware to be built, so do "ninja all" before
trying to run them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517092616.1272238-5-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index ec84b2ebc0..72ce0561f4 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -57,7 +57,7 @@ $(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/
         "BUILD","$* guest-tests")
 
 .PHONY: $(TCG_TESTS_TARGETS:%=run-tcg-tests-%)
-$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-% $(if $(CONFIG_PLUGIN),test-plugins)
+$(TCG_TESTS_TARGETS:%=run-tcg-tests-%): run-tcg-tests-%: build-tcg-tests-%
 	$(call quiet-command, \
            $(MAKE) -C tests/tcg/$* -f ../Makefile.target $(SUBDIR_MAKEFLAGS) \
                         TARGET="$*" SRC_PATH="$(SRC_PATH)" SPEED=$(SPEED) run, \
@@ -74,6 +74,7 @@ $(TCG_TESTS_TARGETS:%=clean-tcg-tests-%): clean-tcg-tests-%:
 build-tcg: $(BUILD_TCG_TARGET_RULES)
 
 .PHONY: check-tcg
+.ninja-goals.check-tcg = all $(if $(CONFIG_PLUGIN),test-plugins)
 check-tcg: $(RUN_TCG_TARGET_RULES)
 
 .PHONY: clean-tcg
-- 
2.30.2



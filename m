Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C9A42BB47
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:16:05 +0200 (CEST)
Received: from localhost ([::1]:34276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaMl-0002fn-6U
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEc-0002C0-3h
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEX-0005bx-Tv
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:36 -0400
Received: by mail-ed1-x52f.google.com with SMTP id w14so7161038edv.11
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H0+ITqm7hx9kuwpqKK0wFnUKiCP3pA/P6YqdcV8LmWc=;
 b=BuVPJ/zKtYPlfT4eqJinhPbuHGAXgCuUtbyRPAHj73XuXM83Yq0917/AS0EPPGG7og
 wFlrnnQ4B0alstv7KnWemouQwc5WxvDi1Oa2mGGsRMdrljB1WU77DVvRmj+GxgvsTG1c
 aXPiVHvRCAsNT48q8sGbgLlBiCr/04hdxemZja8zJxam4mrPr+tgwLuATW4yqtxjBGiA
 eGDPXpZ7Xa8ztmI3MzoSOZghHNGSXgUrR8yeiQpRHQKKiBk5dE4HiTgn6rwNwTCOmfLB
 5U4lNOIWUrLmZRl/oAI7XOv1JF9H22ljeCKAAK+wrr3pceCPcev0X8+QsYW+kj8VvKVN
 vNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H0+ITqm7hx9kuwpqKK0wFnUKiCP3pA/P6YqdcV8LmWc=;
 b=b+4BqwpFkjVP+Bkk3faKA2vKjECHFL1EyBqq5PHGtAL6r693xkbXNPWabcEySpRrS8
 Fq52KCCwktjiPnO25q327L2sZwG0+yYo3Obf7NvW81t52PS04ETqQhAUbw0OD3FzUqBs
 fp5CQ5uSUBdldonbI7eLcu2Ux6moDBxwcpBp0tpBtpxvmq51++KpAMv7tpRfpzOx/a+U
 nPvxxK6CHy9DxXXNNT0kNuLRyjadTj/sHXTIjjDAkKRL2AKRIpYA1T5NlM9KMFYfQJ8y
 DtBgMcrQ6gwwqXGQLM5VKFFoFy3mYZqynEJKmBdI2vF6PdW+mm9YnKPk9hXwaTe6eRfJ
 54CA==
X-Gm-Message-State: AOAM533WBarlWAkOZAicntpqdOf1Mr3qZf0pqJHBt+e7DntCIMLGyeTH
 WqGoJ+SWi1KFfCmahEbA5uPIWqpBhz8=
X-Google-Smtp-Source: ABdhPJwktlg48fyu0xZERwvBquOwL4er0a5/oZN2LRqQ76sOyVxn1aUSOLRs+s24PxCCtWHC5H2ZRg==
X-Received: by 2002:a50:fc8e:: with SMTP id f14mr7819248edq.87.1634116052158; 
 Wed, 13 Oct 2021 02:07:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/40] build: fix "make check" without earlier "make"
Date: Wed, 13 Oct 2021 11:06:51 +0200
Message-Id: <20211013090728.309365-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"make check", if not preceded by "make", will not build the tools
needed by qemu-iotests.  This happens because qemu-iotests, aka
"make check-block", is not yet part of meson.build.

While at it, remove the reference to the now-dead QEMU_IOTESTS_HELPERS-y
variable.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/Makefile.include | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index cc1e4f2c07..8434a33fe6 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -150,14 +150,21 @@ check:
 ifeq ($(CONFIG_TOOLS)$(CONFIG_POSIX),yy)
 check: check-block
 export PYTHON
-check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
-		storage-daemon/qemu-storage-daemon$(EXESUF) \
-		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
-		$(filter qemu-system-%, $(ninja-targets))
+
+ifneq ($(filter check check-block check-build, $(MAKECMDGOALS)),)
+ninja-cmd-goals += \
+	qemu-img$(EXESUF) \
+	qemu-io$(EXESUF) \
+	qemu-nbd$(EXESUF) \
+	storage-daemon/qemu-storage-daemon$(EXESUF) \
+	$(filter qemu-system-%, $(ninja-targets))
+endif
+
+check-block: $(SRC_PATH)/tests/check-block.sh run-ninja
 	@$<
 endif
 
-check-build: $(QEMU_IOTESTS_HELPERS-y)
+check-build: run-ninja
 
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
-- 
2.31.1




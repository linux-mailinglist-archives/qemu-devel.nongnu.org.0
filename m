Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3C32DFD14
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:56:23 +0100 (CET)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMbm-0000ee-6L
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQk-0004jJ-Ns
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:00 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQi-0007el-V5
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:58 -0500
Received: by mail-wr1-x429.google.com with SMTP id i9so11317874wrc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=joAl+PLtHiQUiU+Ypj043BdhAqkjCAPS2HAV23WoUs4=;
 b=Z16ZXaTwoqHJttCCLhb71YS2/McBCE7pn7LYP8uPFC49OqyHn7nM0hjxbYTH7taip3
 L5BmVrRG78+CKP1lApwhbpPOcflmfNGOthKMBWnPQto54nqgV4M9vi1VAjXC25eFXYZe
 +JwpeUbbysPuA9dVHbHsUo4AJPvrQeHF5COGQ6R36tP/obbNxG8wutGWHyeTLBbFpuuj
 dgqE7tLHQtCg0p0frCu4y9PgtRD1J4EDuXRvbZAy8bObDEGUycT1lLYpHXkrzTm5dL0b
 L9P7vKFizlK8EXBdvfuKbiOuhWV350PM6UBjUTkz5zrAN51rCZ7eTaijDNFeU4jYbO11
 DGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=joAl+PLtHiQUiU+Ypj043BdhAqkjCAPS2HAV23WoUs4=;
 b=r7HSmO5HleTEc87jCGkSLZlMsdZxaulVyLR4wgNwnBv/N7tYsu8y4smD2KzwSLC3gs
 MLRMGbCCtQ2ZfPJWzFN4kb551kjjkRxnAOu3jExzli378qTBl6pJGCcYTwSHl32ew1+n
 8JKyRtB2ap0dnaqSKJJbqgVuS+44i1X7sjqD0zwYthxDAH25z2bRGgPaYUgBEPxGPc1t
 Vv/yDORPelRYd+cTzgLlqZWD6MDt5nZTcQ9OaxowlArlo873xcgx/uA/AmwXC/3098Qx
 UVDYBcX7mNf3xa2b65w+Z+NYhK7iSFR4G5RjXtbi+N0L5s5pEBuiXlLYqzVHJqinUhX/
 YTYg==
X-Gm-Message-State: AOAM5326LsLXiqhucPKXwRwTUkGlJKb4xzVaGTe+B72kHm1SKZrSrBMd
 UMOItUeIeEoAitr1hSXHA56NgkZJ9VU=
X-Google-Smtp-Source: ABdhPJyNl+PBqeeNaSD9fh9WpYP1yKeP70Y6JMJEsxho/WXgASIcTQoEJBZNUCWD/D8ScHJP+VhoVg==
X-Received: by 2002:adf:dc08:: with SMTP id t8mr18917251wri.195.1608561895798; 
 Mon, 21 Dec 2020 06:44:55 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/55] tests/tcg: build tests with -Werror
Date: Mon, 21 Dec 2020 15:43:59 +0100
Message-Id: <20201221144447.26161-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Hopefully this will guard against sloppy code getting into our tests.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201210190417.31673-9-alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 2ae86776cd..24d75a5801 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -94,7 +94,7 @@ ifdef CONFIG_USER_ONLY
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
 
 # Add the common build options
-CFLAGS+=-Wall -O0 -g -fno-strict-aliasing
+CFLAGS+=-Wall -Werror -O0 -g -fno-strict-aliasing
 ifeq ($(BUILD_STATIC),y)
 LDFLAGS+=-static
 endif
-- 
2.29.2




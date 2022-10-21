Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880A607B85
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:52:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oluJa-0006o9-I6; Fri, 21 Oct 2022 11:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oluJU-0006o0-GI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:52:01 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oluJO-0003p6-GI
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:52:00 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so5328536wma.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3cHnjENqbl19ucdyg4MDPQoWXEcNKX05/tWyvwRo7Yc=;
 b=t1IfSOvmZhcSoIsjNlEQXJmJ3BbRGYCcu3G3rLGkXj0Py96/Tqt7xBh72deI+OAveb
 f4GvSOG3D6DE0gfUSmLq3xkA/0KGW282j1yhg5v1kjDBPJT8dipZMqpm2zZ03O6rdMKh
 szXed5Q2qeSsfsNO7MLIx6Zld18EnCClmcNME2kH8gbgWPZ5cxhKZpLExDyI0bViVJ0V
 0pcaruhy/oG+/mEz6SRrH5BKsmd9/LlDRM2G1XXnrA/Plh2eOkHKwDhltzcThYyMk8So
 gohBcT654UZMRruxc53k8nHpc+IbS73NWEb4e2wcQ+95qTr3Sb4ZWoujrrYFfZZ5HEf9
 DlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3cHnjENqbl19ucdyg4MDPQoWXEcNKX05/tWyvwRo7Yc=;
 b=i83utrR47j23MSlh4hNXZllNxM6b/TObd30lEOrnwEwKKd2hKV6Ww/+tzOwhplH9ey
 ixs+2BPKsMW/46hislFSfDDlx8IlLLZvPn/7L79PQ5KUFfDS0SsTTtYE2cNhuJtDRx/u
 1J6ZMvvUGMJiO720Y04PsS5dsWLu9jAI7V2D9MxW8YXrzV2+nX2EKOpefKHvASRg1Ipp
 4Fsq+8Fe9Grpbhu3hwVqNDzLcgtmn2PlctjlQ6EhBdsTUeYRyb+AcGOZWo9V7SfdpBo3
 EEblrzHMOuBnsn3tABrViu7CTAUbeXVWxnZjSIKC5/h5SYogezD3JdTfSLTcZvJloneQ
 GWVg==
X-Gm-Message-State: ACrzQf3bv+ME/5+xmS1A9YzMfqMlTjxxok01doPxogT+4mRMZPTbx4x2
 gB1B1nw0dnCm8l6EC4NKLcce4Q==
X-Google-Smtp-Source: AMsMyM6MmQ0WLy2cTvaxUugQcZ3uaiQCryJMeMiW/jR4sKbOjEgAixK9OGNqfgzZozbkVBuxdpaLHg==
X-Received: by 2002:a05:600c:a04:b0:3b4:f20e:63f4 with SMTP id
 z4-20020a05600c0a0400b003b4f20e63f4mr13638881wmp.201.1666367512125; 
 Fri, 21 Oct 2022 08:51:52 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i18-20020a5d5232000000b00236576c8eddsm1252123wra.12.2022.10.21.08.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 08:51:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C89C1FFB7;
 Fri, 21 Oct 2022 16:51:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [RFC PATCH] contrib/plugins: enable debug on CONFIG_DEBUG_TCG
Date: Fri, 21 Oct 2022 16:51:46 +0100
Message-Id: <20221021155146.2729598-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We used to rely on QEMU_CFLAGS to expose the debug flags but now this
is synthesised by meson and only available to the main build. Add our
own flags if we detect the build has been enabled with
CONFIG_DEBUG_TCG (which is the default for --enable-debug anyway).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---
 contrib/plugins/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index df3499f4f2..23e0396687 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -29,6 +29,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 CFLAGS = $(GLIB_CFLAGS)
 CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
+CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
 all: $(SONAMES)
-- 
2.34.1



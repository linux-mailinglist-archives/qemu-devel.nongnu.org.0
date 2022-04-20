Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DA508FE5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:01:43 +0200 (CEST)
Received: from localhost ([::1]:55612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFaA-0007XJ-8Q
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkx-00023K-Qx
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:48 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:44849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEkw-0001ZZ-Aw
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:47 -0400
Received: by mail-ed1-x52d.google.com with SMTP id c64so3333846edf.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dNSN/5gCgVrbslqw3vlA6e2A9VJiIEfbZBS6zBFUyV8=;
 b=sGYIHceLmfy4cPrcEZKyqMMDzfCAvCwa72NmRP+dtJ6AvBd7VZ5V03ml3J2X+C0zqo
 Bey/KIyDLvckUrQDSZM6vhslTPIQUZH5ygTSpLqFWPpDtW5E5w9TJsg5KbyL7m2aarFP
 JQHP0AnXXiztH7njHA5QocXpMtl5J60KKhc/r5S924R51mWh3nq9RF3RF1S3NjTB3DH3
 0XoKlg7Py1HaA7/G3YDIqRtWeFQ4pwMeKQkYrDGPlacsUR3F/0zPe/2u93bTlJY5qVby
 /ZPzz3jAirvnjyHl7KTye3RbyByV/7NhiT6sntuE0t2jZtdRT+KGCYtEfXDpfgTKcoE0
 AsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dNSN/5gCgVrbslqw3vlA6e2A9VJiIEfbZBS6zBFUyV8=;
 b=TX7+GADppe8zWIv+fJviwxLqZ13HBR1qX3tH2KI9jrwV7Q5rRGwmwYScD16/9F8WjA
 O5wtcuRkwc5kmwTk0VO7FjOi+3RMIgY5A8fIynfCsZbmdWyI+62WGTmQrHpEDyEqT3Fp
 ZJRL6LQXQtIxXd1LUKyUizzo6JvAAxgsHrVFcYXQQJ7VYFilSJbcXc7pd1/jAcwpT5hL
 FoJDdErM8DxfyBYLros7z+ZyjleYz1aZyJEeHrFNR2Tct21kOqXmnez49gyEQVR+9kXf
 mp+ib8kAoT5RsPSOj4A5gM3AmzV18ScAGtl/K+OaAhidfDyfUTsiAl0ZcZlqk/B2pgcl
 PX0w==
X-Gm-Message-State: AOAM530gEBxytTQFQ4WWHso1sK1nVWfQN9aRWLKXZjEWrGkzJoiWrjFx
 HNcXF2Uczj2FiEXPXYYFA+aM4w==
X-Google-Smtp-Source: ABdhPJx1cs0NkX4DlEZXcUJNxhVnddRv3BGQdB5y/itE57ybvTRmPNaaL8+2je+PU2YIJbnBCc0moQ==
X-Received: by 2002:aa7:df92:0:b0:41d:84fd:5d92 with SMTP id
 b18-20020aa7df92000000b0041d84fd5d92mr24699576edy.337.1650478124186; 
 Wed, 20 Apr 2022 11:08:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a056402039700b00423d630e575sm6419086edv.11.2022.04.20.11.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE9F51FFBF;
 Wed, 20 Apr 2022 19:08:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 07/25] tests/docker: remove unnecessary default definitions
Date: Wed, 20 Apr 2022 19:08:14 +0100
Message-Id: <20220420180832.3812543-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

The definition of DOCKER_IMAGES and DOCKER_TESTS copes already with an
empty value of $(IMAGES) and $(TESTS), no need to force them to "%" if
undefined.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-5-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-8-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c8d0ec3c66..751151d7e9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -8,11 +8,6 @@ COMMA := ,
 
 HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 
-# These variables can be set by the user to limit the set of docker
-# images and tests to a more restricted subset
-TESTS ?= %
-IMAGES ?= %
-
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
-- 
2.30.2



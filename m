Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C454EEF1E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:18:35 +0200 (CEST)
Received: from localhost ([::1]:35136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI6k-0003P1-8Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:18:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1z-0003JD-79
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:39 -0400
Received: from [2a00:1450:4864:20::531] (port=42572
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1x-0006be-MF
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:38 -0400
Received: by mail-ed1-x531.google.com with SMTP id a17so3098670edm.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=viUKw0INt9DhWO6VgKxhhJ0hhOGAzloEnj6zxsyTXu0=;
 b=AswL2/k+dJYU+ySbPvC+Zjw+Mjt/zlft6IP9vQHPALcNU9HUBYhs8LF+3D/e/+iMpy
 If0Nj16yaey8Jf0oaHetKNLKxcCMaa6qF101WLYkx2XqzuRiByqKK1NUCiL7mbSH6ami
 1cLyv+KMdyZresOccNC9ErcvAuGaTlgpbC79UGWv2T2w9kriE4JezEKhiGfMd6idUE+F
 VXGSdxHQSt7J+qCOeLseBUEXjN9/4mxeOqF448/u073rZkrayg3x5oGLZeZagRp5gGfp
 qlU/M3KbbGanadSN3kuk1NZraTSA4xXq37mumC7bPj3505G0DLQ5r5ci3yYA3qHnMNkE
 U8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=viUKw0INt9DhWO6VgKxhhJ0hhOGAzloEnj6zxsyTXu0=;
 b=AIEG5JOHNQzrvdiF625zIIJvrKWjiuCeGlJZzk+NI5bZvXAT1vRUGR3JS/uvk0W2eQ
 gAbb7HsaBeOx68OO/vxS4M1tbpMJo7lFHfRpvGD68sP4ljhWFHZgDw6ARB6Wy1hqcJbL
 0RuXTP9hBLjtHvUiF5uw+XxdI1015yQTBh07NT4XREPy7rdvjWAbwutr23LlMQBs3z7F
 TIMNOak1MlQGOtI8xBRFxLobkd83B5cDBm81Sn241zWCVQw/KsvBnscDCJbbwKcvHiDT
 57UJMdYWXurfgX4+2A8C38hJUFw1uMnf4j5230hDKmN2/cT6vOAkd23W60kPcE9LnbGF
 BfOQ==
X-Gm-Message-State: AOAM532f4ALUHr44BtjspjabkcHvalR1uHx24NzelelUHpfI83bfLEyi
 saxFMAuRJBhD6pGp7kNmb1fY50P5MjA=
X-Google-Smtp-Source: ABdhPJyBMz8lY+YIhk9gy4CKwz5Wca1Ul9ljUfmeb/t5dUnIcQb3RBO/p+BDyYAVRvpcz0lWC52SEg==
X-Received: by 2002:a50:cd8d:0:b0:416:63d7:9326 with SMTP id
 p13-20020a50cd8d000000b0041663d79326mr21025495edi.233.1648822416319; 
 Fri, 01 Apr 2022 07:13:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/17] tests/docker: remove dead variable
Date: Fri,  1 Apr 2022 16:13:12 +0200
Message-Id: <20220401141326.1244422-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220328140240.40798-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 06c40a9320..c8d0ec3c66 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -13,7 +13,6 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
 TESTS ?= %
 IMAGES ?= %
 
-DOCKER_SUFFIX := .docker
 DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
-- 
2.35.1




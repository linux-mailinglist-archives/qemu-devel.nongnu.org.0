Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A714EEF15
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:16:12 +0200 (CEST)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI4R-0006Dl-L1
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:16:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI21-0003QM-M9
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:41 -0400
Received: from [2a00:1450:4864:20::52d] (port=35777
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI20-0006cJ-74
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id g22so3144953edz.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L65yp4jvbDHDdl709XmNwHvaNrD2BaCXcba2IwnsElQ=;
 b=G44fYg1YoNOytl1lMAYIbZRoBkTHeYbcSM1vZLAQRH1FGJRjV/4puq0AHwHPSHeEdA
 zsWO6LEehqmT/840yswveiSo87H/F+TNKnyL5bpYnt4TSBZ12Hh66M6akZubifyaamE+
 k5G8wSI2GZGEylZEKZjYMV4qeG1WDzQuo2rInF803fbQIgAlkYugIMrarTUyKWtQ6HI0
 OsSgoR6ZLDpPJa8h6VFBkbE0hwpgctmX0me+pGS3DNV6FwAB84iuzzS5efcOBcpiKk8U
 9KTQSQjGr95lyil1nJtSTHuZaNgso+6JmaHHWTUajrZywPpWi6cd4BPFJR2xC9EZ5PGJ
 nlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L65yp4jvbDHDdl709XmNwHvaNrD2BaCXcba2IwnsElQ=;
 b=EK1CByjrcvoKFMssOgnA9rahzW8eHdKl4jq6g/k3BTk/gdvB77oxQwXrYVdGlJdfSq
 RAbbAGMHaZoVor5A9urFVeNB8SD9HfOiJU+3Ceu7yS11pUFOn+3aRUQCcrP6dUHmWvwj
 X3KlELYLe/cLOUlZwZH4aAjUxQHy3W3EMdwF7qxFwl/LWmQqaWIqzxG8I+q6nW+oUAUu
 P+ZGQ9vPa3tGaw3VJP9IIsKonb14RR731Ct0wvw0n3irjGQkpclaSs4Ir2RT1gfM6hrh
 DwdWzq8mY2jwInSgOLfV3Gftv2zjUEbaS8VWFy4bnw6myPzO9XHxQNl8J5irrkGdvsYW
 At0A==
X-Gm-Message-State: AOAM533o6BCek7MOJuE/kN5flZPgbG9jqzqBhxPyJspJlYokXykt+raa
 /ig+EFCEx7io+5e1TdOs/oyACZvTmx4=
X-Google-Smtp-Source: ABdhPJxIMs4TKzUGGBunNACwOP3/hxUOty0wUtL9FGF00wvvgJJuKvKzAK3Olarszs9wAXo9ZKmWHQ==
X-Received: by 2002:a50:9b11:0:b0:419:a8f:580c with SMTP id
 o17-20020a509b11000000b004190a8f580cmr21430391edi.292.1648822418981; 
 Fri, 01 Apr 2022 07:13:38 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] tests/docker: remove unnecessary filtering of
 $(DOCKER_IMAGES)
Date: Fri,  1 Apr 2022 16:13:15 +0200
Message-Id: <20220401141326.1244422-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
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

Now that DOCKER_IMAGES is only defined after DOCKER_VIRTUAL_IMAGES is
complete, there is no need to re-filter DOCKER_IMAGES against it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-7-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9b4d1cf837..3b5ebd5567 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -201,7 +201,7 @@ __TESTS := $(notdir $(shell find $(SRC_PATH)/tests/docker/ -name 'test-*' -type
 DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 # Expand all the pre-requistes for each docker image and test combination
-$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
+$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
 		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
-- 
2.35.1




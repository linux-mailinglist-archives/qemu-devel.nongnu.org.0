Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FEB4EEF1D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:18:01 +0200 (CEST)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naI6C-0001rg-Pv
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:18:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1x-0003I8-V5
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:38 -0400
Received: from [2a00:1450:4864:20::630] (port=37823
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1v-0006aH-Ka
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:37 -0400
Received: by mail-ej1-x630.google.com with SMTP id bg10so6162505ejb.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=px5DmONzQrE1fygF/BcA42BR1vpVp3BuBnpP9NbGVY0=;
 b=ZWFEh+Dm/h619aQxDhpCRlvLPblcZfCc7tIvqDGOYCAOYaOAYSPZJmWWLN38TbS7Fq
 2z3ek95e6j4znbb29QhPFzGoX5jjkiJDQEhjSTb1MGGz5/ygtu2lR/rT64GeVfHHHkk1
 Y7ZeGKMtVY5HRSUQWiSNtBcH4a1p4FWwoTWrI58IWcqq2fz3/vXZJiFBRbsmdaD7z1Vy
 OHGnWtv6Lb/zJAj3SMeykNOa3mwuo9zOV7eHE1c1pXDOXUY5b/ILGnyAUYdTo9iqiNqs
 061OrlKD4f6txIpdLGxhlxHrTXbOpdBCZfuT51/JfZzAMwm1wfI4UgxvaMJzxkKLE6R8
 2F0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=px5DmONzQrE1fygF/BcA42BR1vpVp3BuBnpP9NbGVY0=;
 b=IXAGr1Bczd1PyaN2xA6e4B4LlHqoEr0dLgPzeJa53YKb9q0ODa1fz5bDithUT4cwj0
 4vtqWKEpx+ObftjtXN1mxFkvgBmbBY4gXLxgPlnH1fFP9S90hgJ6tVpo8tJIOCm3tcCx
 IzfzuT2dJsdP3mqzjJg0F598MkbwczO8vkQ7NQRKSsEbJt3qUYumQ8C4v8Dsuuutdt5+
 ZVJ4i0+hyx7mgn0uLXXJj4XE55SUdJdR2uxAigZmcOYMRrG0Xp8SIk9oYPVeTzB9Pkb/
 FshO8wso8dIppZRhcmj8MMVUDmGG8PN4Imb1yHaLVNcgjEFHbGhwXa7BuSlz9xFHa2rU
 fRZg==
X-Gm-Message-State: AOAM533jmwv3SVFZUjVPCYHzi5FxRT5jd0qYACeraAPzMpjE9Gr332FI
 7b5b4dQSuF23yvZkv01ePX7IM6BPMn8=
X-Google-Smtp-Source: ABdhPJxSK2cVq1XXWtsA8k2uL2NBBZ+k3RO7zT+GkWKgF30zCNZXjN48JQ5lNjA/dMi18U4EWbssAg==
X-Received: by 2002:a17:907:2ce1:b0:6df:85e4:d65d with SMTP id
 hz1-20020a1709072ce100b006df85e4d65dmr2955ejc.209.1648822414070; 
 Fri, 01 Apr 2022 07:13:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/17] tests/docker: remove dead code for linux-user containers
Date: Fri,  1 Apr 2022 16:13:10 +0200
Message-Id: <20220401141326.1244422-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

debian-powerpc-user-cross was the only linux-user powered cross builder
and it was removed in commit 80394ccf21 ("tests/docker: remove
debian-powerpc-user-cross", 2019-09-26). Remove all the infrastructure
around it since it is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220328140240.40798-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e495b163a0..a6a5a20949 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -229,12 +229,6 @@ DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
-# Rules for building linux-user powered images
-#
-# These are slower than using native cross compiler setups but can
-# work around issues with poorly working multi-arch systems and broken
-# packages.
-
 # Expand all the pre-requistes for each docker image and test combination
 $(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
@@ -266,11 +260,6 @@ docker:
 	@echo
 	@echo 'Available container images:'
 	@echo '    $(DOCKER_IMAGES)'
-ifneq ($(DOCKER_USER_IMAGES),)
-	@echo
-	@echo 'Available linux-user images (docker-binfmt-image-debian-%):'
-	@echo '    $(DOCKER_USER_IMAGES)'
-endif
 	@echo
 	@echo 'Available tests:'
 	@echo '    $(DOCKER_TESTS)'
-- 
2.35.1




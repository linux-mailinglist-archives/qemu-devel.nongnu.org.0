Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A50A4EEF34
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:22:26 +0200 (CEST)
Received: from localhost ([::1]:43802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIAS-0000ok-Lw
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:22:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI20-0003Lf-8x
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:40 -0400
Received: from [2a00:1450:4864:20::534] (port=37830
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI1y-0006bp-Mq
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id b15so3134580edn.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2X2RDaQklJGwJ5thvT2Fyw9MBaeTJVoyBtZ74o+tlk=;
 b=GfWQ9Vrgjcpj6nF20y2207wlKmYCm6an5eRrJzNs/d2Us2Si31c7/6y482QajPdaOD
 bSFi8ejkmbUIpThvrwm5vabcaWGh9Dio71HgLEQJB9RykDb/jeKpxavAF60hZ9ZUs8/x
 /cVj5fpoLKVo0h4XzDLWDfQQN4m112amMP7xlwk4fmx343OFxFKT/M3686FCnCoSrbNP
 i+/hVfd1rf48LBAt99oqc/Og62wnDufNdZ3Dl/XJ5YWeKjsmQJPs4jjUYFg8ur5bU38z
 CYVkZodjsvf8IdQsdhECSliTlIfH7OKnPXZYbgNvOycv3kMgJN5FoMiyA3MndPylAB0Q
 gocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A2X2RDaQklJGwJ5thvT2Fyw9MBaeTJVoyBtZ74o+tlk=;
 b=Gzw+1afuPFTekRhT5M7uqdSRLls5aoVj11PIPZUB5en4jaYu5eRvore0C+vmkykLW7
 eZEeEN6QzzgFPSMWXLxoqQzztGezq5ZOuAFawfSbie8+seMXuPAjRi806RL25Rs4Wb9J
 k4seRXz9W9rdnnlUtyRaYWdmBMZ6QeytW+wqh2MpMyHquhlzFI3gJQZrPP+RHgdzL0eI
 rjyaujmcJe5PLmtZwf01UyN5a2hwLZDWUt4h2hYM//IWVRUhzZPooi5B+jf2LFaCkcfA
 UyDLRoWBNNl1Xk7zUY2IgCJKapP6U5vwwsvMHJVAENKzRrjkpoWGd1ouEqh2rPwgC++R
 XKyA==
X-Gm-Message-State: AOAM531wvdRFrQBnWhaNsb5a/lo87JTESvQ1a9aPu2wooyhDgasmQLmQ
 sJxlFpnFK6hPmFnOSmiFjuN+j6zcoWk=
X-Google-Smtp-Source: ABdhPJw+eXPnNFHbUuP7wYMn0j/4OaQEtqo0IPD9VpAm1AM0PxbzTDJRaKckw480ivjTxNgBC6JtFw==
X-Received: by 2002:a05:6402:84b:b0:419:85:b724 with SMTP id
 b11-20020a056402084b00b004190085b724mr21508539edz.413.1648822417349; 
 Fri, 01 Apr 2022 07:13:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/17] tests/docker: remove unnecessary default definitions
Date: Fri,  1 Apr 2022 16:13:13 +0200
Message-Id: <20220401141326.1244422-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
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

The definition of DOCKER_IMAGES and DOCKER_TESTS copes already with an
empty value of $(IMAGES) and $(TESTS), no need to force them to "%" if
undefined.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220328140240.40798-5-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 5 -----
 1 file changed, 5 deletions(-)

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
2.35.1




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD213D786C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:26:38 +0200 (CEST)
Received: from localhost ([::1]:51290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O2X-0007VR-7e
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0l-0004oW-I5
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0j-0001mE-UP
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I3f5VWr0dv08m9hk8YYT+1REocG8ozdjKKxl8Jc6Yx0=;
 b=Psu5dcBTfo3GWX4blw4X6sU4xrrWLWmvYcAK7WnP36NRFxyhj6bmlS1FpL6KxlpUKtW73v
 maVq332uJA0udGPqw/OGrGD53WnLHAY8gke0HvuvS77dyGXoGyhYVPkYFkOdKAXRS1Mrrv
 0j8orD0ihQNLINQB3XZr8My+TzH8tMg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-PFsoruJqMa2FCgFNKYKK9A-1; Tue, 27 Jul 2021 10:24:44 -0400
X-MC-Unique: PFsoruJqMa2FCgFNKYKK9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 u11-20020a5d434b0000b029013e2027cf9aso6036013wrr.9
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I3f5VWr0dv08m9hk8YYT+1REocG8ozdjKKxl8Jc6Yx0=;
 b=AYZveggjifL858dpXi5gKVBLKjSDdTwdfCAkUSzlDMhYCAIPfnRAUZXDakiM1A69g7
 LgAIWEZLxqrIE56yIE8/6Fxm/izCryjyEaigIX8jVAkMZm0vnA9SVebC8IjiikMp7y3o
 BvDqsVBJCsFtIXLgu9pT/rPUIB0oodxr3sTipWhelAGpv7AJWUAsksd9Z2aXT2k9WZL6
 CwcbWfnL5DJCiqi9hWLh/Z8OUK8D5meypwCFJfI9T8DB6Swff8ZP4W3FeQgyoOcKRTEv
 4+O+VDTTz5Di2jcFFpSqqzglOrxayqq7EgbUmpgz8lL29gYGN/yi/3eIHP31EprLeINp
 6Q9g==
X-Gm-Message-State: AOAM533gMMkz0EYXk8Rd7Dw+KWKzsv3fRkKeeVsi4kg6dW0OdTpyj8jv
 Yk4DLvzzY0ty2uOqCJpqaLjD1qNgctwHx9IbD5KelN81jsjS2pPN+kZz1r6hD6LSl/Z3pqaKUw+
 9K0j3VfkizRAaD0yrUJqDhZU+j2n5F3HsD7hztMLA3+okDQC+rw4xx2NSxCjbMbsv
X-Received: by 2002:a1c:a510:: with SMTP id o16mr19672132wme.176.1627395883051; 
 Tue, 27 Jul 2021 07:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu6NTNnFCWbA6QW9ELUDqbopzmm80tdaGb0t9D1WlxPogIsAlZCRC+eyYCWwiNnimURM4rpQ==
X-Received: by 2002:a1c:a510:: with SMTP id o16mr19672111wme.176.1627395882898; 
 Tue, 27 Jul 2021 07:24:42 -0700 (PDT)
Received: from x1w.redhat.com (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id i5sm3406249wrw.13.2021.07.27.07.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 07:24:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v5 2/4] gitlab-ci: Fix 'when:' condition in
 acceptance_test_job_template
Date: Tue, 27 Jul 2021 16:24:29 +0200
Message-Id: <20210727142431.1672530-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727142431.1672530-1-philmd@redhat.com>
References: <20210727142431.1672530-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep
running jobs depending on it. The correct condition is
'when: on_success'.

Fixes: f56bf4caf71 ("gitlab: Run Avocado tests manually (except mainstream CI)")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 3e3e19d96bd..fcbcc4e627a 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -73,9 +73,9 @@
     # in its namespace setting or via git-push option, see documentation
     # in /.gitlab-ci.yml of this repository).
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: always
+      when: on_success
     - if: '$QEMU_CI_AVOCADO_TESTING'
-      when: always
+      when: on_success
     # Otherwise, set to manual (the jobs are created but not run).
     - when: manual
       allow_failure: true
-- 
2.31.1



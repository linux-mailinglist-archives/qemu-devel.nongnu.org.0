Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D0C3D5C98
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:06:44 +0200 (CEST)
Received: from localhost ([::1]:42806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Bn-0003OL-Ka
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829y-0000nx-BB
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829v-0003T1-Ql
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7WQ+gfdcuOck7JznttPPPqym0HvZVkv947pTW1KIp4=;
 b=O0y0z7obbrB66WlJ+PEks0vIOkge+Us/yqCp7HLsLn8Wt2THWMoFE/5q9Zk5EXGtMoE78E
 f25qcR1v6kQzH8vQb6wuU5kKDx0k1yuEMqXfxVgVfjshl/nHfj3XDZS72Da4YDMUA/32D3
 OeZ6I2zLc1ur8vacRMPfxKeSCkRrtfI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-pnEauBhBP1mNqBLiMOdDig-1; Mon, 26 Jul 2021 11:04:45 -0400
X-MC-Unique: pnEauBhBP1mNqBLiMOdDig-1
Received: by mail-wm1-f71.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so967973wmc.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A7WQ+gfdcuOck7JznttPPPqym0HvZVkv947pTW1KIp4=;
 b=qPiBOI+Jl5kO36OkAYBaD+QBgJdoJVRixmxD62Ifs+HziQ2B3GcjROUYM3d3ksLYHk
 Ii87G1sPfeqs3shINZVjt1iqXrQKHM7epA9LqrvQXoOJSJuLRWmFpjCy/Kgef3t5Wq7n
 9MwoHoKVYcdIPvg/6YiGrj4dNC8LwQazNduO02Ycu0r6uh0SiN2OyQnKA6tvN9GzNdsn
 l++s1cW82U4UBIMkH6nA0WRo6CrJsjTrBrGIECOqUdrt9UHVeL1FgUs20ai4bYqqLP0v
 McYqLuuPZmttZBoamyDQmKqwAKKrV5kTJEFOveDUfIaWR7g5IXpjyRTfPASQFrIwZGmy
 UStg==
X-Gm-Message-State: AOAM532woWeaGfQRQZU4uFe6ibixmwaXMZkDw0yp93NfDTyZDTKXRNDv
 Z+N8UOu85mnPhDk3VJEFJaA3yWzodp67dbR4QNRQTsqqNd6221HHRXvHoitCcvzqf61spuR321R
 h7G4huzH42qN7ZwkpxY9pdvQxC7Gtn6GZBj6jwi0E2qQfwwRAk6WtsfsYXj+SdtiO
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr14424975wmj.28.1627311884661; 
 Mon, 26 Jul 2021 08:04:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXjXb+R7tEwfKRUpeZm9BCLsfS5rQb1GV8yggX8D1Y4JUTy4fa8mEhCINtKXteMug3qt2f/A==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr14424963wmj.28.1627311884512; 
 Mon, 26 Jul 2021 08:04:44 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id v2sm59634wro.48.2021.07.26.08.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:04:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v4 3/4] gitlab-ci: Fix 'when:' condition in EDK2 jobs
Date: Mon, 26 Jul 2021 17:04:28 +0200
Message-Id: <20210726150429.1216251-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150429.1216251-1-philmd@redhat.com>
References: <20210726150429.1216251-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep
running jobs depending on it. The correct condition is
'when: on_success'.

Fixes: 71920809cea ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/edk2.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index aae2f7ad880..62497ba47fb 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -8,11 +8,11 @@
    - .gitlab-ci.d/edk2/Dockerfile
    # or roms/edk2/ is modified (submodule updated)
    - roms/edk2/*
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
-   when: always
+   when: on_success
 
 docker-edk2:
  extends: .edk2_job_rules
-- 
2.31.1



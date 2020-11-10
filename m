Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822D2ADB54
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:10:41 +0100 (CET)
Received: from localhost ([::1]:37510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWEC-0007xu-FA
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:10:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6F-0007Wj-6q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6C-0003ZU-CY
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9kWNGPy2BYObeozv+vVEW6FQiLUzqEUN2ABqwQ+VsWU=;
 b=ecMGGN1VlO4zYmwcDhScGX+iGeoOx7nPvMzTWOnQ+V6RxCORrMWzZzttsK43MjNje18XPy
 eJz7p1aeb7qf7292qhUAWiksEA7pqHqq6i3aan1s85qu+2UOC2wO0gIAAV7zLXOviXh/CV
 zNtib8D7j0E1xJqT0X3w6c1rUVlRi3k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-d2sZFbV9MNSZafRgO_oaOg-1; Tue, 10 Nov 2020 11:02:22 -0500
X-MC-Unique: d2sZFbV9MNSZafRgO_oaOg-1
Received: by mail-wm1-f72.google.com with SMTP id h2so1463886wmm.0
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kWNGPy2BYObeozv+vVEW6FQiLUzqEUN2ABqwQ+VsWU=;
 b=ehJUYh102SSG8o1e4Ob5RLDCDCWTOAfneyvvoipEEneu8uQz2xXXw0VmLI3vxBAiL9
 foTAxtGTiIfkEcHpHk7JMynyBpxoSJ3OL/4lRplGiKeV4uQ3P/B1/Ic5azkWDB22b8xW
 +huKMV/0ZZFj5ulwaE3r87FLANcgKxHlxpg+F0n1EWDQTOdaeTjlp3bSzr4gzJL6MLX6
 N0okOVZa9SMR7CUF++6EhQhUxcEMPewAIFEtpI+4yHDbBAQYJMyVcpvAFLuhNTpRuhTa
 Fvl5nlMnmpkeV6Fn1mBsRekuVvdXSOXreLI/qEDXhHk19Dvv2ZhiAdwXxJZsZI+ROeTI
 jusw==
X-Gm-Message-State: AOAM532zCOtL6XLmOj6jqFmZB44CBtG9l0M08rn9IxPqmgZzbPAySzBF
 lAgMbAPQxnlp7yUQxxCvWjgdKvH6wZdNMBQe5SzBJpxouH3zNqS2+Vug9wPU52lda3bcg9kWOyK
 oIGxpkDHIntY8WsgWM4YjEex+sMKiXTAqvG8tdV1BqTo8OsyzRJu2jHDnAU+9p+Q3
X-Received: by 2002:adf:eeca:: with SMTP id a10mr20703073wrp.186.1605024139792; 
 Tue, 10 Nov 2020 08:02:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXgJ85ZeL1+MtpePg9Pip9qvuxkcY8YSJ5b88d6HNDqxYrmftHoxr69JiWNPCjs+s0W1wzBA==
X-Received: by 2002:adf:eeca:: with SMTP id a10mr20703039wrp.186.1605024139575; 
 Tue, 10 Nov 2020 08:02:19 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p4sm17349373wrm.51.2020.11.10.08.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/16] gitlab-ci: Extract common job definition as
 'cross_common_job'
Date: Tue, 10 Nov 2020 17:01:31 +0100
Message-Id: <20201110160140.2859904-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the common definitions shared by '.cross_system_build_job'
and '.cross_user_build_job' to '.cross_common_job'.

This will be proven useful later, when we add rules common to
all cross jobs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..701550f028c 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,7 +1,9 @@
-
-.cross_system_build_job:
+.cross_common_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+
+.cross_system_build_job:
+  extends: .cross_common_job
   timeout: 80m
   script:
     - mkdir build
@@ -14,8 +16,7 @@
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  extends: .cross_common_job
   script:
     - mkdir build
     - cd build
-- 
2.26.2



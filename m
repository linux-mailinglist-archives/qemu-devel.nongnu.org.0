Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9C3FDE14
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:54:15 +0200 (CEST)
Received: from localhost ([::1]:46870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRd0-0007AS-8N
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLRbU-0005d7-DL
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mLRbQ-0008VV-Ko
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 10:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630507955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iU0AWSYp5g/9uAso73aflh2bMzazgJNKHhtj5zCkHAY=;
 b=K21WHtrSAlS66RjkDRKW/ZQ7YCi7S7DlYGxXNfS9Ox4egxrpYOCK0a6zB0QjqsotDjRVZ8
 qWfWRAEMNp3xmeSPBgT1PHOZbzJx8lXLMXPFh55gxuXFIK6kdeycEOmZWYAb3GwPbZFemM
 bRqiilIySjs2o9bRfs1Ppt3xE1a96fw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-06cQDWzRMQi2bZeNqTnTqQ-1; Wed, 01 Sep 2021 10:52:34 -0400
X-MC-Unique: 06cQDWzRMQi2bZeNqTnTqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f128-20020a1c3886000000b002e887c95e07so1144018wma.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 07:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iU0AWSYp5g/9uAso73aflh2bMzazgJNKHhtj5zCkHAY=;
 b=ZPx6tyVdavHb3wzDz1RphGCkmIDQked6Wwq81Zy0l7FRnHk8o+n2ZjSoacfs4gDS51
 1JHq6lB5TkbaeIFRQwFvNzBjhr3lVgPSHRUQarYzUSc4Yhnr0BLNJ8LaumyKBlXEVvMx
 RqyCMcoZxvUEqSHYYfyqjlPrgsRfUyorPnBqnC/259w4qdaafVgfdAWneAjh/yWKBLBq
 fI58Bu3mBaVDfcUt4+3DA2XG4QlNfXMWC8zGZTn0YKVFKwstgosPX3B9LfF2zOAI77Jc
 OXc1eZpimFIwf6sSW/Y+h8giJ7AEMX2vq6Ihz+3RvxiVQZG3m8tNKPdkMPY5P/kzpyYA
 0H9A==
X-Gm-Message-State: AOAM530koPl/HmmJxK1Kbn7ZcwYak+uc365XPk8djrxsc4xtHV2qhPYq
 VFSgf0FLr8C4QhSqoCDuwTQmJdec4ZrHp+Nsv5HTefMXNPcTS9ZRRVeXvS9Sr+gaBh8oka58hYk
 VNa9UGfkUE6vWr4BeXzXafYQLPilKqJYGDRDcGdltPM6uTlGbByaq23CJn9l8ryI1
X-Received: by 2002:adf:b318:: with SMTP id j24mr38077989wrd.84.1630507952289; 
 Wed, 01 Sep 2021 07:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKP0voll36jFuHV1getjNpIEJDmKo+VPp9lc0fo1MnGe8DqD/0Gyr8jKZRg1bGdL42Ko0PgQ==
X-Received: by 2002:adf:b318:: with SMTP id j24mr38077949wrd.84.1630507951946; 
 Wed, 01 Sep 2021 07:52:31 -0700 (PDT)
Received: from x1w.redhat.com (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n18sm5386279wmc.22.2021.09.01.07.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 07:52:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab: Escape git-describe match pattern on Windows hosts
Date: Wed,  1 Sep 2021 16:52:29 +0200
Message-Id: <20210901145229.4132606-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Properly escape git-describe 'match' pattern to avoid (MinGW):

  $ if grep -q "EXESUF=.exe" config-host.mak; then make installer;
    version="$(git describe --match v[0-9]*)";
    mv -v qemu-setup*.exe qemu-setup-${version}.exe; fi
  fatal: No names found, cannot describe anything.
  ERROR: Job failed: exit code 1

Reported-by: Cédric Le Goater <clg@kaod.org>
Fixes: 8619b5ddb56 ("ci: build & store windows installer")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/591
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 10d22dcf6c1..62d33e6661d 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -14,7 +14,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
-      version="$(git describe --match v[0-9]*)";
+      version="$(git describe --match 'v[0-9]*')";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
 
-- 
2.31.1



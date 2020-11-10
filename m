Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40BE2AD5FC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:18:32 +0100 (CET)
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSbX-0002Gw-PD
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:18:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcSZY-0000Jc-EQ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:16:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcSZW-0000ke-9p
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605010581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XIapllf2s1hNvPQA26YFSp/VUewIvo86tU9zFiFHkGY=;
 b=RtQ/zirokfAa1B8Rpl4yuSMXC2oPr4qSGSdmcBi+NDRAfMBr0tKVsvxOXg/k+NPUB+SjW2
 c8a0tVb3Zl6S0Xyp5KRI7eTS8s2Db1j5orY0trdgNjhE2Q84BqdD66j0hAdGRoi5nKrMQq
 Ffw/9ioS4TNeGs2RfoqNF3nN5JXT2RQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-3oX8VYwGMMuNtp09sB_xSA-1; Tue, 10 Nov 2020 07:16:19 -0500
X-MC-Unique: 3oX8VYwGMMuNtp09sB_xSA-1
Received: by mail-wr1-f70.google.com with SMTP id q1so5631730wrn.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 04:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIapllf2s1hNvPQA26YFSp/VUewIvo86tU9zFiFHkGY=;
 b=mimZF04U7O9SSMLTzP1FWVa62cj/w2xsOABydTYuNTrUE4NuqelLvqkOwLlWLPq0H4
 qH7/DsKXu5JGH6n+s02Aqchc+p85rHP+AhHVkdU9wQm0dubOTF+dNd0nKN9C9361XUwC
 uoOdOMMkgqUYIGfwygyrZEGMCoUNX1aeBKoqBZmdaqrKfQBeNIm69bsUjv75UQv+Kkwq
 aMCRFbHWg7tUTMXI7mk/4zHkM3k/qq32hYGxTgMrnpbJdst00rIDqoXpOSQ/eit8KMak
 /Ao4XL4vxMgbzAqjDAuOc6vMPgs75ViFt2/zQTG0NU0lNCPXHQan/7bzERoGxuVFdpoI
 hj2Q==
X-Gm-Message-State: AOAM530DNNdyWlFZvsHPKXhoVTXuM01cyUtAFZnBdimuhSSGcmNAjRrA
 e3DKh9hYGfC66QhgMH58YJT0heKgkjCOWHqr57VBoVE5+FiqHsG8kwnWifg1g2uduLTBo4YTaz1
 qBNJsKaxVpS0dffqlQQkIDZqnim3iDNNgAXOYHYy8D5Rydb19quY0Sc+xXNmCT4wX
X-Received: by 2002:a5d:410c:: with SMTP id l12mr4237618wrp.173.1605010578479; 
 Tue, 10 Nov 2020 04:16:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxCun8IOxFXe2S82lC2dLqCNY1vTfKsDPpmVyK1ixe6cNNJuS7JOgbH0wNycXKqy3SwyQI8A==
X-Received: by 2002:a5d:410c:: with SMTP id l12mr4237582wrp.173.1605010578183; 
 Tue, 10 Nov 2020 04:16:18 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o7sm17601726wrp.23.2020.11.10.04.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 04:16:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when not
 necessary
Date: Tue, 10 Nov 2020 13:16:06 +0100
Message-Id: <20201110121606.2792442-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110121606.2792442-1-philmd@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The EDK2 jobs use the 'changes' keyword, which "makes it
possible to define if a job should be created based on files
modified by a Git push event." (see [1]). This keyword comes
with a warning:

  Caution:

    In pipelines with sources other than the three above
    changes can’t determine if a given file is new or old
    and always returns true."

In commit 922febe2af we moved the YAML config file from the
repository root directory to the .gitlab-ci.d/ directory.

We didn't respect the previous warning and disabled the
'changes' filter rule, as the files are now in a (directory)
three above the YAML config file.

This jobs takes ~40min, and needlessly burns the 2000 minutes
available to GitLab free users. Follow the recommendations in
[3] and disable this job by default (except if we push a tag
or the branch contains 'edk2'). Note we do not remove the job
from the pipeline, it can still be triggered manually from the
WebUI.

[1] https://docs.gitlab.com/ee/ci/yaml/#onlychangesexceptchanges
[2] https://about.gitlab.com/releases/2020/03/18/ci-minutes-for-free-users/
[3] https://about.gitlab.com/pricing/faq-consumption-cicd/

Fixes: 922febe2af ("Move edk2 and opensbi YAML files to .gitlab-ci.d folder")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/edk2.yml | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index e1e04524166..335c99035c9 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,10 +1,5 @@
 docker-edk2:
  stage: containers
- rules: # Only run this job when the Dockerfile is modified
- - changes:
-   - .gitlab-ci.d/edk2.yml
-   - .gitlab-ci.d/edk2/Dockerfile
-   when: always
  image: docker:19.03.1
  services:
  - docker:19.03.1-dind
@@ -26,13 +21,15 @@ docker-edk2:
 build-edk2:
  stage: build
  rules: # Only run this job when ...
- - changes: # ... roms/edk2/ is modified (submodule updated)
-   - roms/edk2/*
+ - if: $CI_COMMIT_TAG # we pushed a tag
    when: always
  - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
    when: always
  - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
    when: always
+   # ... else allow manual run on the WebUI
+ - when: manual
+   allow_failure: true
  artifacts:
    paths: # 'artifacts.zip' will contains the following files:
    - pc-bios/edk2*bz2
-- 
2.26.2



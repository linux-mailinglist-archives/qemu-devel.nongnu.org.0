Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 184D33C2602
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:33:15 +0200 (CEST)
Received: from localhost ([::1]:35524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1rZ4-00014J-3Y
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWC-0004eM-NY
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:16 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rWA-0005VT-2R
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:30:16 -0400
Received: by mail-wr1-x433.google.com with SMTP id g16so2518529wrw.5
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=isRhm7PtwuN/k+yKMymzpJRt/x/pmEeyNtpyI5WWM24=;
 b=FfWFLbMk9ybGSNQ9h3U1tOQD6i4xtHo0H6O3hQhDR3ebi+9jvuwKeAilCVsVvrGoaj
 IJQxmfYl6+qym4h4y6hiaJ4zMuzNgw48c8bzFzJ31K1BMKRqXWDRljUNiEDhLBIvPBOl
 SWRtv7YODQPPgcamBlSsfgEa5OFoFZNqMs4mVOJxNiFvsoGIiRnx+O1CCzmj9CABVDJL
 SSRrn4bdR4pK6wj+qILosMYMp/lJJzfI4G93/kEl4B/SGagUmgTgLeuP84E8Ny6Lkmb4
 qcBwhyZsk85RnqaC8AAtYJcT641nbRbf9cE6SdB+SkhaxRWrWtKqsn4yG01H7UB6vFjo
 TDlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=isRhm7PtwuN/k+yKMymzpJRt/x/pmEeyNtpyI5WWM24=;
 b=XgrIi0Li780v9+2vlMJCMJB+/9okS4IPpkWC7xQ9izgGm2FuzrEiQLpIdpL68IxrN/
 9RdM2a+/qZS5/DzRSdrMiy4DTO3zEUr9myGPcm991h3srZzHRi44HPxKO2v1i4uUMqbn
 ZtNxHt9daUTez+GIXnc0uEJ5yimCslSedfgJOOO7jZarYLlas58wxAWNJ8udkIzEpqid
 KCqWEArGfcOzB2ehctXOYKQ9/mP9Ra8DPBtVZEgh7KUL3jMvRP4L6WYyYVs/WEo1LRxZ
 sdbL5UwQQ254LegeRw0sAJEIRtZnXTHixNQILT9h5a+wOE365ogGHuSp/ZSWY8PQ3L5d
 ah+A==
X-Gm-Message-State: AOAM530W6LRW3dYeDwhKazPhlsv7QNmjMY46maWM4o5VCOAmCCGd+sgK
 VtTeC6hzlROT42TimPK89bEycQ==
X-Google-Smtp-Source: ABdhPJytwh4Nq/27EbsyqVLixnDRME9IYmRjUpN006ZrcfipUtuJj/PQiMr5L9BaUW+BLmfMOz6yOQ==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr9338889wro.70.1625841012321;
 Fri, 09 Jul 2021 07:30:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v21sm1322368wml.5.2021.07.09.07.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:30:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A60461FF90;
 Fri,  9 Jul 2021 15:30:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/40] Jobs based on custom runners: add job definitions
 for QEMU's machines
Date: Fri,  9 Jul 2021 15:29:29 +0100
Message-Id: <20210709143005.1554-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

The QEMU project has two machines (aarch64 and s390x) that can be used
for jobs that do build and run tests.  This introduces those jobs,
which are a mapping of custom scripts used for the same purpose.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210630012619.115262-5-crosa@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index a07b27384c..061d3cdfed 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -12,3 +12,211 @@
 # guarantees a fresh repository on each job run.
 variables:
   GIT_STRATEGY: clone
+
+# All ubuntu-18.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+ubuntu-18.04-s390x-all-linux-static:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-18.04-s390x-all:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-alldbg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-clang:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-tci:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-18.04-s390x-notcg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+ubuntu-20.04-aarch64-all-linux-static:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-20.04-aarch64-all:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-alldbg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-clang:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-tci:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-20.04-aarch64-notcg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.20.1



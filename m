Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A14553B4285
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 13:29:04 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwk19-0007kb-OT
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 07:29:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwk0I-0006hl-By
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:28:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lwk02-0000tU-JC
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 07:28:09 -0400
Received: by mail-wr1-x432.google.com with SMTP id j1so10184895wrn.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 04:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wc5U/Rd4PWWgnOQl8CE5xd7amsgWGTP8QNI5fFbgvw=;
 b=z6n9QES2rDHjJ4BWNg5LIeMdhFRiPCqw+eWKGdXJFHNgJtpaqVXiHs8egYvWOBtwMf
 w8SSmapEZ8jzzBEW41HNWXUuaehnAZrlLzsmRQOs5KQqsir5quZRd5MfYx6RJNeQQdJF
 88H2aCp+zLXokb2R4N5i2vK8TNTLV0+d+LtdaFtqLcra7QuUby1m5yUEo+N4/gSCIUTR
 4xUERMZjzNYQ5ZqnxJJPBKA0T2xt586FkPRFSqP2z6vWrniuznJKrosKfOYob19RH5HM
 arIZHFjlWIyAEBFh27P3DM4ewt4vuczNabyBc3KIbIywRBTQRiRHvx/GkIs6ymfpFUbK
 TuAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/wc5U/Rd4PWWgnOQl8CE5xd7amsgWGTP8QNI5fFbgvw=;
 b=Ej5XDLNwEWfAOgkvK1j6IWIyhH0CBBVMpgnethliVbJwwZ7OT8V9B5MV+1SjdPG57N
 SvsT/z4oJTuzzSfUDAODuatNKEp7efrl4/0qm4dBfMkUqP0vbwjxJo9/FQf4PjdpEtaZ
 CbaKIMI73reYvkPJMEGz7iA2e+SvQWo+1H6COUvMqq4Wp2wcwZcA1+gFatWbUuG3k/pb
 5HQOl+1BRl/aLtXKg8Yp70TD7yCdAtTDU09AeXHsGBDr/nb338EbvfSx9/+52DoatYlX
 g3FoP/S0R/cVgm5lmqYsm7sroJVfJ8n47LyO8W4USEf+kzDDcCRgPjDsPeRd2d2QzVsw
 dVvA==
X-Gm-Message-State: AOAM533+F/2J6AfZkLCZ8lLVoTci35wmsoaX54HcUnhd3XDYpgVbewxh
 RQca3K0mfljWaUji3R4r8at2Xw==
X-Google-Smtp-Source: ABdhPJzszKGqyv/uZvpILoRsKG06kXAr5hbpMKMsWhiCSGKJnhyjQ08QKrHtwkhle5X5bjaZAC90/Q==
X-Received: by 2002:a5d:6d83:: with SMTP id l3mr3049044wrs.91.1624620472698;
 Fri, 25 Jun 2021 04:27:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r12sm6124596wrn.2.2021.06.25.04.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 04:27:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 109CE1FF7E;
 Fri, 25 Jun 2021 12:27:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tcg/plugins: enable by default for TCG builds
Date: Fri, 25 Jun 2021 12:27:41 +0100
Message-Id: <20210625112741.12566-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, minyihh@uci.edu, robhenry@microsoft.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Aside from a minor bloat to file size the ability to have TCG plugins
has no real impact on performance unless a plugin is actively loaded.
Even then the libempty.so plugin shows only a minor degradation in
performance caused by the extra book keeping the TCG has to do to keep
track of instructions. As it's a useful feature lets just enable it by
default and reduce our testing matrix a little.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst |  3 ++-
 configure                  |  2 +-
 .gitlab-ci.d/buildtest.yml | 23 -----------------------
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index 18c6581d85..0cd77c77d2 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -71,7 +71,8 @@ API
 Usage
 =====
 
-The QEMU binary needs to be compiled for plugin support::
+Any QEMU binary with TCG support has plugins enabled by default.
+Earlier releases needed to be explicitly enabled with::
 
   configure --enable-plugins
 
diff --git a/configure b/configure
index 38704b4e11..9f7161e26c 100755
--- a/configure
+++ b/configure
@@ -432,7 +432,7 @@ libxml2="$default_feature"
 debug_mutex="no"
 libpmem="$default_feature"
 default_devices="true"
-plugins="no"
+plugins="$default_feature"
 fuzzing="no"
 rng_none="no"
 secret_keyring="$default_feature"
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d9b834c848..89df51517c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -354,29 +354,6 @@ build-some-softmmu:
     TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
     MAKE_CHECK_ARGS: check-tcg
 
-# Run check-tcg against linux-user (with plugins)
-# we skip sparc64-linux-user until it has been fixed somewhat
-# we skip cris-linux-user as it doesn't use the common run loop
-build-user-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
-    MAKE_CHECK_ARGS: check-tcg
-  timeout: 1h 30m
-
-build-some-softmmu-plugins:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-debian-user-cross-container
-  variables:
-    IMAGE: debian-all-test-cross
-    CONFIGURE_ARGS: --disable-tools --disable-user --enable-plugins --enable-debug-tcg
-    TARGETS: xtensa-softmmu arm-softmmu aarch64-softmmu alpha-softmmu
-    MAKE_CHECK_ARGS: check-tcg
-
 clang-system:
   extends: .native_build_job_template
   needs:
-- 
2.20.1



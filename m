Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B946D4638
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:51:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYq-0002vN-Vz; Mon, 03 Apr 2023 09:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYo-0002t2-Mc
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYm-0004t4-6N
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id v1so29425143wrv.1
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kPw3ManZ+Ywd9V8K8Vksi6Xge0WhKBjH9baywEDj7Kk=;
 b=rmXfiWCZi0krL5XTl5WBBeWa7xwSGSOSUcp4MWBpXlZnAzVqL5X0NDXgrYBF0Y6vmL
 DT5vYJ7ECssrMD+zNhBRLKQV4Ul4EyurpiaxXJLUPMuAnVIHaOPw3/yoYZHchKAsqi6c
 dj6XNdYCsAJnQewEMdhmsQyTBzFt/XEuL1LtVgJttkXLJjfdHRdsp28EweTOGWbKdxP+
 cSpEDfSUoo+Moo76eHZQlnI2uPY2tysZX7JA50qffchQsJl9UhhEOfPcU4mXoAt8+wLO
 EwnWLGVOuraerzsaqU3vL9hU38vqWJajRaqtY0q6pQn9Y5hLot2rzjaB10TppgclWrWb
 egQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529761;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kPw3ManZ+Ywd9V8K8Vksi6Xge0WhKBjH9baywEDj7Kk=;
 b=5W4hMkdxaBabcYVzqiSK2S9jWWSPtXgn4weY3dJZxlXr9EMIGe929abbI9caEe5Y1w
 FcxPfg1ekc5rtJtUk7oEUYyViIVHg1kYV4tLKnQHhVP7vMf5BUdDeYtA7E5ZsildE0U6
 RB6ghPnja4u4AsmSsSFhjzne3p2TqLEVnMETgfkFcccxqroEHtWQ4WIBfAvU6kfcG7g2
 CHSEqXFll1DgqFozr4qow6/nRyiW3Qi0FAHFwQswD8AWubayh3lr11Dalsm5ukyKaXTx
 7vfqX/u+be+WrbYkhS6u10lbWG+OCEWOjPrSPOx1+2dAofHE6rxtrI4ZbR1KiN6dnGfS
 +MOQ==
X-Gm-Message-State: AAQBX9f7FjqK3qUnuRhBJwSgNj+QCqAV51Q82NyNSgzZJY2zrc2FqjZ5
 KVQ063ZMXf8+XGCyonTlhcFJnA==
X-Google-Smtp-Source: AKy350ZmeCjCwas3F11HTg/YpngWMJ8S9uOnUWYkwxB3VZ3DPtp0QmSizwnfAGoFaIIO2pFNqSFDGw==
X-Received: by 2002:adf:e44d:0:b0:2d0:d739:f901 with SMTP id
 t13-20020adfe44d000000b002d0d739f901mr28690522wrm.20.1680529761379; 
 Mon, 03 Apr 2023 06:49:21 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t16-20020adfdc10000000b002e5ff05765esm9249097wri.73.2023.04.03.06.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2C941FFB7;
 Mon,  3 Apr 2023 14:49:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 00/11] more misc fixes for 8.0 (tests, gdbstub, meta, docs)
Date: Mon,  3 Apr 2023 14:49:09 +0100
Message-Id: <20230403134920.2132362-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Testing of kaniko as an alternative builder ran into the weeds so that
patch has been dropped. It looks like the gitlab registry doesn't
support layer caching. However the build also seems to be very
unstable leading to a bunch of container build failures, e.g.:

  https://gitlab.com/stsquad/qemu/-/pipelines/823381159/failures

I've also dropped the avocado version bump. We do gain two new patches
- one minor gdbstub fix for BSD and including the Xen KVM test.

It would be nice to get some review of the documentation update from
the block maintainers but if no one objects I still intend to merge it
in lieu of anything better.

I'll roll the PR tomorrow morning.

Alex.

Alex Bennée (6):
  scripts/coverage: initial coverage comparison script
  gdbstub: don't report auxv feature unless on Linux
  MAINTAINERS: add a section for policy documents
  qemu-options: finesse the recommendations around -blockdev
  metadata: add .git-blame-ignore-revs
  gitlab: fix typo

Daniel P. Berrangé (2):
  tests/qemu-iotests: explicitly invoke 'check' via 'python'
  tests/vm: use the default system python for NetBSD

David Woodhouse (1):
  tests/avocado: Test Xen guest support under KVM

Marco Liebel (1):
  Use hexagon toolchain version 16.0.0

Philippe Mathieu-Daudé (1):
  gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa if necessary

 MAINTAINERS                                   |  19 ++
 gdbstub/gdbstub.c                             |   2 +-
 .git-blame-ignore-revs                        |  21 +++
 .gitlab-ci.d/base.yml                         |   2 +-
 gdbstub/meson.build                           |   6 +-
 qemu-options.hx                               |   8 +-
 scripts/coverage/compare_gcov_json.py         | 119 ++++++++++++
 tests/avocado/kvm_xen_guest.py                | 170 ++++++++++++++++++
 .../dockerfiles/debian-hexagon-cross.docker   |   2 +-
 tests/qemu-iotests/meson.build                |   7 +-
 tests/vm/netbsd                               |   3 +-
 11 files changed, 347 insertions(+), 12 deletions(-)
 create mode 100644 .git-blame-ignore-revs
 create mode 100755 scripts/coverage/compare_gcov_json.py
 create mode 100644 tests/avocado/kvm_xen_guest.py

-- 
2.39.2



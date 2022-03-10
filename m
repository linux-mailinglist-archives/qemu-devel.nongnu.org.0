Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CB4D4806
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:26:35 +0100 (CET)
Received: from localhost ([::1]:47068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIoM-0001QC-G2
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:26:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9U-0006bS-Rz; Thu, 10 Mar 2022 07:44:23 -0500
Received: from [2a00:1450:4864:20::42f] (port=43703
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9S-00059T-AI; Thu, 10 Mar 2022 07:44:20 -0500
Received: by mail-wr1-x42f.google.com with SMTP id e24so7739470wrc.10;
 Thu, 10 Mar 2022 04:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X6K42UfDM1IMF5PNflE3p4SsYa8sU5Qjxltrc0jO2po=;
 b=LEqC/rgfOjNI4g5hEyp9UUYW2sW3h1X629eeWzhKQ0E+IDJ7O6bKWwHidRS3IWTqsL
 lbSu1v9aQgfg5HZScLGzjI4zP16FFVChjZXIUsnECUbqOUUa0hP1oGXf7xqBGfSOBKEk
 teVMET3awlOYoCrTDITLVRd3QDja0kW+fh94AMVpPy0rpXl388dEuXJGFP2INN8QBR1x
 Ey0ClH1kDW4hhm8+pyscD3wCL6CiJQfsmObDIqgK6XbMR6xroNNl+U/23B3pEaMslAkN
 zOIAC1M2emeb+tRDMkFEkMNIV52E8wuMyH0yEJkLIMvKv3lEEixKl5IQY1+U81gGO1+3
 ubxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=X6K42UfDM1IMF5PNflE3p4SsYa8sU5Qjxltrc0jO2po=;
 b=pQY4w0ubS90PNy6ttsjfnrd7hhGYbrafKK7q5EtwL3aMRGWUQuKOpyV1gCOO0mxsyQ
 c7HudWImsyhaWuR1zGtt4SMrP5vX/s2Uye+epv/GISTEw18V+t3319Ps7MWczuAVdjVm
 p1smIOmCG7bPW+kPIhTiGqbiWSqVOp2wbBhjdbtPd6Wk2g1Vyk5pQEhok+MTYleRXbVy
 +49Ry408zr2UCikuwCTwCI13jJIEgVc1emnB16vOORpZqgI/2+r/Gkknzd27rsN3AGJo
 HRCfCrEHr4eP8DPKm1M6i/7sEyLIvZ2t5hF4ekMwkByjOv950kYBm7SvitfQiaHbTW1w
 BEcg==
X-Gm-Message-State: AOAM531sbS8ef/3aS67g0nQOErLDa/pHsq6N+w08P/2e7yssVd4VuqoF
 LAJR234KJBLyaGG+nZJDoVEbb/4P2Zw=
X-Google-Smtp-Source: ABdhPJy6NjvUK0p82fC5Abr7RE2jPv4u72OozrgJVcJ2zh6X2ORC2xVIEj7gqi8+xb55+if+YtSJnA==
X-Received: by 2002:a5d:64e5:0:b0:1fb:5b9a:1a20 with SMTP id
 g5-20020a5d64e5000000b001fb5b9a1a20mr3431406wri.34.1646916256141; 
 Thu, 10 Mar 2022 04:44:16 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:15 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 00/35] stackless coroutine backend
Date: Thu, 10 Mar 2022 13:43:38 +0100
Message-Id: <20220310124413.1102441-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here is an experiment with using stackless coroutines in QEMU.  It
only compiles enough code to run tests/unit/test-coroutine, but at
least it proves that it's possible to quickly test ideas in the
area of coroutine runtimes.  Another idea that could be toyed with
in a similar manner could be (whoa) C++ coroutines.

As expected, this also found some issues in existing code, so I
plan to submit patches 1-5 separately.

The new backend (which is the only one that works, due to the required
code changes) is in patch 7.  For the big description of what stackless
coroutines are, please refer to that patch.

Patches 8-11 do some initial conversions.  Patch 12 introduce some
preprocessor magic that greatly eases the rest of the work, and then
the tests are converted one at a time, until patch 27 where the only
ones missing are the CoRwlock tests.

Therefore, patches 28-33 convert CoRwlock and pathces 34-35 take care
of the corresponding tests, thus concluding the experiment.

Paolo

Paolo Bonzini (35):
  coroutine: add missing coroutine_fn annotations for CoRwlock functions
  coroutine: qemu_coroutine_get_aio_context is not a coroutine_fn
  coroutine: introduce QemuCoLockable
  coroutine: introduce coroutine_only_fn
  coroutine: small code cleanup in qemu_co_rwlock_wrlock
  disable some code
  coroutine: introduce the "stackless coroutine" backend
  /basic/lifecycle
  convert qemu-coroutine-sleep.c to stackless coroutines
  enable tail call optimization of qemu_co_mutex_lock
  convert CoMutex to stackless coroutines
  define magic macros for stackless coroutines
  /basic/yield
  /basic/nesting
  /basic/self
  /basic/entered
  /basic/in_coroutine
  /basic/order
  /perf/lifecycle
  /perf/nesting
  /perf/yield
  /perf/function-call
  /perf/cost
  /basic/no-dangling-access
  /locking/co-mutex
  convert qemu_co_mutex_lock_slowpath to magic macros
  /locking/co-mutex/lockable
  qemu_co_rwlock_maybe_wake_one
  qemu_co_rwlock_rdlock
  qemu_co_rwlock_unlock
  qemu_co_rwlock_downgrade
  qemu_co_rwlock_wrlock
  qemu_co_rwlock_upgrade
  /locking/co-rwlock/upgrade
  /locking/co-rwlock/downgrade

 configure                    |  44 +---
 include/qemu/co-lockable.h   | 110 +++++++++
 include/qemu/coroutine.h     |  99 ++++++--
 include/qemu/coroutine_int.h |   6 -
 include/qemu/lockable.h      |  13 +-
 include/qemu/typedefs.h      |   1 +
 tests/unit/meson.build       |   2 +-
 tests/unit/test-coroutine.c  | 425 +++++++++++++++++++++++++++++------
 util/coroutine-stackless.c   | 159 +++++++++++++
 util/meson.build             |  10 +-
 util/qemu-coroutine-lock.c   | 215 ++++++++++++++----
 util/qemu-coroutine-sleep.c  |  57 ++++-
 util/qemu-coroutine.c        |  18 +-
 13 files changed, 932 insertions(+), 227 deletions(-)
 create mode 100644 include/qemu/co-lockable.h
 create mode 100644 util/coroutine-stackless.c

-- 
2.35.1



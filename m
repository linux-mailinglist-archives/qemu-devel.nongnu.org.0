Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A33155ED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:29:41 +0100 (CET)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xlc-0004Gu-4D
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xju-0002g0-7E
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:37630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Xjs-0007kx-Gh
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id m1so4453225wml.2
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5R1e9GR/GLdG/klE7zT/bf5QWdvO/X/18117WqldYxM=;
 b=RoJZ/WvdabsZhnP+eFDDeN06q5haBA+jhMcuds1lNfJtSohU23h7LTRERw8rEaobyR
 abpnJF92kWFpa81KL1zToZDq8zD5gVmm9Ox/SG+keQ5NyVrGBMdW6+0SFROsnkCgrm7r
 B7358U923TlOsI6esJ+BFGPKwqMtOWMDndNFNBJjVtZUJ+BtSRaCQ0cEiGRWx6OHaHeE
 h71lGRaiileLRlJuwn53obQbELqWAdUtPEaWKHF30eNyJqwb5J3+bhYA3cmtkjjwYJbd
 6V4TNx8lCFvAdpQi1oPVDHswoSZULsjp5jfL6djYLR9ecZsyy8iZoiYibGIah1gLZoBX
 USfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5R1e9GR/GLdG/klE7zT/bf5QWdvO/X/18117WqldYxM=;
 b=OCWLfBh9HaEgyXJWvV1tyEyydcTxx1egPnqAkWhhjEX/Ec5vi6Iue1VhZXpppXK0S5
 UWJNvdwcebFsVxPhrJbdbLzxtED9z4gwYTd+UzrmiK0Gb2a3CFXq2/ln9K02iVOu1noQ
 BS1S/JUlC39VtmHjhWStxUT8Y1t3wvxSbszXITBnR9rBya0JWfApiD9dKED5q9qTFEmx
 GdKF4B/oiefxXT9fKfsfYopDksyk7zOF6MM8yTmekbmn7ToBItOUaknkWfPyAbf4NDp5
 B8FkEsGLvsfe6F1UW2mcph/3em75XLBlWX5EhVft+HhURxoy1NAK95jzjHO8jd4th6zR
 SPQQ==
X-Gm-Message-State: AOAM533+iy0hqBKj9bpf/OcEhq07CSe0ttel2RcCamwyhhUD3DPUWlw6
 mM1VCcht1uWV/n3X6Cc4LuISHg==
X-Google-Smtp-Source: ABdhPJzI2s6m5LxbswVt0VPJOFQgQYlxbAVLVMKos1b/B8Pkcl5zV+Oc/Lsw04sWTNtXxbUjzKQpbA==
X-Received: by 2002:a05:600c:216:: with SMTP id
 22mr4545410wmi.111.1612895270881; 
 Tue, 09 Feb 2021 10:27:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm37707841wrt.69.2021.02.09.10.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 10:27:49 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2EB881FF7E;
 Tue,  9 Feb 2021 18:27:49 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 00/12] fix plugins double counting with mmio,
 cleanup CF_ flags
Date: Tue,  9 Feb 2021 18:27:36 +0000
Message-Id: <20210209182749.31323-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: kuhn.chenqun@huawei.com, aaron@os.amperecomputing.com, cota@braap.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 robhenry@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Aaron reported an issue with TCG plugins when interacting with the
cpu_io_recompile code during icount. The ultimate fix was to avoid
instrumenting the re-executed block but along the way we clean-up a
bunch of the code by getting rid of CF_NOCACHE. I've also included
Richard's recently posted recompile hook cleanups at the start of the
series because it makes the improves the diffstat by pushing more arch
specific black magic to the targets. In fact without the additional
tests this removes more code than it adds ;-)

I've added some acceptance tests to detect the failure mode as well as
manually testing with a test Peter had lying around that exercises the
trixy "executing out of MMIO" code path which I've touched.

Please test and review.

Alex Bennée (8):
  tests/plugin: expand insn test to detect duplicate instructions
  tests/acceptance: add a new set of tests to exercise plugins
  accel/tcg: actually cache our partial icount TB
  accel/tcg: cache single instruction TB on pending replay exception
  accel/tcg: re-factor non-RAM execution code
  accel/tcg: remove CF_NOCACHE and special cases
  accel/tcg: allow plugin instrumentation to be disable via cflags
  tests/acceptance: add a new tests to detect counting errors

Richard Henderson (4):
  exec: Move TranslationBlock typedef to qemu/typedefs.h
  accel/tcg: Create io_recompile_replay_branch hook
  target/mips: Create mips_io_recompile_replay_branch
  target/sh4: Create superh_io_recompile_replay_branch

 include/exec/exec-all.h         |   6 +-
 include/exec/tb-context.h       |   1 -
 include/hw/core/cpu.h           |   4 +-
 include/hw/core/tcg-cpu-ops.h   |  13 +++-
 include/qemu/typedefs.h         |   1 +
 target/arm/internals.h          |   3 +-
 accel/tcg/cpu-exec.c            |  62 ++++-----------
 accel/tcg/translate-all.c       | 128 +++++++++++-------------------
 accel/tcg/translator.c          |   2 +-
 target/cris/translate.c         |   2 +-
 target/lm32/translate.c         |   2 +-
 target/mips/cpu.c               |  18 +++++
 target/moxie/translate.c        |   2 +-
 target/sh4/cpu.c                |  18 +++++
 target/unicore32/translate.c    |   2 +-
 tests/plugin/insn.c             |  12 ++-
 tests/acceptance/tcg_plugins.py | 134 ++++++++++++++++++++++++++++++++
 17 files changed, 263 insertions(+), 147 deletions(-)
 create mode 100644 tests/acceptance/tcg_plugins.py

-- 
2.20.1



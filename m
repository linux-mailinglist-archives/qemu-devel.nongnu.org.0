Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A5363888
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:36:53 +0200 (CEST)
Received: from localhost ([::1]:43738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGyC-0000st-Hl
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwI-0008Db-Q0
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:34:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:52962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwH-0002wU-5w
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:34:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id y204so15786791wmg.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r01iM2KbID8qjwwpuUA9Z/vootSEp7qdc6/UZqHFLOI=;
 b=NA0++XsM9e5B0KBQnEns6pbruuFFpR5/A6D3GjAdY8uBBBptG8++GmMGDwenpIDiWC
 PpBe5y3SDrKWyXy/rLtlnEgjA2QrmvH0dBEIKDy8ulflvMMi2gURH/n/dqvkuzXC/tp9
 ZcHLdFwVOrm6EV7HJO/xIYXvoX98Mts30bRkxGqSmbufSxCqs3i9ztzPr2ZEPmB1bRDV
 N9xXmjayahpnxj882jiPd/1m05aAaIJqRpyTnnGXtuabrmNOmJpUhioaa18vd8ZkRIYj
 mSceQvGQ9F3bqI538iVhEBrf52S0xq/FgGTvZo9j1uZTBFLYAWsByQmrNDwRLGPk47E4
 RjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=r01iM2KbID8qjwwpuUA9Z/vootSEp7qdc6/UZqHFLOI=;
 b=fYwLZbO7NdmDZm3XyDTM6SbFGCnQO/ozlDKGI8jHK4kYxk1MVrNAWA0tfXr2nwAgIe
 xw0bInBnBS0du7mZ5yWrcMxC3qkJTUDha3FyCQrZ36JT82WehGs/835iJ0mz3/ckrqjY
 qJNY1xh8saI7s+xc0U8CMn6833HIHRP0mIVdGEncbjCaW5GdI1aFgKHsoUF0MoN82i8y
 KMvKkZaw6ApoxkJNip3ARS6ySgT8O8yfVdyN37ZsqjCJxdsU8LOA3hykPsVsmkCkaUeD
 3K9kvHFaOY2RfB+yAN2aAoEcSY/3EUzmhUFBUGlaq2K0/uME2zlBtsU4oQB3Wuw2sV7f
 qP6A==
X-Gm-Message-State: AOAM530rRNXwfLm2ufWD0Ujw05XZLNV9KJkNqvLZYk/KHn9ipGLkrNAy
 bGGIlxlwSaoMvOzXg2dihRoj9QE9lXuvzQ==
X-Google-Smtp-Source: ABdhPJw0mVmrVh4wopjziETzckyqST1vw9zQSeKVdS8N/Iddix+XApDbEdWrU3CaMq1qf7nEOp85Zw==
X-Received: by 2002:a1c:4089:: with SMTP id n131mr18883138wma.77.1618788891391; 
 Sun, 18 Apr 2021 16:34:51 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id z15sm19104521wrv.39.2021.04.18.16.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:34:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/15] gitlab-ci: Allow forks to use different pipelines
 than mainstream
Date: Mon, 19 Apr 2021 01:34:33 +0200
Message-Id: <20210418233448.1267991-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TL;DR: Patch 13 is an experiment to dynamically generate pipelines.=0D
=0D
Hi,=0D
=0D
This series is an intent to allow git forks to use different set=0D
of jobs than the ones used by the mainstream repository.=0D
=0D
Currently, a fork gets the mainstream CI pipeline YAML configuration=0D
and runs its set of jobs by default. Mainstream tests many cases=0D
which might not be always useful to forks. Beside, one mainstream=0D
pipeline might be a waste of ressources when forks provide their=0D
own runners to their gitlab namespace, or use private instances.=0D
=0D
This is not a new / unique problem to our community, and Gitlab=0D
already figured it out. They describe this case as Upstream (our=0D
project mainline) / Downstream (a fork).=0D
=0D
The pipeline is divided in 2 steps. First the "upstream" part, which=0D
does some evaluation, and depending on the result, triggers the=0D
"downstream" part. The "upstream" is committed into mainline, and=0D
dynamically generate the "downstream" pipeline. This allows forks=0D
to easily rebase with mainstream, avoiding merge conflicts.=0D
=0D
This might not be adapted to the QEMU use case, but I wanted to give=0D
it a try.=0D
=0D
Gitlab recommends to use job templates. To be able to re-use /=0D
include templates, they can not use YAML anchors. All current jobs=0D
has first to be converted to use the 'extends' keyworkd.=0D
This is done by patches 1-5 (already reviewed).=0D
=0D
Patches 6-12 extract various generic jobs (which can be reused by=0D
forks) as template.=0D
=0D
Patches 13-14 follow Gitlab guideline to generate dynamic pipelines=0D
=0D
Patch 15 is an example of how a fork could use mainstream templates=0D
to maintain his own set of jobs.=0D
=0D
The PRO is forks can contribute to templates.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (15):=0D
  gitlab-ci: Replace YAML anchors by extends (container_job)=0D
  gitlab-ci: Replace YAML anchors by extends (native_build_job)=0D
  gitlab-ci: Replace YAML anchors by extends (native_test_job)=0D
  gitlab-ci: Replace YAML anchors by extends (acceptance_test_job)=0D
  gitlab-ci: Rename acceptance_test_job -> integration_test_job=0D
  gitlab-ci: Extract container job template to container-template.yml=0D
  gitlab-ci: Extract crossbuild job templates to crossbuild-template.yml=0D
  gitlab-ci: Extract DCO/style check jobs to checks.yml=0D
  gitlab-ci: Extract build stages to stages.yml=0D
  gitlab-ci: Extract all default build/test jobs to buildtest.yml=0D
  gitlab-ci: Extract core container jobs to container-core.yml=0D
  gitlab-ci: Move current job set to qemu-project.yml=0D
  gitlab-ci: Switch to dynamically generated pipelines=0D
  gitlab-ci: Allow forks to use different set of jobs=0D
  gitlab-ci: Use my own set of jobs for CI pipeline=0D
=0D
 .gitlab-ci.d/buildtest-template.yml  |  80 +++=0D
 .gitlab-ci.d/buildtest.yml           | 744 +++++++++++++++++++++++=0D
 .gitlab-ci.d/checks.yml              |  24 +=0D
 .gitlab-ci.d/container-core.yml      |  17 +=0D
 .gitlab-ci.d/container-template.yml  |  22 +=0D
 .gitlab-ci.d/containers.yml          | 108 ++--=0D
 .gitlab-ci.d/crossbuild-template.yml |  41 ++=0D
 .gitlab-ci.d/crossbuilds.yml         |  43 +-=0D
 .gitlab-ci.d/philmd.yml              |  33 ++=0D
 .gitlab-ci.d/qemu-project.yml        |   8 +=0D
 .gitlab-ci.d/stages.yml              |   8 +=0D
 .gitlab-ci.yml                       | 845 +--------------------------=0D
 12 files changed, 1033 insertions(+), 940 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/buildtest-template.yml=0D
 create mode 100644 .gitlab-ci.d/buildtest.yml=0D
 create mode 100644 .gitlab-ci.d/checks.yml=0D
 create mode 100644 .gitlab-ci.d/container-core.yml=0D
 create mode 100644 .gitlab-ci.d/container-template.yml=0D
 create mode 100644 .gitlab-ci.d/crossbuild-template.yml=0D
 create mode 100644 .gitlab-ci.d/philmd.yml=0D
 create mode 100644 .gitlab-ci.d/qemu-project.yml=0D
 create mode 100644 .gitlab-ci.d/stages.yml=0D
=0D
-- =0D
2.26.3=0D
=0D


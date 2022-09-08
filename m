Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224015B1F35
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:32:14 +0200 (CEST)
Received: from localhost ([::1]:55962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHdc-0001oz-T8
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHa1-0004SW-6o; Thu, 08 Sep 2022 09:28:30 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHZz-0002aC-NW; Thu, 08 Sep 2022 09:28:28 -0400
Received: by mail-pj1-x102c.google.com with SMTP id o4so17778595pjp.4;
 Thu, 08 Sep 2022 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=YXlktPsWk3inBfe9ammWRoCM+NL+p/EqWYsk+luM1kw=;
 b=nSpwhfum+77A76GOYymDiVAEzP0xY/7AHFDbMqPbUi4JUCJTzBF/iKAWD9a3hjJa2K
 KrLOOhTfzZNC+2wcO0TaPVz7PT0rH4IPFTkVs9tMRhaGsH/ee1bseY/be0lVcfh6ec7l
 lSwECCmbEuiFtX+cHYZDh9eygao3tiR99dUEG9lHlwR6cTKkpkoWcjkzKmeqLOCE56Ti
 MkiLRBxOXf5q4y523bo1Mq6M7/X4J0ZD/cs5CT/4SDkPXtbuswvIaeJbUNapBsKoxYF5
 EdXJ7K24NgNBIkScjPrTQZqbDoYZby6/wBCbOoxa7zkjCv6rnGaqghS2YWWCtz4aKA+j
 HotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=YXlktPsWk3inBfe9ammWRoCM+NL+p/EqWYsk+luM1kw=;
 b=gXSSWU8ohl/Aum8wNo4b50UnQuLuPHXhBKN9zAMyppM4ke7CSLofuBCH1TvYgN5OV2
 n9ay2BMmoLVuqMLgt0nl8wLZee9DVVY9lj0AavSuEYpYgiMoeu1hlPfuG3OLKYYn7zvI
 R54Yn+RJYVDde19BbAD7rQRYnJ7hvArlrsqzyHVfYRVn7kUNG/HWJx7xu9TodhMU/+V2
 Q1Xmsjjq0dELIGlT5I8syCLp/crjLNURmTOSJ7ejWXiDSiO8vAInsJPcUk6hL4ziP9r4
 aE198QsQl202BGokbNEpghajKdhSAxUn8uWpY8khU76uPb6ToyM6RQAAAiOy2Nf/aiee
 AGJg==
X-Gm-Message-State: ACgBeo1ZGLz6XvSlVRLRcMA5ceVpK4tKy5dj0jHmKM/XnuMWi06gbtjD
 7HsD7oMMj2zalAs7JmYphEJEQlf/yKA=
X-Google-Smtp-Source: AA6agR5Dg4+NrDpu7q+kpCpIhDmVFHaDizR/OdyqyeM+Uxmo9krjV9aiy9ED5zIAjbmwWTpfx8umdQ==
X-Received: by 2002:a17:902:a502:b0:172:5f2a:9e35 with SMTP id
 s2-20020a170902a50200b001725f2a9e35mr8757221plq.79.1662643703821; 
 Thu, 08 Sep 2022 06:28:23 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-block@nongnu.org
Subject: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer packaging
Date: Thu,  8 Sep 2022 21:28:10 +0800
Message-Id: <20220908132817.1831008-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present packaging the required DLLs of QEMU executables is a
manual process, and error prone.

Improve scripts/nsis.py by adding a logic to automatically package
required DLLs of QEMU executables.

'make installer' is tested in the cross-build on Linux in CI, but
not in the Windows native build. Update CI to test the installer
generation on Windows too.

During testing a 32-bit build issue was exposed in block/nfs.c and
the fix is included in this series.


Bin Meng (7):
  scripts/nsis.py: Drop the unnecessary path separator
  scripts/nsis.py: Fix destination directory name when invoked on
    Windows
  scripts/nsis.py: Automatically package required DLLs of QEMU
    executables
  .gitlab-ci.d/windows.yml: Drop the sed processing in the 64-bit build
  block/nfs: Fix 32-bit Windows build
  .gitlab-ci.d/windows.yml: Unify the prerequisite packages
  .gitlab-ci.d/windows.yml: Test 'make installer' in the CI

 meson.build              |  1 +
 block/nfs.c              |  8 ++++++
 .gitlab-ci.d/windows.yml | 40 ++++++++++++++++++++-------
 scripts/nsis.py          | 60 +++++++++++++++++++++++++++++++++-------
 4 files changed, 89 insertions(+), 20 deletions(-)

-- 
2.34.1



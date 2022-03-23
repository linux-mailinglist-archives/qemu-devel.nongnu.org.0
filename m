Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9E4E514E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:29:05 +0100 (CET)
Received: from localhost ([::1]:59890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWzAm-0004e2-59
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:29:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz92-0001p4-H6
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:17 -0400
Received: from [2a00:1450:4864:20::431] (port=43003
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWz90-00063i-R8
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:27:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id r13so1640362wrr.9
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eUvnyW2LvwbLgR8kCxa+Rf8KWTM16c1/KjF1EBVHb1w=;
 b=ITHNqBaomZ2osvEP1wqINaBpjcjOfQnmZxW2fMaLykg0AoZdpAkA+mNTais5xOsaAw
 rnHAQwIumb+wtYm8PyOXVU8K/ta9YUseVpd2Yi0SPx68mEwkFzV7T2szXzzCnqOikv04
 HPQ6dYrnEYIKCzq6aOmOs55plkz2DmjPxme8dQXFKH3KuIf2J/A/7iB8mqrL8bxjqPnw
 Go+pFpILQwJlUAPyyxEV0K9jbvR8Wgw+doOyJn0PdbQ8TnTAdTdabI4jcP+xXhMUWDyd
 yUfaUkgOtDN6+aHOMhEAcj7t8Fyzd1tQndCFZf3WhsadHDIUU1raQWlbY235s8rHnHw+
 fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eUvnyW2LvwbLgR8kCxa+Rf8KWTM16c1/KjF1EBVHb1w=;
 b=znuJhyO+YtiblJxlx9ysOLDvZCpvl7nT7YRs49/j/8+PgC6z2a2qF2PonHOL+Fwsw1
 F268WaL649daR0anBdw+32Ng4EauYOhiUK3k3YyOa5b40I8cGoUZJ0OKeyLYqRDS/LVF
 Sm9VSXau8ktK7jfMvdV1xXBzNySujv3XJ8xjz9Wec1diuxDqPZPFuJoHX81gAPAJtwVN
 V8YSdy1evOR4iJYXlx1uTTHNqC4Ok78EvqQ3tptgJdcKVAELjlANZutCvU+tDGSeFhwX
 Vzi8kifCxm5+Tm4uAT6Msjk0mmrcOCG+c0uOAFR6NvA6P8Tz8HOobMAiYj6064c9kgDb
 q/Rw==
X-Gm-Message-State: AOAM531I4IAs14Uax52X8cb7q0bCWhYk15xc0RNjFBhsdrOmJKbe2GeG
 FZuCQZ6MtG5L0yC7Ka+KxbScdA==
X-Google-Smtp-Source: ABdhPJwhbFnepsk+N+Qyp5+Ceze59Vpt2OVE2q60HMdturH70kgsP77uzsGlWYnRPVGMlxN0L3XumQ==
X-Received: by 2002:adf:e508:0:b0:203:f27e:d2a8 with SMTP id
 j8-20020adfe508000000b00203f27ed2a8mr22513905wrm.41.1648034833205; 
 Wed, 23 Mar 2022 04:27:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c26cb00b0037ff53511f2sm3598435wmv.31.2022.03.23.04.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 04:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 838FC1FFB7;
 Wed, 23 Mar 2022 11:27:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL for 7.0 0/8] i386, docs, gitlab fixes
Date: Wed, 23 Mar 2022 11:27:03 +0000
Message-Id: <20220323112711.440376-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 15ef89d2a1a7b93845a6b09c2ee8e1979f6eb30b:

  Update version for v7.0.0-rc1 release (2022-03-22 22:58:44 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-fixes-for-7.0-230322-1

for you to fetch changes up to 0f37cf2f71f764c5649e149c774172df7ab187c7:

  docs/tcg-plugins: document QEMU_PLUGIN behaviour (2022-03-23 10:38:09 +0000)

----------------------------------------------------------------
Various fixes for 7.0

  - make clean also cleans tcg tests
  - fix rounding error in i386 fildl[l]
  - more clean-ups to gitdm/mailmap metadata
  - apply some organisation to docs/devel
  - clean-up semihosting argv handling
  - add custom runner for aarch32
  - remove old qemu_logo.pdf
  - document QEMU_PLUGIN env var

----------------------------------------------------------------
Alex Bennée (6):
      target/i386: force maximum rounding precision for fildl[l]
      mailmap/gitdm: more fixes for bad tags and authors
      docs/devel: try and impose some organisation
      semihosting: clean up handling of expanded argv
      gitlab: include new aarch32 job in custom-runners
      docs: remove qemu_logo.pdf

Christoph Muellner (1):
      docs/tcg-plugins: document QEMU_PLUGIN behaviour

Thomas Huth (1):
      tests/Makefile.include: Let "make clean" remove the TCG tests, too

 docs/devel/index-api.rst                           |  15 +++++++
 docs/devel/index-build.rst                         |  19 +++++++++
 docs/devel/index-internals.rst                     |  21 ++++++++++
 docs/devel/index-process.rst                       |  17 ++++++++
 docs/devel/index-tcg.rst                           |  16 +++++++
 docs/devel/index.rst                               |  46 ++++-----------------
 docs/devel/tcg-plugins.rst                         |   9 +++-
 docs/qemu_logo.pdf                                 | Bin 9117 -> 0 bytes
 semihosting/config.c                               |   6 +--
 target/i386/tcg/fpu_helper.c                       |  13 ++++++
 .gitlab-ci.d/custom-runners.yml                    |   1 +
 ...-20.40-aarch32.yml => ubuntu-20.04-aarch32.yml} |   0
 .mailmap                                           |   6 +++
 contrib/gitdm/aliases                              |   4 +-
 tests/Makefile.include                             |   2 +-
 15 files changed, 129 insertions(+), 46 deletions(-)
 create mode 100644 docs/devel/index-api.rst
 create mode 100644 docs/devel/index-build.rst
 create mode 100644 docs/devel/index-internals.rst
 create mode 100644 docs/devel/index-process.rst
 create mode 100644 docs/devel/index-tcg.rst
 delete mode 100644 docs/qemu_logo.pdf
 rename .gitlab-ci.d/custom-runners/{ubuntu-20.40-aarch32.yml => ubuntu-20.04-aarch32.yml} (100%)

-- 
2.30.2



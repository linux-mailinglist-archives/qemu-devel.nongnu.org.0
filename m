Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8F669C958
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU45y-0004Uy-12; Mon, 20 Feb 2023 06:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45j-0004SA-Q7
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:20 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pU45i-0006Rp-6j
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:12:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id m23so617777wms.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g/Pwj7to5aA8eC+rZhEqXEy/D80eL61vdmDF0vzitvw=;
 b=bvfcGWwaMsmAUI40wCgFbc9N85xea8FUOyftNnHIM3XpjsS+eVU7WvyAcoepkIiWaW
 OuOjUkWW7j08qjD0YYUD86kTZCFImt94OaWmY/7QVxQMuZYFSIcs94urStvsqEiivhR+
 MNB+BPfBVLKg6roaax7s2L3W28si9PCizbwURSEYnWT4rDkPag+dq6ktLu3OMZGWvEkS
 TQKJFfuFN5w7U+bu3Ab1Q4sxpbGl/17eZiI+syq0hb4wPwtiD/7GQC6TGxPNrKnrKZlU
 ujEro8aKaRqFjTl5Qx7F3AVzQuborjiylxOtIuwdE4bt14zAEVULQQtvSwAmYrnJDt+A
 m7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g/Pwj7to5aA8eC+rZhEqXEy/D80eL61vdmDF0vzitvw=;
 b=k1tYZp8MvtX4k+urXGcrKjMENTZQTwqQZwA6UZUR0T+kssVvfrbqmeUzuv7I97ZO7R
 hXa0T9mifrxbhnznWK5uaVJ+u4dU4m++7VWAl/z+u38fuUi34cwCuNrA3D+vIkif7uoG
 pciMDuKelzFyk7yRk7HM04O9ZyGnfmB3/0zAbyKYBloOP1nysBv35Z+X8WyKK+IqLPM2
 a8ut/v6rv8O7Tksbf0bv/JDCsXfOMBv79K6aOE9ZbvVX7LVkrc4+nl//BjQLQFs9HD/X
 eqb9iNXtPLDQNNEML+WfTo37ozuwsRKN7Cm46PfqwijD7eZQCnpxZqP0Mv05L7WABe68
 yqPg==
X-Gm-Message-State: AO0yUKXyye0keGBVMqISuFKXLBSy65gNZ/B8R1wI5vyWEC6HiMwltpBS
 SuyHixRIFqJ5X1s6bT6Qi/bPxREItZQucq0pVYM=
X-Google-Smtp-Source: AK7set9bhoSUpMW5s5RCxOwUgCuuTkIHb4QaiEkIILey7rsYXygirp7Xd1cy1YXf0FqLzSyAlczUrA==
X-Received: by 2002:a05:600c:a29d:b0:3e2:665:4e48 with SMTP id
 hu29-20020a05600ca29d00b003e206654e48mr640096wmb.0.1676891535629; 
 Mon, 20 Feb 2023 03:12:15 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 q2-20020adff942000000b002c573778432sm5046656wrr.102.2023.02.20.03.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 03:12:15 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 0/4] Adds support for running QEMU natively on windows-arm64
Date: Mon, 20 Feb 2023 12:12:11 +0100
Message-Id: <20230220111215.27471-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since v2:

- Delete superfluous comment on unreachable code
- Fix style for multiline comments

Since v1:

- Comment why we use generic version of flush_idcache_range
- Ensure __mingw_setjmp/longjmp are available using meson
- Fix a warning by calling g_assert_not_reached() instead of initializing a
  variable

As before this was tested with:
- make check
- boot an x64 debian bullseye vm
- boot an arm64 ubuntu 22.10 vm

Thanks

Pierrick Bouvier (4):
  util/cacheflush: fix cache on windows-arm64
  sysemu/os-win32: fix setjmp/longjmp on windows-arm64
  qga/vss-win32: fix warning for clang++-15
  target/ppc: fix warning with clang-15

 include/sysemu/os-win32.h | 25 +++++++++++++++++++++++--
 meson.build               | 24 ++++++++++++++++++++++++
 qga/vss-win32/install.cpp |  2 +-
 target/ppc/dfp_helper.c   |  4 ++--
 util/cacheflush.c         | 14 +++++++++++---
 5 files changed, 61 insertions(+), 8 deletions(-)

-- 
2.30.2



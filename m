Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C01699648
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 14:50:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSedS-0001TZ-FQ; Thu, 16 Feb 2023 08:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedR-0001TN-BJ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:17 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1pSedP-0001a3-LS
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 08:49:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so1709467wms.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bd5H0WImwMjPW3TBJPLlxjV+HxVE0c2rQwXonUsYG6g=;
 b=y9P2idz2jkMDQdb+zsN7MWVzSMMKxgIo/8OAv1v/Eekp3htckyRbYoqCqdo9tjatSj
 tsXIzYIa6jCiDzn7l2OJn5xLn4OP3CpOdmO96U5M2oG8qfgpGaMW1FwGyf3pkza1db/F
 aiCJk5jV9eWc0++2hMQwyTg9KVN2PRw2uLCo2SMSInvVyTcoJZ/yRmH+TsvdhpL81tKS
 JIgOAQ6JyEErqfd5oW68ggE5OepVnJcYlh0NeNdg30X4rJXMrGvLvntAdXcSkIhuIkom
 rfUKax595WXdnk8fMHHU/wQcVrTnx4f/DRcuWYgoZJfujiy5NYziC8+RlVJRra4KLgR/
 Cg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bd5H0WImwMjPW3TBJPLlxjV+HxVE0c2rQwXonUsYG6g=;
 b=Qm4jAkkfW0JJw/dL4Mhq/7rI5+WaaAhZV0y9T26DV/jsD9gCsenzFq5nGWv8esdXPD
 BaTHTijW+tiKapuJvQDgPpryf6c+Ccrjzri+vMPMRhUwGrK+Z5nP102PkTby1y5eAAFX
 bV1xrUYEyKSv+/lxbo2a7TbGH3TiV28PfMSSG5v1OVUIqiySwfWLxVk0p9N7uXOJ1oy4
 lOtHZ7F50cpPf88mt1dgzmeZFUnPF+NXvMHnujxv4p6ZrYmFpI1VJrbf2ct+lrqzaATC
 YKJxFNdpOYaQwognwDg2aKc6qXfK0OcJoxvJKExRbGwjfai4Po2/mZ78xFHbLyzvbWCV
 8+Ag==
X-Gm-Message-State: AO0yUKUDu7924LIE+s5Va4Oki1VUt8eoeF9BApBek2qLGYLLBZdXJSpF
 mwnGX81VzFKcvdRo+j0Hu29xw6lzzoH/prs/XZg=
X-Google-Smtp-Source: AK7set/cxkEes4JRGQyC17NwULE+bZ44JVMyV6UCbfWL574XSuyH/DNu1XNxuvDJfsNVJqmmU/ZQpw==
X-Received: by 2002:a05:600c:18a6:b0:3e2:f80:3df1 with SMTP id
 x38-20020a05600c18a600b003e20f803df1mr1694358wmp.19.1676555353367; 
 Thu, 16 Feb 2023 05:49:13 -0800 (PST)
Received: from volterra.localdomain ([2a01:e0a:5cc:caa0:c49d:d14a:e6ed:555a])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003dc0cb5e3f1sm1557933wmq.46.2023.02.16.05.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:49:12 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 peter.maydell@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 0/4] Adds support for running QEMU natively on windows-arm64
Date: Thu, 16 Feb 2023 14:49:07 +0100
Message-Id: <20230216134911.6803-1-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-wm1-x32c.google.com
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

 include/sysemu/os-win32.h | 21 +++++++++++++++++++--
 meson.build               | 22 ++++++++++++++++++++++
 qga/vss-win32/install.cpp |  2 +-
 target/ppc/dfp_helper.c   |  4 ++--
 util/cacheflush.c         | 10 +++++++---
 5 files changed, 51 insertions(+), 8 deletions(-)

-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0256D05E
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:14:33 +0200 (CEST)
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaVq-0008C2-Er
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJF-0006UN-50
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:29 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJD-0003Ox-PQ
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:28 -0400
Received: by mail-pl1-x634.google.com with SMTP id r6so203636plg.3
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TsboKHDJYIu5BEIJqCkd76aYeMsV8T9uXdlh43KjXMY=;
 b=D7jL9jV3XAedCj/pmVxB9eyJWctK/GqAWiiv/M9KURIpupPQfstxDIOaczjSN6Wmqu
 X0Qd3oNS2sOT1XXfBdsBfcG/Zdn30lphuGautcXO7hh6WL/cKrK8mTiyul8/Pxjt05GA
 97KnElZwd8u6B2aH0reJiC8uBm26FRMC5t7xxsa2Z5VO9jdJKx896ZPtOjuyJXGylvRr
 bnZINVnxLywAfxgVgmttRQvkZOv5RCjdMyrVqIgoi8hIc5cg8wVj07j9orPRrzu6TyM7
 YE11pLudO86ibynqNgtDnfLLSYtK6FoTjurkoBLSNN1Qs+q+6vjHpZyZAhRNpyzCAj/5
 S6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsboKHDJYIu5BEIJqCkd76aYeMsV8T9uXdlh43KjXMY=;
 b=ab+SnmUi8qxR33raEssA1Qg08AoDZLEzPcEUlw672Hq5P6RmMggmmyJQQbZIqE4ogv
 DX3LeI6CRJCa4GNvW5r+ejONm/urYR0TKwPTJ7yQqT1z0wzUqUQPIMLDK/ufI8/01Zjy
 svcgukZtoGCMkGzVzheDTzenPQf2eWaBSeslWvYtnbEsSDwO5kPwdIdoC3aM2fwdMo5g
 ngdLEitRAk6dcyVZwPrryPFOvShYzJ2fi1dBQt14RTdU9USonf9fcYReoUG93Mgi7YG+
 5VeuAwG8ZqTh7tNbFgvk7YN/KR9MzYUu9kES/YZvs7ZbkdLXUW0wZM3vLSD2rcF4U8um
 y9vA==
X-Gm-Message-State: AJIora96/H3Qa1PDfsid4Ta6l1lundsq24HrQKpZ6DH+9aQriCmpVx7w
 b6/IOa1WkgnnT0k2shn5SfiX4He47eJAcGJR
X-Google-Smtp-Source: AGRyM1vYOirkFeXB7XpxhGA7J7CwaAQERUzBajhurlKWzfBSfd2jLADjH+e5/FtzmK7GQuVkW+YnCw==
X-Received: by 2002:a17:90b:1d04:b0:1ec:f898:d863 with SMTP id
 on4-20020a17090b1d0400b001ecf898d863mr12809937pjb.79.1657472486322; 
 Sun, 10 Jul 2022 10:01:26 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:25 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com,
 Ani Sinha <ani@anisinha.ca>
Subject: [PATCH v2 05/11] acpi/tests/bits: add SPDX license identifiers for
 bios bits smilatency tests
Date: Sun, 10 Jul 2022 22:30:08 +0530
Message-Id: <20220710170014.1673480-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Added the SPDX license identifier based on the following output from the
licensee tool for bios bits:

$ licensee detect bits/
License:        NOASSERTION
Matched files:  COPYING
COPYING:
  Content hash:  7a1fdfa894728ea69588977442c92073aad69e50
  License:       NOASSERTION
  Closest non-matching licenses:
    BSD-3-Clause-Clear similarity:  85.82%
    BSD-4-Clause similarity:        83.69%
    BSD-3-Clause similarity:        77.27%

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/pytest/acpi-bits/bits-tests/smilatency.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/pytest/acpi-bits/bits-tests/smilatency.py b/tests/pytest/acpi-bits/bits-tests/smilatency.py
index fb1b7228e3..9b11623b2d 100644
--- a/tests/pytest/acpi-bits/bits-tests/smilatency.py
+++ b/tests/pytest/acpi-bits/bits-tests/smilatency.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause-Clear
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
-- 
2.25.1



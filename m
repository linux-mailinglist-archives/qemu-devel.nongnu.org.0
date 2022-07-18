Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C409E5785AB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:42:03 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRwg-0005Kt-TJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:42:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDReV-0007Zh-La
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:15 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDReU-00075V-3I
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id b6so6702516wmq.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4F2yO5frOYAcnHfs5PLoHLHOZn9nM5yRB7Vtwa8islA=;
 b=TwDNq1R576aoYttGBsN+lAGUy8V6+CULMFROsyfHhC9jnjoYuPfBwrZzLmAHkWPUK3
 HqqXQNw0JVNPCWzWBUB/x44WaOGKA8ENOpaHKEQBFoeAwcrCsSjBNTWwvWmYFxdDTTXj
 NVLeHIvtRs7XJxQM74DgmJyfq5ykp5YBQBn2qCwCu+aRn8o/V4n1hmGY56qUqOVgEL9v
 PXZ/eITdcmcuF7GrM2i0WR/F66Kt6fgv8VxkvHP8wzE2u0XS+r4KOn7HPasxz3SXsVMN
 LHF7YyTogHOXYVy41Rs847Vb7s0aB20CRt90oBiRpmJ4eQJQQS+Ag9RA0yJn1yIF16ul
 jWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4F2yO5frOYAcnHfs5PLoHLHOZn9nM5yRB7Vtwa8islA=;
 b=wAhCKDdQCdbtm1h0SfL+59r26QVy313Fj/6B+jufQ6KtwLI47bjpUEj4LuNtQApy6j
 QL1Ib0hDvQRPz03CW+XTlPfgRjOui7tGH/XMSuC0QuK5r6/Qe1JziLXl15X7O8D58HcD
 eufg93a5k5+HHzDX7koEaLnR0/d5+tK2Vi0FKJJo1f+7qP+j9YpnoBC//5msWO2xMe4a
 +yeBl2j9FzmR5xPis3yTcgKCiAD90/DMYEaT8qZYZFt62rqQWAmuqeJioCo7+EKUONCx
 w6FeMeZCc6ebcwt+YtIsH7sTr5n6WOIF+QTUivc/wxPRU7lEPny55EFH4Vu4MF/YJzDb
 WneQ==
X-Gm-Message-State: AJIora+GZ+H09j0ISCkK3v1DhadsOdghcAa/2cOlZNlRcaqgDQ6EFZIK
 0lZOm+nZHjPlZer1T5CbfOrHAGfr0Wfseg==
X-Google-Smtp-Source: AGRyM1vjLwEpr0SJ/7YhpGA50tX9xmeFtQb4/o7GQgT9Obwvnth3FLs/RYrKc3Ov1Q1FAzYNpRjTMg==
X-Received: by 2002:a05:600c:a02:b0:39d:bdf8:a4f4 with SMTP id
 z2-20020a05600c0a0200b0039dbdf8a4f4mr26434837wmp.201.1658154192621; 
 Mon, 18 Jul 2022 07:23:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b0021d6e758752sm11079694wrt.24.2022.07.18.07.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:23:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] coverity COMPONENTS.md: Update for loongarch, slirp
Date: Mon, 18 Jul 2022 15:23:08 +0100
Message-Id: <20220718142310.16013-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

This patchseries updates the Coverity Scan component regexs
to add a new component for the new loongarch architecture,
and to tweak the slirp component and mark it as "ignore when
doing scans" (since it's now a separate upstream project).

Unfortunately there's no automated way to upload new component
definitions to Coverity Scan; when these are reviewed I'll
update the components with the GUI :-/

thanks
-- PMM

Peter Maydell (2):
  scripts/coverity-scan/COMPONENTS.md: Add loongarch component
  scripts/coverity-scan/COMPONENTS.md: Update slirp component info

 scripts/coverity-scan/COMPONENTS.md | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07D75FF31B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:45:26 +0200 (CEST)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOkP-0003l2-Ld
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObo-0002yd-Qe
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:36 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObc-00083N-AG
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id s196so3596425pgs.3
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyu7QZZcn9Q1/zGtjEBOGs4FcuSFU9uCRS/DX2QmpGI=;
 b=KVC1LizeBfm+T0hz4XhKC0wFNPYBoYZIp2beMY3MyjS536CNEymGUR/6nQZ2EjS9r+
 0AVM8iY43zmEmyHBKmbCJaaIRpL0132PPC53D/ry2D1tgK0D2uil8eBDjgJqAJaW9rYg
 yLIcWRy63v9I+olHbQytjyGtCkMATNyfqvxFdnelHxL6xRJmmySRdnFnDPaV6J8UA9gA
 tiQIKgYPV2UMCf/16u2MFBA79wnycDFQx4rD+Zn89ReL5TGgDIkb/ip2J1dgELBq468S
 MVutv1ZZaiuNZVOpJ+c4NKBiYtco9S4L5zo7RyToDuDYjChvqUl9pfFMCpeYxDKhO6D8
 G/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyu7QZZcn9Q1/zGtjEBOGs4FcuSFU9uCRS/DX2QmpGI=;
 b=HbGpi632kGqsagzOd2y7YmLUXYXlYAGUoO5rA4u5MuTB5y35ZeAAJ6rKLoicBpVCPA
 3a9M3kIfFwvxeDNp7hcwppvPI9k5IxcPrLMvMCsKGAFtd2cWckHI4UQUwqPMPC3+85kA
 qEXPgFPbBKVgNFePavmwyjqzCANPs8Rk/kN88qwFLNUPn3FNnBiORvfEkmOZDQJdsW2S
 mN01qH4BT0IXbaze5BzDycwOGFgkoaykltvkXilnvo3/uA3Z8xWN7emx1oE8FlIWvvlg
 ZnoWluvxk44QKD9FZJc87BUR4lFLbK/HpGBS2nEurjb48tE2OcvTbAc+KOzbXAM+IXG8
 KOiQ==
X-Gm-Message-State: ACrzQf1vmA7Wni4i66r1BLAt7r6w9x7nJLhj3ELMPrvBv6Ez0meMYO25
 dPmDNlmx0Y3US62BLQOZ/4uenw==
X-Google-Smtp-Source: AMsMyM4D1Jv633qid/qdDA0/NFOpUIZu5su8J7V3yKX7Hpw7JyYXbUM/zLt6G5YhEaQq5OGttRHVFw==
X-Received: by 2002:a65:6e82:0:b0:41a:9b73:f0e6 with SMTP id
 bm2-20020a656e82000000b0041a9b73f0e6mr5595859pgb.371.1665768978935; 
 Fri, 14 Oct 2022 10:36:18 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Fri, 14 Oct 2022 23:05:03 +0530
Message-Id: <20221014173508.222823-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Added the SPDX license identifier for smilatency tests.
Also added a comment indicating that smilatency test is run from within the
biosbits environment/VM and hence is not subjected to QEMU build/test
environment dependency fulfilments or QEMU maintanance activities.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py2 b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
index fb1b7228e3..d616970b31 100644
--- a/tests/avocado/acpi-bits/bits-tests/smilatency.py2
+++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py2
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """SMI latency test."""
 
 import bits
-- 
2.34.1



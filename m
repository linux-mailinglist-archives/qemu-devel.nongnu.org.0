Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848F6416E1
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 14:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1SV9-0008D6-Ay; Sat, 03 Dec 2022 08:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p1SV6-0008CI-Ni
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 08:24:16 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p1SUr-0003Ce-15
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 08:24:16 -0500
Received: by mail-pf1-x435.google.com with SMTP id 21so7352154pfw.4
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWuLz03qEswZ6o7BB0b7vQiY8TUfIuu199usv0agUCE=;
 b=WMokU7VfEiQme4pO16BqUEOcuNjOzfOu0I9PMDFn7157F5ZQloeaS+QKyPQ7vAFCvM
 BMihR3wvoZw3NpWymtIaThVWAna5MBPg8i0vxuVnC9CARDSA3kzHLZGC0EzpOQR5eCoe
 gKjKsL+UjElHSeDtY7E9pFyWEBXKKlCrXo+PpbZGgTX5340OjCxkL5KQrUFqCpVZC9VW
 MJqM7dXp55n9UKTQWOue7ofiEIrJci7Azj4XcJw8K8Yze1lCiFyW7TJf7voAX2O4XXRz
 estqraMG3qWJ3fOzFHGLOkR/L7moGWVJJi+TeVGXhG8VkH/gPtl/lkDGy3rM9c7ZUWwL
 kypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWuLz03qEswZ6o7BB0b7vQiY8TUfIuu199usv0agUCE=;
 b=UBT0Zr5Yib+mDYigzh/zb9YJqRB1XX53gn96BsbrvyR52NbG/APPW8Md6SCO0VjvPm
 83EmxVKDQ2AH+O+uRNpMhSDhz7GGNqDP+MdyVpbUji5FKnxFmGqbx3duIBHX6wyFB9rA
 0OZNxc5N7+QAm9p94pCPo357Q1kwzGcMA7+ejieDXkE1wyC0WJkk0u7uJ6Vhv9oIrQL/
 GEccfavYkdvkgJB9H7hnOn4tUtvZMIlDrwoXoblHlGSAitumfPZjqMJ/zjW8SiyyuIkS
 6WzGbX1wq/TeZGX3qcy0JyCtHhyRpwi2dO4AH7m2jjbFBhOp93Lsspm+mXxay75Uud3U
 PvTw==
X-Gm-Message-State: ANoB5pk1ABDwMAV7peQ362MbwJRK6BUQkszX0ZMbeAKDGPOfoKN4o1fK
 IqLjlKuY4m9pSrRyg3RaZvylsA==
X-Google-Smtp-Source: AA0mqf7gtZ/zOTn5NgjMHoMu0BiAqbkU5A7sxLHld4TGH4dNUF0nVQSMPluRNZ2zuB4AhDEci3v+wA==
X-Received: by 2002:a63:1626:0:b0:470:2c90:d89f with SMTP id
 w38-20020a631626000000b004702c90d89fmr52257075pgl.253.1670073838871; 
 Sat, 03 Dec 2022 05:23:58 -0800 (PST)
Received: from localhost.localdomain ([203.212.244.39])
 by smtp.googlemail.com with ESMTPSA id
 pc16-20020a17090b3b9000b00212cf2fe8c3sm10500276pjb.1.2022.12.03.05.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 05:23:58 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/acpi/bits: document BITS_DEBUG environment variable
Date: Sat,  3 Dec 2022 13:23:46 +0000
Message-Id: <20221203132346.34479-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Debug specific actions can be enabled in bios bits acpi tests by passing
BITS_DEBUG in the environment variable while running the test. Document that.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/devel/acpi-bits.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 4a94c7d83d..9eb4b9e666 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -52,6 +52,9 @@ Under ``tests/avocado/`` as the root we have:
    for their tests. In order to enable debugging, you can set **V=1**
    environment variable. This enables verbose mode for the test and also dumps
    the entire log from bios bits and more information in case failure happens.
+   You can also set **BITS_DEBUG=1** to turn on debug mode. It will enable
+   verbose logs and also retain the temporary work directory the test used for
+   you to inspect and run the specific commands manually.
 
    In order to run this test, please perform the following steps from the QEMU
    build directory:
-- 
2.25.1



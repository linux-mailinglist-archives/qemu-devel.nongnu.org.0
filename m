Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228C96416E0
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Dec 2022 14:25:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1SVP-0008E6-Iz; Sat, 03 Dec 2022 08:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p1SVB-0008DV-By
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 08:24:22 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p1SV9-0003If-TE
 for qemu-devel@nongnu.org; Sat, 03 Dec 2022 08:24:21 -0500
Received: by mail-pl1-x636.google.com with SMTP id w23so7012426ply.12
 for <qemu-devel@nongnu.org>; Sat, 03 Dec 2022 05:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G8aYMJ/jpaZj1xkITSSGZmPe4Gw9fVXpb5ZDRlFXQJg=;
 b=Pamkz9D4Gea+aRX9yWmfS0JEtGPn50zRc3rUaTGhzLgQcTIlp7CWQ+j9AFo+nVVkd8
 7RQIYDOfCzupcM+uiL5oBT+y8Kb33sIplyTdAvknUYABdxJIzrJgPY7w3wWEhTCT3eDV
 mZTHXtz1mdke2jZprKElyUnXQwjfQNXrQGbFR5ieFc083u3AzvPm4GNJCo+YIRMzZYyV
 vGckQizpZUn4EKsVMehtytg0A7rLEleeG/c0W6wtvdkRXLDQcAMp9JFH4Dof4/qaWDFG
 DFOWgVEJsYUPS2W3VPfKGkLzDlGsGgnCn/q8NAoUWk/TFVr3+inGrnPIabxvJ2M5PeRu
 lhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G8aYMJ/jpaZj1xkITSSGZmPe4Gw9fVXpb5ZDRlFXQJg=;
 b=M5V8Zv/M89ZGB6MDNRX0ETVWB5xq1QIHlNx7/R2UtRuvrHb0ceO1Yg6kyASFOa+IgS
 QdiQhNl8Vxj5nRyWyzh5GymUw2cYyCS/fkHh3zSWrR8J3UdhH3yulitC0Lj8M7RR4cz4
 kUue/Q8H7sp6JKssgasnK4G4jUcwbej8rxGZYR2nURBs+fiZT/NWdBu0hrFgOq+CDGDI
 maqJ/nKABmb3D7o9bYf1nv79IH/nA39gGjD81PjRU8SpwrG98rsvQ9mVOcoYYbmfNqbW
 kpB9VG9WX0zZ4RUkhOwnWN01yp7KpYVjuQDtfSuVRiVJS9VOF1OQtSkx+3OAF2APpnlj
 bCZA==
X-Gm-Message-State: ANoB5pmIpi/7EmCsf6zjztDACrLoGB3jmw999NhUdalgLFlPCNzyW+hq
 zBnGq9Jc8OKs1O/9sIWg7DtL/Q==
X-Google-Smtp-Source: AA0mqf6ri7cjt2fUbfgF+bGSjs8rQ2SvBvL7CH78P3bM1UjIdJ16nkEZQPmiuCCe4YVZHtJ4SaoK6Q==
X-Received: by 2002:a17:902:b493:b0:189:1120:17ab with SMTP id
 y19-20020a170902b49300b00189112017abmr55910749plr.52.1670073858500; 
 Sat, 03 Dec 2022 05:24:18 -0800 (PST)
Received: from localhost.localdomain ([203.212.244.39])
 by smtp.googlemail.com with ESMTPSA id
 d75-20020a621d4e000000b005622f99579esm715142pfd.160.2022.12.03.05.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 05:24:18 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: [PATCH] acpi/tests/avocado/bits: add mformat as one of the
 dependencies
Date: Sat,  3 Dec 2022 13:24:07 +0000
Message-Id: <20221203132407.34539-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

mformat is needed by grub-mkrescue and hence, add this as one of the
dependencies to run bits tests. This avoids errors such as the following:

/var/tmp/acpi-bits-wju6tqoa.tmp/grub-inst-x86_64-efi/bin/grub-mkrescue: 360: mformat: not found

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 898c837f26..14038fa3c4 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -50,7 +50,7 @@
 from avocado import skipIf
 from avocado_qemu import QemuBaseTest
 
-deps = ["xorriso"] # dependent tools needed in the test setup/box.
+deps = ["xorriso", "mformat"] # dependent tools needed in the test setup/box.
 supported_platforms = ['x86_64'] # supported test platforms.
 
 
-- 
2.25.1



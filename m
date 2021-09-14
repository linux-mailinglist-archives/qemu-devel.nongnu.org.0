Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A00640B193
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:42:13 +0200 (CEST)
Received: from localhost ([::1]:59030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9dU-0000Lw-38
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MX-0006Fi-Dn
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MP-0005Qk-BW
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso2268153wmb.2
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=fK0YxSDiCHrTwUEMTdSyk6J/gIKTUzJFHCKPj8JVl1isshp4DPQ1QP+jlnH7qpcMD2
 IQqOxl2R4E3GV7gGjDclIbV2PzY9Bicqb2bpSK3fmZaaBwDZ95MU5BiOSU39g7KKoD+m
 FFxBhvGQWPcZo0KGwK3TNfJ4r8MWGkE8BoPKpsd8DcJY0P1V0uot2JPdAulze3m1TFl7
 J6otwAy3GkPbMRXZZ4moNNItExSQrK95vrM59JOtNxYAOHoojddO10Z8r+4sOqJA2MaU
 NV5oLDUSvwPZohL9/RwVVg48PZXPDF9yeMN6Ms/xFjjS0oifzeDzB30QKjslg3LvZGkU
 Vz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=uzCB25nxpySZ+VBc8hGBoN7BMtBrxIXaEj1Krqfw0W94BImTHMrhJnlfoFHT4kC1ZQ
 /dz3FPBz2p9rvWlkGJVzjZhvO2wrmWK6Rva/Fbm2rCKSEETmSKlGTWQ17yhggy0F7Rst
 2IniyldjedzWX7rlFsSnHu+JsoWI21dHG6MptcHznkvOXXXcO6FSJXLtAJbjVw+En18X
 vtPmUIgWlCmxnFt1UvY70TSrZuhzW8S0FFQ+mZgtN9aHLj1f+IWmdfN8F2qRpfGluheh
 9lGfuOpBm2XCkVOu4UR8i/3hMAqpDEemXwj8cMvnKr1a3707SZQ8XTB6jAc4wbKhgSAD
 6Fug==
X-Gm-Message-State: AOAM531FRYr+InP8uElb8G+FseighWVPNudr2e9FD2g/Ld6WIfwoYqXP
 XpfhUtiQwdgujBvJ99rPCBH+eA==
X-Google-Smtp-Source: ABdhPJyx3TZEc/nQYW9X8iTzhxot4otGKCDhUbjDAhFp1Xo5P2o19JIZcTUZT0sRxq0pDK3vqcDoew==
X-Received: by 2002:a1c:a942:: with SMTP id s63mr2489571wme.45.1631629467420; 
 Tue, 14 Sep 2021 07:24:27 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:27 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 06/10] tests/acpi: allow updates of VIOT expected data files
Date: Tue, 14 Sep 2021 15:20:01 +0100
Message-Id: <20210914142004.2433568-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create empty data files and allow updates for the upcoming VIOT tests.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 tests/data/acpi/q35/DSDT.viot               | 0
 tests/data/acpi/q35/VIOT.viot               | 0
 tests/data/acpi/virt/VIOT                   | 0
 4 files changed, 3 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot
 create mode 100644 tests/data/acpi/virt/VIOT

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..29b5b1eabc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/VIOT",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.33.0



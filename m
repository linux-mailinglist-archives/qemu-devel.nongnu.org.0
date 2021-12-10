Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811D4706DC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 18:18:08 +0100 (CET)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvjX5-0006Xk-Ko
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 12:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLT-0005qd-E1
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:07 -0500
Received: from [2a00:1450:4864:20::533] (port=42754
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLO-0006T6-1l
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:04 -0500
Received: by mail-ed1-x533.google.com with SMTP id r11so31360087edd.9
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xA+b4YSvWdX/w+5WGD2ZykAzUJbBu1kLdHNwHXJDTcc=;
 b=rRNLfYZ8N+H3Bmco19njhMhPnZ4mG1SmtU9MgG1dUJhba5eiWoaU2kekGmcsaVd0V0
 C5TDitUuro1u5rpQHlYHe+FOYAilME9GwbUtrr1XgZ0nt3b5OPXjw1AkVfHm8TM+RQ4n
 sAsymWdg+Q7wrIB9sGoqzLFZK53/37M3NHhPYycTrpokas4i1wY7kQbP79ZtT6/peVGu
 taVakdRJmx0CqQI38YC1cAQHfm6weBd55pkzGRJ35e7/33lp9Z+3lP+mXeoxvAX6LyRV
 jLdbADl2b36Uxx0BFy+eKleQ86ind4mdcNCuFmGYpRKd4yhmBh0g9KcreqJ3cbMyBYil
 fHJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xA+b4YSvWdX/w+5WGD2ZykAzUJbBu1kLdHNwHXJDTcc=;
 b=8IkceWj48SiSaizQrUVn5SqdeZm2bkMErwgKCD5Q1A2uxqISbvpmoy9s+NOkYRzDBO
 hpUHllDdjaVut6OVgIEKpCFcPHV0KXAUMSwQlOkDzVSQCnT3onlacpirTDSbf0/6wj8A
 9/lKuVG2QxwgZCVKafOiQGCqtYNIH+qAHp+qT9Fa8WdU3w9rmGZs2DUIeDFBOhjPUwzG
 U+IfKNRt5Mm4o39WnfV4rm5PPjR22zAAXDa5Ss1dqsIdqucBUx5nNA/Z7TfIPRhS14op
 5g6jG8H4IrBzt/P1bi23aMb80OrqMWGWk2agmUqCPfIfjgDQ24S1UDFlSvejKc/CieyC
 49dQ==
X-Gm-Message-State: AOAM533t09SJcsgsUzcBRRoCqm1qZWXQ4TuD8zObnc+DOiIuJr091KHF
 c05L4TmWPkyy6NZBQaZroYfX7PYTFK1JSg==
X-Google-Smtp-Source: ABdhPJzQP3BSC5wPzlSglwurPUTvqiHKD/TVHDR4Th6TRqJpixv+8R4/zd+7u6FI0AqrpaGN7SwPFw==
X-Received: by 2002:a17:906:619:: with SMTP id
 s25mr25336986ejb.237.1639155960394; 
 Fri, 10 Dec 2021 09:06:00 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:59 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 5/8] tests/acpi: allow updates of VIOT expected data files
Date: Fri, 10 Dec 2021 17:04:13 +0000
Message-Id: <20211210170415.583179-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create empty data files and allow updates for the upcoming VIOT tests.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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
2.34.1



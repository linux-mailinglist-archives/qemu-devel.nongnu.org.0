Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2908741F4B6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 20:14:31 +0200 (CEST)
Received: from localhost ([::1]:58924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWN3F-00071o-VB
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 14:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUM-0000aT-Ow
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:28 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUG-0000mH-ES
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r10so162257wra.12
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=MO+jKaoKkcl7asXlV2R94xYOsojNok9L8O4LdbJRGQQjI95dY/K2EZQTtgwCvPTISO
 PEINhcax2ZEddVDNjMuELT6omHNg8pcAe0GVZaLSgm+KPoxQI8Ou6mw+VqqIPZDVQA31
 LZAFMgpCy/lw81KqKc+Umuyp8MrDFqaOYOsnUfEl7cgZywqPTMjk1tLMOc29VIyM2ELn
 yDXPJ7+bo8zgoHC+u9STNs8Jr3u9RTkvIieJ6dgErAS5iJNxrnBAeklPC76jgrlq8ZTL
 cqAexzm19CR8K4ANE1VRxpRCNJohNHS7Igc1vjLfNggBwNycW0ZodWpXlXmDWLpVjojE
 4KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=DWmGujzdnPI1RUjutZ/iwAqN0XOzYOqFpeRLCw656af4LnMsX+ylfYBBgLNeGHfHVR
 PLcjLEfxqr16t4VjAGHeKE/u4jLEqx5tbAVf/GY0u5AnBadl4V+lln1B71KNSXtG6APX
 9VqxDmfWwQG+J3vBGF/JWqZ37atdEkmTknChmBrLa3QFtFf/Cw9Wp6r4Ke0scaP/rFWA
 XrRQzCjlBBBfX+0K7cc7tiOqnDTJ1xRnZnPxI+/tGzGTmpuwOTPFgaWQaGoAuH3xOd0o
 dNtn+aEuEsmDY8/0cHeE5Z4Ho2LxjN/GHMfDzPf19iNgwdC5CBxtAF76+uvZNGx6Do8U
 4Erg==
X-Gm-Message-State: AOAM5339vDGBstbZVZm1aZe2F0QmJ/nlomZfvXYSoxN9ig4kHwJSPTpg
 S79uUXxY1Zeq8OOnf5NjoxxRuQ==
X-Google-Smtp-Source: ABdhPJyt931PhWRGgahIYte38qq5PBFff4sGo60BYqBS0ZGhp+zZCqc9zy4gMdr3cg88/9SgEWDD+g==
X-Received: by 2002:adf:e742:: with SMTP id c2mr13997124wrn.18.1633109899187; 
 Fri, 01 Oct 2021 10:38:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:18 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 08/11] tests/acpi: allow updates of VIOT expected data files
Date: Fri,  1 Oct 2021 18:33:56 +0100
Message-Id: <20211001173358.863017-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 ani@anisinha.ca, pbonzini@redhat.com
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



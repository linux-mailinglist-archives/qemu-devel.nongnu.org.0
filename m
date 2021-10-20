Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B34351E5
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 19:48:18 +0200 (CEST)
Received: from localhost ([::1]:55806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdFhI-0002pP-JT
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 13:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUc-0005JB-UR
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUb-0002gV-Bs
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 13:35:10 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o20so48590929wro.3
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 10:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=ZQHFOc3lXBs4VPWAtkf3sK+f/tzzXdB+Jg3MUUcFa4H/2/2WyCvbnzEU5V4oYnkd5n
 Wt4RDKnv/k4s+GmT1+78GNrgKxTG1h3FvXxb+7JsVhaFOsi/wskhgTr3o4CDk5e/TlTq
 uyBnb/MPT+sSeDlYbr3GvytYmploI25H7xf2Qm9Rg09J2YAjcUdbD/qnh1pAeCq5xfoG
 DWntZcjQSIUyTLMdqYrVpaA02/LCFxdl7PYvvyrLWf+59JKcjyqNaZeNelVjarZTQIdx
 edtDqKia0d+VwfBf4rlQoJOKqQQA0he1W7ClzaUiVjWEljesjv+GBXp3BBfaCW4+vYTm
 VWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tUzjz0DaQh9V/E1AtSG5a0bXdcLZdXoyXVjvZ0SiJck=;
 b=cIC+WydSquTn8onUWN3LJPkx88hSFjncz/5ykwLlshDtG5cogJI1NL8J1BwGWNtsKx
 vnfgSHR2XakZD8wFGmZN7KJMC14MotYSZRJqIDhc8c3Ff8WL4zrudt2iUxyI5kB/fv2l
 ziHZox+Nr8KLzNp2002F7EWaCeEClKEfOt8AKQg/yzsDUzzJdGYwcEnbKh9Q/ui4fdwH
 SBhEVIao/6Nq6yJF0qYZ0IfnpmpRY+hJtK/omipnge8iqFLFiD2CmULT4wvdWq5AQGv3
 sl9ax+puUr9+0dc4vhAcBa2yyCiUjkCISvgyZ4mqNQX6i5DZSni7FF13QuvRwrIFuh4M
 5Ubw==
X-Gm-Message-State: AOAM533oIBOqBODg+wchXn/TLnZYa26L5VCvwvvFHhJe3KJA8EbBCl4Z
 Rp6/WkgXsUhonvV9JAMMofFATQ==
X-Google-Smtp-Source: ABdhPJxmk+jvAisc16qp1QTq6U/nKMixeGELt5/4u32ZcUUkbLB/D8UZcSFB4U6vqLiCOMhgK/DWOw==
X-Received: by 2002:a5d:47cb:: with SMTP id o11mr749684wrc.184.1634751307902; 
 Wed, 20 Oct 2021 10:35:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:35:07 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 09/12] tests/acpi: allow updates of VIOT expected data files
Date: Wed, 20 Oct 2021 18:27:43 +0100
Message-Id: <20211020172745.620101-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, ani@anisinha.ca, pbonzini@redhat.com
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



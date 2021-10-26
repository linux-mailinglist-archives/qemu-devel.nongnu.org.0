Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803A943B9B8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 20:38:21 +0200 (CEST)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfRL2-0007s6-Ia
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 14:38:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8V-0005t3-AY
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:23 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mfR8K-0006ka-Ov
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 14:25:21 -0400
Received: by mail-wr1-x42c.google.com with SMTP id o14so3617146wra.12
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j+BBAW5iSJyQ3Sj2lUOBBomieyHxEfVo2gQrsqKjAfE=;
 b=qa0kmaMnsA150GyPw1SZ4W4uC1zx/BNTYp3UXkz8048GvkgCoGVv0AciHtAbiP1NKO
 ehOHbvRNqdW98VvBf65wnU5mNtq4CzS6sr5Gc7VCYYoAONm9mmu8Is0kquZg7h19dge7
 0fTDd6u8x9JJI7FZ04vUq7IeXuZCJkTOJWvRp2n+lge/SNOw5TQx1Do/NCQOq9MiEvuU
 GSfIZ9u2BYPrRt3Y0aUaEkAPsC/X7xeUy95Yh25IcPvA2M76glDHdrBf90BLIhenSmtd
 +Ue1NW96RUoDIFEAc7D+0H+wU3lmK7Zo13YhTfZTXRUOFXEM0g5MUFsCDiKuLQAkME2B
 JIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j+BBAW5iSJyQ3Sj2lUOBBomieyHxEfVo2gQrsqKjAfE=;
 b=GNaB+n667CVHEJKswPBWtUg1Rwz+ZgkH3ZsbLP+cu91Upz9NW5ulrtWmLQjoGvXThl
 hOSrlNWFxto/g8WklnMElRB2Rb4ZY3Nu4aT4VF9/QTi0k8lKRJ6Glw6Kvok8iv47lJzv
 PgvLEyCx0E2pKR7n5h0dzaKFi8T3RY/JXIhhHZucVUqUunctZHL5u03onqUU6lN3ZOOP
 vm+I/PJE3rNiyCe3L5birQtmf20Exr/JZ2gNfW9OFEE71vo4Tptk24zO82QyAQ/XULUQ
 QIfA7VJgKR1i9r/F9hv78niZOeLa11F/u6WhvuY/nCpgX9Uljyh6ay8G7HrKOF6HnD0U
 097A==
X-Gm-Message-State: AOAM532wofQjDLVVZXxxdue4o1LWKWleiBUJFmdkOByTiXGsR8dwUeT5
 ErrpP0MZpmOfm4mdE3bM87xf+w==
X-Google-Smtp-Source: ABdhPJxfgqpeceKmjK32Y7ko04bKyRBTEoPuEb6cZqyQ1xeKhbb47L6lu3u/6nwiR3PZeldXnUmIrQ==
X-Received: by 2002:adf:f50f:: with SMTP id q15mr34969279wro.324.1635272711000; 
 Tue, 26 Oct 2021 11:25:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id b19sm1275283wmj.9.2021.10.26.11.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 11:25:10 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v6 5/7] tests/acpi: allow updates of VIOT expected data files
 on q35 machine
Date: Tue, 26 Oct 2021 19:20:24 +0100
Message-Id: <20211026182024.2642038-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211026182024.2642038-1-jean-philippe@linaro.org>
References: <20211026182024.2642038-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42c.google.com
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
 jasowang@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, eric.auger@redhat.com, ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create empty data files and allow updates for the upcoming VIOT tests on
the q35 machine.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 tests/data/acpi/q35/DSDT.viot               | 0
 tests/data/acpi/q35/VIOT.viot               | 0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/DSDT.viot
 create mode 100644 tests/data/acpi/q35/VIOT.viot

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..fa213e4738 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.33.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374814366A6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:43:25 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdaDz-0007Fx-BG
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx4-0000Au-9s
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:37585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx0-0002Qs-Cw
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:53 -0400
Received: by mail-pf1-x436.google.com with SMTP id q19so963288pfl.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLeCAn9UpCFXZ2tYI2+7Y5B4D+ZV0bPVvNpx+NghjAM=;
 b=mSgGZYMytADVCxFUrMR03PKo1vvpqVRCObGMual3qL2rxhwqAZQaga+L+IqYjD0BLi
 BJRbItfg6MHbrAtSCRRqU4NklxMATCDT7gCXhGy+YOxMnhgDdM08sp+8xjLLox39Eu2U
 qxUtQGggoao0aRBHwnWTrnhkgf+crggtY+rnGk17C3OKmdyfzh0w7VGqfw6dOVtUCzdC
 hnpWy2OMUphMSSbXcJmqlVcCWtNCpMI4M0jryKDKVAkWu45euesVpHCKrrB5m0EUMkFD
 RaQ0Wls7nTDllqsnaGl7lCSN9YKNffPhtDEM+NNBxIzmu52VJ4awywM2e/BBGZ1Zs0yH
 IeuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLeCAn9UpCFXZ2tYI2+7Y5B4D+ZV0bPVvNpx+NghjAM=;
 b=WbSS+N9AgM/AbDZUrDyVyaDtwOEFO+LJ/I+8pLqzV8zMcrYNFBmKMNdiFjs+y9M10f
 Y1J8sTW01jbpblzWOeYjQiR7rs6y2I9IpJhKS78cfRo0+xwpcywv6mJOr5pLV6Z7+VLE
 KpuD1DxiMkLqKeqEP+XgQWMRBqi7qaigx7hFRNHeprMrfOAyqQ8Yb6rXIbGckI6EzuZy
 NfcG/harlmN+YyK9Gr7hxLPZz5oeV3577SX6LwVshA8MR/ASfiQka9AQWemMF0SuuVgC
 qFMtV7tQPEkgZaAONgv/lL5x9xaI6FevHWYfAeg/AHpC6Gv1P6ggrO3hZkDHaTPi3c3F
 UL1w==
X-Gm-Message-State: AOAM53301BU0/z2fd/yonooucKAO+rZmLTWS9WMwMJUSYJRJJhxMUMDv
 jphXJEaOrd78dxfjRhZLaraXrpSKL2fXEg==
X-Google-Smtp-Source: ABdhPJx5Ax2TrICLJnlsbFyHvoJN4g0qlW3M5bvCSmXam9ltAT5ZRaFltQ3ZAGe6X9I5/T2dmyiwIQ==
X-Received: by 2002:a05:6a00:15c9:b0:44c:a998:b50d with SMTP id
 o9-20020a056a0015c900b0044ca998b50dmr6351341pfu.49.1634829948758; 
 Thu, 21 Oct 2021 08:25:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] tests/acpi: Add void table for virt/DBG2 bios-tables-test
Date: Thu, 21 Oct 2021 08:25:31 -0700
Message-Id: <20211021152541.781175-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Add placeholders for DBG2 reference table for
virt tests and ignore till reference blob is added.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211019080037.930641-2-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/virt/DBG2                   | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/virt/DBG2

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1910d154c2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
new file mode 100644
index 0000000000..e69de29bb2
-- 
2.25.1



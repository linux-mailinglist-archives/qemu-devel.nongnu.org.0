Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B294757E4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:38:13 +0100 (CET)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSbs-0005cX-QH
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRij-0007Ml-Gi
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: from [2a00:1450:4864:20::336] (port=54824
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mxRie-0000LR-SR
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:41:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id i12so16260348wmq.4
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bo0mTQjcOMMWuhko1G14Jx9iZKqWtrs0vKnktosNhhc=;
 b=hPGL3a2FP8c3HH3qc/broYy/kEc47QjyrNasVaNVh+kG1ifdhGOj19GCPL9mdMzehJ
 gbOC/y0F4YpsarHanpyj1suq+Iv0Dk8uBFblpmd/8ZFxC35qkMD5UAHWivfJ0l5E7EJL
 H3iCe5N/Q6xn5gkuhAI2XnbQ5dHOdS7oX3GLiXtztNuWUgFyIo549hNxLM5gn1BC3gTa
 BK8N74xR3hv1mYOBN2oWxq1ZP2hiiLHaYiyKbaES9I7RPb0cPZQfSi6ra3QebFZg9TE9
 A95wIEAps6AiAK2jMPVLtASk9edTpEVXtjBQnQl0lyJh8MWoIA5EFLZ5KAM5sCN6WABW
 crcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bo0mTQjcOMMWuhko1G14Jx9iZKqWtrs0vKnktosNhhc=;
 b=4geem2TfY8LNprrvGGHCsFyvuZljobUMPF/jBbDLcTitv4mYZiaYMUCvphSjZPW20y
 5Q7Q9w+8E2nU8qUKG+/cnd7UWAkMJ2Z1g+7khsC8XV2dGDDY8zBC0+gQ2JshPOGymJFv
 X72j2e4UV2ZuBNh+XRIbcpykRGK69ALGgmB3gF4jCRq62JGCieJVAIgwHeFMLy/+KmpB
 xPy8yiAXRy/YVoSNOQKWesooPfHr4O+CG8b87BOcn2KE+VO4Gwe1HSP9ls397xGuTo4v
 +gPest5Ngnk9Q/f65uVPlp7cSJD6HM/yo6XrqMYHgiAXQwpQfycQxLhV7FL4LQ4y4X1d
 5JVg==
X-Gm-Message-State: AOAM530WkKONvO5MxsV4gOgK7FoWz5E6eMUUoKThGvd5tjrKUmaWyiTa
 sbfTnwwItmc2Mmq1lOHyE0YTrLyXkr+ZAA==
X-Google-Smtp-Source: ABdhPJz4NDZOKff7LEdBUKmlAOlobzxqIGOqjFuW9pusZ2Jkzt2bxkS2Nx2/UIX9Ta0Sdrd4lItYQQ==
X-Received: by 2002:a05:600c:1e8d:: with SMTP id
 be13mr4053711wmb.79.1639564867428; 
 Wed, 15 Dec 2021 02:41:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id e18sm1600815wrs.48.2021.12.15.02.41.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 02:41:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] tests/acpi: allow updates of VIOT expected data files
Date: Wed, 15 Dec 2021 10:40:46 +0000
Message-Id: <20211215104049.2030475-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215104049.2030475-1-peter.maydell@linaro.org>
References: <20211215104049.2030475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Create empty data files and allow updates for the upcoming VIOT tests.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-id: 20211210170415.583179-6-jean-philippe@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index dfb8523c8bf..29b5b1eabc7 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/VIOT",
+"tests/data/acpi/q35/DSDT.viot",
+"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
new file mode 100644
index 00000000000..e69de29bb2d
-- 
2.25.1



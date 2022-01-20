Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A14495258
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:29:15 +0100 (CET)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAaJG-0000R8-67
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:29:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgL-000497-8X
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:49 -0500
Received: from [2a00:1450:4864:20::32d] (port=45841
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgG-00038k-VR
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:47 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j5-20020a05600c1c0500b0034d2e956aadso13329678wms.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KUc3XlkQ7HfI6yduy11X4HlqCIkUpFO9z1JoBKBUutM=;
 b=uIjOypzY7eT5rRwAnVHBwd8DJBTwVwjX4O3v4wc9ifX4ux62qiFRQECCcp39ZIQw++
 4F/nFNMSOt/QRe0D9ZNQE06qYyb2qy/5N7+2gK8LvLmtKQ7vNkZRtiYMRP/SgQW4AFEt
 LpItQ+wqAWcRyOm+HyGP5ouIJBiaX4TpPVDkjfX2w51FXMUUvNxxhFPFer6Leg9Xzw5Z
 UD4Tc30s70xwvAuTLMpkbcIEGVTeT7INYnJ7qwqochFzZlA1Y3yshnpUO+sVlaF8/TFF
 Q24MeNc/urtF52bFMGkIdZ+bgth3DJIbY/waNa5Q8nryU371On+3UIN9lB4/VFOgEjFU
 R6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUc3XlkQ7HfI6yduy11X4HlqCIkUpFO9z1JoBKBUutM=;
 b=22JU1ITV0nx/zNHxOYhmPHd4oM3IHRulMxWTErbrl7nSvcybxqc1NBcV03lRHYHdpO
 RxTD9gYS/YoxAgDbVID4yTc493upuPT/OoiHFwGUqvqCr3DFZtDVtklbvokFMWy5vf0R
 5FiAI3jx/ECOWBCxu3lbsVB5Al7HlV7UQNgvk9HZHWQ1zltSTSyNUz5ZY91huS3wbWV/
 K09Pk4MBDR5FTPTUW7/OoT/9qwqPbYXn5FFIBjkFumNzuNK15LyfV/OjT/9//EdX2U4N
 PRGkrORpDiNiWC6K15tRon34PuzWMQG/pBfxcMfhY4I0EynUKY/DicXDCvbSIVMsx6bG
 II7A==
X-Gm-Message-State: AOAM532l04/eTC+i5A5aGbedvIBqiia8kLY3G6Q1JL17Y/DpMLixuyBI
 FqA8CmFy0ryT4Kgs3zuPXdQzZP8lNg67AQ==
X-Google-Smtp-Source: ABdhPJywXCbNYHdlzRZ8Mk2s8NTAPr0IxOoAXm+eKgsTqcrmcp40ULsFDduP3ei7rRbznU8z0FWh1Q==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr32294701wrs.83.1642682199839; 
 Thu, 20 Jan 2022 04:36:39 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:39 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/38] tests/acpi/bios-tables-test: Allow changes to virt/PPTT
 file
Date: Thu, 20 Jan 2022 12:36:00 +0000
Message-Id: <20220120123630.267975-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Yanan Wang <wangyanan55@huawei.com>

List test/data/acpi/virt/PPTT as the expected files allowed to
be changed in tests/qtest/bios-tables-test-allowed-diff.h

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
Message-id: 20220107083232.16256-5-wangyanan55@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..cb143a55a64 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/PPTT",
-- 
2.25.1



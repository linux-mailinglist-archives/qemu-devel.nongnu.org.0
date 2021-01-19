Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F592FBAD6
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:16:24 +0100 (CET)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sk3-0004Zw-5n
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfD-0007ZW-3X
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:23 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf6-0001CB-Qt
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:22 -0500
Received: by mail-wm1-x334.google.com with SMTP id u14so56271wmq.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9KFpD2cUg2lKsaJg5Ed6S/qtyzviDudxsPMpF7d6W+k=;
 b=PQYNdiCEpS39d0aK3wymvnFGkg8Nu0GxzEhSQbgFIEesXBANXzRx1uo+UjDg5mzA9U
 S6KMBmpI1bgyv/6Me8P6NNv4Uo+ZwDmfG5uJMpT9qB6cz41az/5ZUvSRWRhiJBPYyI0I
 qcDuBPkUYLZ8WuKrtQFD9WFjYaPF+g/ulxnq2BVcGN8HPvc2D7ex7CfPTblC21rbM7BD
 srCCaAaVkZ+Ms669V3rL93K8a/nG01xAbYuURG8AeccI47l7+H0P/YCDhbyYy2rYyEVs
 mce5Ua0jkWWeq9LJcuTNj0ZSQB4hkPZECwV9mVMj+h5hAYUOCB+oUyfPD6Jr8irwURw6
 dMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9KFpD2cUg2lKsaJg5Ed6S/qtyzviDudxsPMpF7d6W+k=;
 b=e9yikAsmzSi3HWce1auwnsazjAac3+Zyzkz6BGo5fagqN2eThV1cVK+UzA1hmfJWLE
 jyNDIJdD2jruZtv074qd4ElruPAPfh6bJ332iwltKG4+F+TCRPj1FlrjECcEdq6LKFzq
 tuILzP3G3j+s54BJQXkvcLqqNm5BU4MPN8FHJhIwGAVU4bVJx6mKagrMWGePUboUca7W
 TNxDJ5ecbsmuyt/cALAqUrQLSJWlcdIAwTvwwf5BgY2vE0F32iUE1luuekaB2DY8hUlv
 RsLwRAjTJNhT3r3B7shw42W1lEwLxorTTOJRSFffBsNa6qwedvl/VtVCs50BSFQr17cf
 j2TA==
X-Gm-Message-State: AOAM530uHR9Dn6b1gHgLA3GdWL/QKa8DsKzBphJh+psCU9ywqxfNv46Q
 mTga/S4mwzkqhYJSRSCXNvwSrf9HBXSY6w==
X-Google-Smtp-Source: ABdhPJzPKJG7h7nW0zTOd7SjsrCVLPf4Tru+YGb9gfgmpRiwn5kbXmi3+7PE/IfuUd6uEkJ6xDl8Zw==
X-Received: by 2002:a05:600c:2117:: with SMTP id
 u23mr63983wml.153.1611069073924; 
 Tue, 19 Jan 2021 07:11:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/33] target/arm: Define isar_feature function to test for
 presence of SEL2
Date: Tue, 19 Jan 2021 15:10:40 +0000
Message-Id: <20210119151104.16264-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-6-remi.denis.courmont@huawei.com
[PMM: tweaked commit message to match reduced scope of patch
 following rebase]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 66e36032949..22a3c8a4cfb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4011,6 +4011,11 @@ static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
 }
 
+static inline bool isar_feature_aa64_sel2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SEL2) != 0;
+}
+
 static inline bool isar_feature_aa64_vh(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, VH) != 0;
-- 
2.20.1



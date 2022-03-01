Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9954C9840
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:21:14 +0100 (CET)
Received: from localhost ([::1]:47540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPArp-0007ih-4C
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXl-0001SS-Iw
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:29 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43898
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPAXj-000576-Jt
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:29 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso66538pjb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
 b=U77H2tZWwh5cJRW1Wpb4uwaA3RLNMtAJF+LLSgoaYC3NKL5ZbSUUPZKRMK83mzHkgA
 EwfhF8EhRPwlYzTKtfX7hQftMqLJvQkXT7L1A9ravjK1SUzJLu4GeK8Fg46sCMiZO2uI
 WmWgkkePaXBbkCeaCXOey3JkfDIs3g6L2BxlbUIAeXa+JHuDYJZScFNd2nGIdhBOBdm0
 UjOhS8FNMPfbKGHwQMiniFpcJEXP5u4jgS4oiXpM+uW7XwJi4E0XjUxfwbp+mSu1TEuM
 EAiy3eI6UAxlI+Np9vscUD8nmI7ZjKy9m+PAbv4MAS7mw8GT2QS7Rixsv74oRg2wlXi+
 ytbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ncep1+pfaj4VrhFhzBJtvktsI7eesl8NO/EGk2kyoM=;
 b=W1vsVOOcYWt7VTFGGoukFR7U240gD1MXpymYrxerj/5Py5wKvtqbEFoxUrOreLksTW
 trxAnUNqqDko8qRHa0mMsuxRq8ghYHsJ32FAhzy5n5OjA2ApHPQMnDOuImRSBJulHvnj
 y4IFRXgZPZS0EofE4Ciy8kZGNHABkVLXMEgx3T+/ZJJUzbSe7qnQvOs3uN/C+OAec5nD
 wmjjuIThbnuij/S1eU3NPc8Ejqeh9zT51QUkjxKs9pEoCweAlgTmJh1kamZ5edmi4po9
 hixakVjhkj/qsRQxd/LMcUISkhJCyHLdjwD2ez8mQB5XCw/+BDgmmptTh/bq/ysaRzlU
 NwVw==
X-Gm-Message-State: AOAM531DwfMvMO/RZ6G9ekPTJnXPKbxbKnmOEgJYfb7rEsCYuOIHWcGs
 J5XH9ZMUxwHd39BrNdp0788XvqtC/I61Kw==
X-Google-Smtp-Source: ABdhPJwu4NrQ3hWhhFdKlGLBU+fCPoPmbcieKMlEw7RsuTpzzsnAnuogtQ0nl1I/EUnL23IjOCvyOA==
X-Received: by 2002:a17:902:8b87:b0:14d:7920:e54a with SMTP id
 ay7-20020a1709028b8700b0014d7920e54amr27533190plb.140.1646172026329; 
 Tue, 01 Mar 2022 14:00:26 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 m4-20020a17090a7f8400b001bef3fc3938sm284392pjl.49.2022.03.01.14.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 15/18] target/arm: Advertise all page sizes for -cpu max
Date: Tue,  1 Mar 2022 11:59:55 -1000
Message-Id: <20220301215958.157011-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301215958.157011-1-richard.henderson@linaro.org>
References: <20220301215958.157011-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We support 16k pages, but do not advertize that in ID_AA64MMFR0.

The value 0 in the TGRAN*_2 fields indicates that stage2 lookups defer
to the same support as stage1 lookups.  This setting is deprecated, so
indicate support for all stage2 page sizes directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d88662cef6..2fdc16bf18 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -796,6 +796,10 @@ static void aarch64_max_initfn(Object *obj)
 
     t = cpu->isar.id_aa64mmfr0;
     t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16, 1);   /* 16k pages supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN16_2, 2); /* 16k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN64_2, 2); /* 64k stage2 supported */
+    t = FIELD_DP64(t, ID_AA64MMFR0, TGRAN4_2, 2);  /*  4k stage2 supported */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-- 
2.25.1



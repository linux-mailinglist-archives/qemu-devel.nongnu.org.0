Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F843D41A0
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 22:35:55 +0200 (CEST)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m71ti-0002Iy-49
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 16:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rj-00005L-W7
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:52 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:52047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m71rh-0008B7-RG
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 16:33:51 -0400
Received: by mail-pj1-x1033.google.com with SMTP id mt6so3902569pjb.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 13:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GpJUCaic20diw7TGpsJ1YjJDDOjkpwMa5Bhf6kyWxKY=;
 b=oOqj8eRD1N3a8xjK7sYpF0jLDrg42jdWzZBxRXqh1OuGhIUn5ue3lvXmOpWmgp+KXQ
 yPpeSr+JcVR/11W+KZhv7u1o+p3MdPv5SCJdkFxPUdZM8hStVwwjlQuD2HyN8By7Ud/a
 E7fFImyi9Zg2hWTYCUOecTCNDdRa9kkOV7gIDkrgA8j5hPAEbRKWD/z/HUkNe+9ySU3V
 NpvvfW9gkZ8AcqriP+vTjjEcGpFsgoaOf2meP2reS8fq4ENaPfTH6UmZFLm8j7sgXkLV
 ustrzEHpZs+EtTA7C2g7rn6Y0MFRi+XFUhrzqlxAca20LmSdyaFF5XBivEwDNkKQInXv
 /pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpJUCaic20diw7TGpsJ1YjJDDOjkpwMa5Bhf6kyWxKY=;
 b=taXiBGaL2CzHpjnbp9tuzV1W8q3b4xxjv3StIpp3Q5xX+aKEtH5jTbe2xdYZKZMX43
 okK/gEHgv88ETKkaD5+T59sd8+tFuTeMnOPK2W4ShgZwYzj/eR9FA/APHfemmrZrEOhA
 7b8S904LAP05/zgw4lJ06Cb/lJZvG1FuqK42ZsplZWJBzyNX3PuiaKkoUtOGY2soQhq4
 c9gQp/P22HuYk36nMCapGI/bBfUjDToO0AQRvJRQ9c93PHCRzvx+OehGkPR/0PXS/v3e
 m20uaEc64jMCvL+jA+GvCRrw3eP+hhA/IqJFYbaLiearkMEGhUX5Mvs8HLwplL1ehD1s
 SQsQ==
X-Gm-Message-State: AOAM530rCk7GeJTnjLvg3Z3kmB1j0wQFrPOxo3mVnHXNx3xOFbOUEaO9
 m8kc86513CVo3GrnXOQooKHvBXfU6ZVqIA==
X-Google-Smtp-Source: ABdhPJw7BKAm88jBsDRgiS8ruoMO5hkbinZEvNrIyZ1TGjiYILJlLMXmud5lyvViUTtrqe8EPKJV9A==
X-Received: by 2002:a17:90a:f293:: with SMTP id
 fs19mr5483966pjb.212.1627072428681; 
 Fri, 23 Jul 2021 13:33:48 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id v23sm6904754pje.33.2021.07.23.13.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 13:33:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Correctly bound length in
 sve_zcr_get_valid_len
Date: Fri, 23 Jul 2021 10:33:42 -1000
Message-Id: <20210723203344.968563-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723203344.968563-1-richard.henderson@linaro.org>
References: <20210723203344.968563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, our only caller is sve_zcr_len_for_el, which has
already masked the length extracted from ZCR_ELx, so the
masking done here is a nop.  But we will shortly have uses
from other locations, where the length will be unmasked.

Saturate the length to ARM_MAX_VQ instead of truncating to
the low 4 bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0c07ca9837..8c1d8dbce3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6461,7 +6461,9 @@ static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
 {
     uint32_t end_len;
 
-    end_len = start_len &= 0xf;
+    start_len = MIN(start_len, ARM_MAX_VQ - 1);
+    end_len = start_len;
+
     if (!test_bit(start_len, cpu->sve_vq_map)) {
         end_len = find_last_bit(cpu->sve_vq_map, start_len);
         assert(end_len < start_len);
-- 
2.25.1



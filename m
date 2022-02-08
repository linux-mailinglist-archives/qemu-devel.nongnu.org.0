Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249394ADD25
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 16:42:06 +0100 (CET)
Received: from localhost ([::1]:57290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHSd3-0002XF-3f
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 10:42:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHQ5g-0006An-M6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:59:29 -0500
Received: from [2a00:1450:4864:20::62a] (port=35369
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHQ5c-00077M-Pr
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:59:28 -0500
Received: by mail-ej1-x62a.google.com with SMTP id y3so31203994ejf.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 04:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqXBDmtnq//7EbFJK5efxf/ffy/Wh9R9JTgEuy3Ouig=;
 b=n5Wy1OMcTDyH5dL1ldS7jyW/hwCTsoZMAbemOvOjANnljf+hGLOc0ZMgYJFGj5zYOc
 SCm0MaUU4gl/uwrEDNb1aouiWV8eBCzHeg3Rh20S/zdzVzB6u6luUvxlI/FFKhOooZ/G
 Z8XOt7rKCEQ91nCEIeN813/Pua1HEWQRrDRhi16Wafqn/NW97slhqEiTKraPLNOiFRJv
 zGDUWXBLvCUccNRwj/bLMT2cluHyhzCPlTpnAheo86JOLuo/pKQRXrfsNmIxX3RXvtzH
 ksqzawGpU6nIde9ElsJg8hQcwW0KE/QdNGE7Yp0EB7Xp7h3GmZc3k1cXtEbDL7TbzfEW
 s9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eqXBDmtnq//7EbFJK5efxf/ffy/Wh9R9JTgEuy3Ouig=;
 b=AnS8cvVVIQhsw/Z2FCd6BuFSqeQWL+8AFZDBqjE/KmEGEvj6hq7jOiZXfNANDlxlCm
 yWMu0e8PBMpYziD7a1pEtikU53fH2SxAf78SSwROCJUkRQ+Cz8Z7bseLdRvYXcv0bSU2
 IkCtTuS4h3bZS0bTIQvVCXJAYFiDTzQNb0VjWICjNaZIAedpQ60uVBQvzXOSrhm4hXBR
 n1btG96E5BpY9WqiGMuhWCzsZa/ocI4uroACQJ//b3JfhTyHutkrP4a2MyjzxFJsVG3s
 setetbNwK+h4OpOit7qunJGyBxxpyKR3gAvC+/2oH1Sr2/wH6JRgEQtahccb5cEQf1B0
 U4Yg==
X-Gm-Message-State: AOAM5317X9+cjNpE8lskqw9fF+jAONTUb37M4t0nRqA6IcR2+si7CFoT
 8gcYDKVzy4wAdAn0MfSM3ExSGw==
X-Google-Smtp-Source: ABdhPJyU92VUWnm+v8QzVSHbH39z3h0vob5dbEgUzJopYyrh7aB2k7s6pN4Hyi99av+CXO7jRJOBbA==
X-Received: by 2002:a17:906:cb91:: with SMTP id
 mf17mr3662320ejb.459.1644325156298; 
 Tue, 08 Feb 2022 04:59:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s28sm172237ejm.158.2022.02.08.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:59:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4103A1FFB7;
 Tue,  8 Feb 2022 12:59:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] include/exec: fix softmmu version of TARGET_ABI_FMT_lx
Date: Tue,  8 Feb 2022 12:59:09 +0000
Message-Id: <20220208125909.3031809-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_ABI_FMT_lx isn't available for softmmu which causes confusion
when trying to print. As abi_ptr == target_ulong use its format string
instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/cpu_ldst.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a878fd0105..da987fe8ad 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -121,7 +121,7 @@ static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
 })
 #else
 typedef target_ulong abi_ptr;
-#define TARGET_ABI_FMT_ptr TARGET_ABI_FMT_lx
+#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
 #endif
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
-- 
2.30.2



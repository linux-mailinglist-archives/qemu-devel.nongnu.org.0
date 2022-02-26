Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151514C5711
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:15:56 +0100 (CET)
Received: from localhost ([::1]:51300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0fj-0005wv-4i
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xd-0008Ny-EL
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:34 -0500
Received: from [2607:f8b0:4864:20::130] (port=36700
 helo=mail-il1-x130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xa-0000Rf-J1
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:32 -0500
Received: by mail-il1-x130.google.com with SMTP id e11so6847621ils.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Y45btB372BUYpl0DMg2V5qSfR8CjjH9rCY8SnGr7hw=;
 b=3sEK3M6Vha1V7yF9Y/xaKbKkal+cJnkNErJDh0OANbY3cEhC3AW5qV+Pr/iSYFmQ9/
 oPp0IQGLx+XgTEDNdWtdUvbAdIWoOosCUVI3sauDxvpvr20Sgl5HP8v51DfSvAxHZ6v1
 Ty6gpXYP/bM7TnYvo7Fdl/eB4At03iuwo0LjMJBHe1VLAAvmB4Mn8UZoyqNT9ydecNaw
 xQO4BX+4TWmIzewd+goRslYA7lvlJaCLcJxj0DdoyIr9lWCNVwF5DV6+rEUG2KYadPRH
 uVi/nIpg8T0OTYz10MOatU0co6ZgjR7K6SAwT07oP6YULbvnG5fWnap8y0dRo9CAQeV0
 IB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Y45btB372BUYpl0DMg2V5qSfR8CjjH9rCY8SnGr7hw=;
 b=OP5k0vnja5w225zt6xy8cNT1NYlyxiGaQSwuogHUVgruiL+Pyy9wfW3IppUizUSjVH
 +8fewZoGOqwxK9d5zWbhwcc1gKRSgJpCBUTCjyPV1ZoN+6WmlFEyIoCNtIW47/UnZf9j
 xSwdUAY+YHsAjkMq4rA8oWk8PsQ4cg9qa+dv+in0HojXydbFcofKKR7lhTNvVczCALma
 hf9E8BKfjC3rmX+4PqXOhZMosLpLdLOXcMtvcgId2EJw7ERJs12ESWUi+u0I6dp81rV2
 e9KATo1i35ujSUodbWekV1lhc3hYICX/oiLiXhXPpn2MYOv2JC/RDOwYAeJb8JF0oAXd
 gWAg==
X-Gm-Message-State: AOAM530MWOiiVW+jxyvHaGkEFjj0FDZpKzyLRUpMJr+e73nzu1Gy6ZPB
 pgBNroUykDtfEiKxE4Ftojt5SNksWdgtrA==
X-Google-Smtp-Source: ABdhPJxrTjue1flmymB72PZaI+bew2ezSWn/nMhmFffo52Tai55uJjwyivUmOQRTJdZbdtIOF8VLuw==
X-Received: by 2002:a92:ca0f:0:b0:2c2:59c6:e32b with SMTP id
 j15-20020a92ca0f000000b002c259c6e32bmr10929134ils.224.1645895247182; 
 Sat, 26 Feb 2022 09:07:27 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:26 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/16] bsd-user: Define target_arg64
Date: Sat, 26 Feb 2022 10:07:43 -0700
Message-Id: <20220226170744.76615-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::130
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

target_arg64 is a generic way to extract 64-bits from a pair of
arguments. On 32-bit platforms, it returns them joined together as
appropriate. On 64-bit platforms, it returns the first arg because it's
already 64-bits.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index a9efa807b78..af272c2a802 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -462,6 +462,19 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 #define unlock_user_struct(host_ptr, guest_addr, copy)          \
     unlock_user(host_ptr, guest_addr, (copy) ? sizeof(*host_ptr) : 0)
 
+static inline uint64_t target_arg64(uint32_t word0, uint32_t word1)
+{
+#if TARGET_ABI_BITS == 32
+#ifdef TARGET_WORDS_BIGENDIAN
+    return ((uint64_t)word0 << 32) | word1;
+#else
+    return ((uint64_t)word1 << 32) | word0;
+#endif
+#else /* TARGET_ABI_BITS != 32 */
+    return word0;
+#endif /* TARGET_ABI_BITS != 32 */
+}
+
 #include <pthread.h>
 
 #include "user/safe-syscall.h"
-- 
2.33.1



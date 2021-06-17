Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE56E3AB3A2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:34:31 +0200 (CEST)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrE6-0005Sq-MM
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx3-0001cw-76
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:54 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwu-00071G-Vp
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:16:52 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso6248546wmg.2
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPEe/mxyIf9ZhRHcAraWOUduFhYjBABA0TkClu26TTk=;
 b=fPdo5AgTilalzRlONhfVPNh+RPuO1UL8hSocSl9v86NrR2aQ6Bm5759CK10jHOxkE6
 hqjPKQxsokfygIWS075euZ4SV7h1CEK/HVHDUFd9H1mVsDucocGKlqbyOqPY16AWp7+9
 PWC18lggUFsCC5dOqJoAADpWAripuXjs8i75+IFd5xW2SllVSRYnpKQQNmkdBOjR5tOR
 i6feYPHSCSRn7/uB03PGj0qVu+XF4MCnW5wG/w8GDv9MrneBBZryyNW0u5zFh6WbyTSh
 Do5kCFibFf2MNmOOcZeBhxMP0Rxwx9xsX0nLpBP6qte6VtIek1AI3N8VEBN858JMOI8T
 PozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPEe/mxyIf9ZhRHcAraWOUduFhYjBABA0TkClu26TTk=;
 b=uke4E5l9wlXdQTCPVd50JMLVJw4nAAZx8Q6mWWN8NhEWjTnU6xsdNFgqw6tqMwK2jO
 aRL/K+ji1bLt1YlDJmh6+XUWWpXvOcNLxEsQskIepv00nc1anlY+7aIJnqmQ89ic0ab1
 IxZx9sXAb9+5h96+yc6ob7KzBTG5vfaZWjyKeVYGu+SmWf4wulVrVxD027NhoU5TejNG
 6aQhUKhgoeAMhjWDHzI5QI+wc+9wnT5zJiQXEdBOZRT+DLJ6haagQROpRZbXjeRj3JU/
 h1TYbIOdVnNhglGQEFQlVAK9xkMJd0dLYW8DLVgJ/3Wl+uzn6Zd9c65xEtktR+8aexhB
 ePiA==
X-Gm-Message-State: AOAM533l2voo+tXqSYMR0kITUsi6cHM6UqJ/X0s3bvI03Jq5VKuqziWy
 urqsbHg90yzh//191v0LZmp1s0Au6/O2BA==
X-Google-Smtp-Source: ABdhPJwmNA9hwRr2yvnkFKCJDztn0ah9joACXgLQ9mZEh/B74ZlfwgeYO6GygqpQs7lBk0DPydRTDw==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr4809442wmq.40.1623932203668; 
 Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 17/44] target/arm: Implement MVE VHADD, VHSUB
Date: Thu, 17 Jun 2021 13:16:01 +0100
Message-Id: <20210617121628.20116-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement MVE VHADD and VHSUB insns, which perform an addition
or subtraction and then halve the result.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 14 ++++++++++++++
 target/arm/mve.decode      |  5 +++++
 target/arm/mve_helper.c    | 25 +++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 ++++
 4 files changed, 48 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5cd4e7d736d..02bef53ed41 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -116,3 +116,17 @@ DEF_HELPER_FLAGS_4(mve_vabdsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabdub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vabduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhaddsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhaddub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhadduw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vhsubsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vhsubuw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 087d3db2a31..241d1c44c19 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -96,6 +96,11 @@ VMIN_U           111 1 1111 0 . .. ... 0 ... 0 0110 . 1 . 1 ... 0 @2op
 VABD_S           111 0 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 VABD_U           111 1 1111 0 . .. ... 0 ... 0 0111 . 1 . 0 ... 0 @2op
 
+VHADD_S          111 0 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHADD_U          111 1 1111 0 . .. ... 0 ... 0 0000 . 1 . 0 ... 0 @2op
+VHSUB_S          111 0 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+VHSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 0 ... 0 @2op
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 65141221b63..a89f6e3b01b 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -444,3 +444,28 @@ DO_2OP_U(vminu, DO_MIN)
 
 DO_2OP_S(vabds, DO_ABD)
 DO_2OP_U(vabdu, DO_ABD)
+
+static inline uint32_t do_vhadd_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n + m) >> 1;
+}
+
+static inline int32_t do_vhadd_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n + m) >> 1;
+}
+
+static inline uint32_t do_vhsub_u(uint32_t n, uint32_t m)
+{
+    return ((uint64_t)n - m) >> 1;
+}
+
+static inline int32_t do_vhsub_s(int32_t n, int32_t m)
+{
+    return ((int64_t)n - m) >> 1;
+}
+
+DO_2OP_S(vhadds, do_vhadd_s)
+DO_2OP_U(vhaddu, do_vhadd_u)
+DO_2OP_S(vhsubs, do_vhsub_s)
+DO_2OP_U(vhsubu, do_vhsub_u)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 041fd1ef14f..f593d3693b9 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -357,3 +357,7 @@ DO_2OP(VMIN_S, vmins)
 DO_2OP(VMIN_U, vminu)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
+DO_2OP(VHADD_S, vhadds)
+DO_2OP(VHADD_U, vhaddu)
+DO_2OP(VHSUB_S, vhsubs)
+DO_2OP(VHSUB_U, vhsubu)
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F377E6B2E17
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWy-0004fp-Ay; Thu, 09 Mar 2023 15:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWw-0004Yn-Av
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:26 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWu-0000mv-QR
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:26 -0500
Received: by mail-pl1-x62d.google.com with SMTP id i5so3226188pla.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtufajdDebyVmSFuNQvXmKqJXsZdaoV3hxIFJfT57+c=;
 b=WA4HjgeFffdR8SHzW3RTqpdCeqFRhG1XupcoBDRj7zFPkAW4h1il7LxlVyK0LaJQ6e
 7t0VnSFxQQ5BelwRcuoaODYJikO9lJsDA/nyS62lZYjulQ+4bisHx2JqExKCn5NCEXMQ
 ocKRFWjV6hgjS5j8SnxWpsUKBm0sArDYT9xB22G8VsZFapzHUxEk0BDNZmkqDl7wzX5K
 oT2wW2+k9cUtbPo83cwn0uVvhvj3hk5Msr3mplYS/UXCFGErjuvKM5KHgpd/f0sLQDD7
 94ADnN+qHsrWCaZq+l40pp72YXDLTPbMJbDow2B/cy2FzVN9jJhCZiqodOgn6rfgZ45b
 T0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtufajdDebyVmSFuNQvXmKqJXsZdaoV3hxIFJfT57+c=;
 b=mgeylwljdlOxJyB1Twirf7nx1QeDLbwqSH3hdUi2L120BU/+qySYZv8pOnA3hiMOLt
 POl+pYwowW3ISghuNRXhBByTNNtoB6UNmCQxrSShuGhTPTCnnQR6cocR+S2wBw22Pt5K
 wqG7nP4fbK/5074vgtzpnhlhNrzpXEg321/h925NkzzKUBaTyZNBnuxd6hScpr+KGnij
 WPBZElrqEBvgHAQgBsBfa0/dtlNMb9k66hYHoyikvI+vrgdsqRGxT3VAprZjQqRGeFeY
 vgJebw54xkjfT0uZFgnm7yeT1Lp9fzjnWdGLgfQgYtsYW+TxzR3wgtC6AY8KiO7PWe5I
 Yr/g==
X-Gm-Message-State: AO0yUKWsWtqFtwtjxKIy5Ga/s6OZTARezJzBpzFR/xuWQIQSCju8JgQ/
 OKO7OR0EgS8J7EyN8Iveclhb4shhBFL9cVT6uLM=
X-Google-Smtp-Source: AK7set+aWrukMuHbRdkkrAyODXWSiQTtZpqNvZaTm89zKhCNWoOk2bjCJY6dcJoTF4KXUoXV9CegZw==
X-Received: by 2002:a17:90b:3b85:b0:234:8c58:c325 with SMTP id
 pc5-20020a17090b3b8500b002348c58c325mr22664721pjb.31.1678392383862; 
 Thu, 09 Mar 2023 12:06:23 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 36/91] target/tricore: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:55 -0800
Message-Id: <20230309200550.3878088-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-22-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/tricore/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/tricore/cpu-param.h b/target/tricore/cpu-param.h
index 2727913047..e29d551dd6 100644
--- a/target/tricore/cpu-param.h
+++ b/target/tricore/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 14
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 3
 
 #endif
-- 
2.34.1



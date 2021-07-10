Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21393C354B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:43:47 +0200 (CEST)
Received: from localhost ([::1]:55624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F8s-0002kx-Tb
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExR-0005Ip-Hm
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:57 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExP-0002IR-Qy
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:57 -0400
Received: by mail-pg1-x531.google.com with SMTP id f5so13162790pgv.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J78iIrV/uBjFzK3bTpbLy3S7PgpqgxUhkktjGy5U398=;
 b=GIIoO/5xKbWWYqmwwtrB4C4MHHxPxAo74NX6bOiHHyov8GPu2E1HjYK8b8kPJ5vkMa
 y73Y+Mn8lKKBdsrX0tn5Tnls/sYAubshefOEXWEEBKTLHveF+Ibuk2KraIMkn28SAcZr
 gw9V6tibNLAD0E294BgwnV8kJ+GOeJX6mOccw7N7DzdVsgrfJ9zrj/SpQD9YeP+OgoI/
 WapaOoxvkFlu0ysNyYqv6UUuSZlHc2BAoXLD7XZgNCo4a467rkbyg8cL8xq2RGmDICB3
 hz0mW280MVmKovgcAJYfe+frBjbwEEil9CHK7nMW2oT7jYWTc3euXUUvRxWHM+9TxiqN
 JKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J78iIrV/uBjFzK3bTpbLy3S7PgpqgxUhkktjGy5U398=;
 b=IEr3GjUMsWsiv6JeOKmLiPyIbv9ttdgv61e0x4/4iqHB3V5ZIQh2gITaBaM9gJVNK3
 RvEmyMyt5BzVxp9cZP0l46rYysvEO1EyVMeJiJl0aEDe4V5VfNBBTkcQ+GPMgpSmRY1z
 kTletR4owCx+K40NPbdvWGZMz4Ng5j/x1eIhNyMtMcNVwpKKCgxrcZpjSLVLshIbrgV5
 OD6hKMQRTiMBQcV8oMiST+u2MYAlMEptEsaAdOuN9+UVcZPkYqZX/JHo8SEpIvrVpynz
 DuRfAc49wZrtxLsx7WDUVIPONAA33xklZ2KZnMa1gFc684oQ8XMG4YPwX7B6qZo8ZQQl
 ZWcw==
X-Gm-Message-State: AOAM531JWCnm0xXC8Z9/XvZ2u2n6gotEQuRdwqZ7ybhRdb+S0n9H0eus
 btlFXnj+LrHmcFZC2uU/Wuq60kA7NPHx9g==
X-Google-Smtp-Source: ABdhPJxx3ZinqZhxkUK4D31SpuV//uWBVbF5RI+H36iuBptw00wJxvJT8mE48ap8lxpEd5aEGoPlIw==
X-Received: by 2002:a63:383:: with SMTP id 125mr39210085pgd.208.1625931114554; 
 Sat, 10 Jul 2021 08:31:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/41] target/avr: Mark some helpers noreturn
Date: Sat, 10 Jul 2021 08:31:16 -0700
Message-Id: <20210710153143.1320521-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of these helpers end with cpu_loop_exit.

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/avr/helper.h b/target/avr/helper.h
index 8e1ae7fda0..4d02e648fa 100644
--- a/target/avr/helper.h
+++ b/target/avr/helper.h
@@ -19,10 +19,10 @@
  */
 
 DEF_HELPER_1(wdr, void, env)
-DEF_HELPER_1(debug, void, env)
-DEF_HELPER_1(break, void, env)
-DEF_HELPER_1(sleep, void, env)
-DEF_HELPER_1(unsupported, void, env)
+DEF_HELPER_1(debug, noreturn, env)
+DEF_HELPER_1(break, noreturn, env)
+DEF_HELPER_1(sleep, noreturn, env)
+DEF_HELPER_1(unsupported, noreturn, env)
 DEF_HELPER_3(outb, void, env, i32, i32)
 DEF_HELPER_2(inb, tl, env, i32)
 DEF_HELPER_3(fullwr, void, env, i32, i32)
-- 
2.25.1



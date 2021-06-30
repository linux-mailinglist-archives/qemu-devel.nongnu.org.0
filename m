Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA0A3B889F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:39:49 +0200 (CEST)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyf7k-0005vN-Mg
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0n-0005AT-5K
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:37 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0k-00021E-9e
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:36 -0400
Received: by mail-pf1-x42f.google.com with SMTP id 17so3087656pfz.4
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J78iIrV/uBjFzK3bTpbLy3S7PgpqgxUhkktjGy5U398=;
 b=GpcDQhn3rNZq22ejfC51ec1IHUChdfMXgZltxnQz6aid6/QPCGIpK2IECmRwcRB4u9
 leXOYx460tvMC18EoKJad3WJKsIgVbH27GdBfH1HyfzXeWeTMYkoR9KA0unx7WTj8y5w
 xRMFGlyCEn5n9FqBttq5MD6dNBXr0CDaQnRpAGofCZedIkOI0ihvb5oKx5BO0YkGi93M
 6J6/93aC12nGEgIeFEQHZgrqJUyps1E5zv3iBnquNkbiv6otXhu4m/5n5309KE+gjwnH
 JAhCPjprCziSUjxMV1cNlYSWcx7gmCpwlecQl5lWA9PCSaZm3Ed2/WnUxlV3tZQCIqcs
 CE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J78iIrV/uBjFzK3bTpbLy3S7PgpqgxUhkktjGy5U398=;
 b=kMuOqDrJMplov1zd6MUNljjMK1ahONjpnDhxP8twaf9z+eyNb1Tkh8GwzRGajmdMbH
 m1lXEJ9VkFmYcxTNaO3JcBoUztHq86U8q0gzwK+vLT9iKM0LxU5G0+/+X8NwEdLZnN80
 00x0vdOzLh5LLSsVDAYSpuY3tYjkAR8AKv/RWPq/7F+VPv6hx/y2LbG2IPkVTdmBi8p/
 eRRDs0UhR4WQSdLFYdrHaT3NeNt9qU+FUnohVCYaWRXTnhcKtEBNHS7mcfqbvRAVWQOd
 /3Ardqd93XGFsX5CXL9JqD2vN4+qTfjj7U+BGFzbGBddznMVbPR+UeifTuNsHjSRVThg
 y90w==
X-Gm-Message-State: AOAM530oXhc4Ng3DdV4E22ka9uDRaRhiZDlP+BJbZZCgJKiDb06BvQX0
 bEguZbqGTzSy5f/FtSZoFpYGpKOgIkWc1g==
X-Google-Smtp-Source: ABdhPJz7Qfcl+U4cOLwZOZvplv2iGdDygH1i68OQUvU45yckLM+QNmyrJW0YUKL0+IQuCIlotmiw3g==
X-Received: by 2002:aa7:8591:0:b029:302:e6e8:705 with SMTP id
 w17-20020aa785910000b0290302e6e80705mr3613749pfn.5.1625077953046; 
 Wed, 30 Jun 2021 11:32:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/28] target/avr: Mark some helpers noreturn
Date: Wed, 30 Jun 2021 11:32:07 -0700
Message-Id: <20210630183226.3290849-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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



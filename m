Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F48B8818
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 01:34:06 +0200 (CEST)
Received: from localhost ([::1]:49758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB5w4-0000gj-Gc
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 19:34:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iB5sC-0006Lw-B1
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 19:30:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iB5sB-0000oN-A6
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 19:30:04 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:43455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iB5sB-0000m5-4b
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 19:30:03 -0400
Received: by mail-pl1-x641.google.com with SMTP id 4so2294009pld.10
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 16:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gR0jg0QcrjTmZyLiyBAs7/D2tb3kDYy6vyz4PCvILE8=;
 b=HA9NGZ4qOs7I31WceYz6oYBUUcRBhIxSzgYAaxwKXh0hn5zntw8+o7PvsrZaayuFMi
 wD6WPUCtgE5KoV6U5psG8k0RF6cUo1WjN99Aean9PdaTEXB5PPu2T8XQ/CkrAJVMzuuB
 1bRspCxe05i1fHHvbt/38wiVdhqi0Sf+BOHeX3wOPpVaW+ExSdm4IO0eKIDvc9IHZrI5
 IlpwSmkZD0kGfd9Xg5iBS+FQ6sod+WPmVSxQyrYzzTRu9YIGThVgQPbqvN65yRRkTL5x
 C6dt/54d3gJR6mgtqmp69cs5f+kFhDNQz/3PZLCDPvdJqkQ2ikYXQdVsPfR62vjGZIor
 HZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gR0jg0QcrjTmZyLiyBAs7/D2tb3kDYy6vyz4PCvILE8=;
 b=XFUfaZ2RfRZg5ueg34FTWxEMYsddkSpQO6u8k0KeOQk5KqiJ/MBoJdxebBQzPbswbw
 JBLXFwG4Vd+FvnNthLKTs4n8FVNbgU1BdD6QM6MDXr5pyAddyrWIYX4mguEQ/1m1HgN4
 eGGSCzarfaoiNW28Ppd2DdHmo7CLIpy1VbfoCrs1sO7l2XUDvBORSTQqPX4/O6AZODIY
 Kgq0gnzoi3w3XeHCFg1tjJ1XSTfXtddMVeWD0Zi0a7MZ7lDIJtaayw8WLzIqCopNnoZb
 FO2t1uBbCRQsqIag+iWYusDSxyKQZntqd8lLkm6wh/g50OamgWX78TxNW8D9brl4dW4E
 UxMg==
X-Gm-Message-State: APjAAAW47i8yhk7cu57gGMDlLe5Oq6G5S9vh8bLt8pXtDv7pX1osw03B
 W5430MpibApL3Ftyh1hTKews2JjHBq4=
X-Google-Smtp-Source: APXvYqz2bYTc8c0IICqup8Qq7SXTYgwyR8/+6i2RqrxydUGJ9Ga+yLGXGS0uSn6kpE/dJdZ63DjtDg==
X-Received: by 2002:a17:902:a50d:: with SMTP id
 s13mr12808974plq.248.1568935801836; 
 Thu, 19 Sep 2019 16:30:01 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id h8sm103340pfo.64.2019.09.19.16.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2019 16:30:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] exec: Tidy TARGET_PAGE_ALIGN
Date: Thu, 19 Sep 2019 16:29:51 -0700
Message-Id: <20190919232952.6382-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190919232952.6382-1-richard.henderson@linaro.org>
References: <20190919232952.6382-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use TARGET_PAGE_MASK twice instead of TARGET_PAGE_SIZE once.
This is functionally identical, but will help a following patch.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 34d36cebca..5246770271 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -226,7 +226,8 @@ extern const TargetPageBits target_page;
 
 #define TARGET_PAGE_SIZE (1 << TARGET_PAGE_BITS)
 #define TARGET_PAGE_MASK ((target_long)-1 << TARGET_PAGE_BITS)
-#define TARGET_PAGE_ALIGN(addr) (((addr) + TARGET_PAGE_SIZE - 1) & TARGET_PAGE_MASK)
+#define TARGET_PAGE_ALIGN(addr) \
+    (((addr) + ~TARGET_PAGE_MASK) & TARGET_PAGE_MASK)
 
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
-- 
2.17.1



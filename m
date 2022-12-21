Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C565652C43
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 06:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7rGJ-0002Gy-Ko; Wed, 21 Dec 2022 00:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGF-0002DC-SQ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:23 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7rGE-0003NV-4z
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 00:03:23 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so1024518pjj.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 21:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAUonYiwjRnP6N+RJ7H0Na3sdK2hQtHKLKMXocwrETk=;
 b=v92p0/YrHnSCADhlHANPMHJMa2Pzmku7kOA+tOv7VBDKqnEhFvRxe/91KpHDeEeyFy
 3JdyezwknguGZ8eT2YSAQOnryC9Ys806w3Zck73goC+3J5U5CwR1cz2emy3U7LzAlJEP
 l9U/mHVUq4BhXbDECDFYHIGx7nDncvlJ6i66w0XVx6FZWNLj7bKhN7XLP07aeYnGCK6A
 PcGx3Xy9dJ37oiVLJpJZugs7VrkKtr6e6HjTcViTxDvqNrvLZTpPybzX/szcSArAeRXI
 i0B1mGT+GTmklaPCeeWlp8ayo/QLHvWOuy5Kqml/sWUFlIqbJX5XDRW0XdYF9Db5gIFY
 1I4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAUonYiwjRnP6N+RJ7H0Na3sdK2hQtHKLKMXocwrETk=;
 b=AV9phfl3SxoRUr1Ff+sSbIa96nJUCQULSoY02JHAE/k1JkqcdcdwceNDOl5NFqOLgq
 GZdisrb9I7OchcBxDVXweHybuN1iksu/8n42ZgVC6vyCOA9kminuyZFhUmJkmGIjHLop
 +n3R3qhzTRGOCmTzVpE4IVH+3GPWU91ne/MZf9zAykQTQtpFV8a0Yl5uHtZcQBALKyUU
 dzIrSy7y5C4jvqACwZHoCeRYgCAdlXxSQiX33ZhgoL2U7z7NlnxLxTQuOkKVyXDVLlBe
 cJPymyoe0FOUCZlyedZogBi9na9cohbpnn7KaU8pbNNqILsK6MQB4LJKKKm4Awxcj5nZ
 PYuw==
X-Gm-Message-State: AFqh2kqeHq+sC48K1QfvHft2Qf78CXrFIk2XBQhyd0PO20Cgk92/F/IU
 Wg1ppU0Kx66eXJkNWWb/FAaBP827KjhQ9TH5
X-Google-Smtp-Source: AMrXdXtRakJ2X0ukBnf2wEIST3IFYdvhzpXPTrrgnuqbARaydHkYsdmQnwS/eqezWhkBB+0FiyNmqQ==
X-Received: by 2002:a17:90b:794:b0:220:f82d:b938 with SMTP id
 l20-20020a17090b079400b00220f82db938mr17369828pjz.23.1671599000786; 
 Tue, 20 Dec 2022 21:03:20 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:3efa:624c:5fb:32c0])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a688800b002135e8074b1sm390645pjd.55.2022.12.20.21.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 21:03:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 05/14] accel/tcg: Drop PAGE_RESERVED for CONFIG_BSD
Date: Tue, 20 Dec 2022 21:03:04 -0800
Message-Id: <20221221050313.2950701-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221221050313.2950701-1-richard.henderson@linaro.org>
References: <20221221050313.2950701-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Make bsd-user match linux-user in not marking host pages
as reserved.  This isn't especially effective anyway, as
it doesn't take into account any heap memory that qemu
may allocate after startup.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Tested-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 65 ---------------------------------------
 1 file changed, 65 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b964ea44d7..48e9d70b4e 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -354,71 +354,6 @@ void page_init(void)
 {
     page_size_init();
     page_table_config_init();
-
-#if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
-    {
-#ifdef HAVE_KINFO_GETVMMAP
-        struct kinfo_vmentry *freep;
-        int i, cnt;
-
-        freep = kinfo_getvmmap(getpid(), &cnt);
-        if (freep) {
-            mmap_lock();
-            for (i = 0; i < cnt; i++) {
-                unsigned long startaddr, endaddr;
-
-                startaddr = freep[i].kve_start;
-                endaddr = freep[i].kve_end;
-                if (h2g_valid(startaddr)) {
-                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
-
-                    if (h2g_valid(endaddr)) {
-                        endaddr = h2g(endaddr);
-                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
-                    } else {
-#if TARGET_ABI_BITS <= L1_MAP_ADDR_SPACE_BITS
-                        endaddr = ~0ul;
-                        page_set_flags(startaddr, endaddr, PAGE_RESERVED);
-#endif
-                    }
-                }
-            }
-            free(freep);
-            mmap_unlock();
-        }
-#else
-        FILE *f;
-
-        last_brk = (unsigned long)sbrk(0);
-
-        f = fopen("/compat/linux/proc/self/maps", "r");
-        if (f) {
-            mmap_lock();
-
-            do {
-                unsigned long startaddr, endaddr;
-                int n;
-
-                n = fscanf(f, "%lx-%lx %*[^\n]\n", &startaddr, &endaddr);
-
-                if (n == 2 && h2g_valid(startaddr)) {
-                    startaddr = h2g(startaddr) & TARGET_PAGE_MASK;
-
-                    if (h2g_valid(endaddr)) {
-                        endaddr = h2g(endaddr);
-                    } else {
-                        endaddr = ~0ul;
-                    }
-                    page_set_flags(startaddr, endaddr, PAGE_RESERVED);
-                }
-            } while (!feof(f));
-
-            fclose(f);
-            mmap_unlock();
-        }
-#endif
-    }
-#endif
 }
 
 PageDesc *page_find_alloc(tb_page_addr_t index, bool alloc)
-- 
2.34.1



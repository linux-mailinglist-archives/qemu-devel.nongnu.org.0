Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA639666090
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:33:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe1A-0001FU-HN; Wed, 11 Jan 2023 11:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe18-0001F4-DM
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:31:58 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe16-0006BP-RY
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:31:58 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so13127007wms.2
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYffee02pGXsDaWEK6vxcHOMS52J5/C+ETdo1/oigCU=;
 b=Ks2Xu7NCVAGfIFkzDPbgINU73TtdKiS+26nh4ZR/niaw4OnmjeQgpAm15D+HV4iNTj
 SG5adEyerflqWOnzefO68YDCWB5AcrAjemROlSXvfchQqLaQqZ/MLppO3nm83g6LBIA2
 0h3RzqCCSfQsCi9RTgEnpGTaa+hW5FbEN7EQzcXJqAbDQ7lR5kyKY/7uqxCv6ogVm1gB
 uYXcpgOJJXq8wGImx0uNJr62HKw8lPJyZLKcmG8KU0fe3olrypd6Etb5EJYWlW2HC4GE
 laEMFKniML349jUcb3HYIOa7iDpXpn5pZJRVXcuRenV0hu28odU2YtvoQmeZWQhjRIYj
 acGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYffee02pGXsDaWEK6vxcHOMS52J5/C+ETdo1/oigCU=;
 b=ZaszEbjD8valSMDcAeRu2aUfaEHm7s4KZi6JzTFwif7n6QgItCje3cToS7DTLS9TG5
 Px8RgforvH+nA8qTWdjFaJUxAEFQXvqTeLsRW0UzRkwyRqUFlUL1kkXpbp1LXYUNdybr
 ychC9vy6mCwzI2RG8kkNvaDFqBjCiWRmdUNVOmo8+SQD/5h5HoSTtaLB7Mh+yJ3yvGHE
 0dor97DJnkAoRvnBGuIFO9rMFv5QVon7DPbQbQjtXEIWkN4SMFVuL9964ij3G27eAAVw
 EwhKU6JPp3pRam2TvhGWGyokX+heonENaTvQxLgHwLPSPIZgzrvyG38IDT2F+V8+yrIh
 A5wA==
X-Gm-Message-State: AFqh2kouCIH/Zk0UfqmyJdqV2DxBdqzET3Q7GGhQBaXxJ06AMWFRryjV
 hYIk8r/9p1i9UWvxYbnU8+XacvOQUNX4tk7T
X-Google-Smtp-Source: AMrXdXvDcMYJ7YqMd8jkETn++un/h+TCUuRk87eI5N75q5wAu0Om76nQXC00Zb6iQj8ILYzsLX7RXg==
X-Received: by 2002:a05:600c:3b90:b0:3d1:f0f1:ceb4 with SMTP id
 n16-20020a05600c3b9000b003d1f0f1ceb4mr52762995wms.19.1673454715084; 
 Wed, 11 Jan 2023 08:31:55 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c1d0e00b003da105437besm801426wms.29.2023.01.11.08.31.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:31:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 1/6] qemu/bswap: Replace bswapXX() by compiler
 __builtin_bswap()
Date: Wed, 11 Jan 2023 17:31:42 +0100
Message-Id: <20230111163147.71761-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
References: <20230111163147.71761-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Use the compiler built-in function to byte swap values,
as the compiler is clever and will fold constants.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index 346d05f2aa..ca2b4c3f15 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -37,31 +37,12 @@ static inline uint64_t bswap64(uint64_t x)
 #endif
 
 #ifdef BSWAP_FROM_FALLBACKS
-static inline uint16_t bswap16(uint16_t x)
-{
-    return (((x & 0x00ff) << 8) |
-            ((x & 0xff00) >> 8));
-}
-
-static inline uint32_t bswap32(uint32_t x)
-{
-    return (((x & 0x000000ffU) << 24) |
-            ((x & 0x0000ff00U) <<  8) |
-            ((x & 0x00ff0000U) >>  8) |
-            ((x & 0xff000000U) >> 24));
-}
-
-static inline uint64_t bswap64(uint64_t x)
-{
-    return (((x & 0x00000000000000ffULL) << 56) |
-            ((x & 0x000000000000ff00ULL) << 40) |
-            ((x & 0x0000000000ff0000ULL) << 24) |
-            ((x & 0x00000000ff000000ULL) <<  8) |
-            ((x & 0x000000ff00000000ULL) >>  8) |
-            ((x & 0x0000ff0000000000ULL) >> 24) |
-            ((x & 0x00ff000000000000ULL) >> 40) |
-            ((x & 0xff00000000000000ULL) >> 56));
-}
+#undef  bswap16
+#define bswap16(_x) __builtin_bswap16(_x)
+#undef  bswap32
+#define bswap32(_x) __builtin_bswap32(_x)
+#undef  bswap64
+#define bswap64(_x) __builtin_bswap64(_x)
 #endif
 
 #undef BSWAP_FROM_BYTESWAP
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87266609B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:35:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe1L-0001Jg-GN; Wed, 11 Jan 2023 11:32:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1I-0001Iu-Ok
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:08 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe1G-0006CN-UO
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:32:08 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o15so11496185wmr.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3zyYlmMr7+ydHjPpWElbYHyC0T5f+cMjb1tNVSE7zFk=;
 b=t0mD+0BoZzKXROIu3PFe/6wnv+KKrnl3R1XDZFEs38HFWC7iToiS15nsqdijtp5c3b
 ifJrPQxxnn8hmYvqGriRaPkO2DM6mozi+ZnJnq63u+t0VaCbIPSnTQWJ0NGGSgSwXtBj
 nM+sk/YrcT+kdNTEOIVybe4pl0/ZC+5KxnmkYwZ+H8QDsoIEjnYaHcZYL7oyObjfGp95
 Wq08DK9CnKsQcjHX1Q0SqDbLg4N6VUwzEtVAFNukv1CI3FC3nQw+CJSx1cyyGRe81mj+
 wY2lHavsUHgxZiJvTYsV2GiV5eu0LaBo78QzBGr0KzSo8MfY0s6tt8/W5XscoEY38yyl
 cyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3zyYlmMr7+ydHjPpWElbYHyC0T5f+cMjb1tNVSE7zFk=;
 b=K82Xq3kzMC0wfdptGuS8EKxEZQPEVI15CInnBIcmF7lE4SLuQKSIGBorkQQeDaMefF
 ln4toi26HhGa+rsZOgSWsFoCvzU/x6GCViYkIhCo0uSo4y+kIV5MwJQmq+3iv1ArCjpD
 TzfQqXdJLdPihT1UlTaLutMTloRTrhUqw/LfbZw9vwVBdiPW4FhhWdjYVd0omRfuYq15
 pLgqwH2PNrfFwe5zvqDx1Qytd2GjDE0Go1hIKmivvLnMzJ+8UcTNTQoAbGEEP6sw3s/n
 PPLok0+rDlCotAXK5p5weM7QH5DI1XwzZpJwcqjSzU8KbzVBZNtUr28Zw9CHrbuCv2BF
 YWMQ==
X-Gm-Message-State: AFqh2kq3ffHKIcokfT4zIXOvJ+FRa18PdIRTklnkWef7rB2BbZUgNnYh
 gBUT67venqGs4PlNAOqXEPMkolsUWJTrPO2s
X-Google-Smtp-Source: AMrXdXu+jkdPCbqmx0ptX/EklXkoKw22LC/oOrQkTQ9onj8jO5XceSzmfceSpip1zKCkPGdV3LVxWg==
X-Received: by 2002:a05:600c:4496:b0:3d3:47b7:569e with SMTP id
 e22-20020a05600c449600b003d347b7569emr51862586wmo.2.1673454725347; 
 Wed, 11 Jan 2023 08:32:05 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d534a000000b00272c0767b4asm14261687wrv.109.2023.01.11.08.32.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Jan 2023 08:32:05 -0800 (PST)
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
Subject: [PATCH v3 3/6] qemu/bswap: Remove <byteswap.h> dependency
Date: Wed, 11 Jan 2023 17:31:44 +0100
Message-Id: <20230111163147.71761-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230111163147.71761-1-philmd@linaro.org>
References: <20230111163147.71761-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Since commit efc6c070aca ("configure: Add a test for the minimum
compiler version") the minimum compiler version required for GCC
is 4.8, which supports __builtin_bswap().
Drop the <byteswap.h> dependency.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/bswap.h | 21 ---------------------
 meson.build          |  2 --
 2 files changed, 23 deletions(-)

diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
index d2dafdc54c..fd5a98125a 100644
--- a/include/qemu/bswap.h
+++ b/include/qemu/bswap.h
@@ -8,9 +8,6 @@
 # include <sys/endian.h>
 #elif defined(__HAIKU__)
 # include <endian.h>
-#elif defined(CONFIG_BYTESWAP_H)
-# include <byteswap.h>
-#define BSWAP_FROM_BYTESWAP
 # else
 #define BSWAP_FROM_FALLBACKS
 #endif /* ! CONFIG_MACHINE_BSWAP_H */
@@ -19,23 +16,6 @@
 extern "C" {
 #endif
 
-#ifdef BSWAP_FROM_BYTESWAP
-static inline uint16_t bswap16(uint16_t x)
-{
-    return bswap_16(x);
-}
-
-static inline uint32_t bswap32(uint32_t x)
-{
-    return bswap_32(x);
-}
-
-static inline uint64_t bswap64(uint64_t x)
-{
-    return bswap_64(x);
-}
-#endif
-
 #ifdef BSWAP_FROM_FALLBACKS
 #undef  bswap16
 #define bswap16(_x) __builtin_bswap16(_x)
@@ -45,7 +25,6 @@ static inline uint64_t bswap64(uint64_t x)
 #define bswap64(_x) __builtin_bswap64(_x)
 #endif
 
-#undef BSWAP_FROM_BYTESWAP
 #undef BSWAP_FROM_FALLBACKS
 
 static inline void bswap16s(uint16_t *s)
diff --git a/meson.build b/meson.build
index 175517eafd..697059d2c8 100644
--- a/meson.build
+++ b/meson.build
@@ -2006,8 +2006,6 @@ if rdma.found()
 endif
 
 # has_header_symbol
-config_host_data.set('CONFIG_BYTESWAP_H',
-                     cc.has_header_symbol('byteswap.h', 'bswap_32'))
 config_host_data.set('CONFIG_EPOLL_CREATE1',
                      cc.has_header_symbol('sys/epoll.h', 'epoll_create1'))
 config_host_data.set('CONFIG_FALLOCATE_PUNCH_HOLE',
-- 
2.38.1



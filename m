Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457623EA74F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 17:16:55 +0200 (CEST)
Received: from localhost ([::1]:34962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mECRx-00055o-Tb
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 11:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mECQc-0004BW-OO
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:15:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mECQb-0005Tx-0I
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:15:30 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b13so8846891wrs.3
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S59jP0Dz50UepKvgAyg6BiF3KY5os6JcegL6QKJo0kM=;
 b=c8Z7hx05m0Xjcd8efhFSNaPzkX+r9nM+7LJ6j1R1S0u5Lin/jfKISxN5KR3pmd5qaX
 6bnXGaUls9RM5iWGBSU10T5kC4dH5ebS8w+57uqUfm0sWLSzk4p1mSpb1kToqBsLnY6X
 db3WyY9KGtCg2WkOaYxjY5eP02kSxVpguZp3Pzec7BgD7hD6G6hPzwc62Wdt0kdRiu1K
 hGKCmaiqLJFEP/DdvustqlcrS38EDk4NcyEqXxHnwCbzHfU9EqZmhXWPXxakD4ID7fnI
 ri/VuFpwsuFkXPbiF8fPvBLDIcVUbPwiYkHDIy4fT81lL7H7VnVx6eKMw5ES0JRKtQJT
 T/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S59jP0Dz50UepKvgAyg6BiF3KY5os6JcegL6QKJo0kM=;
 b=FC+c4nbUKc+8c40x5dBGqyEO5pHCw3ljq7c8k+QWBZtEjSwvwcFwf+L1ui9nazsPpK
 8pUZPSMZFZK8MoLIX0NYGbXrND7f/A1qRm8Gjn3ErlIQPJpkfzr1cJrzo/ate8jjTxww
 SlaYqkTAnkGG9y+3zxgPMAaJpr1w5kl3l796S1Ds9TTquKdVBjwMc/qJ0o2cj50OY9ka
 uN972tv/gv/5uBjzFtScr+56fZGtHrJgBtpmuuj5+AMkrHA1VKQ75foxuybsvD780Akc
 gEYKHft8wXk+B24+czUdKeOgWldGK1K0YGcpKTraOw4elqaJguuQqmx5p0qRNFqvWMa1
 bJ2Q==
X-Gm-Message-State: AOAM533dHLHghbPSTU5sWw3S7Bsog7bKAa6il3R7Kn5E16TmN6mCTuue
 IUG9Em9zEkh00u+7GqW0rTRtuaRy2MFGnw==
X-Google-Smtp-Source: ABdhPJxGVdNhoWQfBu/A6z8Y0RkxJSaj7a6PlvN17Npg6T0T1XWFOq/AHlIunV+CGu9cAv3RWmPGFw==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr4598385wrj.216.1628781327056; 
 Thu, 12 Aug 2021 08:15:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e3sm3235532wro.15.2021.08.12.08.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 08:15:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/physmem.c: Check return value from realpath()
Date: Thu, 12 Aug 2021 16:15:25 +0100
Message-Id: <20210812151525.31456-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jingqi Liu <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The realpath() function can return NULL on error, so we need to check
for it to avoid crashing when we try to strstr() into it.
This can happen if we run out of memory, or if /sys/ is not mounted,
among other situations.

Fixes: Coverity 1459913, 1460474
Fixes: ce317be98db0 ("exec: fetch the alignment of Linux devdax pmem character device nodes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/physmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index c47cb6da2e4..eb0595d57c4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1451,6 +1451,9 @@ static int64_t get_file_align(int fd)
         path = g_strdup_printf("/sys/dev/char/%d:%d",
                     major(st.st_rdev), minor(st.st_rdev));
         rpath = realpath(path, NULL);
+        if (!rpath) {
+            return -errno;
+        }
 
         rc = daxctl_new(&ctx);
         if (rc) {
-- 
2.20.1



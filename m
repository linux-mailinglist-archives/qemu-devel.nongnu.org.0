Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56166336922
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:47:42 +0100 (CET)
Received: from localhost ([::1]:56004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9UL-00060Y-B3
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK962-0005A2-J4
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:34 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95x-0001R1-9D
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:34 -0500
Received: by mail-ot1-x332.google.com with SMTP id e45so18297578ote.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hRDKBlkrkH0wPjjBxkhifgdz+KlBpVlUTlAscxlmvqk=;
 b=GsYC70hk9ndl6hZhnlOx9eCG4SHBgGWkrHbwm4i0V8+1hxYGqxnG6s3gWoKHokYhZz
 TYopvvE9PgXFnXCkjf7Tx+NTGzvWBkoQMPLF7Inl/q6TGDBrAVsle4lOkNkBYoq0AKiQ
 XXgxG9NkvzfkOdA+j8oTsuZeWuJPv8NImlFWEQlrnOWB480CwgvO3KY4e70f5voTXwPN
 vaow8BldsnTcI4NV6jThbuVa4WDS+NVZnMlWPVC8DK7yGpyfPQtJIuNMM9NIq2rZLDCY
 kK93mGbjxS6z1MWpw+GK66Q58aNkwFy+UYgxQZrp/abjbn3xMwvi/8aQph78O6blT2os
 ZK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hRDKBlkrkH0wPjjBxkhifgdz+KlBpVlUTlAscxlmvqk=;
 b=YxkNqISgUUI7q8qz82v79GchyioiqD833zFilv/wWcEBdkK39BJbh2qqJAXU/n2MdI
 iqFFi9lETN6XBb2gkcyFVs0IvIoQe+oMMwb7cVMP7VdEYmvor5mw/6XUOo/0cbo32b7V
 IS89FuH5usJ7NarL+25j8IzSTG2EehXQh1JyKKjsrsyRYJ0ZrHbBEM7XBzE3Zds7+FxG
 3d3OgeCTz5+7R48bJQJCy0HJJNe1Dhl/QGtLzRsy6NEhJQLOzahzznRo8O42TdpXS0tc
 xt1yKmUbf6dqa5X629vWRaN1uKqExaUY2rkBJqtjJwp1vE3TbuIFe2w8SMkMdA88yURK
 8HDA==
X-Gm-Message-State: AOAM531WpaTNVZEqBAOHVddWEeNm5KjIyKor5nd4LdYz9UKb5++sATic
 mTH/1NAWzFiWkOpBt0F6cOgIT3YmfLsHi/XS
X-Google-Smtp-Source: ABdhPJyyvW0K35FkcTtJz+HA+0PCQh0CnWnnlndv7wqvr6j8xqm/znUcj8KyBeAA508kSXeAtoHtMA==
X-Received: by 2002:a05:6830:1352:: with SMTP id
 r18mr4893827otq.283.1615422148231; 
 Wed, 10 Mar 2021 16:22:28 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 24/26] util/osdep: Add qemu_mprotect_rw
Date: Wed, 10 Mar 2021 18:21:54 -0600
Message-Id: <20210311002156.253711-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x332.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For --enable-tcg-interpreter on Windows, we will need this.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/osdep.h | 1 +
 util/osdep.c         | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c56..5cc2e57bdf 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -494,6 +494,7 @@ void sigaction_invoke(struct sigaction *action,
 #endif
 
 int qemu_madvise(void *addr, size_t len, int advice);
+int qemu_mprotect_rw(void *addr, size_t size);
 int qemu_mprotect_rwx(void *addr, size_t size);
 int qemu_mprotect_none(void *addr, size_t size);
 
diff --git a/util/osdep.c b/util/osdep.c
index 66d01b9160..42a0a4986a 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -97,6 +97,15 @@ static int qemu_mprotect__osdep(void *addr, size_t size, int prot)
 #endif
 }
 
+int qemu_mprotect_rw(void *addr, size_t size)
+{
+#ifdef _WIN32
+    return qemu_mprotect__osdep(addr, size, PAGE_READWRITE);
+#else
+    return qemu_mprotect__osdep(addr, size, PROT_READ | PROT_WRITE);
+#endif
+}
+
 int qemu_mprotect_rwx(void *addr, size_t size)
 {
 #ifdef _WIN32
-- 
2.25.1



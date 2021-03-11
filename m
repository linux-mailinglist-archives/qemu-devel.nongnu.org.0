Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5C33688F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:26:46 +0100 (CET)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9A3-0001He-92
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95g-0004f9-By
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:12 -0500
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230]:32880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95Z-0001J4-IB
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:12 -0500
Received: by mail-oi1-x230.google.com with SMTP id d16so11940715oic.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=obYVzAvVf8VNvYi5ASRAvp3MCQUh9mMiVXvJcu+Y4nc=;
 b=mSmymNSXTA8PlUkiI7XKhh5qpWvFDWFUV3zQB8mneF7Ue3Sl9gM4IBZoFffdJr9lkE
 78NKXb8zAI+2fE50IEvAp05EvQD4ruymepVctGNJB3YW466mcC2UVbxprgrwguphkV60
 euZmLGULHWGnwRkGJIE7029L4Qdrr0cA9JaXDL0wS4G9C9BCl+qVUWg3muKnwFal3P0h
 5QCU3iPkAlx9sV3nu5U2IwQugY2h5BVJ9SOLEN8I3plCj5QhOJUvzRMaSzhZGfS2W8uR
 FfnCj4z5Rr4ukjd8PGSeq7yHBh0YFQvF5kmJDooHfO//FSPUMbtd6i+amT4MxyMSwx5S
 k2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=obYVzAvVf8VNvYi5ASRAvp3MCQUh9mMiVXvJcu+Y4nc=;
 b=lVHrzihcsDVNKdGtjyxw0KCv1lqGSs45P9k1WeggrWGNfTjsc6asTa1pkuTcKLHLtU
 GJx9RnGCq008RcgBA/giVrK+6TxbRVFDhJ5ZgU28a7y4imhm2BNACw9DgYlKMPDUc8Xv
 bFFauZ0VnUzB22aNDYgVUFzu5ZGYn5kHnsGCo0Dd0KPKc2dafxg65gZsIXWVtB3edkdt
 6uZ9aN96MW6xhm9FYbnW36EFgTlJgOnQVBKF0hh4y6YpfE+CX2GdtAhLjLvMmbt/0Yiw
 zWE4mNEchx9luLW+4xZ+FLUWyV4Dbro2ls7lAS8LEtqUwFmItKSvMstxsnwZAMdaXkCD
 /2+w==
X-Gm-Message-State: AOAM531uR0RPe3lR5OACLVIrPe9sB0T25biR5J1a2rUFGTDCvzVUKaZx
 K2B/vAbT9e5RlAHrSI+mawrr/CA+E9JZBqsF
X-Google-Smtp-Source: ABdhPJxhSWN/7trzwEZHrMpwI6n95otTpLeTHfNJIPr5byWSwIcAhDGgrf3oFka5jWkH8zqRMqounQ==
X-Received: by 2002:aca:cf93:: with SMTP id f141mr4374260oig.0.1615422121144; 
 Wed, 10 Mar 2021 16:22:01 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/26] meson: Split out tcg/meson.build
Date: Wed, 10 Mar 2021 18:21:31 -0600
Message-Id: <20210311002156.253711-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::230;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x230.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build     |  9 ++-------
 tcg/meson.build | 13 +++++++++++++
 2 files changed, 15 insertions(+), 7 deletions(-)
 create mode 100644 tcg/meson.build

diff --git a/meson.build b/meson.build
index adeec153d9..8bc472ddeb 100644
--- a/meson.build
+++ b/meson.build
@@ -1936,14 +1936,8 @@ specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
 specific_ss.add(files('exec-vary.c'))
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'fpu/softfloat.c',
-  'tcg/optimize.c',
-  'tcg/tcg-common.c',
-  'tcg/tcg-op-gvec.c',
-  'tcg/tcg-op-vec.c',
-  'tcg/tcg-op.c',
-  'tcg/tcg.c',
 ))
-specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c', 'tcg/tci.c'))
+specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('disas/tci.c'))
 
 subdir('backends')
 subdir('disas')
@@ -1952,6 +1946,7 @@ subdir('monitor')
 subdir('net')
 subdir('replay')
 subdir('hw')
+subdir('tcg')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
diff --git a/tcg/meson.build b/tcg/meson.build
new file mode 100644
index 0000000000..84064a341e
--- /dev/null
+++ b/tcg/meson.build
@@ -0,0 +1,13 @@
+tcg_ss = ss.source_set()
+
+tcg_ss.add(files(
+  'optimize.c',
+  'tcg.c',
+  'tcg-common.c',
+  'tcg-op.c',
+  'tcg-op-gvec.c',
+  'tcg-op-vec.c',
+))
+tcg_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tci.c'))
+
+specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
-- 
2.25.1



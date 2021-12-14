Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41F747398C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 01:31:10 +0100 (CET)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwvim-000515-Lx
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 19:31:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwveE-0008Qt-62
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:26 -0500
Received: from [2607:f8b0:4864:20::433] (port=45705
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwve9-0005Tn-OT
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 19:26:25 -0500
Received: by mail-pf1-x433.google.com with SMTP id x131so16369667pfc.12
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 16:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EG4DMUGXVEyZNv1Q4b/NktcGLb+o4TMJ3Kcuz4Efvk0=;
 b=knUFG4Z6NSHK/w/xdb4FSS+/FE0ec0ftoa84sxqLU9mj3YrlGmvlmFwposiXxKJfmQ
 4m67cxgpAjCNNbanEJnDEWM5WlmvJeEJNqjpniYCv1TPKLzxhgL+TlFUCaegc/6qPNck
 GEVsdeSJXDxoFl+UXOc2BQhNvla0YlFF3HXAiLtdDOoDyKpvD7cDLIRbA5ZZI5cC3f5U
 R8oih2cKtWY0VaSJYSgwQn+wm37jtB2dklsk87AD5OFnBhsC685nnGVAR5mkhH1j/qYt
 gSqwtxsoJ497y3/4NGv6QN5Fq546qT/QiaFUqYTSwAFK+utbtpmC1AHvi+b0IoaOYp2V
 couQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EG4DMUGXVEyZNv1Q4b/NktcGLb+o4TMJ3Kcuz4Efvk0=;
 b=SchVbeUMSAFRYp0lqOTnMs3/vjGHzbpjN4m7aKTt8N2pyOotfh0RVqTNmPirh6Tt67
 MhJtm4zKqribpnsQiir9P+Ihbp/rfiSlyYgxS6fTCHtYJYMJgwexanUSzPoQ6sa6/aPK
 m8FIGqqhnJJ93WJKbCpWF7t8AhuaEe4hMz/q2FdzbYaSQu4qQs29JWFW+sZlPznTajHJ
 xHn4cW767XkfURAfuY99CANrs3mdZsov3QUNpenPxzvjrBBdqFl00yBbYWx4zysn8f+9
 U2gsCk97Ljskj4UuBfquBdjOC5qjqJWs27OUszZrqyF+JbDZSBbMEXl4mWt9t1FOlugC
 UfyQ==
X-Gm-Message-State: AOAM532utobPlOJ0XvzRRYkLREKSBpLWVWR/zUCgHIFGn6a6x2A2wyRl
 rZPHWLO1JGJUDflmKLofpKN7VhZl4fwh7Q==
X-Google-Smtp-Source: ABdhPJydHE69m62JPKAH6u4Ho+44zoG2h+KoUfnyR9pu6gHbF9upyZHT9exqCc9FOy/XuOLkw81dFw==
X-Received: by 2002:a63:87c3:: with SMTP id i186mr1369381pge.507.1639441580395; 
 Mon, 13 Dec 2021 16:26:20 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id w7sm11320253pgo.56.2021.12.13.16.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 16:26:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 15/15] meson: Move bsd_user_ss to bsd-user/
Date: Mon, 13 Dec 2021 16:26:04 -0800
Message-Id: <20211214002604.161983-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
References: <20211214002604.161983-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: git@xen0n.name, laurent@vivier.eu, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference bsd_user_ss outside of bsd-user.
Go ahead and merge it directly into specific_ss.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          | 3 ---
 bsd-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index bf7af382de..e425129011 100644
--- a/meson.build
+++ b/meson.build
@@ -2363,7 +2363,6 @@ genh += hxdep
 authz_ss = ss.source_set()
 blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
-bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 common_user_ss = ss.source_set()
@@ -2618,8 +2617,6 @@ subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
 
-specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 25c3976ead..9fcb80c3fa 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -2,6 +2,8 @@ if not have_bsd_user
    subdir_done()
 endif
 
+bsd_user_ss = ss.source_set()
+
 common_user_inc += include_directories('.')
 
 bsd_user_ss.add(files(
@@ -17,3 +19,5 @@ bsd_user_ss.add(files(
 
 # Pull in the OS-specific build glue, if any
 subdir(targetos)
+
+specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-- 
2.25.1



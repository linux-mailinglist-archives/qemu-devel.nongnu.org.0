Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1925309BBF
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 12:54:25 +0100 (CET)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6BJA-0004ZO-ON
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 06:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFY-0001xJ-V1; Sun, 31 Jan 2021 06:50:40 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:34278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BFX-0005L7-7K; Sun, 31 Jan 2021 06:50:40 -0500
Received: by mail-wm1-x32c.google.com with SMTP id o10so9638786wmc.1;
 Sun, 31 Jan 2021 03:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VqrmhVxmrVpTinVk4e74EOokFJxAnJGleMWOvxObkGo=;
 b=lyvsp3J4UkNurQZJVFz9o4JYa1UA1x5dEPXNh3rSqZoz/D+ftmCq5kSipCIzpP4yYJ
 nSMUwmKcyyFsbqMKa8oxpCNGlXb93gGlqm4bjingFBgZuIWD7AbI0OZpdaMufJDvHG9c
 qC5+dIBepWCX6LFsUMA77xsp6mvys75KRB+jURkPOHD/pN99OOtyoQ9btbVCGzoyfl6G
 MxbJzJi5FBOYnndo2ohyVKrRVbQ75AEh0rEWOFzVWJCmjvCGgSofwmaqh36oRozeOnfA
 jlgBJb1qNwvqao+3AOuUECbxkneAizqC36qIYrHOlMkRF5uKw5qN2ZdR2YCXPAzeFzfO
 Mz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VqrmhVxmrVpTinVk4e74EOokFJxAnJGleMWOvxObkGo=;
 b=EoG4wdNPzLBSq8l8lcdNcy8JiNf9/lBxipdDmxgdwUqi+mE+RvDudawafxFPa6DFwN
 xbysb5ajbH/MFqWIDZn0p3QDTOG4LZ6gmIgb9c4SVdEFOw9MUj81bxeTLCZ4kTsW3kwl
 ZGyalTrHQJaVdAxNCeW30d5Puvum1FbaFtEpjbzn3V2UhHOJnyTTG/jM2lxqoDM46YDq
 /UvWZdpFTGnFniBIJpPTp4CyT9ulT8N/57kWEG3fYPWW6vmD2rb8ybjryXvhn/AdlCUD
 CBeLSJ0Q+Hyr02SGdTuxpcXoTsBk8gpiljH5jgLjvqwn+2bpkKOE0QRaqEcUCxP69ZsH
 dJUg==
X-Gm-Message-State: AOAM533Lov2XjxzLL7SzqnB+4rGORPMBqZiU4IlLCmepsIXVxvHP6i7b
 /bKL74KFQWw0UpiB0MOy204FdMIY0ao=
X-Google-Smtp-Source: ABdhPJzlUZ0PoftyMhnvPgCuDfPl7bBhNXVdBlytKA4JLNnnwx1y1kPvC5kny0EUlqDJX52wkKjIyA==
X-Received: by 2002:a7b:c196:: with SMTP id y22mr10912502wmi.91.1612093836938; 
 Sun, 31 Jan 2021 03:50:36 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id a17sm19517259wrx.63.2021.01.31.03.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 03:50:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/11] exec: Restrict TCG specific headers
Date: Sun, 31 Jan 2021 12:50:13 +0100
Message-Id: <20210131115022.242570-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 John Snow <jsnow@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes when building with --disable-tcg on ARM:

  In file included from target/arm/helper.c:16:
  include/exec/helper-proto.h:42:10: fatal error: tcg-runtime.h: No such file or directory
     42 | #include "tcg-runtime.h"
        |          ^~~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/exec/helper-proto.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index 659f9298e8f..740bff3bb4d 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -39,8 +39,10 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 
 #include "helper.h"
 #include "trace/generated-helpers.h"
+#ifdef CONFIG_TCG
 #include "tcg-runtime.h"
 #include "plugin-helpers.h"
+#endif /* CONFIG_TCG */
 
 #undef IN_HELPER_PROTO
 
-- 
2.26.2



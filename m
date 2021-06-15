Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234733A8149
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:48:01 +0200 (CEST)
Received: from localhost ([::1]:56600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9Q7-0003BG-A3
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HV-0005a3-Vg; Tue, 15 Jun 2021 09:39:06 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:41612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9HR-0002dt-Fy; Tue, 15 Jun 2021 09:39:04 -0400
Received: by mail-ed1-x52c.google.com with SMTP id g18so49204251edq.8;
 Tue, 15 Jun 2021 06:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0+AwUXW3F+3xw6jgijJ3i774wGZg+ICftnnBWgQ9fA=;
 b=WfsFJRmf3+VuyUzEpDSJarWNd1b0V/URlXFjxVRA7tT/WdN2Nbtp7tQ2phAHTYT22r
 8o5SI3lDAWSoffhzKsFQhUm0qtbopbVrVbyjKare5hwOd3wjRSlDQ+1uUf7By8mvrDig
 p/lINyyL4mniYGFvHimTQjU1YcN0cgtoHBdgpK2xDLXxzlFIOpe3AIRY5S5DqMn/APWQ
 BF99r6ZhAb5J4BO780isMdhfUfFD4pVKFkBOEHXLLLzuyMuODhtT5CKjLuOC6Dw3PUqD
 smDBW+bPePwnjJNmcMQmIxxHe2gqMsrZMYd5f305UBx1YBWsp5ofKeoiyQsaU1F6AnrD
 70mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R0+AwUXW3F+3xw6jgijJ3i774wGZg+ICftnnBWgQ9fA=;
 b=fGm8pPP8TGNSGYU+DVmcPalgskHlE09o9YwNrBFFNMdq+NBhqRS1Nc/dWou/bF50Hp
 a6z9z/ssv2QqWSTykLPAUr26KFeTHi8xKU+eDpGIbIrKDR0p1t290NKzXZ1Nq/Rd3IG7
 cAj0SUtPrUHfYak6aS/MbEux8zLZHclI0uO1AB4E+Zdvg9b6YYFT0To9qlzbFFSyOvlA
 nryMDSmsAsziGAaw4+WKpy967oifT8fDlyvbWBwkgRJ5Msw5KEOT16cDm0mdBvL4QR/X
 wUTGpWeJ+xwxZRCuTGI7It7VIUb+tF7uDs6t06d5ctOa4d9CAQyBI+BprZp/BXldwD8a
 E6sA==
X-Gm-Message-State: AOAM532je/FJrq28AUBMU8t9IMk9Wp12xIGG9GTu0H0jcmqbBBjKC4gO
 bwOtusuyaHecyZxs3O059knM6CO/nKI=
X-Google-Smtp-Source: ABdhPJxq3YtMfBfhv27m8tuqzhEw130RrQg6heHCS0nzfEXvPnjxKOJfYa2iochWEdyiyhXJqhHv3w==
X-Received: by 2002:a05:6402:358d:: with SMTP id
 y13mr3311174edc.264.1623764339009; 
 Tue, 15 Jun 2021 06:38:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:38:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/33] vl: Fix an assert failure in error path
Date: Tue, 15 Jun 2021 15:38:24 +0200
Message-Id: <20210615133855.775687-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

Based on the description of error_setg(), the local variable err in
qemu_maybe_daemonize() should be initialized to NULL.

Without fix, the uninitialized *errp triggers assert failure which
doesn't show much valuable information.

Before the fix:
qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.

After fix:
qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20210610084741.456260-1-zhenzhong.duan@intel.com>
Cc: qemu-stable@nongnu.org
Fixes: 0546c0609c ("vl: split various early command line options to a separate function", 2020-12-10)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 326c1e9080..feb4d201f3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
 
 static void qemu_maybe_daemonize(const char *pid_file)
 {
-    Error *err;
+    Error *err = NULL;
 
     os_daemonize();
     rcu_disable_atfork();
-- 
2.31.1




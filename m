Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386B36DF97
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:37:27 +0200 (CEST)
Received: from localhost ([::1]:52106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpzy-0007b5-GB
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpww-0005uU-JM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:18 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbpws-0004cx-Ja
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:34:18 -0400
Received: by mail-pg1-x52e.google.com with SMTP id t22so10235344pgu.0
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 12:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfZsQ4ONGBdD4XoGEls4UPD+wvPxpUSmaLIy3AFINu8=;
 b=Ds+4gEQTrkeCuLjdEgQyO9IUKxOaKmQ36mruNJjJDPLOLtvVdaU/1a6Hhu/OHi+Xay
 FAI6LRvpKw4DW9qQED7GMzolrTngaXGh72OrgtLFOs/NbYVC39ahSlUPOx15VXvcGVGn
 eko0zkBufHr2BiiePSYETRhhjMlHNPiRpXVwLuHknAWUyiJyO7BlirQp/nUatEM+xDHd
 vqn9ictOyDdLlRIfLOl/N08jjh+xvfR2byyoYUX9vFq2rmB4WIOBV+Uy6GZr0d5jMqBk
 9cvHZbk4RQzU8yGW9zTD7jYNYbTrbly6q2NS2otuMsaQJ1RvYUNEEbD8L+ECpo2+6m+n
 U//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfZsQ4ONGBdD4XoGEls4UPD+wvPxpUSmaLIy3AFINu8=;
 b=IIMGyVkDbbRNp6zwkAns4kpJTp/U/+xixYMMCGbcVLarLwtG6/siUusuiNQnbi3i3N
 o7kCu8IaDvtrXKs0zJGcYXLGebYua2l7UdT5/Lv01rW4SJES+Re/R5Wkshuh4+0G2+Gp
 eCeCJcdIDPkXw1gToRnN/8AKQPEvRP67nq8hzCpjQ/GAAQoFuyZ0uarIyKT8EnzwAGqO
 EV3jtRw1Da+x7nWYjLsxj25b3AENqDMgWhiAIAZfLBtzaitGlG4yt/nUS3loViOdAbLS
 hFZE3itiRftVsd+LOfMQXl9sdcF0NFYsT7iLY1lkOnUtTpYbQkpsu7hfIkn+rJxEjHM8
 nUKQ==
X-Gm-Message-State: AOAM5315+/i51QzdPH4D44qeMY6tzLbTuhnooNe8yUQv0lCiRscuC2n1
 CBDJxO0Ta94h/Edq2k4L8tCz/OdqPBxBRA==
X-Google-Smtp-Source: ABdhPJzqcfIY3OMx3V/oRvB1ZWzG4iBNgzs0PUPnHCTHafdgBFxM2Z1fEQoCr7yxjntxAsbSUIk8lw==
X-Received: by 2002:aa7:8593:0:b029:259:c31b:945b with SMTP id
 w19-20020aa785930000b0290259c31b945bmr29030621pfn.27.1619638453173; 
 Wed, 28 Apr 2021 12:34:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id h21sm403725pfo.211.2021.04.28.12.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 12:34:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/15] linux-user/s390x: Fix sigcontext sregs value
Date: Wed, 28 Apr 2021 12:33:59 -0700
Message-Id: <20210428193408.233706-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428193408.233706-1-richard.henderson@linaro.org>
References: <20210428193408.233706-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: thuth@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 laurent@vivier.eu, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using the host address of &frame->sregs is incorrect.
We need the guest address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/s390x/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index dcc6f7bc02..f8515dd332 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -142,7 +142,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
 
     save_sigregs(env, &frame->sregs);
 
-    __put_user((abi_ulong)(unsigned long)&frame->sregs, &frame->sc.sregs);
+    __put_user(frame_addr + offsetof(sigframe, sregs), &frame->sc.sregs);
 
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
-- 
2.25.1



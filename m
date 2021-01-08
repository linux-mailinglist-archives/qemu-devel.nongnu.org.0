Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92F2EF509
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:43:33 +0100 (CET)
Received: from localhost ([::1]:44702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtvI-0004Sn-PF
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtof-0004qb-MA
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:41 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtoe-0002vT-2j
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:41 -0500
Received: by mail-wr1-x434.google.com with SMTP id r3so9441653wrt.2
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/bYzZPH4tKpsMQvtJRcHRyaf4REHsMCcIzPJUmKEZHg=;
 b=Ncn5h/od/Lwq0s3apIH+SckOpN0F+Tlqdh9iSK3uEjzrCgdV5Z81IXUB+tIrkgQBLS
 sinFL5lAWR6PSvii/QMMwNOa+GNcnsKzIAsTHyN9asL07utOvIEEupAGflJTih3MAp1f
 5NfSFNCiSQNFAwv5DrvjpprzTR9OzU3ZilVsSK47EiIrEoneYEbFFDblUsmEmmtWQets
 aPuHnxCheHKf5pNWbD/ITuLJ1yOq1MN2Yaaz3mKoYEJPh+pEYj2QxwNzOgxnoG95NJPK
 +hHldmy2ac/sHR0Dz3gAc9CKCEkGo2KFiBr2RbgPb9oZLPz3B4GSpd7c3LDnqY4kP2Nn
 z9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/bYzZPH4tKpsMQvtJRcHRyaf4REHsMCcIzPJUmKEZHg=;
 b=PlXvtNEUvweL+OYDzGcB8v+GHYwAlstnxLC4NesG4N1+DM9rUh1x9VKq6F9nZu4mS3
 7ACDxKh3tZ83cuxnUtpBNkiDeS9FNUOSJgFc9qMCxjR70aV3JbQX9f3ziBUl+iwAHmNf
 4sdaqRatTXdmN8yjA9Bj1blhdaldEG11YBijNoBol2sDA9F1oJm1ZkstSvLcGDbrIzzV
 VDvBc4gbP9y1u9tUuwMI49LSn66dhWGxYrm9ObL+90m50KNIcXIVjUCRPP9nVeL5tt0X
 bwKHXi5f3EM/6uPYLDl3sGk6JIi5lnXqi+u0RZ+xdI5PdQ5sr/OCf9XgH5ASEPY7g5Ez
 ZEMw==
X-Gm-Message-State: AOAM533ar1xbzQ5bis0r3DJ4bFdE3IW4ZVTb30tIr7PZEH9fjLOYxh73
 E0/vgaK8VWD7ccvcIX5NWznQLGprWBvefQ==
X-Google-Smtp-Source: ABdhPJy2PM7JEy6qRKzIRnYPQ3jVy09y2MeCN5KHm9uNwKXwXd+ok8wh2I1Ta5q9m9tP9lXj+UHfYQ==
X-Received: by 2002:adf:dd92:: with SMTP id x18mr4239280wrl.311.1610120198523; 
 Fri, 08 Jan 2021 07:36:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/23] scripts/coccinelle: New script to remove unnecessary
 timer_del() calls
Date: Fri,  8 Jan 2021 15:36:08 +0000
Message-Id: <20210108153621.3868-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that timer_free() implicitly calls timer_del(), sequences
  timer_del(mytimer);
  timer_free(mytimer);

can be simplified to just
  timer_free(mytimer);

Add a Coccinelle script to do this transformation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20201215154107.3255-3-peter.maydell@linaro.org
---
 scripts/coccinelle/timer-del-timer-free.cocci | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci

diff --git a/scripts/coccinelle/timer-del-timer-free.cocci b/scripts/coccinelle/timer-del-timer-free.cocci
new file mode 100644
index 00000000000..c3cfd428039
--- /dev/null
+++ b/scripts/coccinelle/timer-del-timer-free.cocci
@@ -0,0 +1,18 @@
+// Remove superfluous timer_del() calls
+//
+// Copyright Linaro Limited 2020
+// This work is licensed under the terms of the GNU GPLv2 or later.
+//
+// spatch --macro-file scripts/cocci-macro-file.h \
+//        --sp-file scripts/coccinelle/timer-del-timer-free.cocci \
+//        --in-place --dir .
+//
+// The timer_free() function now implicitly calls timer_del()
+// for you, so calls to timer_del() immediately before the
+// timer_free() of the same timer can be deleted.
+
+@@
+expression T;
+@@
+-timer_del(T);
+ timer_free(T);
-- 
2.20.1



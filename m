Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FD64853DE
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:56:03 +0100 (CET)
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56lm-0002Sr-Ge
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:56:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gN-00088a-60
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:27 -0500
Received: from [2a00:1450:4864:20::52b] (port=43645
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gC-0004Be-Bb
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:21 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z9so92343806edm.10
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bD0oDY1HtICxlXxcowAdM7TsTzK/YruAnbX2dCOOobA=;
 b=sYVMpR/eD8cqP7I/e81dWfevm/vRdkcciL2z86aHTOgK9mbbmrIt7nt/w1/GDAgN2+
 iAsD3pqSlIIEcmafUVET0c9MPv5FOKg+Dawnr+Xi9U0t9G4FrcDWy81hqQbfo41xybnI
 vfTtFtFDry38KdInoySNvBfk+D62nn/6faEmET+GVWJgboW0J7X4zvuuoNtMDyBzfMHm
 9NzGPtuvQGHVQf58Ej3bBZfs8Aa84NPcw7LAzZWJXrsxfvu+NzTemesSbAgZPqd8QXcA
 CBoRfUFaKfrovr+3BiaM+yQXliRbURDXaktFwEugwqNCpy5ZavhdtP6dtb12n/a7KYdX
 900Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD0oDY1HtICxlXxcowAdM7TsTzK/YruAnbX2dCOOobA=;
 b=kj+Zy1SkJjnKEOrvYrGhn5GbkQ2KJpu5ASG+aKxvkUbTrFL2aS4EcSL285PHdy2PKp
 pQeiR/MDri/sDBXr8wAKB/MjJ9OXem/RtcFYLXQfAC7nKn6frizLOyncNEUfssTrq6K7
 6sjLxP1X/OZ7/W/GpsmZqL04kh7DRUcHIigj7YmRqqUvHM+da9alW00+ntWmKQT4QGPU
 nRMpT/jHAtBfFnblIJlDKFxYv1HtDYNdI2lm+EIhpsW9j2obj/u3foOkJnz5jI0RIZJP
 kfsRFFS1e4pBF85PLP9xczg4uMl4dIb8RECubacx4+/8uVVI3pbZoI+Q79/XbbHLbRv1
 1VAg==
X-Gm-Message-State: AOAM5301eKvncAIHNVBWkLjO1iQoXPzYhQNZqYdrftBWHYpv96aBU71N
 zfsqEkh6lSiHXRfiWhFHI5IddQ==
X-Google-Smtp-Source: ABdhPJx20A5p/nDjjoeFOa/w6sJViGJJCB7H6X44Us3PoRPW+9FkLJ1ZXyiAqs7fjEPXoiqAXSYVqQ==
X-Received: by 2002:a17:906:85ce:: with SMTP id
 i14mr41592984ejy.416.1641390614526; 
 Wed, 05 Jan 2022 05:50:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h11sm9956072edb.59.2022.01.05.05.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 39DD41FFB8;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/34] ui: avoid compiler warnings from unused clipboard
 info variable
Date: Wed,  5 Jan 2022 13:49:36 +0000
Message-Id: <20220105135009.1584676-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 Gerd Hoffmann <kraxel@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

With latest clang 13.0.0 we get

../ui/clipboard.c:47:34: error: variable 'old' set but not used [-Werror,-Wunused-but-set-variable]
    g_autoptr(QemuClipboardInfo) old = NULL;
                                 ^

The compiler can't tell that we only declared this variable in
order to get the side effect of free'ing it when out of scope.

This pattern is a little dubious for a use of g_autoptr, so
rewrite the code to avoid it.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
[AJB: fix merge conflict]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-2-berrange@redhat.com>
---
 ui/clipboard.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index 82572ea116..5f15cf853d 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -62,13 +62,11 @@ void qemu_clipboard_update(QemuClipboardInfo *info)
         .type = QEMU_CLIPBOARD_UPDATE_INFO,
         .info = info,
     };
-    g_autoptr(QemuClipboardInfo) old = NULL;
-
     assert(info->selection < QEMU_CLIPBOARD_SELECTION__COUNT);
 
     notifier_list_notify(&clipboard_notifiers, &notify);
 
-    old = cbinfo[info->selection];
+    qemu_clipboard_info_unref(cbinfo[info->selection]);
     cbinfo[info->selection] = qemu_clipboard_info_ref(info);
 }
 
-- 
2.30.2



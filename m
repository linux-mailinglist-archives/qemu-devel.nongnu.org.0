Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A19858008E
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:15:42 +0200 (CEST)
Received: from localhost ([::1]:56968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFys1-00065u-EH
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiH-0000w2-59
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiF-0000Gg-2m
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id h8so16115847wrw.1
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cE/FR17mvWvfbQ79ls9QY67VkyGl05hhpT8w+cwb150=;
 b=hTWMAGJQwFLMiT59GBdReM6rgU4k+6uHMiCRCi7v2eXCOXcjWFHip/nAEVDu4krBqb
 FWT/ujJ5lClEq8o+3BBo7wNscqDEJmClDTpKOq6YuMCRIbjnPFHZ4UUfYuQ4W0pYh9wQ
 VDa3Jkq2eYmMyhizsq0CfNbcmOe/EXHoOvheuGhDc4u9lBhnYc7hZJECUrOzLwC0SzAF
 Oa9Byo2yi+YoZHnnHvwZKUvzPqGCQYBVmW2joFU+I/5BemcYRwQlBcxnQq8zqGazP96F
 tvHRx/Mh4IoomSOnb87AHHJY7mkZhaA4ZqnzM/AbHXtnMq4hrOSmo0ORMqQ9Os4VFa6w
 d5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cE/FR17mvWvfbQ79ls9QY67VkyGl05hhpT8w+cwb150=;
 b=kBtDKJuMyOmCTKTsko3UuUsJmCiqMxtwjMitptmW2BbacrQ0DFSviSu81UnC7MUAXQ
 02BKraEw2RGQH6FIsvHUQlVbLX5LNd0fodIjVn8JaX3u4v9A5JFBmAkwbcRFVVyy6dms
 yj3ScmHP1vB9c9U0cAktKjpQ64ftc3AWb4Mg9AvcP8GfI/nUk4gWDnDUh3bpBPT1RDWZ
 ohI5bCwcyEWpRIC0P5xsLwy9umaTte6yQJFzFBCoMzNsrd9ftdXH113Pt/a3qixIxyth
 A5XKct+sZKBzImkiFOqC0A5Z378DaEvhMOpG+JkujzAUi0SsyKxH/9mkNSM8o8JW5HP1
 7N9w==
X-Gm-Message-State: AJIora+OVE4uquYDIN2be02dMM72z5/JpXgU2bk4kcxZZMpQNiFuBe7Z
 xROGURRdUsadUpkGwoTC9d2uGQiX53dGUA==
X-Google-Smtp-Source: AGRyM1vwDe+3GHsUXngqMVygioqBQnH9IWpzwYhjVhP3pBy7qMYDL6g2Wfcrev2Z0PdtvXX2oZAXag==
X-Received: by 2002:a5d:6c65:0:b0:21d:b7c0:9930 with SMTP id
 r5-20020a5d6c65000000b0021db7c09930mr7627169wrz.500.1658757933719; 
 Mon, 25 Jul 2022 07:05:33 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j3-20020adfa543000000b0021e150553acsm9422351wrb.14.2022.07.25.07.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3950E1FFBF;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 07/13] semihosting: Don't copy buffer after console_write()
Date: Mon, 25 Jul 2022 15:05:14 +0100
Message-Id: <20220725140520.515340-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The console_write() semihosting function outputs guest data from a
buffer; it doesn't update that buffer.  It therefore doesn't need to
pass a length value to unlock_user(), but can pass 0, meaning "do not
copy any data back to the guest memory".

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220719121110.225657-3-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 4847f66c02..508a0ad88c 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -627,7 +627,7 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     ret = qemu_semihosting_console_write(ptr, len);
     complete(cs, ret ? ret : -1, ret ? 0 : EIO);
-    unlock_user(ptr, buf, ret);
+    unlock_user(ptr, buf, 0);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.30.2



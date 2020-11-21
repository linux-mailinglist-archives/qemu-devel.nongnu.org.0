Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B492BC232
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 22:05:07 +0100 (CET)
Received: from localhost ([::1]:38622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kga49-0008Lt-V1
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 16:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kga2w-0007vZ-NB
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 16:03:50 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kga2u-0007CC-KW
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 16:03:50 -0500
Received: by mail-wr1-x444.google.com with SMTP id u12so14576557wrt.0
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 13:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NbWfrp3N72dvhLJn+pkW6Vgzj5xKnjoyfi5D0jqvobs=;
 b=CEzgtI2+V5frGDsF0b+3Lq7iievdLevLWu0WfNzQpLbLmSC7+9Q1aFetmC1RvhWcEt
 GVspkYlWccKr8bhIO21bXgyuHbPTtCQXNThdEjJT+M7l1T3Fp9ZIaYXvoulmkeF//J+y
 736lnsU6VHRRJPi/XdWhQbsA1xaqJ/MHVUnd7AkW6bhtMITEDrRj3C3jcrmF8jpqhJht
 TFt898VFIRWml0cHjtpBhOJ6B1fqbJqpofXtv9r6UB+VKNVqDKwQu5+13i4uTmYj7+FW
 x4rD27e1ee5+2AnOKI1D7pnkwmFobhE2Em6Y3FBTSDK5NlWTwV1Iyu+HNmu2Eq9QYOqf
 0hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NbWfrp3N72dvhLJn+pkW6Vgzj5xKnjoyfi5D0jqvobs=;
 b=luIngaAZMPBnNcYQjpqPR/aGJS7tUum/EM60hnlY0U+SGH85XH0T8IWqSqQNDjGuJo
 CupevuGoR8ujWxXgxHTwQCi22c1KZtKk+QSNeP0jX1UReOSR3281bdbWbc24EXDo0gxb
 22aaiskPU8Z3pENCIw6QPkBlKCjNL+pNf3B+CV+DfF94Eoqynr7f6nUHhf3V5UZ+ZS8y
 lv/626Nk+skLr4mEi/TIof7QUvy4a7yy2VQRUKKMdwM1swF159jxnk0D98UUVedzm5q3
 drz3cqYH89Xj0a06fcpVHBrNcrnF/MmhtblRHe2akTBONBwXvWNCyIJC5Tr25WtPJRSP
 vufg==
X-Gm-Message-State: AOAM531dgl/zf4I3J2TVqIzWVuScxL1vUjWzjjHtuX7K+Rdb+C5rnoOG
 JTTj3ya/kuHt8QB91LEta5kLCDLGHEyHHQ==
X-Google-Smtp-Source: ABdhPJza86rzkBooK7KyvnlzkEpROJKxJka8PCh33ztA2fthiOaQdXKtuz8pVT74cW1wcw4yAqa9Rw==
X-Received: by 2002:adf:e44f:: with SMTP id t15mr21297734wrm.380.1605992625970; 
 Sat, 21 Nov 2020 13:03:45 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b124sm8370725wmh.13.2020.11.21.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 13:03:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] gdbstub: Correct misparsing of vCont C/S requests
Date: Sat, 21 Nov 2020 21:03:42 +0000
Message-Id: <20201121210342.10089-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the vCont packet, two of the command actions (C and S) take an
argument specifying the signal to be sent to the process/thread, which is
sent as an ASCII string of two hex digits which immediately follow the
'C' or 'S' character.

Our code for parsing this packet accidentally skipped the first of the
two bytes of the signal value, because it started parsing the hex string
at 'p + 1' when the preceding code had already moved past the 'C' or
'S' with "cur_action = *p++".

This meant that we would only do the right thing for signals below
10, and would misinterpret the rest.  For instance, when the debugger
wants to send the process a SIGPROF (27 on x86-64) we mangle this into
a SIGSEGV (11).

Remove the accidental double increment.

Fixes: https://bugs.launchpad.net/qemu/+bug/1773743
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Haven't really given this enough testing to want to put it into 5.2,
I think (though it does fix the repro in the bug report).
The bug has been present since commit 544177ad1cfd78 from 2017.

 gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gdbstub.c b/gdbstub.c
index f19f98ab1ab..d99bc0bf2ea 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1243,7 +1243,7 @@ static int gdb_handle_vcont(const char *p)
         cur_action = *p++;
         if (cur_action == 'C' || cur_action == 'S') {
             cur_action = qemu_tolower(cur_action);
-            res = qemu_strtoul(p + 1, &p, 16, &tmp);
+            res = qemu_strtoul(p, &p, 16, &tmp);
             if (res) {
                 goto out;
             }
-- 
2.20.1



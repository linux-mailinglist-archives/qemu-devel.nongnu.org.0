Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2672FBE8A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:07:57 +0100 (CET)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vQ4-0001hz-Bk
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAy-000110-8X
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:20 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAv-0003n3-3W
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:20 -0500
Received: by mail-wr1-x435.google.com with SMTP id l12so15377442wry.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OEMrYXFLFBgx9QE3SeqCE2AX1IhddCjd817s2XOV/Yo=;
 b=HBGuYYKTTua8Nc2kXc4HLJolOtGXoVdhiDz6pZDso7IO+SrjohPmgufNQruOKk8Hk3
 GvQBHPiwy8uADWIlim8IG1sDY4t7QwemD9F86l2xSI0UCC9QAn0edIJg/SlDJ097N78W
 n0wfviQmstv0QUP76bJXWhNpr9QhqAhVXnNU1X5zNlhNmJSYHt/ADXz2MGdMGK7TrWa/
 OMS9s2czVAdP6qJ1qZtNe9Iww0d2RIHlumaDGwlX+dftqRywDKgFykt3wtwpYGSe9CNH
 iw2j6Ix86lbu1mIlPDeTkjHT7zSWLSHdozR2sg2tpDffa/nWGuM7IWbtwuZINlC1e0FV
 dj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OEMrYXFLFBgx9QE3SeqCE2AX1IhddCjd817s2XOV/Yo=;
 b=AQ7zttMiuUYTkYJ4Fcm30jahLxInKNXAH13wyj4wtwuenbVsn5E/zKb3roZ4VoxsTM
 MJSplarWH9G++nl7zUI2IzU1vX9Eo2vQdrwb9pHdDqFyOe7dEM4Ot3jkE30YrgQuN67P
 z/lvn1F+yrlqdIIoipXkVMdnJ+FBs9YJvwwQUPdVKX8jpLewQ1MSx+lHDhNvcYOM7J2A
 cQ3ysEjrO25DwWXEg8Z1cxNVXNDEB97jruBNHUbdQrDb3C3nA2nPVUmApGjHZreh/r0z
 wTDDfNYMrCCe00g8vUSfxBJ6elsiTSRncd0dHSjGThhAUF95U7w94mNYT4MwuXal8JmY
 MShg==
X-Gm-Message-State: AOAM5313cpfx4zwq1dRNky8gzf117n1SmHMHqGlTKhOXiqV9FZc0qwPp
 eE/cT/nJtdoSV2j2miCmQiFarQ==
X-Google-Smtp-Source: ABdhPJx8gUgF9d3MV+uc/UEM9oLlo1hcRYvf15yu7nsdfgaODdTYEln3bx/pnbdr59Rcwr3bIlfXFA==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr5290144wru.415.1611078734557; 
 Tue, 19 Jan 2021 09:52:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 33sm40802668wrn.35.2021.01.19.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4DC9A1FF8F;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 3/6] tests/docker: make _copy_with_mkdir accept missing
 files
Date: Tue, 19 Jan 2021 17:52:04 +0000
Message-Id: <20210119175208.763-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119175208.763-1-alex.bennee@linaro.org>
References: <20210119175208.763-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the linker/ldd setup we might get a file with no path.
Typically this is the psuedo library linux-vdso.so which doesn't
actually exist on the disk. Rather than try and catch these distro
specific edge cases just shout about it and try and continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 0b4f6167b3..fb3de41c0b 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -103,7 +103,12 @@ def _copy_with_mkdir(src, root_dir, sub_path='.'):
         pass
 
     dest_file = "%s/%s" % (dest_dir, os.path.basename(src))
-    copy(src, dest_file)
+
+    try:
+        copy(src, dest_file)
+    except FileNotFoundError:
+        print("Couldn't copy %s to %s" % (src, dest_file))
+        pass
 
 
 def _get_so_libs(executable):
-- 
2.20.1



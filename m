Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9C67A0E6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:08:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNij-0007SR-VJ; Tue, 24 Jan 2023 13:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhQ-0005BO-4q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:13 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhJ-00074K-Dp
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:11 -0500
Received: by mail-wm1-x32f.google.com with SMTP id l8so12108226wms.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/kMBc7kYwawlV6mjDVr7qPyvgsdPKM2HCAFr0iHJ9Nw=;
 b=Px4XXAAPoI99BxJOfqALUUKnq1EnuJL94V8Voql9G1D5kQZm8b0tKOLptf6K1KIA6n
 0cIUr6HEtlotahjoTFdqiusDgDNlaiy/wDRQMtz96UThe/g4ZhK8nBK47VTH1A6c9790
 6SO0WaOll5IFBdRLIvGbE1jXdMC3DRzITHGDCBCG1hv3edbUkfh/xCi3Q/Ww+KM8v0g8
 7jq7RRauaPAsF09GOltJqZpJ7Deam90g46CY/It4Fe7imRxNYL0Wx7XzTU1QoP3jkZRh
 BdiXXLZJfLGuij8qipmmQ7fyoHn5pgTRKaFMT70BKOdwNPDCsJyYztzx1oyIo7UOcX+9
 Ezmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/kMBc7kYwawlV6mjDVr7qPyvgsdPKM2HCAFr0iHJ9Nw=;
 b=nIUjF/V+nRKdtADkPmmvPja7hb1ymoVdYZt/yAHnl4Xj+DZuy//M2Buh0Xf8MvYwD+
 xE9aNZBZbYwcuO+Kiay1t1iAMzKHX459+9t5ljkoDTKeuYOyg2TfyjeLz2Mv2M3L5qLA
 tcU+Sah9z+pJov/1jXXYElGg9UU0vLvfnY5chSmUUU68P75NLpNGartFUVFfaXhOn8n2
 H2Gc7dQn12cMu+A7tskIuJEje+Ld738fKnScDTNraFW5eRiRP5HEDQgOuSRmNFM2KYuD
 JS6vnOH2h+HiterTeh8whCzjavHyGOv4NB5oSccfriptkNg+xfro+m7Bb2Ne0SjQb5Hg
 408g==
X-Gm-Message-State: AO0yUKV3sm6r/0CZFAbnwOfHEQ3TYXKgyPeA1Jksvg+vNwKl2ej/MhvQ
 a9YBsfMztIu52msv4w3xG0emlA==
X-Google-Smtp-Source: AK7set+tjY7DVvpe8qJNKyZ6IfxNMsFQhyyJ63u2qK4uj1wh5VE3E6xa9v2w2u+qrK5c5Ne4Ld+r3Q==
X-Received: by 2002:a05:600c:354b:b0:3dc:16d2:ae5e with SMTP id
 i11-20020a05600c354b00b003dc16d2ae5emr2207733wmq.32.1674583624622; 
 Tue, 24 Jan 2023 10:07:04 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 az41-20020a05600c602900b003dab77aa911sm14298103wmb.23.2023.01.24.10.06.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:07:02 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E6351FFCB;
 Tue, 24 Jan 2023 18:01:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, qemu-arm@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>
Subject: [PATCH v2 23/35] semihosting: Write back semihosting data before
 completion callback
Date: Tue, 24 Jan 2023 18:01:15 +0000
Message-Id: <20230124180127.1881110-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Keith Packard <keithp@keithp.com>

'lock_user' allocates a host buffer to shadow a target buffer,
'unlock_user' copies that host buffer back to the target and frees the
host memory. If the completion function uses the target buffer, it
must be called after unlock_user to ensure the data are present.

This caused the arm-compatible TARGET_SYS_READC to fail as the
completion function, common_semi_readc_cb, pulled data from the target
buffer which would not have been gotten the console data.

I decided to fix all instances of this pattern instead of just the
console_read function to make things consistent and potentially fix
bugs in other cases.

Signed-off-by: Keith Packard <keithp@keithp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221012014822.1242170-1-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index 5893c760c5..ba28194b59 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -319,11 +319,11 @@ static void host_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     ret = RETRY_ON_EINTR(read(gf->hostfd, ptr, len));
     if (ret == -1) {
-        complete(cs, -1, errno);
         unlock_user(ptr, buf, 0);
+        complete(cs, -1, errno);
     } else {
-        complete(cs, ret, 0);
         unlock_user(ptr, buf, ret);
+        complete(cs, ret, 0);
     }
 }
 
@@ -339,8 +339,8 @@ static void host_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = write(gf->hostfd, ptr, len);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -426,8 +426,8 @@ static void host_stat(CPUState *cs, gdb_syscall_complete_cb complete,
             ret = -1;
         }
     }
-    complete(cs, ret, err);
     unlock_user(name, fname, 0);
+    complete(cs, ret, err);
 }
 
 static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -444,8 +444,8 @@ static void host_remove(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = remove(p);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(p, fname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -469,9 +469,9 @@ static void host_rename(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = rename(ostr, nstr);
-    complete(cs, ret, ret ? errno : 0);
     unlock_user(ostr, oname, 0);
     unlock_user(nstr, nname, 0);
+    complete(cs, ret, ret ? errno : 0);
 }
 
 static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -488,8 +488,8 @@ static void host_system(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     ret = system(p);
-    complete(cs, ret, ret == -1 ? errno : 0);
     unlock_user(p, cmd, 0);
+    complete(cs, ret, ret == -1 ? errno : 0);
 }
 
 static void host_gettimeofday(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -554,8 +554,8 @@ static void staticfile_read(CPUState *cs, gdb_syscall_complete_cb complete,
     }
     memcpy(ptr, gf->staticfile.data + gf->staticfile.off, len);
     gf->staticfile.off += len;
-    complete(cs, len, 0);
     unlock_user(ptr, buf, len);
+    complete(cs, len, 0);
 }
 
 static void staticfile_lseek(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -608,8 +608,8 @@ static void console_read(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_read(cs, ptr, len);
-    complete(cs, ret, 0);
     unlock_user(ptr, buf, ret);
+    complete(cs, ret, 0);
 }
 
 static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
@@ -624,8 +624,8 @@ static void console_write(CPUState *cs, gdb_syscall_complete_cb complete,
         return;
     }
     ret = qemu_semihosting_console_write(ptr, len);
-    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
     unlock_user(ptr, buf, 0);
+    complete(cs, ret ? ret : -1, ret ? 0 : EIO);
 }
 
 static void console_fstat(CPUState *cs, gdb_syscall_complete_cb complete,
-- 
2.34.1



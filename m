Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F8767A0EE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 19:10:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKNhd-0005Gs-1s; Tue, 24 Jan 2023 13:07:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhI-0004zZ-0I
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:04 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pKNhE-000745-5U
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 13:07:03 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so14702879wrz.12
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 10:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETifGALS4KmBJlNwYTjtra3baBU/IlLzVll0TgmEm7I=;
 b=VcfhsapgAqIuVGUBppvmxX0rDEi5T07SCnXSbt+ILThlbqIkp+R9km33EImmtlf0Q1
 h+7yXCdpYuNdtUphFC7xMpqCtTteHI+fs2MoNfX7rNcyuQjzfQ5jPV6E+QUQG79WDrpJ
 vPf2RxliY4YoVRfcMqpRdrcMVwwz9EnJv2b4LQX4bj3EuGYyqa4cvGHOgQsBvg0WgBGz
 2HC/p1IWP3zUgiXBIuSrDr/LBmJ9mMEfSIlnk3kSBwV9zuVwpVAUECtP69j9wiysqHGv
 zdaJ/KQtVjKB3+NH2t84f8f6M/KdtnFZc+TozDNxeB8NA2rgP0zh7DC/e56UGhvuY00B
 r8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ETifGALS4KmBJlNwYTjtra3baBU/IlLzVll0TgmEm7I=;
 b=WK3Lta/eHcZdJpJlEtYeKiLHk9BgXh7xIV4XJ+PY6Q4baqc+gxYC+dYcQMwf6hh6f5
 nqJ+/+3jwE+SWMviM1fMc04p0z0nErrVRZ7/q1smtCazlMpF/1MZb7QqTnfDuH88XAsS
 kKlCZiFP+MSDVuKj8O81ok0hmGJmSGy79B173w2UABxZkNNzd0TgedCN6AHDjBctn3/+
 7qtBjFK+i+CYERpVRo5P6nECrHoEsXrDEkziM4RRTnat9g2L4tAz3sm6go3JbU71m4iV
 tCY5+6nOMO6vQY8cd7BkYOL3NYu3x+ypeVujamVU+Wkhu5SSWLgp71Kqo8a+3mtiGYEf
 Zgig==
X-Gm-Message-State: AFqh2kqq2NF1nqMifj5V+FjbUh9pGWAJk/6EjEihYPoaBOxig2pYhXxy
 YrBBPMPGcRqAMuLHInGYPeNBMg==
X-Google-Smtp-Source: AMrXdXt5t58fQj5N9diEGDwNER++CaG+oX/nIoh6aQ/pxMF+k/X5d+Fc9ySLv6sFnvugfQBaBiW8ag==
X-Received: by 2002:a5d:55c5:0:b0:242:3812:f948 with SMTP id
 i5-20020a5d55c5000000b002423812f948mr34064351wrw.24.1674583618856; 
 Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y4-20020adfd084000000b0028e55b44a99sm2366949wrh.17.2023.01.24.10.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 10:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 959431FFCC;
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
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2 24/35] semihosting: add O_BINARY flag in host_open for NT
 compatibility
Date: Tue, 24 Jan 2023 18:01:16 +0000
Message-Id: <20230124180127.1881110-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Windows open(2) implementation opens files in text mode by default and
needs a Windows-only O_BINARY flag to open files as binary. QEMU already
knows about that flag in osdep and it is defined to 0 on non-Windows,
so we can just add it to the host_flags for better compatibility.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20230106102018.20520-1-eiakovlev@linux.microsoft.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/syscalls.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
index ba28194b59..e89992cf90 100644
--- a/semihosting/syscalls.c
+++ b/semihosting/syscalls.c
@@ -253,7 +253,7 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
 {
     CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
     char *p;
-    int ret, host_flags;
+    int ret, host_flags = O_BINARY;
 
     ret = validate_lock_user_string(&p, cs, fname, fname_len);
     if (ret < 0) {
@@ -262,11 +262,11 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
     }
 
     if (gdb_flags & GDB_O_WRONLY) {
-        host_flags = O_WRONLY;
+        host_flags |= O_WRONLY;
     } else if (gdb_flags & GDB_O_RDWR) {
-        host_flags = O_RDWR;
+        host_flags |= O_RDWR;
     } else {
-        host_flags = O_RDONLY;
+        host_flags |= O_RDONLY;
     }
     if (gdb_flags & GDB_O_CREAT) {
         host_flags |= O_CREAT;
-- 
2.34.1



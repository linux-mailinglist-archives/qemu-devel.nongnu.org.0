Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6093B692B19
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:24:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcj5-00079O-EI; Fri, 10 Feb 2023 18:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj4-00078x-1N
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:42 -0500
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj1-00051k-Sd
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:41 -0500
Received: by mail-io1-xd34.google.com with SMTP id j17so2538291ioa.9
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/ho+o97t3oUvsCX6/tWPXAhBUu89VuwLZO+3r6EySU=;
 b=oM0W7SAaJ27tWn/wmtYpN8eFV5izsd7Aq4JtigWEkxqkB+pGTU2GrGpH3sx1v/pOHb
 iE2Xztrm/s2cY1sfvY3mOo9oqmI8+Tz3l2Nj8NK0aFzyRY3ikvF4pzm9YecxoMOcGOLN
 NSCbGZa3M4GJ5IbaRAZBJgnHkskhzLwd6JGBVn3+dPV6CtUIlCfdI3ZtEqcbboZMyd6H
 xloUnxULt3yzLpUJv0C0TWk5pOn+yjzQ3JCpjJSpGQmSBUfCvphk9ZgBpLiJgioJMCmM
 gH1DJQoLqTf23IhLilAhz382UbwaIHrl5rchRNHgdzera9rSueCg6tJfgSCnkdHX9dnh
 MDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/ho+o97t3oUvsCX6/tWPXAhBUu89VuwLZO+3r6EySU=;
 b=dkYMHNtcqO+aVBIrlLhtScDMlg+RLgwdVLHrnvViJxoFvKo2uuQAu4Gcwuk6xvWpO0
 qw1jE/rt+mr9lkN7sKmPzijrjmZErHgH/8nYzY0V74PC6E2h9Emmw5PNAVUfahAH13w9
 P9g1U2i0Hdlyu6OxyAHMhZkvpn2+EEVo7MBV6+zZ8nniQjV1sZTmA/QezM3rH8EGMyQ3
 apM562+CgTzMChxX2J1NxnaqWNNqtZPXbAndAEczwDSfWErn6u9AFO5HrSHho8VtnYkY
 XMKhYNcJK6li/OSdfesZzudTsbVrqa/Nbp4cUnRbG84oTGsxVCiByIbfaj/L5WaLEjRX
 XCKA==
X-Gm-Message-State: AO0yUKWdmvBSt5NqUWGx1YdXyxTu9G+dpinXpogg2wz+uYUHPEQTMg7R
 i/IJui0biTIxcquZGdxr2pPTYs3Lu+TC3P9f
X-Google-Smtp-Source: AK7set9CPWrvskOWCAWrtbbImUVFItiZxjwaHpdeezOIRTRlFFQXcUx8elhcM9++Szej9X/Ho2xgzw==
X-Received: by 2002:a5d:990c:0:b0:73c:459b:de72 with SMTP id
 x12-20020a5d990c000000b0073c459bde72mr523903iol.11.1676071355931; 
 Fri, 10 Feb 2023 15:22:35 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:35 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/9] build: Don't specify -no-pie for --static user-mode
 programs
Date: Fri, 10 Feb 2023 16:18:22 -0700
Message-Id: <20230210231829.39476-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210231829.39476-1-imp@bsdimp.com>
References: <20230210231829.39476-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

When building with clang, -no-pie gives a warning on every single build,
so remove it.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 64960c6000f..eb284ccf308 100755
--- a/configure
+++ b/configure
@@ -1313,7 +1313,7 @@ if test "$static" = "yes"; then
     error_exit "-static-pie not available due to missing toolchain support"
   else
     pie="no"
-    QEMU_CFLAGS="-fno-pie -no-pie $QEMU_CFLAGS"
+    QEMU_CFLAGS="-fno-pie $QEMU_CFLAGS"
   fi
 elif test "$pie" = "no"; then
   if compile_prog "-Werror -fno-pie" "-no-pie"; then
-- 
2.39.1



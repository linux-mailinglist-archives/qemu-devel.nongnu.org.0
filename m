Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC58664B8B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:49:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIb5-0003TZ-8B; Tue, 10 Jan 2023 12:39:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIb2-0003R9-OD
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:36 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pFIaz-0001FK-53
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:39:36 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso12505875wms.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 09:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rFoN1+6hqCTYGYDksjk1ynmsYhV/AhUVVwODaCS298=;
 b=bkmPqtSyWkx4x+JxMiE38XylY27VjsZcvOsQ7DHuqx6ioKV20yPY6EHdStr5iEqVvd
 HeMhUZtP9kkgDJ2j1dKW6TnT+RFjVFbNfbRWuCSOwzJn/fIrfIkbWJJuKwDfyGPKmXUp
 Hg2WL3hDuNJfpcv3nQOZxDYp5PJzhP9E7D0U/Ri/oPWJR4Zt8jsrSeyUFAWviXI2NJsK
 +y3vy+gv43bmcMjEcUNBTOUHXLg25Y2cir5ifuutB2SDp3aLXcIZRY+Jyb8mHVBPNUlJ
 jSzyZ8xnhDW7B+8/7FNNPo6gmz2GXhUnx2meXjw/ys75h8hQhJpAAapOkZ4OR8fz6rvs
 oDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rFoN1+6hqCTYGYDksjk1ynmsYhV/AhUVVwODaCS298=;
 b=PGRRJz91FfCF/0FBDkUaVLK9VpvTuKoXGsEUtAv7UhXrZHjB0D7lt3opAzhDyTbtN4
 ZdkJ5e3eu40+VBmINwcwdKz7ifEShSK7Wu5Mwvppt5KQqSCjyaVa87/9Jv/JHQrMz8XH
 6LBFEL6W/cR2KUdr4VBFSsztjFg5sBRygqxFWhH89hJQz39DJYn3AE2tSI6Wvfg6O0AO
 Zahc62d+AZTWrGlea6mEHh1Vg12dIWq1556R7x6+SU8RMZuOLDmCncu+ZM+uoo+1/Q/Y
 mZt1rgNjjlPpXi7QJziWIhaeLGEOoHSUDClmoDGTBksYh6+y2/QDXrsEKTDbAVGSEg7Z
 V+lg==
X-Gm-Message-State: AFqh2koObsMql1UCkkzU2QyoNVRgr0QhBqfILWhz0fe/ehSmcvdZDAk6
 ISlqRMO98fdN45CPmB6OFtfvgQ==
X-Google-Smtp-Source: AMrXdXukNhfZSorsiLn4tGP5WxGh8kZn22lO8cBjhKzg0WvG+vEEF7RlmYWbiOb6eryjm5keudD+xA==
X-Received: by 2002:a05:600c:3596:b0:3d2:3b8d:21e5 with SMTP id
 p22-20020a05600c359600b003d23b8d21e5mr49094455wmq.14.1673372371421; 
 Tue, 10 Jan 2023 09:39:31 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l36-20020a05600c1d2400b003d9fb59c16fsm2455956wms.11.2023.01.10.09.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 09:39:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 803761FFBF;
 Tue, 10 Jan 2023 17:39:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Ed Maste <emaste@freebsd.org>, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: [PATCH 07/26] configure: replace Perl usage with sed
Date: Tue, 10 Jan 2023 17:39:03 +0000
Message-Id: <20230110173922.265055-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230110173922.265055-1-alex.bennee@linaro.org>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Let's try to reduce our Perl usage during config/build-time.

Note: this patch might be dropped if "configure: remove
backwards-compatibility code" is merged earlier.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230110132700.833690-4-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index 2281892657..9a944698b4 100755
--- a/configure
+++ b/configure
@@ -2571,11 +2571,9 @@ else
   if test -f meson-private/cmd_line.txt; then
     # Adjust old command line options whose type was changed
     # Avoids having to use "setup --wipe" when Meson is upgraded
-    perl -i -ne '
-      s/^gettext = true$/gettext = auto/;
-      s/^gettext = false$/gettext = disabled/;
-      /^b_staticpic/ && next;
-      print;' meson-private/cmd_line.txt
+    sed -i.bak -e 's/^gettext = true$/gettext = auto/g' \
+      -e 's/^gettext = false$/gettext = disabled/g' \
+      -e '/^b_staticpic/d' meson-private/cmd_line.txt
   fi
 fi
 
-- 
2.34.1



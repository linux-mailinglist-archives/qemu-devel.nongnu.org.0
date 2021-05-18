Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD153874DA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:13:38 +0200 (CEST)
Received: from localhost ([::1]:44476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livnF-0007l8-QI
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhJ-0007n8-4J
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:29 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhH-0005Qo-Cf
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:28 -0400
Received: by mail-wm1-x334.google.com with SMTP id o127so4979519wmo.4
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k3GgIZwo1ALDw7AyuDX5LfQUKo52ZHvXcuy3wRBGlmI=;
 b=T1Ke2WSA+sKRz1V1wNjsW35K4N3kKn6JOCvD77u9/KQ7rqi1p7nVA97kFLrGfpHLhD
 oL5dnJAnYhI8dukQ6o7wuslvMuxabzj7VuKsCdC6V4PES0wFSYCJUXHY2xYVW+SMDYqm
 ElqNwo8wdv7JiIlSt/aPY9elcp5pWLc429P0ZtLc0zppNioM/1BQJSxTCr3C4WOm1Fhm
 qkwRbIxpsEZI9Ped0k2e1V76lDdtQ8sYjyG5xmuboLnWnIu3B/jefC8iOEBvNdgQQ7qI
 EtvAuYO1vAx07qXMZPk4S4xuzLrp5fhK3MYHeqSotBNWEUET4l1C+21eOxmd/rF/LIQi
 akdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k3GgIZwo1ALDw7AyuDX5LfQUKo52ZHvXcuy3wRBGlmI=;
 b=Ze1qbadBRwWe/1/YCOCH9KjGYusN+c3nlM5fR2lIGa81FuUgFzREsqUeOi3Jk6BHqU
 cwELuJ9qgZKRR/oD96eRgSNRCtaxYeyWb5dRpfkhCiOGiOVjRcL3uscgYitfltBv3eWn
 FOnnvYNlQovds0Yzco3te8FWw4fQOkLptsI0wSIvh0ZazsQKw0o6NENHn1gmOJRJ0WvO
 v8cNOSSJr6j7xp+X5NVMYPZuldJk9i2FjjWnD03NtEQRLoRaMHIF7eWuztCbaHoxwDpO
 vojhaCmwIbiGT7/FL+Lag3GoK1wvprLiHA87ZdJQsnReqsnRoFFuXEEuZ84I56LORc69
 4gtw==
X-Gm-Message-State: AOAM5311/HZprSjnT7qW2In6ADOcY9Gf3yeL3wwwyHsXORBQXYr4Jcun
 bhiPxxbXqcH/MvDCX+H6OBQaZA==
X-Google-Smtp-Source: ABdhPJyqZUw0XQ6eR+en05NbdZRZNRQT8/+v/CHBni3J6eMArBoOmeVbKo3cHHCJ2eYeB36RAC0MPQ==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr926923wmi.118.1621328845970;
 Tue, 18 May 2021 02:07:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x13sm10604875wro.31.2021.05.18.02.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A7D81FF8F;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 03/29] tests/docker: allow "update" to add the current user
Date: Tue, 18 May 2021 10:06:54 +0100
Message-Id: <20210518090720.21915-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current user functionality is used for cross compiling to avoid
complications with permissions when building test programs. However
for images that come from the registry we still need the ability to
add the user after the fact.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210512102051.12134-5-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 9b3425fec2..7a14058801 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -517,7 +517,7 @@ def run(self, args, argv):
 
 
 class UpdateCommand(SubCommand):
-    """ Update a docker image with new executables. Args: <tag> <executable>"""
+    """ Update a docker image. Args: <tag> <actions>"""
     name = "update"
 
     def args(self, parser):
@@ -525,6 +525,9 @@ def args(self, parser):
                             help="Image Tag")
         parser.add_argument("--executable",
                             help="Executable to copy")
+        parser.add_argument("--add-current-user", "-u", dest="user",
+                            action="store_true",
+                            help="Add the current user to image's passwd")
 
     def run(self, args, argv):
         # Create a temporary tarball with our whole build context and
@@ -564,6 +567,13 @@ def run(self, args, argv):
 
             df.write(u"ADD . /\n")
 
+        if args.user:
+            uid = os.getuid()
+            uname = getpwuid(uid).pw_name
+            df.write("\n")
+            df.write("RUN id %s 2>/dev/null || useradd -u %d -U %s" %
+                     (uname, uid, uname))
+
         df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
         df_tar = TarInfo(name="Dockerfile")
-- 
2.20.1



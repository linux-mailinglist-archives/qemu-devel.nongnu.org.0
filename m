Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C63BDA4D
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:36:09 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n7H-00009C-HX
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0moo-0002Mb-S9
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:03 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mom-0004qO-0M
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:02 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so2019291wmb.3
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OsQYMRRF2LqfhugUabYWk+fOdkK5koC/O99HVRocaM4=;
 b=gARORN8AFiQ86ohPNMOAfzjb3+YsOohcxtV7DiiLwrSV9fwK983DoztMHlsXbg3+dW
 n4KItquriE+W7j8WfzYkfQV3Hy5srpZdD1jNksTsoE2laiq+ndKU0mScdevwXCYWyUrl
 JkwBWe0fj7IIWE3IAQX+P6bj3E0fAPGDz3ze7l1ET5YduPa/mmzzi9N1V1/P7b4/D1cP
 QHavbaqJ8NfdbTmWf+l6MLIgMiPBsfgJhAZQHi6nhfR8Iyp0/QFg2fHjIWYZmWUHwp9M
 Nn8Bwen6rD4vMKWNw8rTFBv/UalQGIxrbdTdFOx3taVVdD6Yw8VOIlYBaSBqhcRppBpV
 HT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsQYMRRF2LqfhugUabYWk+fOdkK5koC/O99HVRocaM4=;
 b=Cfk7G+zNJeisM6G573XMbD/DlLN3FDfti0JSWnGkst+sgrbWFSX/LQf/Th+2klldt2
 wsb4Wj/8GcIAleYBoWjYw3u8QBgUjE59dlLdsk9RbaOBih/9UpwUZmOMu6JtJ7r0OOKr
 fCGJmrAKbAWmGpfblYzmxRtJ2Md1LHTANlQYsE0pWtc+TbEpBG/bf7s5eK+pEYVRsJdi
 c7EqKEdA/Fy+A6IMEvNJ56BnGg3HMF4nJSSJKlTM3Q+xm6aijpMoxdw8JitJFQ8qltw8
 /w5pNkb0alHdCsdWxQZpUazALj5KQTEL0H+YdiRdQOi68bMlGAvcKzvSR6lb3OU1Crt6
 bGPg==
X-Gm-Message-State: AOAM533Tz4QxrVyGtqvYRZIQ0ef2/cHuhYhFyxliOckmdx4rtLWX8WOE
 b7cQ9CQPoEEfyLLZ7L/LUoJjfg==
X-Google-Smtp-Source: ABdhPJwNnLVKNOpSl//CkILbLpUwO2yOp2q50EHiK2eQLEbTJ5TrB2iVCB5YdhT+Vq3GHKJEhqOvSg==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr21156737wmh.104.1625584617557; 
 Tue, 06 Jul 2021 08:16:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r16sm20301818wrx.63.2021.07.06.08.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:16:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 759DE1FFAC;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 24/39] tests/vm: update NetBSD to 9.2
Date: Tue,  6 Jul 2021 15:58:02 +0100
Message-Id: <20210706145817.24109-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm: update NetBSD to 9.2

Signed-off-by: Brad Smith <brad@comstyle.com>
Message-Id: <YLe+LZ/j0pxVGeBi@humpty.home.comstyle.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/vm/netbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index b9efc269d2..4cc58df130 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
-    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.2/images/NetBSD-9.2-amd64.iso"
+    csum = "5ee0ea101f73386b9b424f5d1041e371db3c42fdd6f4e4518dc79c4a08f31d43091ebe93425c9f0dcaaed2b51131836fe6774f33f89030b58d64709b35fda72f"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1



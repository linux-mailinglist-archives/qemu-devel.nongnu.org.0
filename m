Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DBE6D4628
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYv-00030S-Ev; Mon, 03 Apr 2023 09:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYs-0002xO-Ev
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYn-0004t5-UC
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id q19so26356676wrc.5
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PldKx1qfpz7lDvG61jB68knTHdO2ooZN76NERNqkzDY=;
 b=tAaXPTuxrZUwgDhNs2VAA3i3A5sbpUS96TJNu9EnHiuS5McEnfl5cstLz9L8iPRyMm
 jWDWiyCo47qpsZoFmbQlC86I9o0KKIsuvTeq+G6EWzEJkwAAJpeHCXDuAQsCgp2zn9eX
 F4qqn5xVcYpsCdCgRKXYKrcLgDuVHj3/chtJPS5xOJaQqG0XSxlyHWqCpnnl5tDVrWwd
 EhL57J/td90pFXIrSsBfNC92WqwTVsqMuokr0Zsf2W5SUy3L5RWjqyLYARjjsoYgZyCW
 p7Jd4iSOaVHpFVYz33XRBz8xdSqji6nhgSHdB/Kbk3PNu/cm1fr86kp6okiP5IdY760a
 pjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PldKx1qfpz7lDvG61jB68knTHdO2ooZN76NERNqkzDY=;
 b=UDn3GmVhn7GrUF3UMLWEKxkPxmQCFWzf9b6m0T/wpmDZyipxvWeoW5YcGGmzIYo2GN
 gn5d9DlgnTZRySYfMIhrZ4BraLgsAoBCepwMjGfQo8z+v5qQYDdONdJ2YEEf4iXqwicM
 DIKWE5Qckt/a+cDcDIgVgyMeRap+9V/j/7eBZ+3A/SGff3QPQ7gjto4SqBlBmmXj5ydG
 73YAuQdykrFpL5T04hxiWMC7b4JY4Y4W6Q72Kkh1tBgnUWDgkfPukjIW9MPSg+X+mBWk
 QldfieTjBSh+kd7yW0tkcTbEIHDjX+SngBJ6w7bQFy86eopFi2cdaokqKrb/yvFcvfZn
 aZ2w==
X-Gm-Message-State: AAQBX9fM/78u9OLpWAWPUFZBjuZYCyO9C7nhau0iwewI12id+DLud4tC
 xN7NeQhtuwWnzPSdRsZhjjeTcw==
X-Google-Smtp-Source: AKy350bQGOJWN5zGDlFHeOGdE2SUiSfVLxmAnGCX0rxA7lXuuoZ5vohL7JrbQpsr9aKTsRFQUoJkHg==
X-Received: by 2002:adf:e848:0:b0:2c7:fde:f7e0 with SMTP id
 d8-20020adfe848000000b002c70fdef7e0mr24295594wrn.65.1680529765220; 
 Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c468d00b003ef7058ea02sm19327158wmo.29.2023.04.03.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 960301FFC0;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 09/11] tests/vm: use the default system python for NetBSD
Date: Mon,  3 Apr 2023 14:49:18 +0100
Message-Id: <20230403134920.2132362-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

From: Daniel P. Berrangé <berrange@redhat.com>

Currently our NetBSD VM recipe requests instal of the python37 package
and explicitly tells QEMU to use that version of python. Since the
NetBSD base ISO was updated to version 9.3 though, the default system
python version is 3.9 which is sufficiently new for QEMU to rely on.
Rather than requesting an older python, just test against the default
system python which is what most users will have.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230329124601.822209-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230330101141.30199-9-alex.bennee@linaro.org>
---
 tests/vm/netbsd | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index aa54338dfa..0b9536ca17 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -30,7 +30,6 @@ class NetBSDVM(basevm.BaseVM):
         "git-base",
         "pkgconf",
         "xz",
-        "python37",
         "ninja-build",
 
         # gnu tools
@@ -66,7 +65,7 @@ class NetBSDVM(basevm.BaseVM):
         mkdir src build; cd src;
         tar -xf /dev/rld1a;
         cd ../build
-        ../src/configure --python=python3.7 --disable-opengl {configure_opts};
+        ../src/configure --disable-opengl {configure_opts};
         gmake --output-sync -j{jobs} {target} {verbose};
     """
     poweroff = "/sbin/poweroff"
-- 
2.39.2



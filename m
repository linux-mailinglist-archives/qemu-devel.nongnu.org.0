Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 388C813296F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 15:59:23 +0100 (CET)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqKI-0006n8-95
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 09:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iopIQ-0000TY-P5
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:53:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iopIP-0002K9-IR
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:53:22 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iopIP-0002JZ-CF
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 08:53:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id c14so54010601wrn.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 05:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zyr350dP+8AP15d0xj3musU4lwX/lJBrE7DQSiVzx7k=;
 b=Z+sAVM68+8HQ1BEoNM8lawz8xDJeCe3I4y+eVHAgpELpDASodvaXYtJokp0ze7K7uf
 0l/hae9yb+TQQIEr56fHZ30jCrrvsSq91WSTxuSPHI6LS9ui7wD30piezKEiksDuNJgT
 4rZmsDmBE8/WPE+VlfJdwBLt4tN4V+2qYVZtuTzPhiDxqpGwCcA7gGpBzdrwFbg2IV5+
 g/s4jJpefVtXJDwsKsCokNF3Xt0I8qQedGkek+fhv+7wQEc9pA4IxOdCTrUjTYVjw6v+
 mi6vMQHGPw1HGstHMbIGG151hHi+lAdkzag0yf26I/GXe1cxgPL1ZhInjwjs7UKsJpr8
 NMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zyr350dP+8AP15d0xj3musU4lwX/lJBrE7DQSiVzx7k=;
 b=Sf3l+HxbQIgWEFjCU3g+uun6jbXdkN1FBsBLZpn/Xmi+7YJwl7Tu/LP0ez5QQR7VTR
 FakoZMJtge87KMaiveC9RURqff3LevoGWaCeuO9LuHJGynp+WOG6zPtR/8yKSUeRkNDZ
 2PAY+z6PSF7+edLXqibdZcsLawxeY2iuQGUGjseFeuG3Cct9dxDf4Q2lQhw6vyBfT0sA
 G1cWeqfClSFHtGHUf1/d3ZfR9ojw1CGI2/rCUTSXSQ7Jz4Kz1pudAaHCvQUc6T/ipxxE
 Biwu4Zjwkl3rSehjrqHJdNp+1sbMMM0Pg8i6rqSHtMAJ2Yk1gQIOT/18r20m++PKBIOK
 9rDg==
X-Gm-Message-State: APjAAAVtToq1WMKDxdppa2yTmRoiizgDj9T1gsuCV2/VkATpnYTIOhqH
 Dlz2HUZag4pu5uQGrt+u3zBK2A==
X-Google-Smtp-Source: APXvYqxPWc0ra4PApoEmwTrFqddjBqEt76qCmDewUUQjKbWWBWyzL075m9canW9NVoqsGaBcf5kf3Q==
X-Received: by 2002:a5d:4847:: with SMTP id n7mr109472711wrs.30.1578405200385; 
 Tue, 07 Jan 2020 05:53:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q6sm81674422wrx.72.2020.01.07.05.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 05:53:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 83D6D1FF92;
 Tue,  7 Jan 2020 13:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 5/6] travis.yml: Detach build and test steps
Date: Tue,  7 Jan 2020 13:53:10 +0000
Message-Id: <20200107135311.5215-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107135311.5215-1-alex.bennee@linaro.org>
References: <20200107135311.5215-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Currently build and test commands are a single step in a
Travis's `script` block. In order to see the output
of the tests one needs to scroll down the log to find where
the build messages ended and the limit is not clear. If
they were in different steps then Travis would print the
result build command, which can be easily grep'ed.

So this change is made to detach those commands
to ease the visualization of the output.

Note that all steps on the `script` block is executed regardless
if one previous has failed. To overcome it, let's save the
return code of the build then check whether succeed or failed on
the test step.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20191230184327.2800-3-wainersm@redhat.com>
---
 .travis.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index 93838bf0f8b..848a2714efe 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -94,7 +94,8 @@ before_script:
   - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
   - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
 script:
-  - make -j3 && travis_retry ${TEST_CMD}
+  - BUILD_RC=0 && make -j3 || BUILD_RC=$?
+  - if [ "$BUILD_RC" -eq 0 ] ; then travis_retry ${TEST_CMD} ; else $(exit $BUILD_RC); fi
 after_script:
   - if command -v ccache ; then ccache --show-stats ; fi
 
-- 
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6657415208B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Feb 2020 19:43:48 +0100 (CET)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iz3Ap-0007ec-EG
	for lists+qemu-devel@lfdr.de; Tue, 04 Feb 2020 13:43:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49571)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iz37m-0002Aj-SA
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 13:40:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iz37l-0002rN-Jg
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 13:40:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iz37l-0002nF-CW
 for qemu-devel@nongnu.org; Tue, 04 Feb 2020 13:40:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id a5so4463938wmb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2020 10:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L4X7cX+gH4YtMrZHTiaSgjBu9vQtfciJis+jW4CKLig=;
 b=p93AzM4TgdC14NnjSb1DfeYADoK8kBVJ29G+8pz9+LoHDiuxE1dqOIESk3nxHqlQWI
 e34nufYr/xmOMyRC84/n03aYxpMufzF+VwB0MFSQOR7+K2aECE4gAWR+CDX2WBvMx6kz
 uDfYrayhuaLs5STL14wXInpwJpQcgda9cLNgacsKth6V9k9DjRcjXc2kZTBGVygkxmcp
 cQLenTdvKzAb9mUfRFrRHqUGJhqgQP0EQbS4VzsVCnCOkuk67kRqaWTEGnYBA0bV+5nU
 hHJ55QWNdEnylafZ62bShKBqPlXEZ3SZgpRYEBzQsOdocKc0YEfEGQkGCkiZbWp8eIVX
 BT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L4X7cX+gH4YtMrZHTiaSgjBu9vQtfciJis+jW4CKLig=;
 b=SBCims2pig1dlXGTUTusSQy8HiUknD499mVbw+aMKkv45NQ1Xj6dYfWNH6ffYBMGDP
 Nn924NZQ9E6vCuZw3PmNdqSC8Axj7DBiMYh5GhCKkgq0cswEtcDYbwUtb8fwjxKw2muA
 Vxm7a0j/iF04uwoR64iufDFupjKrixYhKxhyhGRsDDcRMFLrCGPFC9K/tOyvFzFC629l
 Q0R0vYnZwOoxcQJ2nN5DElNjuydYBa0PAGCXMaXLjb/nm/ybPZuqLGrRzi0o06aFEi5q
 2/KmQAE+7v6hA/Rem961FZDWrXWxeCIIMROiP7/KAk3UXa2/izNGaEf3amwuCIdMZZUc
 jV0A==
X-Gm-Message-State: APjAAAXtQSk9q/0FmN3+j9wuvPzjFdyoYQ/EuSMrwjt6I1AzsKYL+SID
 S145dVByAllCuH9wvatYWIdq8A==
X-Google-Smtp-Source: APXvYqy0eevZqVZCmrJ/XwhtqD6tx/1YF4satBaklXXJYLvFxuAlt4oDbyIPLaCz0M14hpxJtCoflQ==
X-Received: by 2002:a1c:8156:: with SMTP id c83mr362636wmd.164.1580841636306; 
 Tue, 04 Feb 2020 10:40:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 11sm5524304wmb.14.2020.02.04.10.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 10:40:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D62311FF92;
 Tue,  4 Feb 2020 18:40:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/16] .travis.yml: Drop superfluous use of --python=python3
 parameter
Date: Tue,  4 Feb 2020 18:40:17 +0000
Message-Id: <20200204184028.13708-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204184028.13708-1-alex.bennee@linaro.org>
References: <20200204184028.13708-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::330
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

As we require Python3 since commit ddf9069963, we don't need to
explicit it with the --python=/usr/bin/python3 configure option.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200125184217.30034-1-f4bug@amsat.org>
Message-Id: <20200203090932.19147-8-alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index e75c979b6c5..75269678476 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -270,7 +270,7 @@ matrix:
 
     # Acceptance (Functional) tests
     - env:
-        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
+        - CONFIG="--target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
         - TEST_CMD="make check-acceptance"
       after_script:
         - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP")]' | xargs cat
-- 
2.20.1



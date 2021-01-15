Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EF2F7C32
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:12:40 +0100 (CET)
Received: from localhost ([::1]:54544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Ou7-0007o7-Gz
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0OqG-00068j-PD
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:41 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Oq9-0006UA-0N
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:08:38 -0500
Received: by mail-wr1-x42c.google.com with SMTP id a9so5763660wrt.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qCfmMpKgkFsOUU7euaB6kPeimG9lO3ftqeOAgTO8Ito=;
 b=JdOtiKmHmuSn7kKTMPmw5l9UnyULSNbn4x5VsaA2vBIHAxx0UGWzknRLCOBLmkn9By
 z3KwkNKAl2iQvhGV/t1Vc1tzl1BekSV+mPUwxmMUinoIgfQi6pn5LXGie92JtQfBhWU6
 InZXl9AgBSEZpBpVQYJ/ypXzbZ0Z6klmfvoW10YbNVP1TOkCL1NOkD+IPaUyRwOIIR1L
 aLDV6sbBVjybBqDRkniSGIVfaoHkrOF6kzW117c1DvDcwqx4urVPVQb2M9IXxXIrvICz
 vmNltnBD3IEHgthGXNU9oY1PJqRKxUhxhjx0PagAvwu4T6XgjEll+Sa7vhvkjz35zPPa
 FBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qCfmMpKgkFsOUU7euaB6kPeimG9lO3ftqeOAgTO8Ito=;
 b=MdAvqjIfa3GSIjMVOexkNl93H1FltO0ekjI7P+1VRehBnddnySq42kFsS++Sc1venE
 Pf32BNqVGGQn2LxQi8780C4+7QkQVfnwE0UniRTTLzTLJ5wa9ipYHC2D+oco22DIYzU/
 TY3toRsXZJi5+DprL1AowQuefydyFriGODJVrGCsLUncqnqdOyya0l7aYZ1Qpc58AtSv
 cKtIH+SbvuiKRrWRGqLDBE66sHsrg/BEA7iPsCExgGCZWR0qmgdoX5FvE7yNGwPKrGM9
 7cWErtwWWfP37UhZFBDmn9g6g6yX7/XepMGPHAvrnziy1fxb4aV4JxJRtWoezcHUo1rC
 83hw==
X-Gm-Message-State: AOAM532FJo/7x0+6MnF/URgWh3f2FGGyunRoqT6CcUJKVeQ98ILv7F44
 8Hkeqx+VQyyKzq3sVtZDFNkzpw==
X-Google-Smtp-Source: ABdhPJzzmZrC46unD3PPBTJKex+fDyoln1VcL6kh7L/dcCdRnpIYQOYda9P9MVEq28q0Y2VFV4o9bQ==
X-Received: by 2002:adf:82c5:: with SMTP id 63mr13223373wrc.38.1610716111315; 
 Fri, 15 Jan 2021 05:08:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm15097652wrx.5.2021.01.15.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:08:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DFEE31FF87;
 Fri, 15 Jan 2021 13:08:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/30] tests/docker: Remove Debian 9 remnant lines
Date: Fri, 15 Jan 2021 13:07:59 +0000
Message-Id: <20210115130828.23968-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Debian 9 base container has been removed in commits
e3755276d1f and c9d78b06c06. Remove the last remnants.

Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210107072933.3828450-1-f4bug@amsat.org>
Message-Id: <20210114165730.31607-2-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c254ac38d0..0779dab5b9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -108,7 +108,6 @@ ifneq ($(HOST_ARCH),x86_64)
 DOCKER_PARTIAL_IMAGES += debian-mips-cross debian-mipsel-cross debian-mips64el-cross
 DOCKER_PARTIAL_IMAGES += debian-ppc64el-cross
 DOCKER_PARTIAL_IMAGES += debian-s390x-cross
-DOCKER_PARTIAL_IMAGES += debian-win32-cross debian-win64-cross
 DOCKER_PARTIAL_IMAGES += fedora travis
 endif
 
-- 
2.20.1



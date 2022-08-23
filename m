Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3059E631
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:41:32 +0200 (CEST)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQW1z-0001j9-Uw
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn7-000265-H9
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQVn6-0000Sl-1O
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:26:09 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso9820719wmc.0
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=LsZpgMlG5k3/z4R/dGjpJ9j2VMDJig/kzVEqA19cmEE=;
 b=xHXNvAsC55oEXRYfmRrU6YA9nw6wu/8q/5aD/qvra/xlKD4RXoiQQyQbbn4809KWG/
 Ii8i7XCh+r2ebU+DmIBo1/5gkSPQR431jX3NBrfSNp8ltmrwSqSDZVGP+MJ1S+n18xru
 2MRclH4Pb7yHlTT5RR2HIoRLuX2b6f/UIiEmnKW6omv8c6JWwGG0y+fNWQ+WZPg15tpN
 04ZVVnm1scloUHn1nvxQunpwAPFctrGyrSs7IJDC8/J2bsiWY+10z+06mYm0LgnoWAH0
 6RTwAWJDKD0XrcFkFWHOagu0N7X3NhegDQsVywaRrRnAphXWsvxwESlhpHIbqIX41C6P
 JAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=LsZpgMlG5k3/z4R/dGjpJ9j2VMDJig/kzVEqA19cmEE=;
 b=ctJ3g1ZGD1+qHHehmjAlcey1xIksJH7cK64V2LNTYmunBsCb7Wy9t0pCw6E4s38orO
 aBwSKIElfwLqBIES2QaJjRz+2xgWbHpeV8OqG2kGusWnSBygeDBTBSxz5G6XpxHu5zyW
 IRP4UjCVGx8QklbWtP+zMmSxM283RjC/FUOPZCSPV32ob/dIQo0FNdtTTNtrY7agBcZI
 o2WPOUsN6oU94sRXRruHgcJEcYzwOK9hjuPhIxerE/sYPBIgkOCjAcCFgiEYKXTiP7Qk
 DkjZJGZiu+verIvEPxN3byb1nFMBf0oR7VFc3K99GMB+pnLmwp7Ip48wJQWjMAgCc7pb
 3K1A==
X-Gm-Message-State: ACgBeo3Y9dMsW4+cMtyyJ8HVDLbcJa4F8Chmy7M49B5o/bC725svQIhF
 qExZLGPfFxNQx/NtTv381khlDQ==
X-Google-Smtp-Source: AA6agR5z6atS1fwqAI2aPqU6XMHWMeWn08bn8IxkuieYptdNI4jSVFRFGsG7xtn9USyQae6vz9kxog==
X-Received: by 2002:a05:600c:348e:b0:3a5:fbcf:4c1a with SMTP id
 a14-20020a05600c348e00b003a5fbcf4c1amr2551264wmq.171.1661268366640; 
 Tue, 23 Aug 2022 08:26:06 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1c4304000000b003a5c7a942edsm20924643wma.28.2022.08.23.08.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 08:26:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0789E1FFBE;
 Tue, 23 Aug 2022 16:25:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 6/6] qemu-options: try and clarify preferred block semantics
Date: Tue, 23 Aug 2022 16:25:58 +0100
Message-Id: <20220823152558.301624-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220823152558.301624-1-alex.bennee@linaro.org>
References: <20220823152558.301624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try to correct any confusion about QEMU's Byzantine disk options by
laying out the preferred "modern" options as-per:

 "<danpb> (best:  -device + -blockdev,  2nd obsolete syntax: -device +
     -drive,  3rd obsolete syntax: -drive, 4th obsolete syntax: -hdNN)"

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Cc: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Message-Id: <20220822165608.2980552-7-alex.bennee@linaro.org>

diff --git a/qemu-options.hx b/qemu-options.hx
index 3f23a42fa8..31c04f7eea 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1105,6 +1105,19 @@ DEFHEADING()
 
 DEFHEADING(Block device options:)
 
+SRST
+The QEMU block device handling options have a long history and
+have gone through several iterations as the feature set and complexity
+of the block layer have grown. Many online guides to QEMU often
+reference older and deprecated options, which can lead to confusion.
+
+The recommended modern way to describe disks is to use a combination of
+``-device`` to specify the hardware device and ``-blockdev`` to
+describe the backend. The device defines what the guest sees and the
+backend describes how QEMU handles the data.
+
+ERST
+
 DEF("fda", HAS_ARG, QEMU_OPTION_fda,
     "-fda/-fdb file  use 'file' as floppy disk 0/1 image\n", QEMU_ARCH_ALL)
 DEF("fdb", HAS_ARG, QEMU_OPTION_fdb, "", QEMU_ARCH_ALL)
-- 
2.30.2



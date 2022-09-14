Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7034D5B8C9F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:14:24 +0200 (CEST)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYV1r-0002Nt-KL
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnt-0006Rw-Uc
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnr-0002mH-Qu
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id g3so5533578wrq.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HoXaq5wqa0NQD2yFNqfhg3M2YWScwtFEAMJcP4/Q/QY=;
 b=XFBMLwiCLPYPERy/Edsd44FsQhtwtz1OKx6owOtRZAxRMmLq99x9Tyxo3tNc9xPm/J
 ooAN6MyrPCK515MIvREdpsqZ5oPcf2wb1QDTeHFnEpnH09Q2eK52qjZEJY1GStL20bu+
 jtL9x/LkG9nedxjLUlzIHP0fEZvcsysoisBdw9390SiUM9SV04gf5DapdGYNpNzNp2UP
 9/hgHp8H/HSmnSYMyyoAFA7WukBV314FcLAnvZEWMD4BJF1HBzCIEROrau8nSME42Qv4
 hEhqKNSgXdu/37KP5fNl9iOrCu4gFRA4YQOnugQCOJStiq3LORfHYxSL8GPcm/3IuXnY
 aa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HoXaq5wqa0NQD2yFNqfhg3M2YWScwtFEAMJcP4/Q/QY=;
 b=y7BLmnjEDbreoWTz86qvqoMVMj4IoyjRuoZebutCor4HMPOD9ZUqkFCX89jU3x2SJu
 EQP+gtBaJ5jaXokm2V5CQWgWZDEzhn1xZ1tqrsOTwcozJxb0/uKo/Cj9FyiPubrSVg2V
 78vfD1bBdkNzuPNqWN/aX0B6cDbbUg5SHc2tofQuM6GaVzkh2Ypb8Pe6zCl3R1GwXMtX
 X99Azx/rZP5B+MNKhV4eucVqRBDhxsNiGgF9VqO1SrumcQVELr1viteEyvGp4H94G9Dm
 zrOrc6XUbeobUkSTRBcmK3wPNbWL2l6bYnjAWPG/hjWNHaefdqHZ+VZ0JoH/eQgZLNGt
 1hzg==
X-Gm-Message-State: ACgBeo3VRKTXQXIN+58HD1KRVqvtN4GvN4QcY2G1RlbtLLffcpxvZFoA
 wDayO5akGxYsurweMw9kEHB31w==
X-Google-Smtp-Source: AA6agR4EBx5R4460Su3aAFowAVUwNIK2kZk4328VTE3YwJtaIeKHAIVBdVbOcuyTg3zuPosTLD7/jg==
X-Received: by 2002:a5d:59ad:0:b0:228:d709:43cd with SMTP id
 p13-20020a5d59ad000000b00228d70943cdmr23264915wrr.30.1663171193419; 
 Wed, 14 Sep 2022 08:59:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a7bce96000000b003b4a33a7d08sm3037321wmj.9.2022.09.14.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A30D41FFBB;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 03/30] tests/avocado: add explicit timeout for Aarch64 TCG
 tests
Date: Wed, 14 Sep 2022 16:59:23 +0100
Message-Id: <20220914155950.804707-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

We don't want to rely on the soon to be reduced default time. These
tests are still slow for something we want to run in CI though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ee584d2fdf..67a24fe51c 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -63,6 +63,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
+    timeout = 240
 
     def add_common_args(self):
         self.vm.add_args('-bios',
-- 
2.34.1



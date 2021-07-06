Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9833BDA02
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:20:16 +0200 (CEST)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mrv-0005MZ-CR
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfI-0005P7-MR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfH-0007AS-0P
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:12 -0400
Received: by mail-wr1-x435.google.com with SMTP id a8so14776817wrp.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8aMzBTIJfLBRFTgmCGKFYY8ArIkOG6uB9avvuOEJOSo=;
 b=rQ/YoxriyBreQNX3veqZwrn2xRkhc/VGvj9D60JLPeuVWhv209UF1zV1gm8LaTYq1V
 mz8D6kBGlscnIZ6bSMTOq7RoZsgn+Q/XVMx6jaRvCVuYrKESCd8jhLlqgaagNURZF55z
 5ocA8X5obtNZTFcXfMK/5mKCo3+VbeHgNCOOoIN7/e9pKuG1ormKoGNcCuNhfH5vv7yo
 JKg0pvfdbPQbTKYc/cKlDwBSTjbKFK1Fe3JA4wTnepsfFOGQbdIni84sItx4BduhRb+g
 BgRZ7s9V939bjdj/DbKR3lRt/PsmkpT5sAMcCFZ18rP60U6qFFsRimdJknY+tLGaWmrA
 nDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8aMzBTIJfLBRFTgmCGKFYY8ArIkOG6uB9avvuOEJOSo=;
 b=B+MsWc8qrRuTBDvYiaUs2pGKjTkM36Xnobex6GIWgpu6A66DaAx9aDdHNuUJZIzqsK
 lloyS9DZ4o+GRsHscFxfbWU4LlvvR21ariTpXHY2zMtTnecDhI6Mwa/jbYBuFYiaAZDO
 9KoAJesqpNp4tYz6zslbj8fOVD76j/LfF6jgKR7ZxDnyNVE1O5S7X4iGze/O/sWlS+4/
 RRENaHowf/t/exIi1aHhBw/2nx6zu4roAwzasFGMBJKRXbvjUw3PLkrJdiOAFEXjCj32
 NnaIjMLPV4t8sMIlqHhjVzFPTqHka6aJXV2q4KRii649v8tNrrikhCAPiF3IbtRsaLKb
 yu5A==
X-Gm-Message-State: AOAM533EwebVe2Mhiq379dm7luzVZFpprIPMl3ykEBJpne4GQXooMtP8
 Tzolv9+FWCF8O/wDhve1wroCaQ==
X-Google-Smtp-Source: ABdhPJxXOWZBRsEmLcNoEPsc//ioODYgE2VgoFWPUWxO4JxUpGAFoP8xiqnmf9TZmYoeUnhh3MtKmw==
X-Received: by 2002:adf:f04a:: with SMTP id t10mr22059527wro.318.1625584029671; 
 Tue, 06 Jul 2021 08:07:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b11sm17255710wrf.43.2021.07.06.08.06.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A10E1FFB5;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 30/39] configure: stop user enabling plugins on Windows for
 now
Date: Tue,  6 Jul 2021 15:58:08 +0100
Message-Id: <20210706145817.24109-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Yonggang Luo <luoyonggang@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some patches on the list that enable plugins on Windows but
they still need some changes to be ready:

  https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/

In the meantime lets stop the user from being able to configure the
support so they don't get confused by the weird linker error messages
later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>
---
 configure | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure b/configure
index 44a487e090..9d72b31a9f 100755
--- a/configure
+++ b/configure
@@ -707,6 +707,11 @@ MINGW32*)
   else
     audio_drv_list=""
   fi
+  if "$plugins" = "yes"; then
+      error_exit "TCG plugins not currently supported on Windows platforms"
+  else
+      plugins="no"
+  fi
   supported_os="yes"
   pie="no"
 ;;
-- 
2.20.1



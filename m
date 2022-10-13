Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186F5FDD95
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 17:53:14 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0WF-0003P4-TC
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 11:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QR-00062g-MT
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oj0QQ-0006nj-2C
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 11:47:11 -0400
Received: by mail-wr1-x42a.google.com with SMTP id bu30so3470592wrb.8
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l7SmkBkb58R6n4ne7NU6GDv/kWwWZJH06GSqHAlR/+Y=;
 b=pFUKknOhTEX1KtVpnhNN229iO6BAyhWJzWZRRx334EPlQaedM3YTfI6jpYacdGsbwF
 hHAJ6tXTh4w6UloVYJW05rYNTpwXfXWEtB1weJfQpIcSbgRpH/9q9tYyX4Fpvg/JTwhc
 Ey63zNgUlLlnpKPjJBdDU2cBP+9yWH7n6o/hh8Laaaftounh35q+FAFkGv0HlSmm6gDs
 0FpgrVrAaW3K3XEXSdbX8HJiDsTvstz874/oFrrzvxWL0BkHVUBZ2gJqlLHVaSlIqodZ
 C2fLG+XwJN4xsokn47WpKWic+Q5PUC58hSloYIreMEnQI9osIdpdRlVrse0FsZluPZCn
 cBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l7SmkBkb58R6n4ne7NU6GDv/kWwWZJH06GSqHAlR/+Y=;
 b=nPDC6Nbehq16r9zsWHcxpwW2jFh4b/7UEgdVdAEluiTBucv0ig3bkYpxjkA6PGg2hf
 ndQswN2Mgt4PiHusSW02wNoO3cTVgBUerlznrYwLnwg1FCzKIveibV7bzT1CSZ29iMaL
 NYoca4JuVVntVRvwdsTa5CrXJqz8jf95veiOZ6C5s/C/Ev9aUk/kL0dNM/Q/Vhu8Lpk+
 N3IeWtuv3rHa2oThYePVWgAoxFmNnHPAOSC6JVqqsA5plUzWCg+BsFolVYXX7vHsTbAX
 WWmsNrA0KSoHJrNJr/nxWNQtayfcJoP+9g/TZJEcPzHTurY9+D5uI5SjrFTKNDIXv8Re
 7b5Q==
X-Gm-Message-State: ACrzQf2z98USjCpCvbGYSbSkqa9oRFuvgPmEQ8t/ZIQpvccDabpJ/Bmw
 m24kQaMnLxT0h6FmBIbZUC3UaA==
X-Google-Smtp-Source: AMsMyM7nL2fFmXMf5oGRMisHldfc0cDiGQSgdVh9j7msUpZ7KOKSGtjm55rE7yp3viwCZ7DllbCUmQ==
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id
 a12-20020adfdd0c000000b0022e4bf66c08mr405684wrm.617.1665676028184; 
 Thu, 13 Oct 2022 08:47:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a056000004800b002238ea5750csm2624083wrx.72.2022.10.13.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 08:47:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 368A31FFBC;
 Thu, 13 Oct 2022 16:47:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 4/7] configure: don't enable cross compilers unless in
 target_list
Date: Thu, 13 Oct 2022 16:47:02 +0100
Message-Id: <20221013154705.1846261-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221013154705.1846261-1-alex.bennee@linaro.org>
References: <20221013154705.1846261-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This avoids the unfortunate effect of always builds the pc-bios blobs
for targets the user isn't interested in.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configure b/configure
index 45ee6f4eb3..246651f25d 100755
--- a/configure
+++ b/configure
@@ -1866,6 +1866,11 @@ probe_target_compiler() {
   container_cross_ranlib=
   container_cross_strip=
 
+  case " $target_list " in
+    " $1 ") ;;
+    *) return 1 ;;
+  esac
+
   target_arch=${1%%-*}
   case $target_arch in
     aarch64) container_hosts="x86_64 aarch64" ;;
-- 
2.34.1



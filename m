Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46C6A4399
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe54-0001u5-RW; Mon, 27 Feb 2023 09:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe48-0000da-Qh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:29 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe44-0007XL-Du
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:18 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3883991wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oDI/Gvf1vTBawfRe/WqKnp9A0gmcK09jwaqQOvTxWMM=;
 b=NE87DflL9Bcf61p+nKys6TyxSGKu1rFXWOAw9vFJdWYGnlZlrB8J/3CWdE+5OIpB+a
 aOCZOop5WD7owzAt5xt0aSk2XdfswACgUjgzvwpYP8P5JFTvdQRjU2GH4+i6Lb5p9L//
 0EculsczBLExubH9T8IRUk3yprlLwXWqBVBHswzwE6nvL3CEB50bH1yQ5SOuK6KfBpi6
 iIGCWAWjqQutIu4LkApoQDl7sx5DHl5loNegB4CjXZaUlPVe1WfACbECk9m1AwzlY9Z/
 E6rsgdTbnCIiNJ4FuXr0GFl+ZBktAEy0dXiCEGI6LWy1oF3a/vgZpZ7aCN/sp0POgGmH
 Y6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDI/Gvf1vTBawfRe/WqKnp9A0gmcK09jwaqQOvTxWMM=;
 b=P7H8s37Cr4NC8KwRCdgRK1Cjb2H0BEDeyVM9HKoctfxa5sR4jGFlh3d9KCkDu1JqUX
 JmWW/xXp/13RP9nt3QYlOjd8rCjIH/mTH34DNnGPy+LVeK7wJXQYoQ4Eu5J99pSCa2Xe
 IsHFXAy4/8HOVWd+kezeZUaEFszzL6es9zh1JOeOW27th2J4Cz+tohzvxhEzEgaieEUY
 jaCbksxvKi9Y2/V5gzQeiGxnQERonQP8KBehoU61C8BWlox/Jk9XZ2CG7cwD050o9uyV
 Oaxpevw9Ov9KLcjJPB0fnXiHL1e945r/MHhqa33LrKexOARL5jeOF2MK97whwYsE8YpF
 TgYQ==
X-Gm-Message-State: AO0yUKUR9F8DbrhT+Qt/uQgF9GFJsHK5miRDdIgGV4zKM+Wd9qDf8MHN
 9+w2fWUuj1MfMwokQwghuMttg/Hxbl2ctQMC
X-Google-Smtp-Source: AK7set+fU9W1kmC4NWQvBRwiYEi6ciw98U1ZjF6O9YMiIiECYfo1xjLfvUtvIrUAwn3ZwvC3DcHliA==
X-Received: by 2002:a05:600c:3b1e:b0:3ea:e5fc:a5a4 with SMTP id
 m30-20020a05600c3b1e00b003eae5fca5a4mr10202472wms.1.1677506473360; 
 Mon, 27 Feb 2023 06:01:13 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/25] target/arm: Move psci.c into the tcg directory
Date: Mon, 27 Feb 2023 14:00:43 +0000
Message-Id: <20230227140102.3712344-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/{ => tcg}/psci.c | 0
 target/arm/meson.build      | 1 -
 target/arm/tcg/meson.build  | 4 ++++
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename target/arm/{ => tcg}/psci.c (100%)

diff --git a/target/arm/psci.c b/target/arm/tcg/psci.c
similarity index 100%
rename from target/arm/psci.c
rename to target/arm/tcg/psci.c
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 3e2f4030056..a5191b57e1c 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -22,7 +22,6 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1f27ba1272e..fa8a9eab933 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -43,3 +43,7 @@ arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'sme_helper.c',
   'sve_helper.c',
 ))
+
+arm_softmmu_ss.add(files(
+  'psci.c',
+))
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD75842FD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 17:22:24 +0200 (CEST)
Received: from localhost ([::1]:54700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH5LD-0003K2-JI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 11:22:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH5DI-0005JJ-Gv
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:14:12 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH5DG-0005mO-Am
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 11:14:11 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 2-20020a1c0202000000b003a3a22178beso1108831wmc.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 08:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4ss+tbkFJfFRzI7qatNEZJh7WZ3snIsk/Ar1GUZZ/8=;
 b=gtSM04pK6sDMm69TAJ5+8HYHe4EtHeEyoad9VOeXBzeyqelA4/VeL4rklBuApqallC
 FrwJMa5EhXxFVFdiSb1XPvv7OgABLg57DUydnxZrsVlvff5hccUmsorSYSLT8Y71IMsZ
 J5v4ayx2ZIj6A2tpYXyXN588gp05X1MQwx0i8bEQCYS6rkd/9uW36uCyHp+tSxDVNP4I
 iujduaV46/JN4PaE9ZBbZTtu47BR4o+r3HvHF6GpNBTm4Gk+E/oLoE1UPzg58dIm8nNh
 Irgedyhnrmx7L/CM2r5Sh87QISMNW62jZOoQH+09Ln9EH8KquxbSTVKwJV6rjyDKK27m
 m0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c4ss+tbkFJfFRzI7qatNEZJh7WZ3snIsk/Ar1GUZZ/8=;
 b=UkewrFgOiM37MOS4B4hTcFjaBiim67Lh7lZ+u97F4Z5MlfJsSsbgfNQTcU7OXxZcuz
 R3z2Nix8tgHLhxctBX0/ZYYIKr/MK61W87QH8atFL8fFiOwBZzmn0vJIUrF0krmBSS5U
 WpNwaUtI1Zm0AnEFsjBOkqp8IHg7JUWOxyn05MvFIbEV2VuSgCpc9h475FEvEk7eSXnQ
 uxVOepBxlg4J7WA0QfuniuWCpz9tCSdbuqHEFJr6GvRYpZGlSSDaTi7r4TRxS7QgbtGw
 +Z74XlwBMJFonQISE0XfVi6R9SNKog5LlNTj0AowcH6m46EsRlP96/7iJvWfARUwLRO1
 qvcg==
X-Gm-Message-State: AJIora/DG6sf+ms51gi3bEpO1kSn4SAEvjr5WDRLIiwhGdKiFsJYQ7YC
 zAPsl0sq92sQk+3cjIPtIPq/reZYqSoigg==
X-Google-Smtp-Source: AGRyM1ucWCsoysElCMdOBx77CI9KF0/a1VBCFWi7rS2Zj0ATrxBpCwuhEks8Na3nhTlVD7xt6Qqmwg==
X-Received: by 2002:a05:600c:190c:b0:3a3:4293:3710 with SMTP id
 j12-20020a05600c190c00b003a342933710mr7029854wmq.81.1659021248338; 
 Thu, 28 Jul 2022 08:14:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d50d2000000b0021e9fafa601sm1337573wrt.22.2022.07.28.08.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 08:14:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH for-7.1] linux-user/flatload.c: Fix setting of
 image_info::end_code
Date: Thu, 28 Jul 2022 16:14:06 +0100
Message-Id: <20220728151406.2262862-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

The flatload loader sets the end_code field in the image_info struct
incorrectly, due to a typo.

This is a very long-standing bug (dating all the way back to when
the bFLT loader was added in 2006), but has gone unnoticed because
(a) most people don't use bFLT binaries
(b) we don't actually do anything with the end_code field, except
    print it in debugging traces and pass it to TCG plugins

Fix the typo.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1119
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/flatload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index e4c2f89a226..e99570ca182 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -808,7 +808,7 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
 
     /* Stash our initial stack pointer into the mm structure */
     info->start_code = libinfo[0].start_code;
-    info->end_code = libinfo[0].start_code = libinfo[0].text_len;
+    info->end_code = libinfo[0].start_code + libinfo[0].text_len;
     info->start_data = libinfo[0].start_data;
     info->end_data = libinfo[0].end_data;
     info->start_brk = libinfo[0].start_brk;
-- 
2.25.1



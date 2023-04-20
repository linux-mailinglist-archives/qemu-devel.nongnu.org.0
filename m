Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 293086E98EE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf5-0000Aa-3M; Thu, 20 Apr 2023 11:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf1-00009r-QE
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf0-0007tg-5H
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:27 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f17b967bfbso22937985e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006244; x=1684598244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HYJcS3iHeEAwGWypbyjBIxEOx4FrubTVVdwDYF4Gy2c=;
 b=bzPEdQeLqUssfR1GMDY0w1UTXat/Us5iWwL5c9njHwNb9d6BKT+2XzwtrASCY5e1Vw
 LrJ7zTeYYZBw+09tca9uKweq7CvjWDA6ydwWgdVMgAY1wPixguZYB/S4Y+G9v56Zvfhw
 LIRI0OFg4udgNujHtBGf57eTltDAtejZVIhDIh5nndYghcy7vy1fkQfSWIVj57nCdlhS
 Fv7reO2XZippAHz9EBHsEjGqFdxj1C8P55TGBn1mZiiMEQVY2Qkdw4dwUKxSvfE8hBsE
 72x7U1Gh6JCXZX41Us17wjDqJvrqb1hVRisIDVO51gCJWY51q72gqLIvGZ0EUbm/bX5o
 t7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006244; x=1684598244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HYJcS3iHeEAwGWypbyjBIxEOx4FrubTVVdwDYF4Gy2c=;
 b=PAGWNIO4BNQgvB4Ko2kb75IHX5x1L+Gd2qKG0sSmvrhdJu6C5YeFDJrtJIQG738Koe
 TayFpaRD2HFhzXqC124uY+nOS5l1hPOhgnCd4geXRPVloC5YwVYBjKTNLCjZEwZT6xBg
 bXlL8cbg9M5llpYpYG0lQJE/Nhz6vvag+rUXLUAOPCm/Ox141lOx6vVPpMarAMrxJq/6
 I7ob3Tm/iQXfXKMDg2zb8eRiOPQkkLh6BUx/Yepu4fDgpNulbLiyfOOMCAhXMVDwzTUk
 Z3hKj4SDB1bp2RC6WiL+iVsnfAVVQSFQ5SdRNuZUpo9u3xmhavVFzi/Ezk1/iyhXV8mj
 UPlQ==
X-Gm-Message-State: AAQBX9dReVzEUjts5gKPbvXB7mvJg0EFb5b3hii90Fh73EtWQpk/VTpm
 OblAi9im0DtOxVGCz0MvBaLfGA==
X-Google-Smtp-Source: AKy350bPGFimz+e+F4uWm517s/umwApmhXjCFefrMRho7/B+eGkThNIB6H6eAOicuNXX4blAlEXmLQ==
X-Received: by 2002:a5d:4603:0:b0:2fa:a8ad:c49b with SMTP id
 t3-20020a5d4603000000b002faa8adc49bmr1661016wrq.1.1682006244395; 
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f11-20020adffccb000000b002f90a75b843sm2249945wrs.117.2023.04.20.08.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9931C1FFB8;
 Thu, 20 Apr 2023 16:57:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 1/9] docs/devel/kconfig.rst: Fix incorrect markup
Date: Thu, 20 Apr 2023 16:57:15 +0100
Message-Id: <20230420155723.1711048-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

In rST markup syntax, the inline markup (*italics*, **bold** and
``monospaced``) must be separated from the surrending text by
non-word characters, otherwise it is not interpreted as markup.
To force interpretation as markup in the middle of a word,
you need to use a backslash-escaped space (which will not
appear as a space in the output).

Fix a missing backslash-space in this file, which meant that the ``
after "select" was output literally and the monospacing was
incorrectly extended all the way to the end of the next monospaced
word.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20230411105424.3994585-1-peter.maydell@linaro.org>
---
 docs/devel/kconfig.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
index cc1a456edf..ac9453eba9 100644
--- a/docs/devel/kconfig.rst
+++ b/docs/devel/kconfig.rst
@@ -274,7 +274,7 @@ or commenting out lines in the second group.
 
 It is also possible to run QEMU's configure script with the
 ``--without-default-devices`` option.  When this is done, everything defaults
-to ``n`` unless it is ``select``ed or explicitly switched on in the
+to ``n`` unless it is ``select``\ ed or explicitly switched on in the
 ``.mak`` files.  In other words, ``default`` and ``imply`` directives
 are disabled.  When QEMU is built with this option, the user will probably
 want to change some lines in the first group, for example like this::
-- 
2.39.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0A46E98E7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:58:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWfB-0000EN-4b; Thu, 20 Apr 2023 11:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf6-0000Bx-Sx
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf4-0007v0-Pw
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 ay3-20020a05600c1e0300b003f17289710aso1366573wmb.5
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006248; x=1684598248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pvsbb/phYjqIHhkDoc+XfXTFKQuZBTz/m6mNyHE4+kM=;
 b=jh0RYM2e1dLFRy6AjKmTi7HPrcNgNDHYOv3eXxz9suB/j8xLersdGgXei2RIwp6Grp
 ELwKPUAeGmKeoBn+KoT3H2zekTjBnF7Mk5afWj/ru+hNiMJZ4wqbvvY3rNpTWDzQkmlO
 elnSgts2Pk328lUyywxgdwW7oAAjT6BVtTM+QLFOUXS0lLT5SNQYnfm1jEhH+HAgNiMt
 3ofgiiTyYNB1prklgDGlk4PlgF0eoAgAORizyqEqNM1rPz2hHiwl088avwftrpnrbMX8
 xQZr1AwaQf+SiZf0nwRW2d11MF45s0HmDOOzzFzER1vNspfEIbLk5QYL3DC26NQR9isH
 DIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006248; x=1684598248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pvsbb/phYjqIHhkDoc+XfXTFKQuZBTz/m6mNyHE4+kM=;
 b=R+CP2EDXgWBqWwlbOXKftuK0BMFlR0EcJ7S8bVYAjw/1nc0IZVQdFiBlce9QrUBBcL
 LTip5iRQdDCte119DFoFt2saeFb8dUPskA7arKSdQpa0FnYELi1G6BFE4FiWAGpDIgFy
 JOI0opXohakpdlc4h3pIOZ5nfqsnsbdyGhAbFj9iIDBBEDaZic4mRDAORxKUghhCobfb
 VXJ/rCFJM11W8QtWYJPfP6u+CSrdECVrL5hRkCKknLyJy4Ur5tHOMPeSz0m4UsSAFjRQ
 4agwJCYPUYNGiNXWHQwchkdQ3sgMx3vjWx3FIGJOB2xDFESAUUMfSvKeBRHiEs/DYxsP
 mgPA==
X-Gm-Message-State: AAQBX9fFxG4AuPOiVwVn8lxziMQCGj0GEQXeIrg6z00eKXjmGpeLIRxJ
 zGgBEgOz5ESM9AKAI6c3zHV9ZQ==
X-Google-Smtp-Source: AKy350YMNfOiFcn0pFE7Xo33AmOFKvSwoqvtGrqyxBv1eUh8AlqRWpsnm7gSBibOWnAF9KZeB07Bxg==
X-Received: by 2002:a7b:ca45:0:b0:3ef:7594:48cc with SMTP id
 m5-20020a7bca45000000b003ef759448ccmr1881591wml.23.1682006248415; 
 Thu, 20 Apr 2023 08:57:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm2372855wmk.20.2023.04.20.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 04CC11FFBD;
 Thu, 20 Apr 2023 16:57:24 +0100 (BST)
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
Subject: [PATCH 5/9] MAINTAINERS: Add Juan Quintela to developer guides review
Date: Thu, 20 Apr 2023 16:57:19 +0100
Message-Id: <20230420155723.1711048-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Juan Quintela <quintela@redhat.com>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230419163457.17175-1-quintela@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2068ea5c..24154f5721 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -70,6 +70,7 @@ R: Daniel P. Berrangé <berrange@redhat.com>
 R: Thomas Huth <thuth@redhat.com>
 R: Markus Armbruster <armbru@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@linaro.org>
+R: Juan Quintela <quintela@redhat.com>
 W: https://www.qemu.org/docs/master/devel/index.html
 S: Odd Fixes
 F: docs/devel/style.rst
-- 
2.39.2



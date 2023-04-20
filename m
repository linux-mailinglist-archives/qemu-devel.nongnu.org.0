Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2466E98E9
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:58:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf7-0000By-Ot; Thu, 20 Apr 2023 11:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf6-0000BO-5E
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf4-0007um-Jo
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a8-20020a05600c348800b003f17ddb04e3so1380975wmq.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006247; x=1684598247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nrpom6SU9io6Y3gUibz5mchgZ9rlSkFFImeDW90ONAA=;
 b=XcIhGUNaOemHzy+nxsyl+p9N4Z1KraBOcUHw3ogTymi2TmBfHdES6IOO3dokbYRz7A
 KOJV5Qhf9tEH5baUAfmyVY/eVGLQCsTZWkkxCbG950IiprLOCP/PXMot3tz5gaCq3m9b
 fB+/dq9/WsXHgzr3pET69BHHVSAOw4xGHlACvTo4aGF2EjRCf3NuWKjkaccwG8VFQby6
 pCJqi1myWQHblE2BlIBpAvVdzfzKAIuArTeVlOtPYV83g3m0bqq0DOEdYfanmMxgt0Fq
 9gxpRtWQasqoQJzaWGQizXghm29DqK35DJYtjaOoQBUe+rVOhMVc87gNDNGz0zkI+hzu
 4pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006247; x=1684598247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nrpom6SU9io6Y3gUibz5mchgZ9rlSkFFImeDW90ONAA=;
 b=UbmMkyowBYdplnW9Gys2Jm9rBkZLa8yzVNF7ZUd8Zwy76wicThpdQzg+J9wKzEjkh8
 VdzCSGHhvskAp60J/bmjPx719nUs4FVeh+z7I2n4XRL/XwvkYOVlMyrvTQDwPPjlGltI
 UqOVMAvx1rBnTtDKiSuo3OCOHRRlwa0HcKVNpLZn0hdbVL1DRipUOMIptw2ZIjWfl9X/
 CgipClQRo1urjWKDyt/tAneo3e5Y0bbrybTEJqXcqekh561XaPN/L8vxFZ+KfW3xnPnK
 CgqWLugD1WZTjRSw54EUcoviCINoYBkWaCKagUFIRBVO7HZlWOTw1C3QA3TsZDZ4Zp90
 aArw==
X-Gm-Message-State: AAQBX9cIh7fwJHS6WtF21jtZtdyKUB+y2gOYDbTnE26hwpEkKG5ftepU
 khLJRwywr/eT0bDsyHhFc0TE2g==
X-Google-Smtp-Source: AKy350Zwz1VDubWElhYeZ9bHAhLkdt7/oqecdXG626wX4vZ/em4ys/xABC4ftCBCegmyUcRmymy1Jg==
X-Received: by 2002:a05:600c:258:b0:3f1:735b:9c4b with SMTP id
 24-20020a05600c025800b003f1735b9c4bmr1768256wmj.37.1682006247508; 
 Thu, 20 Apr 2023 08:57:27 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c315000b003f173a2b2f6sm5828196wmo.12.2023.04.20.08.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3617E1FFBF;
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
Subject: [PATCH 7/9] docs/devel: make a statement about includes
Date: Thu, 20 Apr 2023 16:57:21 +0100
Message-Id: <20230420155723.1711048-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

While not explicitly disallowing header macro abuse (because that
would make us hypocrites) lets at least address some things to think
about.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 68aa776930..5bc6f2f095 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -300,6 +300,20 @@ putting those into qemu/typedefs.h instead of including the header.
 
 Cyclic inclusion is forbidden.
 
+Generative Includes
+-------------------
+
+QEMU makes fairly extensive use of the macro pre-processor to
+instantiate multiple similar functions. While such abuse of the macro
+processor isn't discouraged it can make debugging and code navigation
+harder. You should consider carefully if the same effect can be
+achieved by making it easy for the compiler to constant fold or using
+python scripting to generate grep friendly code.
+
+If you do use template header files they should be named with the
+``.c.inc`` or ``.h.inc`` suffix to make it clear they are being
+included for expansion.
+
 C types
 =======
 
-- 
2.39.2



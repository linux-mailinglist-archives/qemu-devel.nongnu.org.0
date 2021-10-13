Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F542B1C6
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:07:26 +0200 (CEST)
Received: from localhost ([::1]:49626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maSjr-0006XO-Vm
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeG-0007wO-7x
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:36 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:45737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeE-0005A4-Ow
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:35 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 l16-20020a9d6a90000000b0054e7ab56f27so1494276otq.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xj1e/TwUMhnPg0EzSwAwQl/XvDUpfzlFFnWUPRvfKb0=;
 b=FhEa3FvxmdLpOq45YAjfZ9GlHPDA57GYj9Fd0qpKPJCNrdQ7i0Stg+HcMM7oplDcka
 0uJVf3avJ+nutoLa/tPXFD6OsCqoNVc6gZpvvNI8uOERWSsWpWfNWqNzNX4dAJ61f6BJ
 4yVGrN6Fy3VaGlwExiKpnFWK6M+LV31Tqnytk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xj1e/TwUMhnPg0EzSwAwQl/XvDUpfzlFFnWUPRvfKb0=;
 b=XxgAiSoDU3h9hAhW5xTDPdTphzEfj6W6P7wkWYQ5iFN/Yf4uE6ZNESDzLjoC8ZvtXw
 +z6g/I0Gw+JqR6XGdsqifxedK/Ajqbwt/lbF66i5DSAwonvkbc3HDDIDiXcVSx9Nqm3P
 JB62eVahgycR+1pP4VK6nzJvuye/ehR+wMgnH6NN9aY97allQObKb1MGX16/E9VjexA9
 lFkKNu9KZOemoc5ZEs3kg+Ou5wt4JNdmg52n1KlZmP4R5BQCTEGXTlOaHlRohL5qK2II
 UfAsepOcQk24fvt8BkuejiF4x5oa8oYYtWu8K98IB4mNjsHGDZp5k06xMab0vE6gH9ok
 lLeA==
X-Gm-Message-State: AOAM530Eymrt4XgaQ5bBI82Hszdz7UHwRQx9dhlS/erSuoqIRDc02Dk0
 KOCl4JTOkM0P2uAytAdAA4n1Ew==
X-Google-Smtp-Source: ABdhPJy0TemTw6auYJIG00wP8FppUlfLn32uE9pt8D9NiZN/nbvLYvGg4mQ+pn0GLW6kJh8t2B+1Xg==
X-Received: by 2002:a9d:69c9:: with SMTP id v9mr28161771oto.127.1634086893619; 
 Tue, 12 Oct 2021 18:01:33 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id a10sm238107otb.7.2021.10.12.18.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 18:01:33 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH 03/16] riscv: qemu: Explain how to extract the generate
 devicetree
Date: Tue, 12 Oct 2021 19:01:07 -0600
Message-Id: <20211013010120.96851-4-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211013010120.96851-1-sjg@chromium.org>
References: <20211013010120.96851-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=sjg@chromium.org; helo=mail-ot1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Bin Meng <bin.meng@windriver.com>, Rick Chen <rick@andestech.com>,
 qemu-devel@nongnu.org, Atish Patra <atish.patra@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently generates a devicetree for use with U-Boot. Explain how to
obtain it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 doc/board/emulation/qemu-riscv.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/doc/board/emulation/qemu-riscv.rst b/doc/board/emulation/qemu-riscv.rst
index 4b8e104a215..b3cf7085847 100644
--- a/doc/board/emulation/qemu-riscv.rst
+++ b/doc/board/emulation/qemu-riscv.rst
@@ -113,3 +113,15 @@ An attached disk can be emulated by adding::
     -device ide-hd,drive=mydisk,bus=ahci.0
 
 You will have to run 'scsi scan' to use it.
+
+Obtaining the QEMU devicetree
+-----------------------------
+
+QEMU generates its own devicetree to pass to U-Boot and does this by default.
+You can use `-dtb u-boot.dtb` to force QEMU to use U-Boot's in-tree version.
+
+To obtain the devicetree that qemu generates, add `-machine dumpdtb=dtb.dtb`,
+e.g.::
+
+    qemu-system-riscv64 -nographic -machine virt -bios u-boot \
+	    -machine dumpdtb=dtb.dtb
-- 
2.33.0.882.g93a45727a2-goog



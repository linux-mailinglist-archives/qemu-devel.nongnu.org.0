Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B776A4492
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeBV-0003Dw-8H; Mon, 27 Feb 2023 09:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeB2-0002vC-23
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAz-0000Q6-Qx
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m14-20020a7bce0e000000b003e00c739ce4so3895061wmc.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=illwlrrIAF5BtfATNC0qhOmoCzfSa9vUurg0/i93crg=;
 b=ricJSUndjnqkDW/bjVB+uI+2G8Bioy+M8YhqW3dn9YVzFVzCcujw2epaP89M4F0ZGD
 yJ1jZ2mEyGTLJKbgZPbCKuQuZNhV5lreNLgRBHq5PGOrjQjepb4v/Q0sh/k0uRGv/HuU
 UVzsfeJCF2GzBOFTD8Xq/kVvFUIdOfH+nXN5Yr0Uovrnx/S9vR1RdvqOH7KJTMD/PdNw
 RptCBA/1mHM+muBUiCJq763YqHUOsVcYjCw26BkyRyLyWVTthQm0ZFQwvS1zC7dRNBOk
 vaxSYDqYJshEhBHOJTqXi9ntzfrLt9sQFpjjyWvJIuugvh3g1w+gRLjCQVFsjxd85coO
 hieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=illwlrrIAF5BtfATNC0qhOmoCzfSa9vUurg0/i93crg=;
 b=j3HFU2MhJsYlcYVCl51hRd3SmwWkToBRRFJ06Y/RV1QCmFn+PqjdLmwrLSH5XUDxNP
 7Bz1hWkYOWD3/JdxM8/PFHZv9CqYFUCIspav5Ssvx9S9Tg4QfE5b6k5Qc+R1VyyYlfR+
 JCERoI10Lh89BMgNZZbWxw7Y+uPE+eQ5+to982NLZ2qFxncYbJM/rZT/ybZfAT42atae
 7CiE0FwwtqhVkMxSs5FdLiNykzibFgrF5ldkGZ619F8/RcpEiRkZZkOAsiB+se8pp183
 DeJsEWqIiEqhRNnQzwWg5NDXiStfAHkxT8x8BfxoKucHKvEf0fcCH/u4Pk8xJfe5zaPn
 jjpw==
X-Gm-Message-State: AO0yUKUDkW85pEbJD9yeQr5yqlc8g122LNW9vjHbeFN4W007GnxY6loZ
 5poKk+cXboTbrx0WSy7yGFw5VfWXqgUHPujE
X-Google-Smtp-Source: AK7set+pzXrRfSs3z0einfi2k36wJApZ5MdD4Jww7PUloWooWJszi0860987XVDgquFPEAMtyz8/7w==
X-Received: by 2002:a05:600c:3318:b0:3ea:dc39:e8b1 with SMTP id
 q24-20020a05600c331800b003eadc39e8b1mr9852560wmp.12.1677506904318; 
 Mon, 27 Feb 2023 06:08:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c350a00b003daffc2ecdesm14006493wmq.13.2023.02.27.06.08.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 077/126] hw/usb/ohci: Include missing 'sysbus.h' header
Date: Mon, 27 Feb 2023 15:01:24 +0100
Message-Id: <20230227140213.35084-68-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Avoid when including "hw/usb/hcd-ohci.h":

  hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
      SysBusDevice parent_obj;
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230203113650.78146-6-philmd@linaro.org>
---
 hw/usb/hcd-ohci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 11ac57058d..e5e6b434fd 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -21,6 +21,7 @@
 #ifndef HCD_OHCI_H
 #define HCD_OHCI_H
 
+#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "hw/usb.h"
 #include "qom/object.h"
-- 
2.38.1



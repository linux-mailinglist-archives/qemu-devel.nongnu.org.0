Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D6689C64
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:58:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUL-0002zy-6X; Fri, 03 Feb 2023 09:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUJ-0002tM-0X
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUH-0005v2-GZ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:26 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so2572075wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tt1uD8O6Jt66Hf82NoAJiGFntdTbEbmQb2viJlepOPw=;
 b=kgPcfaIRM1Z0jwoP9KgR3Gps5Yb0WSkoc3jGN/Wq7MS0k2g3zoGLbP2bbL6kxEseNI
 eKYee2vG7kVadu96kswhvzz3FoY0JTDxHVjPNxSC2KFmc4jyAK8EtujmILOqnUFkyBbg
 yWBQOFkudUIr2lxT24987h34X4X7YzfO/Js1ujK1WqKePq0kbJFHlZYe3mZHrzRkxtxz
 Q4paVYSefBUQjYKfYe/5c0QIcx0BAM/WJHWX4LUZY9g5AeFG2g2iXBgrBvE3RMrkepyM
 njpgmTmgeX7rPXRI8F7Xbuh2c5/mdbCZ2sSKxjlFTvVtJucvIWUbCRbuWnd2F261lBXi
 IEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tt1uD8O6Jt66Hf82NoAJiGFntdTbEbmQb2viJlepOPw=;
 b=T+Zl3bEtUY+lIz0sFnoTwi3HsK/A2u+mPsmBk66L8TGg2JuhOf3P1Cmxl2VeOw0iJL
 4YckgvZ3cfFhqMwVsxo9yu3Y9rSJBeVfoY5rY25wa4gftohg5rLBMCc55ZJOyyGgEC9W
 jeUlZRx9EPOTsWb3v2lYBpQu9tgVdH5xZVIuz+Hl21r742fGpVsDz7QwFsqEhbB5DEA7
 /9V6iWrQPU2930HQtP/Im6kZac2gGFwhAZeHCbXaI1qgMj3gYXPi8mRzBufL9Bsa9HXh
 /sj3G5hBTbwPks+KXSsJZDvUw3I3+ClsMkQmCV4qtJ0MLDnfsgAimd/ECA/LJPMJ4Fns
 97jQ==
X-Gm-Message-State: AO0yUKU64WKqKFo6clsLxZAJr7kHwJ6Aj4Wn/JfXOf13a3aEV9+Zozdq
 7JnNPYLlVe6XqX6378Ut60687hiUrxnDjBID
X-Google-Smtp-Source: AK7set9xi1FfhrLR0xju1AV4DdUrdok6FgSKsjoZ2Vb+fsZJeKXbTlfpvJuXQuOMNNQD2/DfYeV4pQ==
X-Received: by 2002:a05:600c:16c4:b0:3dc:16d2:ae5e with SMTP id
 l4-20020a05600c16c400b003dc16d2ae5emr9981488wmn.32.1675436184316; 
 Fri, 03 Feb 2023 06:56:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b003dfe8c4c497sm1995876wms.39.2023.02.03.06.56.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 09/15] hw/usb/hcd-ohci: Include missing 'sysbus.h' header
Date: Fri,  3 Feb 2023 15:55:30 +0100
Message-Id: <20230203145536.17585-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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



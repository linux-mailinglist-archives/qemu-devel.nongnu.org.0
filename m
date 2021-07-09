Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A643C2791
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:30:01 +0200 (CEST)
Received: from localhost ([::1]:58568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tO4-0003JG-B9
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t56-0001Wb-JQ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:24 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1t4y-0000wz-Nt
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:10:24 -0400
Received: by mail-wr1-x42a.google.com with SMTP id v5so12858390wrt.3
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6G1TjmFOce0UBb+D3g5YhN34aVbiVQHBMI6am3GYruA=;
 b=HIHrGNE0Jyhdv2qVsFTV136Wn365LGklrMRqMhAM72NWH4RZO+2o902dXYjc1zD9zG
 LRFC//v65xZelfzQfsu4+Fhj7Ba6np6HoLJ1cJqq/jjNdgK7LG/hrKN0vt3PCVQMGktr
 YPKUzihzi7eS7u3h7p1/NCBEAkLr8Xotiyu/I9iOEzXzgayDU++bTidIWOYuyBBGnPlR
 fCA07TsTw0T067GzlC+c09j55xhrSjEMdXhgxInIKWPviSz6fZSkvkforAVcoSIaOR+f
 jRvhVk97gjtBYmv8QI40l/vND8KZgZSvhMCNF/ukY0E4VYJt7d2Z8vdWD8kKQf2DAoBl
 pKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6G1TjmFOce0UBb+D3g5YhN34aVbiVQHBMI6am3GYruA=;
 b=N+UbkzRS5I05+dFWOKZbW0UV7q7paxVsi6uZC9A+zdCEFiU+HtLz2POxUeDbaX6E7u
 N5FdsgDwA6ck4fZWiF9Xa1tpY0ZuLwsdI5qpz8DW9CSuW3YFrXWjLqChmHgg6ifmTKlG
 CxvYPCZDi61Ii/jfudKAjNB6/zm70bv0H1sUHo+O32UOaEKtcpA/ZGKUrMVgrJ524Yae
 vF3QtGPb7s1lp/hC48vGu2Wrixsn6oIm6HWBL1osdQUmKwPYKz7jHQ4MRZiXOjow4KTp
 xT4zIfWPEDueXmTIwbmfTPE4kO+D85G4wPQg8THxVb5oLzKo+GcbWk9SWAoft3c+pgKZ
 qEaQ==
X-Gm-Message-State: AOAM533GVGMeilw/ZmG+tItCailf3NL3r3uiDICKo2ZwVWmnxbPJ07vB
 n5Avedt7nbyGX/N4jnQcb1COMGmyge0xZ2L2
X-Google-Smtp-Source: ABdhPJyCW4kc2Ak6DEFMnElAEW5YwBiq7Szzw3uYIOCz/ENYaD3a49vLoE93sneAqM1fKLvG86sU6Q==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr40081792wrt.251.1625847015039; 
 Fri, 09 Jul 2021 09:10:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x19sm5232277wmi.10.2021.07.09.09.10.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 09:10:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/17] hw/gpio/pl061: Document a shortcoming in our
 implementation
Date: Fri,  9 Jul 2021 17:10:00 +0100
Message-Id: <20210709161003.25874-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709161003.25874-1-peter.maydell@linaro.org>
References: <20210709161003.25874-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Luminary PL061s in the Stellaris LM3S9695 don't all have the same
reset value for GPIOPUR.  We can get away with not letting the board
configure the PUR reset value because we don't actually wire anything
up to the lines which should reset to pull-up.  Add a comment noting
this omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/gpio/pl061.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 4002ab51544..899be861cc5 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -453,6 +453,15 @@ static void pl061_enter_reset(Object *obj, ResetType type)
     trace_pl061_reset(DEVICE(s)->canonical_path);
 
     /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
+
+    /*
+     * FIXME: For the LM3S6965, not all of the PL061 instances have the
+     * same reset values for GPIOPUR, GPIOAFSEL and GPIODEN, so in theory
+     * we should allow the board to configure these via properties.
+     * In practice, we don't wire anything up to the affected GPIO lines
+     * (PB7, PC0, PC1, PC2, PC3 -- they're used for JTAG), so we can
+     * get away with this inaccuracy.
+     */
     s->data = 0;
     s->old_in_data = 0;
     s->dir = 0;
-- 
2.20.1



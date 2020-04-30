Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C81BF7ED
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 14:09:49 +0200 (CEST)
Received: from localhost ([::1]:46718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU80i-00026a-VE
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 08:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33954)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jU7jp-0003aG-7l
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 07:52:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jU7jm-0000TU-Ph
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 07:52:20 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jU7jm-0000T7-AT
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 07:52:18 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b11so6520215wrs.6
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AmiLI3uyw2TqnsUeUYVDfRNQU+o2aUltIEi9vudgVCE=;
 b=E41tsTjxbtt0t/Mjpv0/VJoO8nMtiIm46h7eCKxBpC7iC/ZuOgs8Nf/1EdQ+gueHD9
 +PoGf8YC2gK6/YUu6gxBii+UZttdhFzz6wNL9A2sOdpEPphBe3J1lC2I1GVzyuEk0oq+
 FPYmSWFP3G9K2qKuTToRt5CSkfKcZO5WEqouX4wSQ7e9B1R/Y95j4NXbiOqQEdIB+EoH
 3Wg647HVClZjm6CtdLfEN9rc209UYqTtSpoRzo+TrFkmysrdlfyxB48uLl8WNtRCdw2Q
 ss0KeaNNGqRw9C8tVpBIlXXzfrtD+abaniWuMNhwUdbjlD9C+aFRAdSU0Squr6m5b8GH
 MRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AmiLI3uyw2TqnsUeUYVDfRNQU+o2aUltIEi9vudgVCE=;
 b=FufJ/GE9emHllcqkMhP+aGyqoSn9+/FfKAC8wBWt4HJo/BRJVqEdyD8bqWg9yxhv1v
 RT+rp91oQubwWSH8rBmxzRv51NkX/ZDAeMIrp42gaMOo7rlmhghummA7dKDdie+eXJAE
 +iS5OwZe4CiuNFxPc8/dG2KRdBgpMp0hYitYYggDjsdImZkYyYxU814xZmMajQI9Om4f
 gbnmTpvtnga3WK1yk+Mi7exbiXGi7JcUu38iiYSueCD1UMhBQ+EdEmjYuyAkZyhulIJm
 E9pNMxKKvT7l2IEjr+TKc5Oa8iAfIh5W1nSFJEErReK8yr/wOxPKZ0n0OVlfVbamn8hX
 CAPg==
X-Gm-Message-State: AGi0PuYQNIZBgJ/TFa22anwBSQb2P1R9xmvXLm7YI0MhAPf45PrW1giK
 ftkduZtY1hgu6/0M7/zxzfTq8RUJsTk5RQ==
X-Google-Smtp-Source: APiQypI7wUx+x7vBsc/AW17rvK9l7hEFkvrGRC4tlN3TSiWnMKe87PdDeKuUoYUcvVOXLuoP+VHxeQ==
X-Received: by 2002:adf:e944:: with SMTP id m4mr3452919wrn.366.1588247536580; 
 Thu, 30 Apr 2020 04:52:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j22sm491518wre.84.2020.04.30.04.52.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 04:52:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/31] device_tree: Constify compat in qemu_fdt_node_path()
Date: Thu, 30 Apr 2020 12:51:40 +0100
Message-Id: <20200430115142.13430-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430115142.13430-1-peter.maydell@linaro.org>
References: <20200430115142.13430-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::42a
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

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Make compat in qemu_fdt_node_path() const char *.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20200423121114.4274-3-edgar.iglesias@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/device_tree.h | 2 +-
 device_tree.c                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
index 7c53ef76345..982c89345f8 100644
--- a/include/sysemu/device_tree.h
+++ b/include/sysemu/device_tree.h
@@ -43,7 +43,7 @@ void *load_device_tree_from_sysfs(void);
  * @name may be NULL to wildcard names and only match compatibility
  * strings.
  */
-char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+char **qemu_fdt_node_path(void *fdt, const char *name, const char *compat,
                           Error **errp);
 
 /**
diff --git a/device_tree.c b/device_tree.c
index f5b4699aedb..b335dae7075 100644
--- a/device_tree.c
+++ b/device_tree.c
@@ -291,7 +291,7 @@ char **qemu_fdt_node_unit_path(void *fdt, const char *name, Error **errp)
     return path_array;
 }
 
-char **qemu_fdt_node_path(void *fdt, const char *name, char *compat,
+char **qemu_fdt_node_path(void *fdt, const char *name, const char *compat,
                           Error **errp)
 {
     int offset, len, ret;
-- 
2.20.1



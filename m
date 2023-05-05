Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFC6F86DA
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 18:36:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puyOz-0000c4-P3; Fri, 05 May 2023 12:35:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOo-0000ZC-MD; Fri, 05 May 2023 12:35:15 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puyOh-00055p-Vu; Fri, 05 May 2023 12:35:12 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-6a5f7d10dd5so1364167a34.0; 
 Fri, 05 May 2023 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683304506; x=1685896506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYUGzxH80qMCTSOOXwriMGyo86X2j1XLCmtgpmq1JFw=;
 b=RR5gXuJ5/YThc6rouAYq+yFF8dEf4NGe2QzEi1RxrwVx3Ew07jco0wD0v4akrpS6G8
 Xl1mgTQuHx3VWPua3Q4ZoOorSWVtHoQ5WTUljwo6u5NA++NdpwA6FRpWtGgpFsB1AzYQ
 C2YBTLGSwlhzB8qVU86gKVwx1PvJq8PDPGDJ4GO0Pb3RCmnIpHdpyt1DHR/giO76AAJu
 CsAekleAh8maYPXslzziCXcMJ02Yj73B3opLdTi9N7KL+Vpz9Hugt+Be883qPsWpvYAT
 jKY5weAFZet76JWOpL4t+DflUIXR9J+3WJlAkCJvwaizkjA3C6wjk1MGGwKA3k95Te4m
 +w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683304506; x=1685896506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYUGzxH80qMCTSOOXwriMGyo86X2j1XLCmtgpmq1JFw=;
 b=Ggc0NyBKy1Fvj8ZclQ6WWtVZ6+pDXigSrp6uRK+IHRuRrsxwJWBVfRh2CEVhvsvLdo
 IERS60im0D++r8uOQxo3gtbq6pKaHfBnyN1U2HWbqLDjKXv+7TfLRiAdOJyMHgfgM3Og
 oKOPtRfh6q38dJ89nk7UeSTqWwMZa4gxWSplgW6yQp0dk9PD3qKEpeHZ6k7YmnNPAN5W
 wurJoGH0TPiGU1N1YbQKXj4L/HfBAhA0mZ0KijoooF3jyeFIAiVbXjz9p0gwN+nDXbj6
 TlOLNY0aSx97UgOW2TL6UkFyj7oUunQIfjnQYs7qxpIjed4K/zzkJINNCd2/7/v5HyDM
 ySPQ==
X-Gm-Message-State: AC+VfDwSESI+hKsH8EIKLyr43xxNmYSKSfJBVE+znL9J8nwTnj3gUwIo
 YN/5el2PQ/ygXy2pokQbXOIb/A7GBAY=
X-Google-Smtp-Source: ACHHUZ7X1Qi+CtA08psAXiqup4aAtdxY1sAK9+ot3R2XVO95H96VNLFhAgP4xy1IM0IDHHof/DBIjw==
X-Received: by 2002:a05:6830:1501:b0:6a7:c44a:ddd6 with SMTP id
 k1-20020a056830150100b006a7c44addd6mr1004435otp.11.1683304506338; 
 Fri, 05 May 2023 09:35:06 -0700 (PDT)
Received: from grind.. (189-46-207-53.dsl.telesp.net.br. [189.46.207.53])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a9d62c3000000b006a43519523fsm1033475otk.1.2023.05.05.09.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 09:35:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 6/6] hw/ppc/Kconfig: NVDIMM is a hard requirement for the
 pseries machine
Date: Fri,  5 May 2023 13:34:44 -0300
Message-Id: <20230505163444.347006-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505163444.347006-1-danielhb413@gmail.com>
References: <20230505163444.347006-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Thomas Huth <thuth@redhat.com>

When building QEMU with "--without-default-devices", the pseries
machine fails to start even when running with the --nodefaults option:

 $ ./qemu-system-ppc64 --nodefaults -M pseries
 Type 'spapr-nvdimm' is missing its parent 'nvdimm'
 Aborted (core dumped)

Looks like NVDIMM is a hard requirement for this machine nowadays.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20230504180521.220404-1-thuth@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index c898021b5f..a689d9b219 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -3,7 +3,7 @@ config PSERIES
     imply PCI_DEVICES
     imply TEST_DEVICES
     imply VIRTIO_VGA
-    imply NVDIMM
+    select NVDIMM
     select DIMM
     select PCI
     select SPAPR_VSCSI
-- 
2.40.1



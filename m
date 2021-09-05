Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7419340109F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 17:42:31 +0200 (CEST)
Received: from localhost ([::1]:58508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMuHu-0004OV-4x
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 11:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMuGa-0003hI-Jk
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 11:41:08 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mMuGQ-0007FM-HS
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 11:41:08 -0400
Received: by mail-pg1-x534.google.com with SMTP id q68so4139216pga.9
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 08:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/draRrlsHwKNaAs29yyB8blTCojrQ8KUBKsAfXko00=;
 b=VM9U0rgjoEiHmCtiZ1m6BGGIkjMlkMcIMmYoSxY9euvzAirx3HEWx97bFFzGecmou1
 6Ti4FhPYwk4lEiR5S1v9iHAZ1RMyz7inHbql9XODOV/llGSsG+Swc8VCVJBdbe59XmR5
 K2w4cjc0cC/pAfyYyCiJWQ+2nnmIcee+EBthKjPXaTj7+XjBGRa9zgMYWrBmHgAEC0BE
 ZMx2rptuNw51dwQpLyORng/9J0hwXd4yAr6J5YtzdPHW5OUYMWZ8BicYmLnirGjq6c29
 F/wWQlmBFeuzMaii6fdt84uH5UhuiCubI2H6ZbBbU3eJiBxHCd7rIysC/cx9unECDMLn
 v3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/draRrlsHwKNaAs29yyB8blTCojrQ8KUBKsAfXko00=;
 b=inEEWjTNlcZB/chrUiyR+QG2YXA9gxisMwvuw44fNjrwW271g5HW9knL81h9+5mGdp
 o8vseiurwJ/LkvfvhaKYCbjEc0orOLylrbChYC/zpfN/PqcVa5XcQzCOOfI2NxFpSdb5
 kcFuwHIyyg2ZN4eeZvI8YAofnH04RgkSWiVie++J6VAn/wJr7DDgb4KYmlEn+vNYJyZA
 n+VljscYiSn5p8pmbPgL2QgZo7ZpAK74LVsp6aR6gugw6wJHIm00ZY2HGvZTS9K0Tauq
 g/fIUNdckGL2RvNBMbw1+SrVQNpGgcS3GFqaEznLMRBy5jUr8N2Mr589H+7u05aMdr1F
 dCwg==
X-Gm-Message-State: AOAM530fgeiGmeypBujMw8incEnxlFfQ4rTeLMVCBDK8wNdfISH6ntrK
 LX0vWkew6wHhiYDseQNlgOw=
X-Google-Smtp-Source: ABdhPJxGkL6OxQUJsy/A6Aslpk/JSbOVEvuFQ+1wuDmQVXPz869lTmhmWKfO8y38A/MSTuO2IUTa4A==
X-Received: by 2002:a05:6a00:1750:b0:40c:f3b8:dc76 with SMTP id
 j16-20020a056a00175000b0040cf3b8dc76mr8022076pfc.22.1630856457112; 
 Sun, 05 Sep 2021 08:40:57 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y4sm4916906pjw.57.2021.09.05.08.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 08:40:56 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH] softmmu/memory: Validate {read,
 write}_with_attrs before calling
Date: Sun,  5 Sep 2021 23:40:49 +0800
Message-Id: <20210905154049.7992-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

{read,write}_with_attrs might be missing, and the codes currently do
not validate them before calling, which will cause segment fault.

Fixes: 62a0db942dec ("memory: Remove old_mmio accessors")
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 softmmu/memory.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfedaf9c4d..b97ffd4ba7 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1426,12 +1426,14 @@ static MemTxResult memory_region_dispatch_read1(MemoryRegion *mr,
                                          mr->ops->impl.max_access_size,
                                          memory_region_read_accessor,
                                          mr, attrs);
-    } else {
+    } else if (mr->ops->read_with_attrs) {
         return access_with_adjusted_size(addr, pval, size,
                                          mr->ops->impl.min_access_size,
                                          mr->ops->impl.max_access_size,
                                          memory_region_read_with_attrs_accessor,
                                          mr, attrs);
+    } else {
+        return MEMTX_ERROR;
     }
 }
 
@@ -1506,13 +1508,15 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
                                          mr->ops->impl.max_access_size,
                                          memory_region_write_accessor, mr,
                                          attrs);
-    } else {
+    } else if (mr->ops->write_with_attrs) {
         return
             access_with_adjusted_size(addr, &data, size,
                                       mr->ops->impl.min_access_size,
                                       mr->ops->impl.max_access_size,
                                       memory_region_write_with_attrs_accessor,
                                       mr, attrs);
+    } else {
+        return MEMTX_ERROR;
     }
 }
 
-- 
2.25.1



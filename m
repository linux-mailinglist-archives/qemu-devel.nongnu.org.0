Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD96576BF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:05:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAW7Q-0005MU-Nk; Wed, 28 Dec 2022 08:05:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAW6x-0005KD-Az
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:04:51 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAW6u-0002JU-6r
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:04:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d4so6900005wrw.6
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 05:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J11etKy1I+eD1ZxYBXlK61HtI3MDE9eu0yS0RM5yA44=;
 b=ZCFsDORq/unrNsJDI1vegAbZXKMgvZ1by2Mnh7laqYUXMuiCBXLRPGxZcckDtA2uBW
 Y+mfZvQx3+qOwU1JqNUQVBQa6aPHi590h4wDRKC95vJykYwh24YtfTx3Mv3f8MFE0oOT
 eMt7GSXHOYKAUiLIkS0B9wIT8hm/1t3CL5tCbvkHsj/lHgR8PnUSI7ygz4fCriObjl01
 8hMPMRWzySzo7OYMF6oH7lVmTUif9b8XXP7kMN20Ydj8yDyOGt5i79Q/vRHMdc3MS04F
 V6Ypd6hOY6otIP3vPNMkVGtsbOliSLZcQAoOgCd7dcdysHTGgyCrOTuuPLlWm1uLimFO
 9DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J11etKy1I+eD1ZxYBXlK61HtI3MDE9eu0yS0RM5yA44=;
 b=3zqbv+9YaHNOU7Vd7x0oOZuj28zdeL1e3SGyZBRXmdGRkblO5vRBuMCjjaVSf5z+IB
 4rvbH6LftMPHnlUEdCtYrDdCaJCknLvEuzVihBUD8EJn8MuOsKdshu36IG8hfhgGmDU1
 zQR8GtrF5UOl/g15iFgVFMNHhgyocQVZukP5oJZoOeTU9VzdX0GMqcLVmmdrVEn2u5HX
 79i9ADcewCPGg7LMKBog4LBZRn8vx9KdfQU+9kzt1tf9Ve3FD4LI04nLLdkNMyptaOfc
 NduTujV+6om9Id9ZlAcAodOa/xMAzP9Ln2tEpqvhUvgSYOel9B2XJUsU3JNv05kbtqVr
 i5uA==
X-Gm-Message-State: AFqh2kpSuNltVdVhNiqr2bUd8bR9uXmhW+TQsvCdHfpZV/JDdFLfUpNt
 6Xwl/9Go6Ztc7sAq5rEwwe2vZZWyxKApcxQg
X-Google-Smtp-Source: AMrXdXsQpv+bhPNA33i/6X+zPcOUNzSi932oBgGtTwxBm0h8b5EQWTfJDZOamk1kGHQSAdnpi/ngGA==
X-Received: by 2002:a5d:43c7:0:b0:26b:c52e:f7c7 with SMTP id
 v7-20020a5d43c7000000b0026bc52ef7c7mr19673387wrr.29.1672232681669; 
 Wed, 28 Dec 2022 05:04:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v7-20020adfe287000000b00241bd177f89sm15323279wri.14.2022.12.28.05.04.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Dec 2022 05:04:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] memory: Do not print MR priority in flatview HMP output
Date: Wed, 28 Dec 2022 14:04:39 +0100
Message-Id: <20221228130439.80341-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

When requesting the flatview output with 'info mtree -f',
the MemoryRegion priority is irrelevant and noise. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/memory.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index e05332d07f..89713dd5ce 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3330,22 +3330,20 @@ static void mtree_print_flatview(gpointer key, gpointer value,
         mr = range->mr;
         if (range->offset_in_region) {
             qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s @" TARGET_FMT_plx,
+                        " (%s%s): %s @" TARGET_FMT_plx,
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
-                        mr->priority,
                         range->nonvolatile ? "nv-" : "",
                         range->readonly ? "rom" : memory_region_type(mr),
                         memory_region_name(mr),
                         range->offset_in_region);
         } else {
             qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s",
+                        " (%s%s): %s",
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
-                        mr->priority,
                         range->nonvolatile ? "nv-" : "",
                         range->readonly ? "rom" : memory_region_type(mr),
                         memory_region_name(mr));
-- 
2.38.1



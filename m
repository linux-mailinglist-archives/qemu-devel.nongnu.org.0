Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984DF3F8CE9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:25:13 +0200 (CEST)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ7j-0007i2-Lk
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImw-00060d-S2
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:41684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImv-00005N-5d
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:38 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so2677571wma.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uBfKuvC9vU4hge2NlBpeQ1rXhY8CEOUWhY6VAa6lKr8=;
 b=VRXpm+/bujLAHl3N0mlFnpR09gEOsygHWtImjA1PAhWHsPXb3n9ua1gQ5nZrAjddYT
 HRyik5gtecTGbbdBMgrkS2v/cQAMTDTF61HQz4nVMrCFPkOL0L2gBje4bXd338WbCnWH
 iYuGCVTmgZ8sH9aVoPQwE8vA25lIAF0hdcVyVcAvgx5zvqWh+IGNGOoD01UIUmGIVMoa
 7T4lv07FWgFy0JNBeJimv2wiOUsUJMQkZCB9yVE2sCOhDtwMBR0pMEIUMLc0pKKqquwF
 xMH1fKaY68d+dwuqbeQ+Hh0YmgGoHRWIeFhNb9NFxC5aO2PwyKpPm53Hk+uCpnx84Tp9
 P0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uBfKuvC9vU4hge2NlBpeQ1rXhY8CEOUWhY6VAa6lKr8=;
 b=n/ToynBAv9p0S1l5ZoQR5XNlDc3oonA3aBGh90C55o/9HqKXW1wVh55FUSqt0vctDe
 PsIezwZXTGL4x4mQM3/oaOw7ceZ6TctX3vWePaMQsbKOYWc1Kvg9kRkruE8F2liOPER6
 BiW1vc6AkcxCLPxwXKfhpg8He1rrJtHYYiMpFdYW7lQv35a2sT48djkzb5TNkymQn2Dt
 dxqt5fhyLr/cJar0P4V0fbWm6+giEkCN5P9u5sKDS3qA571Jf/+kJECq1wYLnmI9IgzJ
 eZ42700dN8kHg8fJFFr/vtcF13lzb4KUqzhRf/moKsElpUf8lH1+9XjmZz19pRl3b/YT
 /wtg==
X-Gm-Message-State: AOAM531fKXg7TkOpqGnsRz5EllFiuCdgx45AY0RKCFJ3LQsSQ2HuwOz7
 3GIGIwFVMKyxEugXT4W3m1HIRR1uu4MwYQ==
X-Google-Smtp-Source: ABdhPJyxCGTKY5n4hdEPSlE47hxakcYoU72Kus+VQp/wTS6+qs1KrBcgIHWRav8dQb473CKtQ65ujQ==
X-Received: by 2002:a1c:1c2:: with SMTP id 185mr4629806wmb.11.1629997415758;
 Thu, 26 Aug 2021 10:03:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/37] softmmu/physmem.c: Check return value from realpath()
Date: Thu, 26 Aug 2021 18:02:55 +0100
Message-Id: <20210826170307.27733-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

The realpath() function can return NULL on error, so we need to check
for it to avoid crashing when we try to strstr() into it.
This can happen if we run out of memory, or if /sys/ is not mounted,
among other situations.

Fixes: Coverity 1459913, 1460474
Fixes: ce317be98db0 ("exec: fetch the alignment of Linux devdax pmem character device nodes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-id: 20210812151525.31456-1-peter.maydell@linaro.org
---
 softmmu/physmem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 31baf3a8877..23e77cb7715 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1451,6 +1451,9 @@ static int64_t get_file_align(int fd)
         path = g_strdup_printf("/sys/dev/char/%d:%d",
                     major(st.st_rdev), minor(st.st_rdev));
         rpath = realpath(path, NULL);
+        if (!rpath) {
+            return -errno;
+        }
 
         rc = daxctl_new(&ctx);
         if (rc) {
-- 
2.20.1



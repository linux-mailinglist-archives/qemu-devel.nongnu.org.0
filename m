Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BEC48E1D4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 01:56:59 +0100 (CET)
Received: from localhost ([::1]:45998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Atm-0005aD-31
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 19:56:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8AhQ-0002vt-Vy
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 19:44:13 -0500
Received: from [2a00:1450:4864:20::42a] (port=36782
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8AhP-0007R1-96
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 19:44:12 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r28so13096866wrc.3
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 16:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KNFirWGngv7fdeuZsucp5CU8AXZV7k6EpjsRRJqMZVs=;
 b=VUfrFgg3C4tXxT21Km+8oDJD0tvAooIohduZtTTpQ7CAhP8lyhuZR2+hDXdiqwh75l
 +vyq4C2sc9yKQ1XnRF7ulf6qjkInejxmAhJU9CY/udNuzjR+IsOWf2pBVivkqHuY3q3l
 7NABIFe1nMwxBkbUesJSATY5nzx1uPBNVK7hae0mDx9LyK7VLwF/jSXYkKnV4OOfRKK4
 kemZ9ivLn459EvOXRHmyr3KjPn17051qKDmsBIJxJ8RYO5yhHALoUocBya6rAxxrc01+
 xnut4SDQe7WnkQ7UKsOMSlnbuBwhTY55tYTjMNelM16LPrxC+o4BPgay/MMA0enxK2Lt
 dPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KNFirWGngv7fdeuZsucp5CU8AXZV7k6EpjsRRJqMZVs=;
 b=y4TbhdZNWlgGm5x1cAw99pHGdhacBA3epourbLQmzMMHaf4siO4+w/bW33J1SxHAA5
 k8rfWV2R/VhPEj12PZ78hjK5KOF+cn7bGvhd8B+9BaRxgJWpB/6OeeZ8122MwN8pfM+R
 obTnC+sDwhTUK4yk3T1XElWlfNQy6RfXiLDCZ7G60dpuBUHcm3ZOGr1kKrRuKxudH0JA
 qrMGlsXselmau5cd5O7J5TsQwTAbmwvY4BZj+46560VOyJYjRe8ydkFXrQg0hJ4EaQ0S
 pZ534rgl3+3xlLeYto285G5g4mgclu9NrMLiEpCqAycwByf7jOcg5IBkgUHSL8Stn+ds
 Ls2Q==
X-Gm-Message-State: AOAM531kdzb1fqT8y8eZH4lhvP6y8LZKty19VgGx8ctARPeI9BOJTbGl
 kgCugbzSRnHJL0GQbI5FOtSudoCm0qY=
X-Google-Smtp-Source: ABdhPJyPYZ1dRZ2OwvXhHf22yFgAej3MkPZdhqLsQgBh+ch5dzSvBLvRNRYUvcPr4rUxdi4FHOhgbw==
X-Received: by 2002:a5d:4841:: with SMTP id n1mr6065483wrs.620.1642121048863; 
 Thu, 13 Jan 2022 16:44:08 -0800 (PST)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-176-122-157.red.bezeqint.net. [79.176.122.157])
 by smtp.gmail.com with ESMTPSA id b6sm4230513wri.56.2022.01.13.16.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 16:44:08 -0800 (PST)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] softmmu/cpus: Check if the cpu work list is empty
 atomically
Date: Fri, 14 Jan 2022 02:43:57 +0200
Message-Id: <20220114004358.299534-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, Idan Horowitz <idan.horowitz@gmail.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of taking the lock of the cpu work list in order to check if it's
empty, we can just read the head pointer atomically. This decreases
cpu_work_list_empty's share from 5% to 1.3% in a profile of icount-enabled
aarch64-softmmu.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 softmmu/cpus.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 23bca46b07..035395ae13 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -73,12 +73,7 @@ bool cpu_is_stopped(CPUState *cpu)
 
 bool cpu_work_list_empty(CPUState *cpu)
 {
-    bool ret;
-
-    qemu_mutex_lock(&cpu->work_mutex);
-    ret = QSIMPLEQ_EMPTY(&cpu->work_list);
-    qemu_mutex_unlock(&cpu->work_mutex);
-    return ret;
+    return QSIMPLEQ_EMPTY_ATOMIC(&cpu->work_list);
 }
 
 bool cpu_thread_is_idle(CPUState *cpu)
-- 
2.34.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A3418B82
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:35:03 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcje-0005ta-KM
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccS-0000am-70
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUccQ-0005Gl-QH
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:27:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d6so46333312wrc.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q67ayF6mp3x5mowVghP1HWubdfr0XK9yIREcYkI/kjw=;
 b=gVJfOEkXTSUsxNlhV1JRo+YQwIVWWBBbogwpBC2yysQk8bL5nQchQhF4IG1Tvo4ij4
 bEdD3LGt93PTBYsZu4n3E447UKXdm/KcPKMjX2mQhwy1BsU7vsltd9W+7GPC46sr4hdo
 l6DFlh1D3wGBylUYnvvPVJ040MfhdlWLcau7O+XIBEleaoenq8FyUuTR3etd3Xi/TYhu
 coP1LOtcIIwBDzVrPnuOEDqyrr17qhjQAlFKeyLn71uUvoKbppRv0hEj/zwnd4IQKOvi
 blHUhfnVp3z1CmQvLlF3ViUAu8rLx9mKE4bfzWAuC5BTNUsvj4DBasKhCdLA/GBkgekQ
 WQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Q67ayF6mp3x5mowVghP1HWubdfr0XK9yIREcYkI/kjw=;
 b=DDHtnB+z6isUjmepYyJVqSHlAf7mGUhqGPkS/Vws0A8PruM7wzmL9YmFhVDDagx3it
 xmacTCfg5l/ArJGyULv2NC36qd9VgAdJ/sRhK/a13A2otqBT8TkQzv7LbmIj+Nbxbezt
 dDgxGZDZ2oZ0SWBC0vDbnxzAwvKalvjapaRHlzo+VffGC20CTEIFdxzW/eWxI2T3COAk
 nKJOu6MiyWieTVyjyOXb97vb2e77mFmNze5tnafncbiaSxFKpnbXJO32Dm3jCxIaQWbX
 tulMnKuVhpLcSfhL2Dsah7ifgV1pxhnUt4XgTEvwgMJk413MLMqv03BYCVRTb9zZyBYQ
 daKA==
X-Gm-Message-State: AOAM533yRZBLcR6mruHZgPOawN2Rv02W66OX571cZK6Sw3fCc6QjpCYG
 SAoAvGUn4Gr9nfK2BdXvJL8S03QaK18=
X-Google-Smtp-Source: ABdhPJz72EI171N6YHxQ5n9FwI45sOtdylh9CkpZmwOPSAtw2PcS1dLdpQl28jSmJsD+Zix320HF4g==
X-Received: by 2002:a1c:19c6:: with SMTP id 189mr10041556wmz.121.1632695253233; 
 Sun, 26 Sep 2021 15:27:33 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 20sm20499191wme.46.2021.09.26.15.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:27:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/40] hw/core: Un-inline cpu_has_work()
Date: Mon, 27 Sep 2021 00:26:39 +0200
Message-Id: <20210926222716.1732932-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to make cpu_has_work() per-accelerator. Only declare its
prototype and move its definition to softmmu/cpus.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +-------
 softmmu/cpus.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2bd563e221f..e2dd171a13f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -546,13 +546,7 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
  *
  * Returns: %true if the CPU has work, %false otherwise.
  */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
+bool cpu_has_work(CPUState *cpu);
 
 /**
  * cpu_get_phys_page_attrs_debug:
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 646326b24fd..6a05860f7fe 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -251,6 +251,14 @@ void cpu_interrupt(CPUState *cpu, int mask)
     }
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 static int do_vm_stop(RunState state, bool send_stop)
 {
     int ret = 0;
-- 
2.31.1



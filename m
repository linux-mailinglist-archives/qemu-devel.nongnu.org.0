Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D145623AF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:58:46 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70JJ-0000f6-DV
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704K-0004Rx-3A; Thu, 30 Jun 2022 15:43:22 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:45028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704H-0006EF-UH; Thu, 30 Jun 2022 15:43:15 -0400
Received: by mail-oi1-x233.google.com with SMTP id h65so606324oia.11;
 Thu, 30 Jun 2022 12:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P8HTBug/BrxsxU3MmDdqiWcYw9YTVPuLaNnZJgqOZMs=;
 b=fuSjwgJjE49ymHo9R4gzlGrt4BO4uj7c8mH0ioOG6CORIcQRK0B0JINLYZrAKqyzxu
 CDI4gkVdF8wqPM7XTXA+0BCDntapl6XnzJqpjCV5k01RrcJRQUD2fCrEZeDsjppnI634
 Et7WYI5ei5J71d9SPR071ax22dAELLIEs1FXtV0LEZfWyEvqVgkBsVgQ+TSTV0qlix2O
 iiDDWiCbb+47YRtfFf6vexpUGvAhav3pHdblGQHwR0ElBZOiQWLrxaj0MrxOHlZCkUKe
 YLcy64TilBEEAhZRZnBe+KaO66NTRj5O5RuHMRNT9Y0DqVsS/yG3eKURBClAwKPjaYAc
 sTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P8HTBug/BrxsxU3MmDdqiWcYw9YTVPuLaNnZJgqOZMs=;
 b=LYv2J+wzGPfxd05ciqaLSqvwq8TWT3FLVrGT6mRpmqaJaHGmzHLj7cv2zxLcdL73Cf
 KZMQ4x0IxXmAG2tBIg/m2/IqSeQs3SkYEI7sXw+E5JX1lYM5Go+NRihu/xvhth8BqX99
 KpyjBoVw9q1mvuCTAd6MxdV+mXuNT1fF+rQxYnzVJESA1nPdeg98uvsn5d4cJ+2sUYQD
 wbXgvUOIM53mxaTkZSzHttydWkcsVjufiMR5VGiMF/4jqdHTDeBFdASEFQQ/6EUT/R/N
 mS0S1d8XiLsnRgTh6uiFCj+cO52fDf9Ezy76SC99mF1+OR7TvmOQ0lGn6KwIQ4Wckd/i
 Fv8A==
X-Gm-Message-State: AJIora+gPCLAk8+PexlWuQ/ZdtytNwLzjlpe186gZJBVNWiN4/5Fj8C2
 HqTCAS8MwiC8H0382QSFiaCHFiXjHI4=
X-Google-Smtp-Source: AGRyM1u3jWuMiP6HMUlZlp21uvOI5tP6cli4C5CPfvUC0Ne/D8uF3s/RRTh2b57O61q21Y0DQBEAzQ==
X-Received: by 2002:a05:6808:1644:b0:2f7:4de5:3c53 with SMTP id
 az4-20020a056808164400b002f74de53c53mr7481846oib.225.1656618189869; 
 Thu, 30 Jun 2022 12:43:09 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 1/9] target/ppc/kvm.c: do not return -1 on uint64_t return
Date: Thu, 30 Jun 2022 16:42:41 -0300
Message-Id: <20220630194249.886747-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvmppc_read_int_dt() and kvmppc_read_int_cpu_dt() return an uint64_t,
while returning -1 when an error occurs. kvmppc_read_int_cpu_dt() claims
that it will return 0 if anything wrong happens, but it's returning -1
if kmvppc_find_cpu_dt() fails.

The elephant in the room is that returning -1 while claiming that the
return is uint64_t, results in 18446744073709551615 for the callers.
This reason alone is enough to not return -1 under these circunstances.

We'll still have the problem of having to deal with a '0' return that
might, or might not be, an error. We'll make this distintion clear in
the next patches.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 6eed466f80..109823136d 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1907,7 +1907,7 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
     f = fopen(filename, "rb");
     if (!f) {
-        return -1;
+        return 0;
     }
 
     len = fread(&u, 1, sizeof(u), f);
@@ -1934,7 +1934,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
     uint64_t val;
 
     if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
-        return -1;
+        return 0;
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-- 
2.36.1



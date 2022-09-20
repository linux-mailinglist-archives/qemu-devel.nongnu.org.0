Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19065BF1D1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:13:42 +0200 (CEST)
Received: from localhost ([::1]:40076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanN0-0007om-0s
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8x-0001Sh-SS; Tue, 20 Sep 2022 15:42:58 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:35768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oaj8t-0001qN-MW; Tue, 20 Sep 2022 15:42:54 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1225219ee46so5847719fac.2; 
 Tue, 20 Sep 2022 12:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=E1ZW3R369fl4sNndujbvRpTTimpZscgn50GpfMEXvxI=;
 b=Yif32ayi3OuIYZVthtXXRE6ZuDrGYKLp1r8ImMw54g2GP1i5AANfGQ+VEP7CdRIxZS
 OFN1RvsNJwiRpi6FFkQIsCI+ZxWIg5lDKQGg1y1n0corHB9b8AovP42iWDZ/b+TqNhlC
 yUH/jh53IWvqChG6feLSsdU7ZKHMTWswssmaaVJ9W7NlpMd6qQxbpbEQ/EaAbHYrEBvv
 SY1D5N2JYseUzXW8osY8YaWUunocLRfzGEawUivDBr+ElnPhg9jvYd0d5qKCw1sLgefv
 c0zPBWlAxdOsaIobslK2jQVRFffq3pOY4RxyQ66+2E9vAK8b/96gNkHNdGEHrr5QQUQW
 v7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=E1ZW3R369fl4sNndujbvRpTTimpZscgn50GpfMEXvxI=;
 b=6CouD7NSIUxuf2HGsyqfkjE2gAIrR4NmJcRvPddDYXkpbrJ20gbzQWN+A85WmNMNLo
 rt/FaNMEjyCCvdyj5cSfxq2k0EzlsNAT3FEkA+ECMC3+XwO0rPHFX+W8Law3nzNvmiHa
 Hj3NCAQjqbVWrBJk/mvRGHufLTSeSyW86elfujv43ZNZkVuZdG3yYXmHThf8wLPZB3OZ
 yNKDmUXrVUzkQklKiaQ+0BOKkPO9Mc2FKIwvWuar9sNNoBxtSv8A9TxGA7JDUlISuRgz
 Lh6hmLPJl0fcES/eSw3rcJXFpa7wUBZu7LGKCqGFiqlLB5phjCmrw6/wPM9Sk83HYUK5
 dHxA==
X-Gm-Message-State: ACrzQf13GtUXKGWBAIkCtV0IKoz7YBoZ9Gtltz0kvnYmOQb4TAAMvhLA
 UturA4NgYMFF26RN0kVDMbWGzkK/I6s=
X-Google-Smtp-Source: AMsMyM6goOJV4ROKHQvFY9nOq4HJpF26/j+BVK7ulM9YpVtU41DkHrOjkhtmKsNqyAbccKwOSey+BA==
X-Received: by 2002:a05:6870:9107:b0:12c:e448:c5fd with SMTP id
 o7-20020a056870910700b0012ce448c5fdmr2969373oae.55.1663702970042; 
 Tue, 20 Sep 2022 12:42:50 -0700 (PDT)
Received: from balboa.COMFAST ([191.193.2.69])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05687023a100b0012763819bcasm333808oap.50.2022.09.20.12.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:42:49 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 15/17] hw/ppc: spapr: Use qemu_vfree() to free spapr->htab
Date: Tue, 20 Sep 2022 16:42:00 -0300
Message-Id: <20220920194202.82615-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920194202.82615-1-danielhb413@gmail.com>
References: <20220920194202.82615-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

spapr->htab is allocated by qemu_memalign(), hence we should use
qemu_vfree() to free it.

Fixes: c5f54f3e31bf ("pseries: Move hash page table allocation to reset time")
Fixes: b4db54132ffe ("target/ppc: Implement H_REGISTER_PROCESS_TABLE H_CALL"")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220920103159.1865256-28-bmeng.cn@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index fb790b61e4..cc1adc23fa 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1522,7 +1522,7 @@ int spapr_hpt_shift_for_ramsize(uint64_t ramsize)
 
 void spapr_free_hpt(SpaprMachineState *spapr)
 {
-    g_free(spapr->htab);
+    qemu_vfree(spapr->htab);
     spapr->htab = NULL;
     spapr->htab_shift = 0;
     close_htab_fd(spapr);
-- 
2.37.3



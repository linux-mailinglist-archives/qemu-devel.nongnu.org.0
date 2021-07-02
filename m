Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29343B9E2F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:26:17 +0200 (CEST)
Received: from localhost ([::1]:47948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFRA-0005P8-TL
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzFPE-0003oO-8e
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:16 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzFP8-0001A3-4e
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:16 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t3so12293292edt.12
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vs6xGmFtIxeiFa0NgcEkYzo+laYD6q/ErIurkynJ+bo=;
 b=HFPeSlDxGn5HFkBZNgc7Iu10dlRjlYjMHa0sKyqzd+kjioYVIlENlRM6hTPkqSx6xH
 /bCwK1UJpp3qSGg3SJddoFzG+CRN9CYUmbc7aHM6lmSymQy5b0B4kXJ9LodJXtZREy8E
 3jaxEOqqxmJWmNPPhY43w4S3Y8zIzZ7nP5Wtez6P1Gl+czv+B9qWSFW1o9HnSQWohQfi
 RmipSDkWMZoLzpOezAoaf1gMwZKmRTlx+uce9MTXRb+k/FMCdZ/fvDiMSjgCTAjhQSWa
 gTYnyDmaTtieF43MxZEw70ARurQgcjblqGgWtf1ZL3QerUpZEVBayPyBuDYVhujUH6b3
 CeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vs6xGmFtIxeiFa0NgcEkYzo+laYD6q/ErIurkynJ+bo=;
 b=malMGL3YTqDId1luYuSl3oblj5ZY9kKEI4EpvDOpBtI4FapQvS5/iwo/U7dD8qHNCm
 dabJJhd9hahv8eAPygr5OwhSc5VeryMedkPt1r9g/LPNfEzqOURYfw9b9rNb2E237ahL
 uOXeVEaVQGrxENAhHUXilX+nlju3TzNHafN3bz0ptucOgiQHEOP2jizEblaI+QijbPEW
 tls6/84gstFd6G1aaEya4G/iwr15JrLSTJJjFu8kZT5FSavuLnPD80vg1R0LMGgSoY2g
 CkLSOXmEINwnMmPctALPN01c9KYjkpkWywkRZzNgxRRNF8eP4P0WtNU/vqXSv7/uXJwH
 nf0g==
X-Gm-Message-State: AOAM532wvjQV4IK4KOjjksYobPkfrILQmq4NEzBEWTFJtLWreP4TQCpp
 9z66MgIEoSc78nd4PWdmBDo=
X-Google-Smtp-Source: ABdhPJxOsGylIyB25MGHx6fqpbeD7RkwqcsvsfSgftDyMND6QJNYJREtvxs9n5QVvkZVYiClJbBodA==
X-Received: by 2002:a05:6402:d2:: with SMTP id
 i18mr5461719edu.276.1625217848766; 
 Fri, 02 Jul 2021 02:24:08 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id c18sm1035623edt.18.2021.07.02.02.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:08 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] hw/net: e1000e: Don't zero out the VLAN tag in the
 legacy RX descriptor
Date: Fri,  2 Jul 2021 17:24:27 +0800
Message-Id: <20210702092427.1323667-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702092427.1323667-1-bmeng.cn@gmail.com>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christina Wang <christina.wang@windriver.com>

In the legacy RX descriptor mode, VLAN tag was saved to d->special
by e1000e_build_rx_metadata() in e1000e_write_lgcy_rx_descr(), but
it was then zeroed out again at the end of the call, which is wrong.

Fixes: c89d416a2b0f ("e1000e: Don't zero out buffer address in rx descriptor")
Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Christina Wang <christina.wang@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 hw/net/e1000e_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 38b3e3b784..738c7169e4 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1286,7 +1286,6 @@ e1000e_write_lgcy_rx_descr(E1000ECore *core, uint8_t *desc,
                              &d->special);
     d->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
     d->status = (uint8_t) le32_to_cpu(status_flags);
-    d->special = 0;
 }
 
 static inline void
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314573B9002
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:48:13 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lytIq-0003IG-8i
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lytHO-0001um-IO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:46:42 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lytHN-0003vP-17
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:46:42 -0400
Received: by mail-ej1-x634.google.com with SMTP id hr1so5983356ejc.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1q3FhOHZuKfxKp+TQHtgN4PSg9Y2txmELaoYvzRhyY8=;
 b=Gc4RblwinBt3azhWjp8Tv84jgsC3tpHLRQm0xk2jhEh4tKMTnTz6+fscjfk0AM4uEC
 +xdv45j7zu21T82sYgcs6e7zE+n5TugY9MsoytBSj+C1Yj5DXuCWuJbHKcoWpX3vdBXo
 IciudbAd//twNssnvnR8bmVsYVCmPK4kBSEGiS0StKTbzp6NIyo7dLakouFxbkzh51qL
 fRmmNU73Ndz7j7xAOPYIbRSh+5y5z9he+GVtscH8mbrLC6RXeT1WnKn5ES08a+IluN7E
 vZZGzAhDilAuboZDWhiOADLX2TrZGkpZar82nmuSl+7pwuRNGt5wu6SwjWuNlTfFwgCo
 cegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1q3FhOHZuKfxKp+TQHtgN4PSg9Y2txmELaoYvzRhyY8=;
 b=EYPqA4hg5bAgzd8DmGG2Pq0Sfos1bytHn/yut00NgdI8Qcp3L2IVMI8SDZi6NBG6n2
 Mp1SvBXXcTgvE/Zo4pp8jlWY8qEAZqu8zavrdmJKPcfe3ba/tMgkbvVRYkVXu0nCq4Kw
 yR8jMfDqhSgIWWRLC7B0vLmtLB1aIuzcd3LkZ/dbQK63iE7j230eUFwAyZUKNcQtqnvl
 eQSF1CkoAfle3z2jG+r2U2CZfzj1BFLW43WgPEgpAUpLNpMyh5kJbZCE46QkHxfmVSbD
 1smN0XGEUNoP/3GK5olPsITf6AvgUQYNSXofsSN93HgaFq+16R5SdPIFQkfVp4Ee53OI
 TRSQ==
X-Gm-Message-State: AOAM533xrfXDHkmtABDrPWJTpGiFLZBUYFTti/LxbTxrho6KsZfPwCGE
 EzrhtGOCiqMmU1kptLjEtW4=
X-Google-Smtp-Source: ABdhPJwFNXHn4mwY39P6cTntGWK+FWXIFRBn4q5ip33uTNTyduIQ1Mxb7QfkzywYFKQfLntR7ZN8zg==
X-Received: by 2002:a17:907:2622:: with SMTP id
 aq2mr40473857ejc.48.1625132799686; 
 Thu, 01 Jul 2021 02:46:39 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d25sm14467479edu.83.2021.07.01.02.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:46:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/net: e1000e: Don't zero out the VLAN tag in the legacy
 RX descriptor
Date: Thu,  1 Jul 2021 17:46:51 +0800
Message-Id: <20210701094651.1258613-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701094651.1258613-1-bmeng.cn@gmail.com>
References: <20210701094651.1258613-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x634.google.com
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
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

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



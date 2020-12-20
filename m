Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB712DF537
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 12:29:59 +0100 (CET)
Received: from localhost ([::1]:47452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwuU-0008CE-Nf
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 06:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr7-0005Bf-0t
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:29 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:36565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr4-0005Ty-T1
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:28 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MiIlc-1kBonw1Y0M-00fP1b; Sun, 20 Dec 2020 12:26:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/7] goldfish_rtc: re-arm the alarm after migration
Date: Sun, 20 Dec 2020 12:26:14 +0100
Message-Id: <20201220112615.933036-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220112615.933036-1-laurent@vivier.eu>
References: <20201220112615.933036-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oTb2ZjWP6xOrQr9+ttq3WXnsZdQaQORtNJA8mIvyjPk9LE+ssIr
 sy4aK5likIVa/nfWb9QqbnxBsXtq/fC6Ncv0QuuuF3AselcMI7jaAU1KAxojWqRln4sXpPf
 8KMRuFWhsmoQQGa+qbmgLLH6ciw39Wxxdel28nW1JP+J5I2qi23DImdAjOHzhy4fQPjmn9I
 zuuJkETG1KjBSjE2CAYzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A1xnpm/yCoE=:sqX3EswWjpR5N+ThvnPnfn
 rTaapDUZlykHXW8lLJT2wzDwMa5jqQbXKgM9yjVjyMTNJk6GcxMDqpJ5FkCUyYNG08HT+ak+m
 xPwfUHCdy6sOW4pqZWwV/bqtkio4gqd0cfQ6Upf1MvhgY+QNd5pgeEYb3J/AbmP84ixkYIuUI
 NspERaxmaobkG+EmxvqGTg0KeGsVyfS/lWXrJItL2fpP9UvjW7byPsiGIm4KddXgTPfnEMY5H
 7vmhfUvgwiU3uBJE3ZKOECB5MzokFm//QOCNi77cVOmcnwAS29FehuqtpiN+jk6mYueZsm73m
 Z0UiySPO/Erxpb+j/73kVAPoV0P8Eqm1cmd8nfIrBM4f2LrDWPf8YzveKtImTBzF6jakRYdm9
 wFe/Oo7+62ZivnnviX4741EOEvOO3xm3OAEOWO5PuLjya5NdNzR1izsksE54jyqJ9gYUu0Fmb
 0oCSKOuP+w==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After a migration the clock offset is updated, but we also
need to re-arm the alarm if needed.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/rtc/goldfish_rtc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/rtc/goldfish_rtc.c b/hw/rtc/goldfish_rtc.c
index 0f4e8185a796..e07ff0164e0c 100644
--- a/hw/rtc/goldfish_rtc.c
+++ b/hw/rtc/goldfish_rtc.c
@@ -211,6 +211,8 @@ static int goldfish_rtc_post_load(void *opaque, int version_id)
             qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
     s->tick_offset = s->tick_offset_vmstate - delta;
 
+    goldfish_rtc_set_alarm(s);
+
     return 0;
 }
 
-- 
2.29.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A86F13BAD6C
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:33:06 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m03BB-00064Q-OQ
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m039y-0004jA-2t
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:31:50 -0400
Received: from smtpbgau1.qq.com ([54.206.16.166]:41356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m039u-0007tk-Ap
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:31:49 -0400
X-QQ-mid: bizesmtp54t1625409089tiuj8mdg
Received: from Wei.localdomain (unknown [223.72.88.167])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 04 Jul 2021 22:31:27 +0800 (CST)
X-QQ-SSF: 0140000000200080X000000B0000000
X-QQ-FEAT: 5OzP2bT7a4pWVqNlNiPbibtTmS3oVxxkO3EduzJlfaWOXtVx/RYTq6Z8wvFYs
 dm2OW7Csc9hMJXkpxD+dlnIbuJ3WHSpRpXNaX6fdQAFy6ID0P097+GavchCveED5lvgV86f
 /HtRCX9EgRpLlE9Jxnr7zZxjvJ9CJcsji4FiWIRUdJUtMQeV5uguHQ+Wsz28QPWOmhmSyN2
 /Fx1bamS+b6XUyHZb5DHKPO7olDRanym8wlNXw5EsSb98uw0qQQ7SFnL6evDcivJ8+wjnbe
 OX1mw3//Nz48vdHDGSxqjT/kKsG03pDZwFLn56SWOQnspVlYR2es/jpm3Lkp4syG5PEaJdj
 lVzIDk2k7r9pGEop4h1oXDSZdpWspGDzDgcFBKh
X-QQ-GoodBg: 2
From: Liren Wei <lrwei@bupt.edu.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Fix defect in TranslationBlock insertion procedure
Date: Sun,  4 Jul 2021 22:31:25 +0800
Message-Id: <cover.1625404483.git.lrwei@bupt.edu.cn>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=54.206.16.166; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpbgau1.qq.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) BAYES_20=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TranslationBlocks are now inserted first into QHT and then into its
corresponding tcg_region_tree. This is problematic under MTTCG, as
other vCPU threads may immediately execute it, and even bailout before
the TB itself is inserted into its tcg_region_tree, resulting in an
incorrect CPUState after rewinding.

Liren Wei (2):
  accel/tcg: Hoist tcg_tb_insert() up above tb_link_page()
  tcg: Bake tb_destroy() into tcg_region_tree

 accel/tcg/translate-all.c | 15 ++++++++-------
 include/tcg/tcg.h         |  1 -
 tcg/region.c              | 18 +++++++-----------
 3 files changed, 15 insertions(+), 19 deletions(-)

-- 
2.32.0





Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F175F02F4
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 04:49:02 +0200 (CEST)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe653-0006zJ-SM
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 22:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oe61f-00045K-KX
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 22:45:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49228 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oe61d-0002jF-BJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 22:45:19 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxFeI2WDZjJAckAA--.4665S2; 
 Fri, 30 Sep 2022 10:45:10 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, yangxiaojuan@loongson.cn, maobibo@Loongson.cn,
 huqi@loongson.cn
Subject: [PATCH v3 0/3]  Fix some loongarch tcg bugs
Date: Fri, 30 Sep 2022 10:45:07 +0800
Message-Id: <20220930024510.800005-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeI2WDZjJAckAA--.4665S2
X-Coremail-Antispam: 1UD129KBjvdXoWrWFW5KrWfKrWkCr48Gry7Awb_yoWxXFX_WF
 93Gr95Cr4UWay3JFZIkF15ZryDCrW7JFn0vFs0q3yxGr9xXrs8Gr4qqanxZF1jqF4xWFZ5
 CFnFqFyrCr42qjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUUUUUUU
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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

Hi,

This series fix some bugs find from RISU test.

V3:
  -drop patch set some instruction result high 32bit 1.
  -follow some change from Richard's suggestion.

v2:
  -remove patch5 div if x/0 set dividend to 0.


Song Gao (3):
  target/loongarch: bstrins.w src register need EXT_NONE
  target/loongarch: Fix fnm{sub/add}_{s/d} set wrong flags
  softfloat: logB(0) should raise divideByZero exception

 fpu/softfloat-parts.c.inc                     |  1 +
 target/loongarch/insn_trans/trans_bit.c.inc   | 36 +++++++++++--------
 .../loongarch/insn_trans/trans_farith.c.inc   | 12 +++----
 3 files changed, 29 insertions(+), 20 deletions(-)

-- 
2.31.1



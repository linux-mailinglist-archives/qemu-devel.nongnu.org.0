Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E745E944E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 18:19:19 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocULf-0002tZ-0p
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 12:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocUI4-0008K4-Bh
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:15:36 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:38817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ocUI2-0005Yn-Pt
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 12:15:36 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEmAX-1oSFgN1POF-00GJJX; Sun, 25
 Sep 2022 18:15:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] linux-user: handle /proc/self/exe with execve() syscall
Date: Sun, 25 Sep 2022 18:15:25 +0200
Message-Id: <20220925161527.374593-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uKOoK0E6eG57E3eFp5qsaJjcvtBCLpLiJ9LZpqKOM06QVGUZ3pG
 iwlXKbW+ukOKnmLN9OgxKd3krn+MVwr9haa/rTAlsZCfSPHsgmfVMhsYxtbwgXOgDrh/o+S
 WOg2fLSwcmVKiYrBas0X1Apba88mGL/QVsijxWJOLxoyLNCponz/0X3pVHwdjv0UrQRjs/d
 CEj6H8MinmzcuasE9YH0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XeWKFJLXxDA=:j9rsNoef4/C0VGApRi65Rz
 llZegSrBn9tQSldp6MQvTgufmoafOszv84+PK50fSDVH4AQxxVBThsVuoTUdO49165d3j3PpY
 9/co7YyFyMlr6HbleixqR+HzDQeyt3qECyGyqGUIgj9JXJ1Mrj47WbYu8yRTJKYSUMhoMI8z1
 RKtGfxKqHd+1j+Me1k8kV/0yXHk4oOUakoW4t8ue/kOd0jA8PO7HKLV3KhTs0wZQTd6j3/Cu4
 QG54RPxuAE3fS2aqreNWJPExRviWQsof4OoPzm+JazsaOzmzDac2uL+8q72hE1ML7FxsdbYOS
 qabw2e3S0haxZMR19gz+67BDGY7xtQdBcgdRS7i06ZauvkSCKCHv056G0KtnT2+Ogeh5M59nf
 hwpOGFppVTxOnq2jKGcSQ2DfEtbfWz+rtQq0ZZx1RLqMZB/20KqsZ0BYxD5srdfpv4YaEJg4b
 sX1AmA5VqGumx3rM5o2Qb7+mIATQKlkRIjX0yOOevPo3T8JMQKRqs+LxaeBWZkr8q/wRkrcZp
 QD8wpPmsC10YBACZeTQx/eLTsjwkIgdKsfhWYnB+y00Fc3mVg9fdbVY0VQD15kPe4l1gv2w25
 Ce7JqyGrYTJ6JIFEIqJI7GGDLnspC2o1M8rNopWe+hhGBIk0lKXNNJZrmmFoIGuNXNizmAf+9
 ZQEUF/zciO8p926Y7d7NAzzm+MQH+hdZlNsf+eSOmbOvn0WPoQh2mr+ae1APm7xrCFHic+c7w
 vDDWkMISQlV2eeIGG9V6ZjJ0FuZTTK8J1DBCL0isNrm65MnG0tg8jy/Lpmn7y84yU3MNj1FYO
 wiTYRxd
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Use execfd to re-exectute the binary from /proc/self/exe

Fix do_openat() that should not use execfd.

Laurent Vivier (2):
  linux-user: handle /proc/self/exe with execve() syscall
  linux-user: don't use AT_EXECFD in do_openat()

 linux-user/main.c           |  9 +++++++--
 linux-user/syscall.c        | 12 +++++++++---
 linux-user/user-internals.h |  1 +
 3 files changed, 17 insertions(+), 5 deletions(-)

-- 
2.37.3



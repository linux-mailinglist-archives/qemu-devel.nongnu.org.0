Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686311CC96B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 10:32:52 +0200 (CEST)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXhOE-0003Mz-RI
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 04:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jXhMH-0001d0-AZ
 for qemu-devel@nongnu.org; Sun, 10 May 2020 04:30:49 -0400
Received: from mail-m971.mail.163.com ([123.126.97.1]:47410)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zxq_yx_007@163.com>) id 1jXhMB-0006ea-Ry
 for qemu-devel@nongnu.org; Sun, 10 May 2020 04:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=aldV/LWTXaHv4tODW6
 xmIgnsLY6c0U3XqUiYv7ByI4g=; b=on2kneGxyYcKNpBGgrHA4hgmegQZk02UUd
 KEGl9hsBBHEUf0DTcMnHrVaidHtHxEyMyqA8k0Gs2Mqnuk6IVdPlT92L6REJPxjn
 dGi6SegGPVKRRAF9l1vSBdPMcsD6HalejviD7Y0Oi4f/KoGUJ+FV6RSK/WNeypkj
 M4mzSz/Kg=
Received: from localhost.localdomain (unknown [111.194.184.25])
 by smtp1 (Coremail) with SMTP id GdxpCgAHJ_UKuLdej37fBA--.10S2;
 Sun, 10 May 2020 16:15:16 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v3 0/3] qemu-sockets: add abstract UNIX domain socket
 support
Date: Sun, 10 May 2020 16:14:50 +0800
Message-Id: <20200510081453.2915-1-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: GdxpCgAHJ_UKuLdej37fBA--.10S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurWrJr45Ww15Zr4rWryfWFg_yoW3twc_Xr
 y0k3s5KrW2ga1rAa4FkF13JrW7Ar40gF1vqF1UtrWDWw18Zrn8Krs8Ar17tw1UXrykZF1x
 J397GrZ3A3429jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRED73JUUUUU==
X-Originating-IP: [111.194.184.25]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0h0gxlUMWAK4lgAAsE
Received-SPF: pass client-ip=123.126.97.1; envelope-from=zxq_yx_007@163.com;
 helo=mail-m971.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 04:15:21
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 xiaoqiang zhao <zxq_yx_007@163.com>, armbru@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Resend this patch series as it does not meet patchew last time.

By default qemu does not support abstract UNIX domain
socket address. Add this ability to make qemu handy
when abstract address is needed.

Changes since v2: 
* reorganize code to cover both connect and listen
* qapi related changes
* add test cases and update qemu-options documents

Xiaoqiang Zhao (3):
  qemu-sockets: add abstract UNIX domain socket support
  tests/util-sockets: add abstract unix socket cases
  qemu-options: updates for abstract unix sockets

 chardev/char-socket.c     |  4 ++
 chardev/char.c            |  7 ++++
 qapi/sockets.json         |  9 ++++-
 qemu-options.hx           |  9 ++++-
 tests/test-util-sockets.c | 83 +++++++++++++++++++++++++++++++++++++++
 util/qemu-sockets.c       | 39 ++++++++++++++----
 6 files changed, 141 insertions(+), 10 deletions(-)

-- 
2.17.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD71CC71F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 May 2020 08:19:15 +0200 (CEST)
Received: from localhost ([::1]:53326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXfIw-0004hC-NS
	for lists+qemu-devel@lfdr.de; Sun, 10 May 2020 02:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jXfGC-0000gJ-6U
 for qemu-devel@nongnu.org; Sun, 10 May 2020 02:16:24 -0400
Received: from m12-18.163.com ([220.181.12.18]:49079)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jXfG9-0000Tk-3x
 for qemu-devel@nongnu.org; Sun, 10 May 2020 02:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=cThyaTgGLZ3I6o5sAk
 gh07FKp2Vj9HqqzzvQtucERRo=; b=cO+zu1Qj6eAy6xNj77pYf8Y/J537vPPBy/
 N9ZxZLuS9yRgZVEuwKIplEm9ZE4VZaxDwCo51ikluJhz+cBK+ZzepM4wMpm9d0C2
 uN//poL/9qovSmF5OfXzJksMuaE0DesF8okRUVAiLNWJsOHqXoTUB1AW7G4jOptz
 U5D8pNWoE=
Received: from localhost.localdomain (unknown [103.235.247.137])
 by smtp14 (Coremail) with SMTP id EsCowADH7trXm7dehaPQBA--.17000S2;
 Sun, 10 May 2020 14:15:34 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: berrange@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 kwolf@redhat.com, armbru@redhat.com
Subject: [PATCH v3 0/3] qemu-sockets: add abstract UNIX domain socket support
Date: Sun, 10 May 2020 14:14:19 +0800
Message-Id: <20200510061422.24841-1-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowADH7trXm7dehaPQBA--.17000S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyxJw18GFy7tr4kuFyxuFg_yoW3WFX_Xr
 y0k3s5KrW7Ka1rAa4YkF13JrW7Ar40gF1vqF1DtrZ8Ww18Zrn8trs8Aryxtw1UXFyDZF1x
 X3s7GrZ3A347CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREsqXtUUUUU==
X-Originating-IP: [103.235.247.137]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/xtbB0hMgxlUMWAEnIgAAsi
Received-SPF: pass client-ip=220.181.12.18; envelope-from=zxq_yx_007@163.com;
 helo=m12-18.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/10 02:16:04
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org,
 xiaoqiang zhao <zxq_yx_007@163.com>, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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




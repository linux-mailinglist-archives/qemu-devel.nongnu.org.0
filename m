Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2AA1D5E16
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 05:15:51 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZnIk-00030I-D2
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 23:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jZnHA-0001mz-9c
 for qemu-devel@nongnu.org; Fri, 15 May 2020 23:14:13 -0400
Received: from mail-m975.mail.163.com ([123.126.97.5]:47805)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <zxq_yx_007@163.com>)
 id 1jZnH6-0006YE-5E
 for qemu-devel@nongnu.org; Fri, 15 May 2020 23:14:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=GFS6O
 Sv5OXF/PXQYyUTBSYK7hExceohezHeicoNhLW8=; b=hj+0vRgFcqi+nwQWUZ3o0
 6aV1qC36HFwOszV026zA/jwBVvatI8a8RYjO4MECKfXqoAosZLMLAUwgDtHCtEZO
 nrPrPJqXybF1X0iqOCm/Yv1Puv98eKeE3zBos+FZPUFIBkUd2Kn16uDUw8rM/76B
 rgoT3LvPOAc67mLRbYysWk=
Received: from localhost.localdomain (unknown [114.240.93.195])
 by smtp5 (Coremail) with SMTP id HdxpCgC3FwRcWr9eLYq7AA--.563S2;
 Sat, 16 May 2020 11:13:58 +0800 (CST)
From: xiaoqiang zhao <zxq_yx_007@163.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/3] qemu-sockets: add abstract UNIX domain socket support
Date: Sat, 16 May 2020 11:13:24 +0800
Message-Id: <20200516031327.15305-1-zxq_yx_007@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: HdxpCgC3FwRcWr9eLYq7AA--.563S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFyxJw1UGry3ur45tFWDJwb_yoW3tFX_Xr
 y0k34ktrW7Aa1rCa45CrnxJFW7Cr40gF10qF1UtrWkGw1kZrn8Krn8Ary7Kw1UJa43uF17
 X34kGr93A3y2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0VOJUUUUUU==
X-Originating-IP: [114.240.93.195]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiqBYmxlc7PN687QAAsB
Received-SPF: pass client-ip=123.126.97.5; envelope-from=zxq_yx_007@163.com;
 helo=mail-m975.mail.163.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 23:02:07
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 armbru@redhat.com, kraxel@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu does not support abstract UNIX domain
socket address. Add this ability to make qemu handy
when abstract address is needed.

Changes since v5: 
* rebase on master
* refine document statement

v4 -> v5: 
* fix typo and coding style problems

v3 -> v4: 
* rebase on master
* refine qapi document statement
* use random names to avoid name clash in unit test

Xiaoqiang Zhao (3):
  qemu-sockets: add abstract UNIX domain socket support
  tests/util-sockets: add abstract unix socket cases
  qemu-options: updates for abstract unix sockets

 chardev/char-socket.c     |  4 ++
 chardev/char.c            |  7 +++
 qapi/sockets.json         |  8 +++-
 qemu-options.hx           |  8 +++-
 tests/test-util-sockets.c | 92 +++++++++++++++++++++++++++++++++++++++
 util/qemu-sockets.c       | 39 ++++++++++++++---
 6 files changed, 148 insertions(+), 10 deletions(-)

-- 
2.17.1



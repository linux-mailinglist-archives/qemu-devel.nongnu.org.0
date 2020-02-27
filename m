Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B9B170DB5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 02:16:04 +0100 (CET)
Received: from localhost ([::1]:52422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j77mV-0003ab-8a
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 20:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j77l7-0002PT-58
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 20:14:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j77l6-0006Ff-5v
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 20:14:37 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:44976 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j77l0-0005wx-PM; Wed, 26 Feb 2020 20:14:31 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 237C1B615EC1EBCA4E6F;
 Thu, 27 Feb 2020 09:14:25 +0800 (CST)
Received: from localhost.localdomain (10.175.104.216) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Thu, 27 Feb 2020 09:14:16 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH v2 0/2] fix two small memleaks
Date: Thu, 27 Feb 2020 09:29:48 +0800
Message-ID: <20200227012950.12256-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: euler.robot@huawei.com, Pan Nengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fix two small memleaks.
1. 'crypto_opts' forgot to free in qcow2_close(), do this cleanup in qcow2_close();
2. Do free filename/format in collect_image_check() when we re-allocate it.  

v2->v1:
- Instead of freeing part of fields in collect_image_check(), do discard the old check object and allocate a new one in the caller to make more sense.(suggested by Max Reitz)

Pan Nengyuan (2):
  block/qcow2: do free crypto_opts in qcow2_close()
  qemu-img: free memory before re-assign

 block/qcow2.c | 1 +
 qemu-img.c    | 2 ++
 2 files changed, 3 insertions(+)

-- 
2.18.2



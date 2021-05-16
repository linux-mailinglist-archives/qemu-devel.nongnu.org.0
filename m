Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC743381C2A
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 05:06:15 +0200 (CEST)
Received: from localhost ([::1]:55470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li76c-0003Rx-88
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 23:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74o-0000on-Eg
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:22 -0400
Received: from m12-13.163.com ([220.181.12.13]:51768)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liq3ea@163.com>) id 1li74i-0002Z9-Se
 for qemu-devel@nongnu.org; Sat, 15 May 2021 23:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=F4PVu
 Ro4JXFNwNqf/c0Ww7fXKmCAGKqsBaVViBtNCxE=; b=grt0klvsk1XrjxsF+U0jU
 Jw5x81VvtIotpQPbY4pfApcix9XaAuXpN6icno+uDhqoQZtpZNcypUvIpaBillv0
 xUPKI15yOcgIjw92N6vF60kp9tCwOBwMy+BGKSEOoqdNIX9Ug2PSGXOZgfXVkRlb
 o69PF07AGTTwVFfL7adFUw=
Received: from ubuntu.localdomain (unknown [115.200.200.157])
 by smtp9 (Coremail) with SMTP id DcCowAC3evili6Bg85SBAw--.61303S4;
 Sun, 16 May 2021 11:04:07 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: marcandre.lureau@redhat.com, kraxel@redhat.com, philmd@redhat.com,
 ppandit@redhat.com, mcascell@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] vhost-user-gpu: fix several security issues
Date: Sat, 15 May 2021 20:03:55 -0700
Message-Id: <20210516030403.107723-1-liq3ea@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAC3evili6Bg85SBAw--.61303S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF48Jr1fJFyUur1furWxJFb_yoW8Gr4UpF
 WxWF13Kr4xArs3ArWfJF4DWFyrZF1xWF1UCFy7C3Wfur4UW34jv3s8Cw4Yka1UGF9YqFW7
 tF15Ar18Gr1qqaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuKZAUUUUU=
X-Originating-IP: [115.200.200.157]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/1tbitAeUbVSIlhIIrQAAs3
Received-SPF: pass client-ip=220.181.12.13; envelope-from=liq3ea@163.com;
 helo=m12-13.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Li Qiang <liq3ea@163.com>, liq3ea@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These security issue is low severity and is similar with the
virtio-vga/virtio-gpu device. All of them can be triggered by
the guest user.

Change since v1:
Add the CVE information:
Several memory leak issues is combined assigned CVE-2021-3544.
Information disclosure is assigned CVE-2021-3545.
OOB memory write access is assigned CVE-2021-3545.

Abstract 'vg_cleanup_mapping_iov' to make code more clearly.

Li Qiang (8):
  vhost-user-gpu: fix memory disclosure in virgl_cmd_get_capset_info
    (CVE-2021-3545)
  vhost-user-gpu: fix resource leak in 'vg_resource_create_2d'
    (CVE-2021-3544)
  vhost-user-gpu: fix memory leak in vg_resource_attach_backing
    (CVE-2021-3544)
  vhost-user-gpu: fix memory leak while calling 'vg_resource_unref'
    (CVE-2021-3544)
  vhost-user-gpu: fix memory leak in 'virgl_cmd_resource_unref'
    (CVE-2021-3544)
  vhost-user-gpu: fix memory leak in 'virgl_resource_attach_backing'
    (CVE-2021-3544)
  vhost-user-gpu: fix OOB write in 'virgl_cmd_get_capset'
    (CVE-2021-3546)
  vhost-user-gpu: abstract vg_cleanup_mapping_iov

 contrib/vhost-user-gpu/vhost-user-gpu.c | 29 ++++++++++++++++++++++---
 contrib/vhost-user-gpu/virgl.c          | 20 +++++++++++++++--
 contrib/vhost-user-gpu/vugpu.h          |  2 +-
 3 files changed, 45 insertions(+), 6 deletions(-)

-- 
2.25.1




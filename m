Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E69699687
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:01:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeoM-0003ka-OR; Thu, 16 Feb 2023 09:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pSeoG-0003je-6h
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:00:29 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pSeoD-000331-V2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:00:27 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id ACD245FE15;
 Thu, 16 Feb 2023 17:00:16 +0300 (MSK)
Received: from antonkuchin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:7313::1:33])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 30mChN0RvGk1-DWSC8aP3; Thu, 16 Feb 2023 17:00:15 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676556016; bh=LWStvpjF+X9INvQtKoyy/tfGUCKy8vkWL1oG4k796nw=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=GfiIA1g+2bPcsmFSgfvDBmzQ+TYLroVNwSknuLHbVpknZvmRbtmoUaCcQn5G9brJ9
 Gbz21x3aSEFH6B0IEMNX6dfTlxUWY2B4rQp88jPrxbY86mJGe0FbYuM8s+3S+2VYG0
 LNDDv3usSPoa44rzIahsK7qQGG/qTFMtsLqJH7tY=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Anton Kuchin <antonkuchin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, yc-core@yandex-team.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: [PATCH v2 0/1] virtio-fs: implement option for stateless migration.
Date: Thu, 16 Feb 2023 16:00:02 +0200
Message-Id: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v2: Use device property instead of migration capability

Anton Kuchin (1):
  vhost-user-fs: add property to allow migration

 hw/core/qdev-properties-system.c    | 10 +++++++++
 hw/virtio/vhost-user-fs.c           | 34 ++++++++++++++++++++++++++++-
 include/hw/qdev-properties-system.h |  1 +
 include/hw/virtio/vhost-user-fs.h   |  1 +
 qapi/migration.json                 | 16 ++++++++++++++
 5 files changed, 61 insertions(+), 1 deletion(-)

-- 
2.37.2



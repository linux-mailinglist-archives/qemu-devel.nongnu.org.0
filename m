Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4069B18C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 18:02:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT46w-0005s2-SY; Fri, 17 Feb 2023 12:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pT46g-0005Tr-Ju
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:01:11 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pT46a-0008Ts-Ia
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 12:01:09 -0500
Received: from sas1-2d2912cdb877.qloud-c.yandex.net
 (sas1-2d2912cdb877.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:280d:0:640:2d29:12cd])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 0285A5E891;
 Fri, 17 Feb 2023 20:00:57 +0300 (MSK)
Received: from antonkuchin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:7313::1:33])
 by sas1-2d2912cdb877.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 d0qKL50Sl4Y1-as7lgeNW; Fri, 17 Feb 2023 20:00:55 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676653256; bh=LuJa1XzVC5XRjGw6Q/jAedR9HRkgws8FREB9qNB2VwA=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=TNqkLEW6+0v5DyAoC9l82UgXKxWEJ97eYAB/nDG1gNzsu3TPzGqG+BiSIugsGsks7
 bo62YqzU+OtI+YEf2KUEJsMDPjV75aStv3WOPhFXGb+LOwbY+tUGH9V1lG+Wm1nEbu
 MgbMgHAnsBcBWA2INFI+PMg0pWYPaPax+iboFYUw=
Authentication-Results: sas1-2d2912cdb877.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Anton Kuchin <antonkuchin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 virtio-fs@redhat.com, Eric Blake <eblake@redhat.com>,
 Anton Kuchin <antonkuchin@yandex-team.ru>
Subject: [PATCH v3 0/1] virtio-fs: implement option for stateless migration.
Date: Fri, 17 Feb 2023 19:00:37 +0200
Message-Id: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
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

v3:
 - Remove migration_type from migration stream
 - Use enum type for migration_type
 - Get rid of useless cast
 - Fix typos
 - Reword commit message

v2:
 - Use device property instead of migration capability

Anton Kuchin (1):
  vhost-user-fs: add migration type property

 hw/core/qdev-properties-system.c    | 10 +++++++++
 hw/virtio/vhost-user-fs.c           | 32 ++++++++++++++++++++++++++++-
 include/hw/qdev-properties-system.h |  1 +
 include/hw/virtio/vhost-user-fs.h   |  2 ++
 qapi/migration.json                 | 16 +++++++++++++++
 5 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.37.2



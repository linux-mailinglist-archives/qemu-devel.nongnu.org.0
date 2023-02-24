Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7B6A23EF
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:42:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfpD-0005fl-1p; Fri, 24 Feb 2023 16:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pVfp9-0005eA-Im
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:41:51 -0500
Received: from vps-vb.mhejs.net ([37.28.154.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@maciej.szmigiero.name>)
 id 1pVfp7-0002cF-Bi
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:41:50 -0500
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1pVfog-0000j1-FV; Fri, 24 Feb 2023 22:41:22 +0100
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH][RESEND v3 0/3] Hyper-V Dynamic Memory Protocol driver
 (hv-balloon)
Date: Fri, 24 Feb 2023 22:41:13 +0100
Message-Id: <cover.1677274611.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.28.154.113;
 envelope-from=mail@maciej.szmigiero.name; helo=vps-vb.mhejs.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

This is a rebase/resend of v2 patch series located here:
https://lore.kernel.org/qemu-devel/cover.1672878904.git.maciej.szmigiero@oracle.com/

The only changes from v2 are fixing some conflicts around build files (and
re-testing).

 Kconfig.host                     |    3 +
 configure                        |   36 +
 hw/hyperv/Kconfig                |    5 +
 hw/hyperv/hv-balloon.c           | 2185 ++++++++++++++++++++++++++++++
 hw/hyperv/meson.build            |    1 +
 hw/hyperv/trace-events           |   16 +
 hw/i386/Kconfig                  |    2 +
 hw/i386/pc.c                     |    4 +-
 hw/mem/Kconfig                   |    4 +
 hw/mem/hapvdimm.c                |  221 +++
 hw/mem/meson.build               |    1 +
 include/hw/hyperv/dynmem-proto.h |  423 ++++++
 include/hw/mem/hapvdimm.h        |   27 +
 meson.build                      |    4 +-
 qapi/machine.json                |   68 +
 15 files changed, 2998 insertions(+), 2 deletions(-)
 create mode 100644 hw/hyperv/hv-balloon.c
 create mode 100644 hw/mem/hapvdimm.c
 create mode 100644 include/hw/hyperv/dynmem-proto.h
 create mode 100644 include/hw/mem/hapvdimm.h



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62F3426DE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 21:29:12 +0100 (CET)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNLk7-0002Nb-DK
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 16:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLf8-0004yE-If; Fri, 19 Mar 2021 16:24:02 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:53075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNLew-0001P0-DC; Fri, 19 Mar 2021 16:24:02 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MTzrW-1lFChw0gNe-00R27x; Fri, 19 Mar 2021 21:23:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/6] blockdev: with -drive if=virtio, use generic virtio-blk
Date: Fri, 19 Mar 2021 21:23:32 +0100
Message-Id: <20210319202335.2397060-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210319202335.2397060-1-laurent@vivier.eu>
References: <20210319202335.2397060-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Gc7NCjRrRa6oWoAW/nGwf8xXfOoQ0ApvqYEedBxhtkfqS7Ez+c9
 mluwsdF8+K0PmxtJIZUa5ODXloVVpcxh5wyiZYJ+SJeliiW86ws6xgqaSWhZGPD4ALruVZh
 qvRx93eH9gEVRwpWgjHzX683aNDQOspS9pD8iQJXkmc1d5pMxOnsIK0TfYSlbtI4WAtgKee
 a/GXIsEU9eCd5NtBhpnIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C2fVXyWp98Q=:F6y7gkWYgNb0MukgqMbbge
 kRWUGlPRlpu1CrkT4f3XqK0T+LfeuP9o8RfPrTSr0TgO1cSTjwXXohfQnOcNXqaFHsZksjJMw
 yiq3oeX3/htn9rg4jqNJg8KY+1y7pxGTx4uPAgoem6WKUACERDumD9GLL38fl4yIVY5C2r8tT
 NH0hzW1yuPhfQCyU8HbMB7Dnw/7Ta7y9a/ETYMeURRJHsHMJQytin9PdHPfF3OVcEpWHVZ3z2
 BJOQaD02Bfp5oRc2+BEBH5wwZekkTbHcHkCxgajlFQl1+v3kXYdzU8wy0dj3IGQ1ecqtwgM4Q
 a5n0PMktNp00ORtYJ46o+uljkk0XY1IjPxOYZr1ELzYS7A9UMSYthOczT/hFETREr7bCyG+Pb
 OPQaBb2GAWxtOOTJVy7WzsJB0MH3ZSJndRaGQ/adnS7qQYkWDrjssTGVx69gj1rQpd2if9VRM
 Gz4ZodReZA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than checking if the machine is an s390x to use virtio-blk-ccw
instead of virtio-blk-pci, use the alias virtio-blk that is set to
the expected target.

This also enables the use of virtio-blk-device for targets without
PCI or CCW.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 blockdev.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 5cc7c7effe9f..64da5350e3ad 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -969,11 +969,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
         QemuOpts *devopts;
         devopts = qemu_opts_create(qemu_find_opts("device"), NULL, 0,
                                    &error_abort);
-        if (arch_type == QEMU_ARCH_S390X) {
-            qemu_opt_set(devopts, "driver", "virtio-blk-ccw", &error_abort);
-        } else {
-            qemu_opt_set(devopts, "driver", "virtio-blk-pci", &error_abort);
-        }
+        qemu_opt_set(devopts, "driver", "virtio-blk", &error_abort);
         qemu_opt_set(devopts, "drive", qdict_get_str(bs_opts, "id"),
                      &error_abort);
     }
-- 
2.30.2



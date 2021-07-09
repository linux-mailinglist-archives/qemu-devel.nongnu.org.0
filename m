Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD73C2A67
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 22:34:28 +0200 (CEST)
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1xCd-0006FZ-Tn
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 16:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6z-0006AK-Jp; Fri, 09 Jul 2021 16:28:37 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1m1x6x-0007Uw-FO; Fri, 09 Jul 2021 16:28:37 -0400
Received: from quad ([82.142.13.34]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJV9S-1liEMh1MWu-00JqP5; Fri, 09
 Jul 2021 22:28:31 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] hw/virtio: Document *_should_notify() are called within
 rcu_read_lock()
Date: Fri,  9 Jul 2021 22:28:21 +0200
Message-Id: <20210709202824.578187-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
References: <20210709202824.578187-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:C6OHJj5D0XQZuQpLW3xomHX72aiL7JorBTC/WVgaq0MH8wBrb0r
 mPTs6ydho4Qw49cPUGzdnw6CCkFA1XaxflXBupKi7kTPwlPaZdl1RNDIK80XpoK9XZKVB/B
 mM6xeu/TlPYMD+XQCgcG/OjqHHOiNxC/oBzyhdcISoLDwI+DLjU6n4uHuMAgHFnjT/1dmY6
 v5hBXee/fQ/ckSLEybVWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BsSTyS9ruLI=:bJF2ZR/aPVGzw2EloZbw8R
 vkYO7jCuSLYNu5W/1ky3ODeV/EPa9V/fBJItl6nA+Whj1guULZ683RO+4A/iDS383Juk3k5q3
 5oAsWWgeiV6xFHezakbgUY7laOlKLERmi2xkTKxhFzSAz+AqP4GyVjJOuT84yKm6bVbDG/lUQ
 g7MAnAMMicI5WAnRnd0PgBLuvt9eLkVS96SxG4E7MjyO0+gut/2BK1FUa5Eugq2Qaskumq3Y5
 LshgyptiaOaluAHKmbsyzLDXRMIQSwfN13Q7duCC5UMZnxHIHkKnVPmWEly+Mx26lpskeRRIg
 FFmR0mnzP5id3KKRA0HCcgqKUPn7k4UfOEHvd3b4Gi1Lu2VvZtzxRazXvvaSlpvw4otnkPujB
 B5yiA9Uzujszy4qojx3MZijk/a97E8839/jHVPTPOlrefSZtcHi45GiRtsct8VnjjUMs9hfPm
 RggYR4+xVMxralyGjevtZbhjwb9UaE4BNgMct5KoSjZfkEkbsYgstgti2uDzGnZFdDCBa8Lwu
 1xb96h61vZIcAKDs9QDmWLHyNwIVawHgtkSFZNMpww+tniyad+jd5zo5Lf/53AedjLMhGS+DV
 4IB/WC/nWot1TYFyJZBfN7UpV8EsLte5YR9ic0bsZ/Wu4gVVgfs2Y8xd4evWKo/99C+1ZyodL
 oX2mq1Wq/zRHaDah/Shsw5heH56dHqzow5484WDgA8XTCekYo0Eg2QpIAUdV2zfxgPsuFFay9
 T8fA4PiI28zCyPTrdYxd0X3xB6rdvphGjlPjHYQWg3QDv+OFjFo3oJWXlAnuqYTrbbDElHKWr
 owM0wkftrLPJ/WrGVJvB7MlsGCY5uAjTjO3to3kUZA2M1OW7+Jlp+K5W9nyxEZqQh3bRzEJ
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Such comments make reviewing this file somehow easier.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210523094040.3516968-1-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 6dcf3baf56b7..874377f37a70 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2447,6 +2447,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
     }
 }
 
+/* Called within rcu_read_lock(). */
 static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     uint16_t old, new;
@@ -2483,6 +2484,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
     return vring_need_event(off, new, old);
 }
 
+/* Called within rcu_read_lock(). */
 static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
 {
     VRingPackedDescEvent e;
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2671BD635
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:38:35 +0200 (CEST)
Received: from localhost ([::1]:55004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jThIg-0001bK-U2
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh2o-0007wn-Oz
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:22:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh1j-00041j-QM
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:22:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49637
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTh1j-0003xL-CM
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588144861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMMno6mGoMsRZKU4ACociZdb2h0cUGFhg3LPyjD+Xt8=;
 b=Rgy/oeFvB45qiAWxkVP2oKbGojs9R9iQQduKoaXC4B7JQH58CkIwaAcDAXQa5rXRwKhTTC
 XbVFUkgRV8FNlHBC83P4lWVwibjqF2So7Bt3FOXOZIzfnK1JWWHB58hOSrM6gmMz1149MV
 blf/mNydYh25jJT814gSOgdY0tfyoZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-e1FnSLJTNOSNebFtnqjQsw-1; Wed, 29 Apr 2020 03:20:59 -0400
X-MC-Unique: e1FnSLJTNOSNebFtnqjQsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE64801503
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 07:20:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71178282E2;
 Wed, 29 Apr 2020 07:20:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 35C6A11358CF; Wed, 29 Apr 2020 09:20:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/32] virtio-net: Fix duplex=... and speed=... error handling
Date: Wed, 29 Apr 2020 09:20:34 +0200
Message-Id: <20200429072048.29963-19-armbru@redhat.com>
In-Reply-To: <20200429072048.29963-1-armbru@redhat.com>
References: <20200429072048.29963-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:18:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

virtio_net_device_realize() rejects invalid duplex and speed values.
The error handling is broken:

    $ ../qemu/bld-sani/x86_64-softmmu/qemu-system-x86_64 -S -display none -=
monitor stdio
    QEMU 4.2.93 monitor - type 'help' for more information
    (qemu) device_add virtio-net,duplex=3Dx
    Error: 'duplex' must be 'half' or 'full'
    (qemu) c
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    =3D=3D15654=3D=3DERROR: AddressSanitizer: heap-use-after-free on addres=
s 0x62e000014590 at pc 0x560b75c8dc13 bp 0x7fffdf1a6950 sp 0x7fffdf1a6940
    READ of size 8 at 0x62e000014590 thread T0
=09#0 0x560b75c8dc12 in object_dynamic_cast_assert /work/armbru/qemu/qom/ob=
ject.c:826
=09#1 0x560b74c38ac0 in virtio_vmstate_change /work/armbru/qemu/hw/virtio/v=
irtio.c:3210
=09#2 0x560b74d9765e in vm_state_notify /work/armbru/qemu/softmmu/vl.c:1271
=09#3 0x560b7494ba72 in vm_prepare_start /work/armbru/qemu/cpus.c:2156
=09#4 0x560b7494bacd in vm_start /work/armbru/qemu/cpus.c:2162
=09#5 0x560b75a7d890 in qmp_cont /work/armbru/qemu/monitor/qmp-cmds.c:160
=09#6 0x560b75a8d70a in hmp_cont /work/armbru/qemu/monitor/hmp-cmds.c:1043
=09#7 0x560b75a799f2 in handle_hmp_command /work/armbru/qemu/monitor/hmp.c:=
1082
    [...]

    0x62e000014590 is located 33168 bytes inside of 42288-byte region [0x62=
e00000c400,0x62e000016930)
    freed by thread T1 here:
=09#0 0x7feadd39491f in __interceptor_free (/lib64/libasan.so.5+0x10d91f)
=09#1 0x7feadcebcd7c in g_free (/lib64/libglib-2.0.so.0+0x55d7c)
=09#2 0x560b75c8fd40 in object_unref /work/armbru/qemu/qom/object.c:1128
=09#3 0x560b7498a625 in memory_region_unref /work/armbru/qemu/memory.c:1762
=09#4 0x560b74999fa4 in do_address_space_destroy /work/armbru/qemu/memory.c=
:2788
=09#5 0x560b762362fc in call_rcu_thread /work/armbru/qemu/util/rcu.c:283
=09#6 0x560b761c8884 in qemu_thread_start /work/armbru/qemu/util/qemu-threa=
d-posix.c:519
=09#7 0x7fead9be34bf in start_thread (/lib64/libpthread.so.0+0x84bf)

    previously allocated by thread T0 here:
=09#0 0x7feadd394d18 in __interceptor_malloc (/lib64/libasan.so.5+0x10dd18)
=09#1 0x7feadcebcc88 in g_malloc (/lib64/libglib-2.0.so.0+0x55c88)
=09#2 0x560b75c8cf8a in object_new /work/armbru/qemu/qom/object.c:699
=09#3 0x560b75010ad9 in qdev_device_add /work/armbru/qemu/qdev-monitor.c:65=
4
=09#4 0x560b750120c2 in qmp_device_add /work/armbru/qemu/qdev-monitor.c:805
=09#5 0x560b75012c1b in hmp_device_add /work/armbru/qemu/qdev-monitor.c:905
    [...]
    =3D=3D15654=3D=3DABORTING

Cause: virtio_net_device_realize() neglects to bail out after setting
the error.  Fix that.

Fixes: 9473939ed7addcaaeb8fde5c093918fb7fa0919c
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20200422130719.28225-9-armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/virtio-net.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index eddfa7f923..65bb6886c7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -2947,6 +2947,7 @@ static void virtio_net_device_realize(DeviceState *de=
v, Error **errp)
             n->net_conf.duplex =3D DUPLEX_FULL;
         } else {
             error_setg(errp, "'duplex' must be 'half' or 'full'");
+            return;
         }
         n->host_features |=3D (1ULL << VIRTIO_NET_F_SPEED_DUPLEX);
     } else {
@@ -2955,7 +2956,9 @@ static void virtio_net_device_realize(DeviceState *de=
v, Error **errp)
=20
     if (n->net_conf.speed < SPEED_UNKNOWN) {
         error_setg(errp, "'speed' must be between 0 and INT_MAX");
-    } else if (n->net_conf.speed >=3D 0) {
+        return;
+    }
+    if (n->net_conf.speed >=3D 0) {
         n->host_features |=3D (1ULL << VIRTIO_NET_F_SPEED_DUPLEX);
     }
=20
--=20
2.21.1



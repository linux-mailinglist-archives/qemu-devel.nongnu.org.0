Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA771DE901
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 12:06:35 +0200 (CEST)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMUaA-0001BM-RC
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 06:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iMUZ6-0000H8-6G
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iMUZ4-0002LX-SM
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45173
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1iMUZ4-0002JD-OI
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571652326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2mrKDmz69yJr3uvYYgibrixmhFJSC2qc9XXLpvPVEqg=;
 b=KpM30X29fQT+rk9O9Rw5uhHds66a9KTFOLQBgjhfUJneoQshAFd5Ra0lKCCg83SS7SNWQs
 oSS44jdHuhLOA8HQORId7b1v/E+srxZtjZ6s498oUHfyYdZo+cP3QKzqPDeW2ADF50CJtS
 usy6JI6furfioUjl5X9NTujkkxbbFHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-QDoneGu1OFSScEHDnVeo7w-1; Mon, 21 Oct 2019 06:05:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70FCF800D41;
 Mon, 21 Oct 2019 10:05:21 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-198.ams2.redhat.com [10.36.116.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B6C7F6F0;
 Mon, 21 Oct 2019 10:05:16 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] s390x/kvm: Set default cpu model for all machine classes
Date: Mon, 21 Oct 2019 12:05:15 +0200
Message-Id: <20191021100515.6978-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: QDoneGu1OFSScEHDnVeo7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Jiri Denemark <jdenemar@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have to set the default model of all machine classes, not just for
the active one. Otherwise, "query-machines" will indicate the wrong
CPU model ("qemu-s390x-cpu" instead of "host-s390x-cpu") as
"default-cpu-type".

Doing a
    {"execute":"query-machines"}
under KVM now results in
    {"return": [
        {
            "hotpluggable-cpus": true,
            "name": "s390-ccw-virtio-4.0",
            "numa-mem-supported": false,
            "default-cpu-type": "host-s390x-cpu",
            "cpu-max": 248,
            "deprecated": false},
        {
            "hotpluggable-cpus": true,
            "name": "s390-ccw-virtio-2.7",
            "numa-mem-supported": false,
            "default-cpu-type": "host-s390x-cpu",
            "cpu-max": 248,
            "deprecated": false
        } ...

Libvirt probes all machines via "-machine none,accel=3Dkvm:tcg" and will
currently see the wrong CPU model under KVM.

Reported-by: Jiri Denemark <jdenemar@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Fixes: b6805e127c6b ("s390x: use generic cpu_model parsing")
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

v1 -> v2:
- Added a sentence how libvirt probes the machines/default cpu models
- klass -> oc

---
 target/s390x/kvm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index c24c869e77..0c9d14b4b1 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -320,11 +320,17 @@ void kvm_s390_set_max_pagesize(uint64_t pagesize, Err=
or **errp)
     cap_hpage_1m =3D 1;
 }
=20
-int kvm_arch_init(MachineState *ms, KVMState *s)
+static void ccw_machine_class_foreach(ObjectClass *oc, void *opaque)
 {
-    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
+    MachineClass *mc =3D MACHINE_CLASS(oc);
=20
     mc->default_cpu_type =3D S390_CPU_TYPE_NAME("host");
+}
+
+int kvm_arch_init(MachineState *ms, KVMState *s)
+{
+    object_class_foreach(ccw_machine_class_foreach, TYPE_S390_CCW_MACHINE,
+                         false, NULL);
=20
     if (!kvm_check_extension(kvm_state, KVM_CAP_DEVICE_CTRL)) {
         error_report("KVM is missing capability KVM_CAP_DEVICE_CTRL - "
--=20
2.21.0



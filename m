Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532F1370B3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 16:07:18 +0100 (CET)
Received: from localhost ([::1]:47322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipvsb-0003Hh-5f
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 10:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54836)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipvhT-0005L5-Bc
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 09:55:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipvhR-0008LJ-Dv
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 09:55:47 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30284
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipvhP-0008FZ-Hf
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 09:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578668138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a23BP+daq14PCXzBJ1VBQHnFohqZ7eqS+b84+7K03gk=;
 b=JW1RDjmpEsFJmYOLaCSZ8OHebHR2dEnrmct2dbN+aw1pweR0h8t94FonAGOiOacq10bF6C
 pU9VhVQ4LCZ9DGMPCT2Zl3KTDhy5TLNjI9gYOEg/QQgLpyXLSGS+6uT8Ev5w3hEGEWxukN
 axj6PP/aaR7Ct6Y6h4Hqv/E5Oma4gIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-2xX62-pzMkGeqrj6IDdk8Q-1; Fri, 10 Jan 2020 09:55:36 -0500
X-MC-Unique: 2xX62-pzMkGeqrj6IDdk8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 472A91083E84;
 Fri, 10 Jan 2020 14:55:35 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 615E67C3EB;
 Fri, 10 Jan 2020 14:55:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
 kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: [kvm-unit-tests PATCH v2 16/16] arm/arm64: ITS: pending table
 migration test
Date: Fri, 10 Jan 2020 15:54:12 +0100
Message-Id: <20200110145412.14937-17-eric.auger@redhat.com>
In-Reply-To: <20200110145412.14937-1-eric.auger@redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, andre.przywara@arm.com,
 thuth@redhat.com, yuzenghui@huawei.com, alexandru.elisei@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two new migration tests. One testing the migration of
a topology where collection were unmapped. The second test
checks the migration of the pending table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 arm/gic.c         | 148 ++++++++++++++++++++++++++++++++++++++++++++++
 arm/unittests.cfg |  16 ++++-
 2 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/arm/gic.c b/arm/gic.c
index bf4b5ba..cb976c3 100644
--- a/arm/gic.c
+++ b/arm/gic.c
@@ -170,6 +170,7 @@ static void lpi_handler(struct pt_regs *regs __unused=
)
 	smp_rmb(); /* pairs with wmb in lpi_stats_expect */
 	lpi_stats.observed.cpu_id =3D smp_processor_id();
 	lpi_stats.observed.lpi_id =3D irqnr;
+	acked[lpi_stats.observed.cpu_id]++;
 	smp_wmb(); /* pairs with rmb in check_lpi_stats */
 }
=20
@@ -207,6 +208,18 @@ static void check_lpi_stats(void)
 	}
 }
=20
+static void check_lpi_hits(int *expected)
+{
+	int i;
+
+	for (i =3D 0; i < nr_cpus; i++) {
+		if (acked[i] !=3D expected[i])
+			report(false, "expected %d LPIs on PE #%d, %d observed",
+			       expected[i], i, acked[i]);
+		}
+	report(true, "check LPI on all vcpus");
+}
+
 static void gicv2_ipi_send_self(void)
 {
 	writel(2 << 24 | IPI_IRQ, gicv2_dist_base() + GICD_SGIR);
@@ -641,6 +654,18 @@ static int its_prerequisites(int nb_cpus)
 	return 0;
 }
=20
+static void set_lpi(struct its_device *dev, u32 eventid, u32 physid,
+		    struct its_collection *col)
+{
+	if (!dev || !col)
+		report_abort("wrong device or collection");
+
+	its_send_mapti(dev, physid, eventid, col);
+
+	set_lpi_config(physid, LPI_PROP_DEFAULT);
+	its_send_invall(col);
+}
+
 /*
  * Setup the configuration for those mappings:
  * dev_id=3D2 event=3D20 -> vcpu 3, intid=3D8195
@@ -765,6 +790,121 @@ static void test_its_migration(void)
 	check_lpi_stats();
 }
=20
+static void test_migrate_unmapped_collection(void)
+{
+	struct its_collection *col;
+	struct its_device *dev2, *dev7;
+	u8 config;
+
+	if (its_setup1())
+		return;
+
+	col =3D its_create_collection(nr_cpus - 1, nr_cpus - 1);
+	dev2 =3D its_get_device(2);
+	dev7 =3D its_get_device(7);
+
+	/* MAPTI with the collection unmapped */
+	set_lpi(dev2, 0, 8192, col);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report(true, "Migration complete");
+
+	/* on the destination, map the collection */
+	its_send_mapc(col, true);
+
+	lpi_stats_expect(2, 8196);
+	its_send_int(dev7, 255);
+	check_lpi_stats();
+
+	config =3D get_lpi_config(8192);
+	report(config =3D=3D LPI_PROP_DEFAULT,
+	       "Config of LPI 8192 was properly migrated");
+
+	lpi_stats_expect(nr_cpus - 1, 8192);
+	its_send_int(dev2, 0);
+	check_lpi_stats();
+
+	/* unmap the collection */
+	its_send_mapc(col, false);
+
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 0);
+	check_lpi_stats();
+
+	/* remap event 0 onto lpiid 8193 */
+	set_lpi(dev2, 0, 8193, col);
+	lpi_stats_expect(-1, -1);
+	its_send_int(dev2, 0);
+	check_lpi_stats();
+
+	/* remap the collection */
+	its_send_mapc(col, true);
+	lpi_stats_expect(nr_cpus - 1, 8193);
+}
+
+static void test_its_pending_migration(void)
+{
+	struct its_device *dev;
+	struct its_collection *collection[2];
+	int expected[NR_CPUS];
+	u64 pendbaser;
+	void *ptr;
+	int i;
+
+	if (its_prerequisites(4))
+		return;
+
+	dev =3D its_create_device(2 /* dev id */, 8 /* nb_ites */);
+	its_send_mapd(dev, true);
+
+	collection[0] =3D its_create_collection(nr_cpus - 1, nr_cpus - 1);
+	collection[1] =3D its_create_collection(nr_cpus - 2, nr_cpus - 2);
+	its_send_mapc(collection[0], true);
+	its_send_mapc(collection[1], true);
+
+	/* disable lpi at redist level */
+	gicv3_rdist_ctrl_lpi(nr_cpus - 1, false);
+	gicv3_rdist_ctrl_lpi(nr_cpus - 2, false);
+
+	/* even lpis are assigned to even cpu */
+	for (i =3D 0; i < 256; i++) {
+		struct its_collection *col =3D i % 2 ? collection[0] :
+						     collection[1];
+		int vcpu =3D col->target_address >> 16;
+
+		its_send_mapti(dev, 8192 + i, i, col);
+		set_lpi_config(8192 + i, LPI_PROP_DEFAULT);
+		set_pending_table_bit(vcpu, 8192 + i, true);
+	}
+	its_send_invall(collection[0]);
+	its_send_invall(collection[1]);
+
+	/* Set the PTZ bit on each pendbaser */
+
+	expected[nr_cpus - 1] =3D 128;
+	expected[nr_cpus - 2] =3D 128;
+
+	ptr =3D gicv3_data.redist_base[nr_cpus - 1] + GICR_PENDBASER;
+	pendbaser =3D readq(ptr);
+	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
+
+	ptr =3D gicv3_data.redist_base[nr_cpus - 2] + GICR_PENDBASER;
+	pendbaser =3D readq(ptr);
+	writeq(pendbaser & ~GICR_PENDBASER_PTZ, ptr);
+
+	gicv3_rdist_ctrl_lpi(nr_cpus - 1, true);
+	gicv3_rdist_ctrl_lpi(nr_cpus - 2, true);
+
+	puts("Now migrate the VM, then press a key to continue...\n");
+	(void)getchar();
+	report(true, "Migration complete");
+
+	mdelay(1000);
+
+	check_lpi_hits(expected);
+}
+
 int main(int argc, char **argv)
 {
 	if (!gic_init()) {
@@ -803,6 +943,14 @@ int main(int argc, char **argv)
 		report_prefix_push(argv[1]);
 		test_its_migration();
 		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-pending-migration")) {
+		report_prefix_push(argv[1]);
+		test_its_pending_migration();
+		report_prefix_pop();
+	} else if (!strcmp(argv[1], "its-migrate-unmapped-collection")) {
+		report_prefix_push(argv[1]);
+		test_migrate_unmapped_collection();
+		report_prefix_pop();
 	} else if (strcmp(argv[1], "its-introspection") =3D=3D 0) {
 		report_prefix_push(argv[1]);
 		test_its_introspection();
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 29e2efc..911f0b7 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -145,7 +145,21 @@ file =3D gic.flat
 smp =3D $MAX_SMP
 accel =3D kvm
 extra_params =3D -machine gic-version=3D3 -append 'its-migration'
-groups =3D its migration
+groups =3D migration
+
+[its-pending-migration]
+file =3D gic.flat
+smp =3D $MAX_SMP
+accel =3D kvm
+extra_params =3D -machine gic-version=3D3 -append 'its-pending-migration=
'
+groups =3D migration
+
+[its-migrate-unmapped-collection]
+file =3D gic.flat
+smp =3D $MAX_SMP
+accel =3D kvm
+extra_params =3D -machine gic-version=3D3 -append 'its-migrate-unmapped-=
collection'
+groups =3D migration
=20
 # Test PSCI emulation
 [psci]
--=20
2.20.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60D23BBD9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 16:16:01 +0200 (CEST)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2xjT-0000KL-UC
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 10:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1k2xVM-0000nn-Cc
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 10:01:24 -0400
Received: from mout.gmx.net ([212.227.15.15]:34581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1k2xVI-00038k-Qs
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 10:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596549659;
 bh=z/QXmt5sYC3nu5t+U0TkgIU+Re5QzTPu4ajnWt9P04Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GKl7PzchaR6KvwnZkgueRlyxa1nHGXcC+abHLq+ylqsy0C89JFyB1aSN+clx0oU5/
 OSM1bTXoerXfiGJdhioZ4OazSzmMtxh54F+3a54kHDW2/5zGBV9JoHT9Wewt08/p8S
 cc5vGJdSB9IBRUutNO7wmzcX469mUD+KPUKH8HYo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.144.148]) by mail.gmx.com (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYNNo-1kGcVF0wEc-00VTId; Tue, 04
 Aug 2020 16:00:59 +0200
From: Helge Deller <deller@gmx.de>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] hw/hppa: Implement proper SeaBIOS version check
Date: Tue,  4 Aug 2020 16:00:51 +0200
Message-Id: <20200804140056.7690-4-deller@gmx.de>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200804140056.7690-1-deller@gmx.de>
References: <20200804140056.7690-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uWBwFB+Yi+PY+tweoRj3JuXVU53CMrCHNPYDQTtaC2rClXIhN3g
 8a3r9/rk7X/W0OZUyMTQr0qAcTk5RQ93O97/yYi7D2w1ZC2MZLSYmD9LfZhnOocC0Poqeha
 BXJygTavVlXielw6qa+vN6CTU9mETDCEFtLC+hPjuvHSliL/uFEjjfPKjkudxt9q9CQiF7G
 a9IZuEcJctu+HHOolAb4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uJ1BLjQDAh0=:pqFs3hb+wgfh7dnRw7rQLz
 FD8BTi9XsL9Q8izKSaL0iSR8RRj26pXTINjEFZ/mY4xwd43PvZQW27xNzEW6aHSWe7MpafdRW
 JxJyAqI3SqS/RagG/Hp4pRJYlSkv7HUhk1rZZn5f1ydwXa78hL5DrF/mrL7cmKg9gpTL+ELMm
 xBx3oLdu2NaaJliOitX32s8KmSAPXUwUmf5WQ6UHcaGzbrxdQdtxp9AoWSOvl8uBRfkwTrYdU
 5NeliZuJZzQgdAUNaXfg03+mw6boJphds9f+V8/1Iyv3BO5s1CC9puyTZdtGfxDIeCFjYQUzz
 HdgC/JIKL1zR9N4kY7nbBctV8tTklDoYmTITWYLn4wMp80aZHYYfG7TpHQswlHLYm9v1WhFmT
 000wQqtE9/Y05W2cqnvGmNS8NGAfnMk1egCRtQPJ69eOGPiKH5dUzdMzBNNJTDGYshh8HEto0
 3dxpmc96RM971X5Lv/yCP1NxPxeQ08jJqOVgvqyNV4ClUVBbOIC5JfAlHMce4DBOe/vA0vz0z
 FgAOKmo4msbh1oFyenM9tm9KXUYJ/p5/VNMWEcvMWER+aYnAdAQf2HB3on6lIaGlMMcULvVNW
 hKI+va225UZLuwHKzSHcO0FnL8QbAnD2JHqLa+Yo5tumb9++GRRyiUXarIMa5IXVFvTpP94az
 7fxVuJooqb5DGgnU9sV6ZU8Q6NIr8BBMVv0MC0oE+xdX2+Q9wipXA2MARrklJOEu4y69G+g1t
 61jDavWENWGKB4UMvVMvrMgTofsDycJE5rWjLEmssWrBgYyXpLVS9LMrKTx7pR+2N2L5M26R1
 rxjJB6sh6dNimuSylu5jahX6YzzOR+dDH/7iV5kt1CMQRYhC4q2KtZeV9JyUKNAZ1T/Ec1f2u
 7LZN46jL27DR1pbzGXW5paGr9at3VBa7R1l2faD4kr4ivsNIzVj/cMhUOFPwdo+ttTGymD8zs
 yDQnqyOJgmyEBm77F9Bjjd9GqKm28vMv6PoWlHwpozM7CkbvUlfoJOob758yMUqNsFosT4Wwe
 NgAHID4tir7J4Vm2G68F4yJrdF+fCAHT3NMPCNQBVdbR/Rw6Gxdf85EJ2cuK3MTBpAqY8ExvQ
 Ds3hIejw5UIxqx8S7Yh3YE8dMLOVdn+7FPgRg7cL6ohJTbwdzzqJHIZWn7MkOi7ZaOXm9ZdYy
 7cyBH8FAlQvuN3gbXM6czIow2c1S5+Zm8ikGsq6sksB/vW6uG44+w8Y1Bga3U82WqAH0OSKtp
 hHoTBU7SXElU6Uzuu
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 08:28:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Helge Deller <deller@gmx.de>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's important that the SeaBIOS hppa firmware is at least at a minimal
level to ensure proper interaction between qemu and firmware.

Implement a proper firmware version check by telling SeaBIOS via the
fw_cfg interface which minimal SeaBIOS version is required by this
running qemu instance. If the firmware detects that it's too old, it
will stop.

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 hw/hppa/machine.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 49155537cd..90aeefe2a4 100644
=2D-- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -25,6 +25,8 @@

 #define MAX_IDE_BUS 2

+#define MIN_SEABIOS_HPPA_VERSION 1 /* require at least this fw version */
+
 static ISABus *hppa_isa_bus(void)
 {
     ISABus *isa_bus;
@@ -56,6 +58,23 @@ static uint64_t cpu_hppa_to_phys(void *opaque, uint64_t=
 addr)
 static HPPACPU *cpu[HPPA_MAX_CPUS];
 static uint64_t firmware_entry;

+static FWCfgState *create_fw_cfg(MachineState *ms)
+{
+    FWCfgState *fw_cfg;
+    uint64_t val;
+
+    fw_cfg =3D fw_cfg_init_mem(QEMU_FW_CFG_IO_BASE, QEMU_FW_CFG_IO_BASE +=
 4);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
+    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ram_size);
+
+    val =3D cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
+    fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
+                    g_memdup(&val, sizeof(val)), sizeof(val));
+
+    return fw_cfg;
+}
+
 static void machine_hppa_init(MachineState *machine)
 {
     const char *kernel_filename =3D machine->kernel_filename;
@@ -118,6 +137,9 @@ static void machine_hppa_init(MachineState *machine)
                        115200, serial_hd(0), DEVICE_BIG_ENDIAN);
     }

+    /* fw_cfg configuration interface */
+    create_fw_cfg(machine);
+
     /* SCSI disk setup. */
     dev =3D DEVICE(pci_create_simple(pci_bus, -1, "lsi53c895a"));
     lsi53c8xx_handle_legacy_cmdline(dev);
=2D-
2.21.3



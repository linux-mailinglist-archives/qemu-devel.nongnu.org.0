Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EF33D3E7
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:34:14 +0100 (CET)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8tp-00015z-FT
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lM8nI-0004Zc-3E; Tue, 16 Mar 2021 08:27:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7288
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pasic@linux.ibm.com>)
 id 1lM8nB-0007TU-1B; Tue, 16 Mar 2021 08:27:27 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GC4Akm049786; Tue, 16 Mar 2021 08:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=VxyDpOQb81QLqwJ6QSceU7qsAALQpfYd2OG2AcEtet0=;
 b=Zshrg+qxM0r+TEb6XDoMes2T3QsLAMDsaFjgrZNFshXHkOD8dZ74tqC9VAFoQKiWVjYN
 w8WZI3zYI9oCtCmPMxLPzwQ1kZHLSK1BqFhznWajvDbl3qsRPuUJkDqQ3fagz2aE/BuP
 0DNeZBRSbH5TF7ecToOpxKxFjL6iFbLvnc3HK/gS7TwuooY0etKKrBtS4iRPC6Di6oI/
 Pbr/CkbfE/jpQsbDkCiLljtsg1OTtVnufNkP96EFm4k8wcuFDVigl2B2cf3j+pD9ktax
 lVOM1+m3qQ9zC5SQ+ZCPDV8g0Kj7PJ9M5wSCs+XbdweYmsSikCf8DzsT4Uud1IEFEdNy jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aum024xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 08:27:05 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12GC4JBo050708;
 Tue, 16 Mar 2021 08:27:04 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37aum024x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 08:27:04 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12GCCPUG026981;
 Tue, 16 Mar 2021 12:27:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 378n181fw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 12:27:02 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12GCQxjl40304980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 12:26:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58405A4040;
 Tue, 16 Mar 2021 12:26:59 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A59CBA405F;
 Tue, 16 Mar 2021 12:26:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Mar 2021 12:26:58 +0000 (GMT)
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2]  modules: introduce target specific modules
Date: Tue, 16 Mar 2021 13:26:47 +0100
Message-Id: <20210316122648.3372459-2-pasic@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316122648.3372459-1-pasic@linux.ibm.com>
References: <20210316122648.3372459-1-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_04:2021-03-16,
 2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103160085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pasic@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Boris Fiuczynski <fiuczy@linux.ibm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After some back-and-forth in [1] Daniel suggested that
we could/should make qemu modules per-target by introducing a
dedicated modules directory for each target, which can symlink the
modules that do work with and do make sense for the given target.

That way we can avoid trying to load modules we know won't work and
coming up with convoluted ways for making subsequent failures graceful.
The topic of per-target modules was discussed before [1] but, the
idea with the symlinks originates from [1].

This patch introduces  this new scheme of loading modules without
actually introducing any changes to what modules are available to what
targets. For the exploitation have look at 'hw/s390x: modularize
virtio-gpu-ccw'.

[1] https://mail.gnu.org/archive/html/qemu-s390x/2021-03/msg00206.html

Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
Suggested-by: "Daniel P. Berrangé" <berrange@redhat.com>
---
 hw/s390x/meson.build               |  1 -
 include/qemu/module.h              |  2 ++
 meson.build                        | 43 +++++++++++++++++++++++++++++-
 roms/SLOF                          |  2 +-
 roms/opensbi                       |  2 +-
 scripts/call_generated_script.sh   |  6 +++++
 scripts/modules/target-symlinks.sh | 31 +++++++++++++++++++++
 softmmu/runstate.c                 |  1 +
 util/module.c                      | 13 +++++++--
 9 files changed, 95 insertions(+), 6 deletions(-)
 create mode 100755 scripts/call_generated_script.sh
 create mode 100755 scripts/modules/target-symlinks.sh

diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
index 91495b5631..0cee605f0a 100644
--- a/hw/s390x/meson.build
+++ b/hw/s390x/meson.build
@@ -34,7 +34,6 @@ virtio_ss.add(files('virtio-ccw.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BALLOON', if_true: files('virtio-ccw-balloon.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-ccw-blk.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('virtio-ccw-crypto.c'))
-virtio_ss.add(when: 'CONFIG_VIRTIO_GPU', if_true: files('virtio-ccw-gpu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_INPUT', if_true: files('virtio-ccw-input.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
diff --git a/include/qemu/module.h b/include/qemu/module.h
index 944d403cbd..85a59fde81 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -73,4 +73,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail);
 void module_load_qom_one(const char *type);
 void module_load_qom_all(void);
 
+void set_emulator_modules_dir(char const *dir_name);
+
 #endif
diff --git a/meson.build b/meson.build
index a7d2dd429d..8926968182 100644
--- a/meson.build
+++ b/meson.build
@@ -1749,6 +1749,7 @@ user_ss = ss.source_set()
 util_ss = ss.source_set()
 
 modules = {}
+modules_restricted = {}
 hw_arch = {}
 target_arch = {}
 target_softmmu_arch = {}
@@ -2092,14 +2093,54 @@ common_ss.add(hwcore)
 # Targets #
 ###########
 
+module_targets = []
 foreach m : block_mods + softmmu_mods
-  shared_module(m.name(),
+   module_targets += shared_module(m.name(),
                 name_prefix: '',
                 link_whole: m,
                 install: true,
                 install_dir: qemu_moddir)
 endforeach
 
+foreach target : target_dirs
+  if not target.endswith('-softmmu')
+    continue
+  endif
+  filtered_module_targets = []
+  foreach m : module_targets
+    restricted_to = modules_restricted.get(m.name(), [])
+    if restricted_to.length() == 0 or restricted_to.contains(target)
+      filtered_module_targets += m
+    endif
+  endforeach
+  s = custom_target('Make symbolic links script for ' + target + ' modules' ,
+		   input: filtered_module_targets,
+		   output: 'make_mod_symlinks_'+target+'.sh',
+		   install: false,
+		   depends: filtered_module_targets,
+		   build_by_default: true,
+		   build_always_stale: true,
+		   command: [
+                     meson.current_source_dir() / 'scripts/modules/target-symlinks.sh',
+		     '@OUTPUT@',
+		     target,
+		     '@INPUT@'
+		   ])
+
+  # We run the script as a part of the build so things keep working form the
+  # build tree (without requiring an instalation). I couldn't find a nicer way.
+  custom_target('Run symbolic links script for ' + target + ' modules' ,
+		   depends: s,
+		   output: 'make_mod_symlinks_'+target+'.sh.dummy',
+		   install: false,
+		   build_by_default: true,
+		   build_always_stale: true,
+		   command: [
+		     s.full_path(),
+                     meson.current_build_dir()
+		   ])
+  meson.add_install_script(meson.current_source_dir() / 'scripts/call_generated_script.sh', s.full_path(), qemu_moddir)
+endforeach
 softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
 
diff --git a/roms/SLOF b/roms/SLOF
index 33a7322de1..e18ddad851 160000
--- a/roms/SLOF
+++ b/roms/SLOF
@@ -1 +1 @@
-Subproject commit 33a7322de13e9dca4b38851a345a58d37e7a441d
+Subproject commit e18ddad8516ff2cfe36ec130200318f7251aa78c
diff --git a/roms/opensbi b/roms/opensbi
index 234ed8e427..a98258d0b5 160000
--- a/roms/opensbi
+++ b/roms/opensbi
@@ -1 +1 @@
-Subproject commit 234ed8e427f4d92903123199f6590d144e0d9351
+Subproject commit a98258d0b537a295f517bbc8d813007336731fa9
diff --git a/scripts/call_generated_script.sh b/scripts/call_generated_script.sh
new file mode 100755
index 0000000000..1743b39d7c
--- /dev/null
+++ b/scripts/call_generated_script.sh
@@ -0,0 +1,6 @@
+#!/bin/bash
+
+SCRIPT=$1
+shift
+
+${SCRIPT} "$@"
diff --git a/scripts/modules/target-symlinks.sh b/scripts/modules/target-symlinks.sh
new file mode 100755
index 0000000000..25a402a27f
--- /dev/null
+++ b/scripts/modules/target-symlinks.sh
@@ -0,0 +1,31 @@
+#!/bin/bash
+
+TARGET_FILE="$1"
+shift
+TARGET_DIR="$1"
+shift
+
+cat > "${TARGET_FILE}" <<EOF
+#!/bin/bash
+
+test \$# -eq 1 || exit 1
+if [ -z \${MESON_INSTALL_DESTDIR_PREFIX+N} ]; then
+    INSTALL_DIR="\${1}"
+else
+    INSTALL_DIR="\${MESON_INSTALL_DESTDIR_PREFIX}/\${1}"
+fi
+test -d  "\${INSTALL_DIR}" || exit 1
+LINKS_DIR="\${INSTALL_DIR}/${TARGET_DIR}"
+mkdir -p \${LINKS_DIR}
+# clean up old symbolic links
+find \${LINKS_DIR} -iname '*.so' -type l -delete
+cd "\${LINKS_DIR}"
+
+EOF
+chmod u+x "${TARGET_FILE}"
+
+while test $# -gt 0
+do
+    echo ln -sfrt \"\$\{LINKS_DIR\}\" \"../"$1"\" >> "${TARGET_FILE}"
+    shift
+done
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index ce8977c6a2..6842827ad5 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -758,6 +758,7 @@ void qemu_init_subsystems(void)
 
     atexit(qemu_run_exit_notifiers);
 
+    set_emulator_modules_dir(g_strconcat(TARGET_NAME, "-softmmu"));
     module_call_init(MODULE_INIT_QOM);
     module_call_init(MODULE_INIT_MIGRATION);
 
diff --git a/util/module.c b/util/module.c
index c65060c167..26fc893d98 100644
--- a/util/module.c
+++ b/util/module.c
@@ -64,6 +64,15 @@ static ModuleTypeList *find_type(module_init_type type)
     return &init_type_list[type];
 }
 
+static char const *emulator_modules_dir;
+
+void set_emulator_modules_dir(char const *dir_name)
+{
+    assert(dir_name);
+    assert(!emulator_modules_dir);
+    emulator_modules_dir = dir_name;
+}
+
 void register_module_init(void (*fn)(void), module_init_type type)
 {
     ModuleEntry *e;
@@ -252,8 +261,8 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     assert(n_dirs <= ARRAY_SIZE(dirs));
 
     for (i = 0; i < n_dirs; i++) {
-        fname = g_strdup_printf("%s/%s%s",
-                dirs[i], module_name, CONFIG_HOST_DSOSUF);
+        fname = g_strdup_printf("%s/%s/%s%s", dirs[i], emulator_modules_dir,
+                                module_name, CONFIG_HOST_DSOSUF);
         ret = module_load_file(fname, mayfail, export_symbols);
         g_free(fname);
         fname = NULL;
-- 
2.25.1



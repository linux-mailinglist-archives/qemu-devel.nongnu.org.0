Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0716BCB9F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 10:56:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pckJq-0001O1-W4; Thu, 16 Mar 2023 05:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pckJp-0001Ns-QX
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1pckJm-0008Rb-66
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 05:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678960481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LJrCjkjUlBik/3dh3MElKLP0EIatgPyPNbV2DBetjSQ=;
 b=IWClTeuWOZ1TxUTRF5NzunBdwT+tqwy9fZc6uaI9WzlBHFqE0HjRc+CMV+0anFDAl3BJEc
 6PJUImdAjcRK3LwfCP3OWdfQrXTazapnRKVPCpeVyjNrM3j6Brm06YVzu6j6/5ruY1Wdd5
 zGHgn/ZArxOFVHD492Mp+Pyo077JoZU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-tTzUddCwMg6RKJKvm3iNDw-1; Thu, 16 Mar 2023 05:54:38 -0400
X-MC-Unique: tTzUddCwMg6RKJKvm3iNDw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B88611C07581;
 Thu, 16 Mar 2023 09:54:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 093F52166B26;
 Thu, 16 Mar 2023 09:54:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8C3371801F28; Thu, 16 Mar 2023 10:54:32 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 5/6] edk2: replace build scripts
Date: Thu, 16 Mar 2023 10:54:31 +0100
Message-Id: <20230316095432.1514080-6-kraxel@redhat.com>
In-Reply-To: <20230316095432.1514080-1-kraxel@redhat.com>
References: <20230316095432.1514080-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Remove Makefile.edk2 and the edk2*.sh scripts and replace them
with a python script (which already handles fedora rpm builds)
and a config file for it.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/edk2-build.py     | 380 +++++++++++++++++++++++++++++++++++++++++
 roms/Makefile          |  29 +---
 roms/Makefile.edk2     | 178 -------------------
 roms/edk2-build.config | 124 ++++++++++++++
 roms/edk2-build.sh     |  55 ------
 roms/edk2-funcs.sh     | 273 -----------------------------
 6 files changed, 511 insertions(+), 528 deletions(-)
 create mode 100755 roms/edk2-build.py
 delete mode 100644 roms/Makefile.edk2
 create mode 100644 roms/edk2-build.config
 delete mode 100755 roms/edk2-build.sh
 delete mode 100644 roms/edk2-funcs.sh

diff --git a/roms/edk2-build.py b/roms/edk2-build.py
new file mode 100755
index 000000000000..870893f7c8e3
--- /dev/null
+++ b/roms/edk2-build.py
@@ -0,0 +1,380 @@
+#!/usr/bin/python3
+"""
+build helper script for edk2, see
+https://gitlab.com/kraxel/edk2-build-config
+
+"""
+import os
+import sys
+import shutil
+import argparse
+import subprocess
+import configparser
+
+rebase_prefix    = ""
+version_override = None
+release_date     = None
+
+# pylint: disable=unused-variable
+def check_rebase():
+    """ detect 'git rebase -x edk2-build.py master' testbuilds """
+    global rebase_prefix
+    global version_override
+    gitdir = '.git'
+
+    if os.path.isfile(gitdir):
+        with open(gitdir, 'r', encoding = 'utf-8') as f:
+            (unused, gitdir) = f.read().split()
+
+    if not os.path.exists(f'{gitdir}/rebase-merge/msgnum'):
+        return
+    with open(f'{gitdir}/rebase-merge/msgnum', 'r', encoding = 'utf-8') as f:
+        msgnum = int(f.read())
+    with open(f'{gitdir}/rebase-merge/end', 'r', encoding = 'utf-8') as f:
+        end = int(f.read())
+    with open(f'{gitdir}/rebase-merge/head-name', 'r', encoding = 'utf-8') as f:
+        head = f.read().strip().split('/')
+
+    rebase_prefix = f'[ {int(msgnum/2)} / {int(end/2)} - {head[-1]} ] '
+    if msgnum != end and not version_override:
+        # fixed version speeds up builds
+        version_override = "test-build-patch-series"
+
+def get_coredir(cfg):
+    if cfg.has_option('global', 'core'):
+        return os.path.abspath(cfg['global']['core'])
+    return os.getcwd()
+
+def get_version(cfg):
+    coredir = get_coredir(cfg)
+    if version_override:
+        version = version_override
+        print('')
+        print(f'### version [override]: {version}')
+        return version
+    if os.environ.get('RPM_PACKAGE_NAME'):
+        version = os.environ.get('RPM_PACKAGE_NAME')
+        version += '-' + os.environ.get('RPM_PACKAGE_VERSION')
+        version += '-' + os.environ.get('RPM_PACKAGE_RELEASE')
+        print('')
+        print(f'### version [rpmbuild]: {version}')
+        return version
+    if os.path.exists(coredir + '/.git'):
+        cmdline = [ 'git', 'describe', '--tags', '--abbrev=8',
+                    '--match=edk2-stable*' ]
+        result = subprocess.run(cmdline, cwd = coredir,
+                                stdout = subprocess.PIPE,
+                                check = True)
+        version = result.stdout.decode().strip()
+        print('')
+        print(f'### version [git]: {version}')
+        return version
+    return None
+
+def pcd_string(name, value):
+    return f'{name}=L{value}\\0'
+
+def pcd_version(cfg):
+    version = get_version(cfg)
+    if version is None:
+        return []
+    return [ '--pcd', pcd_string('PcdFirmwareVersionString', version) ]
+
+def pcd_release_date():
+    if release_date is None:
+        return []
+    return [ '--pcd', pcd_string('PcdFirmwareReleaseDateString', release_date) ]
+
+def build_message(line, line2 = None):
+    if os.environ.get('TERM') in [ 'xterm', 'xterm-256color' ]:
+        # setxterm  title
+        start  = '\x1b]2;'
+        end    = '\x07'
+        print(f'{start}{rebase_prefix}{line}{end}', end = '')
+
+    print('')
+    print('###')
+    print(f'### {rebase_prefix}{line}')
+    if line2:
+        print(f'### {line2}')
+    print('###', flush = True)
+
+def build_run(cmdline, name, section, silent = False):
+    print(cmdline, flush = True)
+    if silent:
+        print('### building in silent mode ...', flush = True)
+        result = subprocess.run(cmdline, check = False,
+                                stdout = subprocess.PIPE,
+                                stderr = subprocess.STDOUT)
+
+        logfile = f'{section}.log'
+        print(f'### writing log to {logfile} ...')
+        with open(logfile, 'wb') as f:
+            f.write(result.stdout)
+
+        if result.returncode:
+            print('### BUILD FAILURE')
+            print('### output')
+            print(result.stdout.decode())
+            print(f'### exit code: {result.returncode}')
+        else:
+            print('### OK')
+    else:
+        result = subprocess.run(cmdline, check = False)
+    if result.returncode:
+        print(f'ERROR: {cmdline[0]} exited with {result.returncode}'
+              f' while building {name}')
+        sys.exit(result.returncode)
+
+def build_copy(plat, tgt, dstdir, copy):
+    srcdir = f'Build/{plat}/{tgt}_GCC5'
+    names = copy.split()
+    srcfile = names[0]
+    if len(names) > 1:
+        dstfile = names[1]
+    else:
+        dstfile = os.path.basename(srcfile)
+    print(f'# copy: {srcdir} / {srcfile}  =>  {dstdir} / {dstfile}')
+
+    src = srcdir + '/' + srcfile
+    dst = dstdir + '/' + dstfile
+    os.makedirs(os.path.dirname(dst), exist_ok = True)
+    shutil.copy(src, dst)
+
+def pad_file(dstdir, pad):
+    args = pad.split()
+    if len(args) < 2:
+        raise RuntimeError(f'missing arg for pad ({args})')
+    name = args[0]
+    size = args[1]
+    cmdline = [
+        'truncate',
+        '--size', size,
+        dstdir + '/' + name,
+    ]
+    print(f'# padding: {dstdir} / {name}  =>  {size}')
+    subprocess.run(cmdline, check = True)
+
+# pylint: disable=too-many-branches
+def build_one(cfg, build, jobs = None, silent = False):
+    cmdline  = [ 'build' ]
+    cmdline += [ '-t', 'GCC5' ]
+    cmdline += [ '-p', cfg[build]['conf'] ]
+
+    if (cfg[build]['conf'].startswith('OvmfPkg/') or
+        cfg[build]['conf'].startswith('ArmVirtPkg/')):
+        cmdline += pcd_version(cfg)
+        cmdline += pcd_release_date()
+
+    if jobs:
+        cmdline += [ '-n', jobs ]
+    for arch in cfg[build]['arch'].split():
+        cmdline += [ '-a', arch ]
+    if 'opts' in cfg[build]:
+        for name in cfg[build]['opts'].split():
+            section = 'opts.' + name
+            for opt in cfg[section]:
+                cmdline += [ '-D', opt + '=' + cfg[section][opt] ]
+    if 'pcds' in cfg[build]:
+        for name in cfg[build]['pcds'].split():
+            section = 'pcds.' + name
+            for pcd in cfg[section]:
+                cmdline += [ '--pcd', pcd + '=' + cfg[section][pcd] ]
+    if 'tgts' in cfg[build]:
+        tgts = cfg[build]['tgts'].split()
+    else:
+        tgts = [ 'DEBUG' ]
+    for tgt in tgts:
+        desc = None
+        if 'desc' in cfg[build]:
+            desc = cfg[build]['desc']
+        build_message(f'building: {cfg[build]["conf"]} ({cfg[build]["arch"]}, {tgt})',
+                      f'description: {desc}')
+        build_run(cmdline + [ '-b', tgt ],
+                  cfg[build]['conf'],
+                  build + '.' + tgt,
+                  silent)
+
+        if 'plat' in cfg[build]:
+            # copy files
+            for cpy in cfg[build]:
+                if not cpy.startswith('cpy'):
+                    continue
+                build_copy(cfg[build]['plat'],
+                           tgt,
+                           cfg[build]['dest'],
+                           cfg[build][cpy])
+            # pad builds
+            for pad in cfg[build]:
+                if not pad.startswith('pad'):
+                    continue
+                pad_file(cfg[build]['dest'],
+                         cfg[build][pad])
+
+def build_basetools(silent = False):
+    build_message('building: BaseTools')
+    basedir = os.environ['EDK_TOOLS_PATH']
+    cmdline = [ 'make', '-C', basedir ]
+    build_run(cmdline, 'BaseTools', 'build.basetools', silent)
+
+def binary_exists(name):
+    for pdir in os.environ['PATH'].split(':'):
+        if os.path.exists(pdir + '/' + name):
+            return True
+    return False
+
+def prepare_env(cfg):
+    """ mimic Conf/BuildEnv.sh """
+    workspace = os.getcwd()
+    packages = [ workspace, ]
+    path = os.environ['PATH'].split(':')
+    dirs = [
+        'BaseTools/Bin/Linux-x86_64',
+        'BaseTools/BinWrappers/PosixLike'
+    ]
+
+    if cfg.has_option('global', 'pkgs'):
+        for pkgdir in cfg['global']['pkgs'].split():
+            packages.append(os.path.abspath(pkgdir))
+    coredir = get_coredir(cfg)
+    if coredir != workspace:
+        packages.append(coredir)
+
+    # add basetools to path
+    for pdir in dirs:
+        p = coredir + '/' + pdir
+        if not os.path.exists(p):
+            continue
+        if p in path:
+            continue
+        path.insert(0, p)
+
+    # run edksetup if needed
+    toolsdef = coredir + '/Conf/tools_def.txt'
+    if not os.path.exists(toolsdef):
+        os.makedirs(os.path.dirname(toolsdef), exist_ok = True)
+        build_message('running BaseTools/BuildEnv')
+        cmdline = [ 'bash', 'BaseTools/BuildEnv' ]
+        subprocess.run(cmdline, cwd = coredir, check = True)
+
+    # set variables
+    os.environ['PATH'] = ':'.join(path)
+    os.environ['PACKAGES_PATH'] = ':'.join(packages)
+    os.environ['WORKSPACE'] = workspace
+    os.environ['EDK_TOOLS_PATH'] = coredir + '/BaseTools'
+    os.environ['CONF_PATH'] = coredir + '/Conf'
+    os.environ['PYTHON_COMMAND'] = '/usr/bin/python3'
+    os.environ['PYTHONHASHSEED'] = '1'
+
+    # for cross builds
+    if binary_exists('arm-linux-gnu-gcc'):
+        os.environ['GCC5_ARM_PREFIX'] = 'arm-linux-gnu-'
+    if binary_exists('loongarch64-linux-gnu-gcc'):
+        os.environ['GCC5_LOONGARCH64_PREFIX'] = 'loongarch64-linux-gnu-'
+
+    hostarch = os.uname().machine
+    if binary_exists('aarch64-linux-gnu-gcc') and hostarch != 'aarch64':
+        os.environ['GCC5_AARCH64_PREFIX'] = 'aarch64-linux-gnu-'
+    if binary_exists('riscv64-linux-gnu-gcc') and hostarch != 'riscv64':
+        os.environ['GCC5_RISCV64_PREFIX'] = 'riscv64-linux-gnu-'
+    if binary_exists('x86_64-linux-gnu-gcc') and hostarch != 'x86_64':
+        os.environ['GCC5_IA32_PREFIX'] = 'x86_64-linux-gnu-'
+        os.environ['GCC5_X64_PREFIX'] = 'x86_64-linux-gnu-'
+        os.environ['GCC5_BIN'] = 'x86_64-linux-gnu-'
+
+def build_list(cfg):
+    for build in cfg.sections():
+        if not build.startswith('build.'):
+            continue
+        name = build.lstrip('build.')
+        desc = 'no description'
+        if 'desc' in cfg[build]:
+            desc = cfg[build]['desc']
+        print(f'# {name:20s} - {desc}')
+
+def main():
+    parser = argparse.ArgumentParser(prog = 'edk2-build',
+                                     description = 'edk2 build helper script')
+    parser.add_argument('-c', '--config', dest = 'configfile',
+                        type = str, default = '.edk2.builds', metavar = 'FILE',
+                        help = 'read configuration from FILE (default: .edk2.builds)')
+    parser.add_argument('-C', '--directory', dest = 'directory', type = str,
+                        help = 'change to DIR before building', metavar = 'DIR')
+    parser.add_argument('-j', '--jobs', dest = 'jobs', type = str,
+                        help = 'allow up to JOBS parallel build jobs',
+                        metavar = 'JOBS')
+    parser.add_argument('-m', '--match', dest = 'match', type = str,
+                        help = 'only run builds matching INCLUDE (substring)',
+                        metavar = 'INCLUDE')
+    parser.add_argument('-x', '--exclude', dest = 'exclude', type = str,
+                        help = 'skip builds matching EXCLUDE (substring)',
+                        metavar = 'EXCLUDE')
+    parser.add_argument('-l', '--list', dest = 'list',
+                        action = 'store_true', default = False,
+                        help = 'list build configs available')
+    parser.add_argument('--silent', dest = 'silent',
+                        action = 'store_true', default = False,
+                        help = 'write build output to logfiles, '
+                        'write to console only on errors')
+    parser.add_argument('--core', dest = 'core', type = str, metavar = 'DIR',
+                        help = 'location of the core edk2 repository '
+                        '(i.e. where BuildTools are located)')
+    parser.add_argument('--pkg', '--package', dest = 'pkgs',
+                        type = str, action = 'append', metavar = 'DIR',
+                        help = 'location(s) of additional packages '
+                        '(can be specified multiple times)')
+    parser.add_argument('--version-override', dest = 'version_override',
+                        type = str, metavar = 'VERSION',
+                        help = 'set firmware build version')
+    parser.add_argument('--release-date', dest = 'release_date',
+                        type = str, metavar = 'DATE',
+                        help = 'set firmware build release date (in MM/DD/YYYY format)')
+    options = parser.parse_args()
+
+    if options.directory:
+        os.chdir(options.directory)
+
+    if not os.path.exists(options.configfile):
+        print('config file "{options.configfile}" not found')
+        return 1
+
+    cfg = configparser.ConfigParser()
+    cfg.optionxform = str
+    cfg.read(options.configfile)
+
+    if options.list:
+        build_list(cfg)
+        return
+
+    if not cfg.has_section('global'):
+        cfg.add_section('global')
+    if options.core:
+        cfg.set('global', 'core', options.core)
+    if options.pkgs:
+        cfg.set('global', 'pkgs', ' '.join(options.pkgs))
+
+    global version_override
+    global release_date
+    check_rebase()
+    if options.version_override:
+        version_override = options.version_override
+    if options.release_date:
+        release_date = options.release_date
+
+    prepare_env(cfg)
+    build_basetools(options.silent)
+    for build in cfg.sections():
+        if not build.startswith('build.'):
+            continue
+        if options.match and options.match not in build:
+            print(f'# skipping "{build}" (not matching "{options.match}")')
+            continue
+        if options.exclude and options.exclude in build:
+            print(f'# skipping "{build}" (matching "{options.exclude}")')
+            continue
+        build_one(cfg, build, options.jobs, options.silent)
+
+    return 0
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/roms/Makefile b/roms/Makefile
index 955f92286de0..6859685290bf 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -126,25 +126,6 @@ build-efi-roms: build-pxe-roms
 		CROSS_COMPILE=$(x86_64_cross_prefix) \
 		$(patsubst %,bin-x86_64-efi/%.efidrv,$(pxerom_targets))
 
-# Build scripts can pass compiler/linker flags to the EDK2
-# build tools via the EDK2_BASETOOLS_OPTFLAGS (CFLAGS) and
-# EDK2_BASETOOLS_LDFLAGS (LDFLAGS) environment variables.
-#
-# Example:
-#
-#  make -C roms \
-#    EDK2_BASETOOLS_OPTFLAGS='...' \
-#    EDK2_BASETOOLS_LDFLAGS='...' \
-#    efirom
-#
-edk2-basetools:
-	cd edk2/BaseTools && git submodule update --init --force \
-		Source/C/BrotliCompress/brotli
-	$(MAKE) -C edk2/BaseTools \
-		PYTHON_COMMAND=$${EDK2_PYTHON_COMMAND:-python3} \
-		EXTRA_OPTFLAGS='$(EDK2_BASETOOLS_OPTFLAGS)' \
-		EXTRA_LDFLAGS='$(EDK2_BASETOOLS_LDFLAGS)'
-
 slof:
 	$(MAKE) -C SLOF CROSS=$(powerpc64_cross_prefix) qemu
 	cp SLOF/boot_rom.bin ../pc-bios/slof.bin
@@ -165,8 +146,12 @@ skiboot:
 	$(MAKE) -C skiboot CROSS=$(powerpc64_cross_prefix)
 	cp skiboot/skiboot.lid ../pc-bios/skiboot.lid
 
-efi: edk2-basetools
-	$(MAKE) -f Makefile.edk2
+efi:
+	python3 edk2-build.py --config edk2-build.config \
+		--version-override "edk2-stable202302-for-qemu" \
+		--release-date "03/01/2023"
+	rm -f ../pc-bios/edk2-*.fd.bz2
+	bzip2 --verbose ../pc-bios/edk2-*.fd
 
 opensbi32-generic:
 	$(MAKE) -C opensbi \
@@ -200,7 +185,7 @@ clean:
 	rm -rf u-boot/build-e500
 	$(MAKE) -C u-boot-sam460ex distclean
 	$(MAKE) -C skiboot clean
-	$(MAKE) -f Makefile.edk2 clean
+	rm -rf Build
 	$(MAKE) -C opensbi clean
 	$(MAKE) -C qboot clean
 	$(MAKE) -C vbootrom clean
diff --git a/roms/Makefile.edk2 b/roms/Makefile.edk2
deleted file mode 100644
index 485f2244b159..000000000000
--- a/roms/Makefile.edk2
+++ /dev/null
@@ -1,178 +0,0 @@
-# Makefile for building firmware binaries and variable store templates for a
-# number of virtual platforms in edk2.
-#
-# Copyright (C) 2019 Red Hat, Inc.
-#
-# This program and the accompanying materials are licensed and made available
-# under the terms and conditions of the BSD License that accompanies this
-# distribution. The full text of the license may be found at
-# <http://opensource.org/licenses/bsd-license.php>.
-#
-# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS, WITHOUT
-# WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
-
-SHELL = /bin/bash
-
-target = RELEASE
-toolchain = $(shell source ./edk2-funcs.sh && qemu_edk2_get_toolchain $(1))
-
-licenses := \
-	edk2/License.txt \
-	edk2/License-History.txt \
-	edk2/OvmfPkg/License.txt \
-	edk2/ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3/COPYING.txt \
-	edk2/CryptoPkg/Library/OpensslLib/openssl/LICENSE
-
-# The "edk2-arm-vars.fd" varstore template is suitable for aarch64 as well.
-# Similarly, the "edk2-i386-vars.fd" varstore template is suitable for x86_64
-# as well, independently of "secure" too.
-flashdevs := \
-	aarch64-code \
-	arm-code \
-	i386-code \
-	i386-secure-code \
-	x86_64-code \
-	x86_64-secure-code \
-	x86_64-microvm \
-	\
-	arm-vars \
-	i386-vars
-
-all: $(foreach flashdev,$(flashdevs),../pc-bios/edk2-$(flashdev).fd.bz2) \
-	../pc-bios/edk2-licenses.txt
-
-../pc-bios/edk2-%.fd.bz2: ../pc-bios/edk2-%.fd
-	bzip2 -9 -c $< > $@
-
-# When the build completes, we need not keep the uncompressed flash device
-# files.
-.INTERMEDIATE: $(foreach flashdev,$(flashdevs),../pc-bios/edk2-$(flashdev).fd)
-
-# Fetch edk2 submodule's submodules. If it is not in a git tree, assume
-# we're building from a tarball and that they've already been fetched by
-# make-release/tarball scripts.
-submodules:
-	if test -e edk2/.git; then \
-		cd edk2 && git submodule update --init --force -- \
-			ArmPkg/Library/ArmSoftFloatLib/berkeley-softfloat-3 \
-			BaseTools/Source/C/BrotliCompress/brotli \
-			CryptoPkg/Library/OpensslLib/openssl \
-			MdeModulePkg/Library/BrotliCustomDecompressLib/brotli \
-		; \
-	fi
-
-# See notes on the ".NOTPARALLEL" target and the "+" indicator in
-# "tests/uefi-test-tools/Makefile".
-.NOTPARALLEL:
-
-../pc-bios/edk2-aarch64-code.fd: submodules
-	+./edk2-build.sh \
-		aarch64 \
-		--arch=AARCH64 \
-		--platform=ArmVirtPkg/ArmVirtQemu.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE \
-		-D TPM2_ENABLE \
-		-D TPM2_CONFIG_ENABLE
-	cp edk2/Build/ArmVirtQemu-AARCH64/$(target)_$(call toolchain,aarch64)/FV/QEMU_EFI.fd \
-		$@
-	truncate --size=64M $@
-
-../pc-bios/edk2-arm-code.fd: submodules
-	+./edk2-build.sh \
-		arm \
-		--arch=ARM \
-		--platform=ArmVirtPkg/ArmVirtQemu.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE \
-		-D TPM2_ENABLE \
-		-D TPM2_CONFIG_ENABLE
-	cp edk2/Build/ArmVirtQemu-ARM/$(target)_$(call toolchain,arm)/FV/QEMU_EFI.fd \
-		$@
-	truncate --size=64M $@
-
-../pc-bios/edk2-i386-code.fd: submodules
-	+./edk2-build.sh \
-		i386 \
-		--arch=IA32 \
-		--platform=OvmfPkg/OvmfPkgIa32.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE
-	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
-
-../pc-bios/edk2-i386-secure-code.fd: submodules
-	+./edk2-build.sh \
-		i386 \
-		--arch=IA32 \
-		--platform=OvmfPkg/OvmfPkgIa32.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE \
-		-D SECURE_BOOT_ENABLE \
-		-D SMM_REQUIRE
-	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_CODE.fd $@
-
-../pc-bios/edk2-x86_64-code.fd: submodules
-	+./edk2-build.sh \
-		x86_64 \
-		--arch=X64 \
-		--platform=OvmfPkg/OvmfPkgX64.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE
-	cp edk2/Build/OvmfX64/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
-
-../pc-bios/edk2-x86_64-secure-code.fd: submodules
-	+./edk2-build.sh \
-		x86_64 \
-		--arch=IA32 \
-		--arch=X64 \
-		--platform=OvmfPkg/OvmfPkgIa32X64.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE \
-		-D TPM_ENABLE \
-		-D TPM_CONFIG_ENABLE \
-		-D SECURE_BOOT_ENABLE \
-		-D SMM_REQUIRE
-	cp edk2/Build/Ovmf3264/$(target)_$(call toolchain,x86_64)/FV/OVMF_CODE.fd $@
-
-../pc-bios/edk2-x86_64-microvm.fd: submodules
-	+./edk2-build.sh \
-		x86_64 \
-		--arch=X64 \
-		--platform=OvmfPkg/Microvm/MicrovmX64.dsc \
-		-D NETWORK_IP6_ENABLE \
-		-D NETWORK_HTTP_BOOT_ENABLE \
-		-D NETWORK_TLS_ENABLE
-	cp edk2/Build/MicrovmX64/$(target)_$(call toolchain,x86_64)/FV/MICROVM.fd $@
-
-../pc-bios/edk2-arm-vars.fd: ../pc-bios/edk2-arm-code.fd
-	cp edk2/Build/ArmVirtQemu-ARM/$(target)_$(call toolchain,arm)/FV/QEMU_VARS.fd \
-		$@
-	truncate --size=64M $@
-
-../pc-bios/edk2-i386-vars.fd: ../pc-bios/edk2-i386-code.fd
-	cp edk2/Build/OvmfIa32/$(target)_$(call toolchain,i386)/FV/OVMF_VARS.fd $@
-
-# The license file accumulates several individual licenses from under edk2,
-# prefixing each individual license with a header (generated by "tail") that
-# states its pathname.
-../pc-bios/edk2-licenses.txt: submodules
-	tail -n $(shell cat $(licenses) | wc -l) $(licenses) > $@
-	dos2unix $@
-
-clean:
-	rm -rf edk2/Build
-	cd edk2/Conf && \
-		rm -rf .cache BuildEnv.sh build_rule.txt target.txt \
-			tools_def.txt
diff --git a/roms/edk2-build.config b/roms/edk2-build.config
new file mode 100644
index 000000000000..66ef9ffcb91f
--- /dev/null
+++ b/roms/edk2-build.config
@@ -0,0 +1,124 @@
+[global]
+core = edk2
+
+####################################################################################
+# options
+
+[opts.common]
+NETWORK_HTTP_BOOT_ENABLE = TRUE
+NETWORK_IP6_ENABLE       = TRUE
+NETWORK_TLS_ENABLE       = TRUE
+NETWORK_ISCSI_ENABLE     = TRUE
+NETWORK_ALLOW_HTTP_CONNECTIONS = TRUE
+TPM2_ENABLE              = TRUE
+TPM2_CONFIG_ENABLE       = TRUE
+TPM1_ENABLE              = TRUE
+CAVIUM_ERRATUM_27456     = TRUE
+
+[opts.ovmf.sb.smm]
+SECURE_BOOT_ENABLE       = TRUE
+SMM_REQUIRE              = TRUE
+
+[opts.armvirt.silent]
+DEBUG_PRINT_ERROR_LEVEL  = 0x80000000
+
+[pcds.nx.broken.grub]
+# grub.efi uses EfiLoaderData for code
+PcdDxeNxMemoryProtectionPolicy = 0xC000000000007FD1
+
+####################################################################################
+# i386
+
+[build.ovmf.i386]
+desc = ovmf build (32-bit)
+conf = OvmfPkg/OvmfPkgIa32.dsc
+arch = IA32
+opts = common
+plat = OvmfIa32
+dest = ../pc-bios
+cpy1 = FV/OVMF_CODE.fd edk2-i386-code.fd
+cpy2 = FV/OVMF_VARS.fd edk2-i386-vars.fd
+
+[build.ovmf.i386.secure]
+desc = ovmf build (32-bit, secure boot)
+conf = OvmfPkg/OvmfPkgIa32.dsc
+arch = IA32
+opts = common
+       ovmf.sb.smm
+plat = OvmfIa32
+dest = ../pc-bios
+cpy1 = FV/OVMF_CODE.fd edk2-i386-secure-code.fd
+
+####################################################################################
+# x86_64
+
+[build.ovmf.x86_64]
+desc = ovmf build (64-bit)
+conf = OvmfPkg/OvmfPkgX64.dsc
+arch = X64
+opts = common
+plat = OvmfX64
+dest = ../pc-bios
+cpy1 = FV/OVMF_CODE.fd edk2-x86_64-code.fd
+
+[build.ovmf.x86_64.secure]
+desc = ovmf build (64-bit, secure boot)
+conf = OvmfPkg/OvmfPkgIa32X64.dsc
+arch = IA32 X64
+opts = common
+       ovmf.sb.smm
+plat = Ovmf3264
+dest = ../pc-bios
+cpy1 = FV/OVMF_CODE.fd edk2-x86_64-secure-code.fd
+
+[build.ovmf.microvm]
+desc = ovmf build for microvm
+conf = OvmfPkg/Microvm/MicrovmX64.dsc
+arch = X64
+opts = common
+plat = MicrovmX64
+dest = ../pc-bios
+cpy1 = FV/MICROVM.fd  edk2-x86_64-microvm.fd
+
+####################################################################################
+# arm
+
+[build.armvirt.arm]
+desc = ArmVirt build, 32-bit (arm v7)
+conf = ArmVirtPkg/ArmVirtQemu.dsc
+arch = ARM
+opts = common
+       armvirt.silent
+pcds = nx.broken.grub
+plat = ArmVirtQemu-ARM
+dest = ../pc-bios
+cpy1 = FV/QEMU_EFI.fd    edk2-arm-code.fd
+cpy2 = FV/QEMU_VARS.fd   edk2-arm-vars.fd
+pad1 = edk2-arm-code.fd  64m
+pad2 = edk2-arm-vars.fd  64m
+
+####################################################################################
+# aarch64
+
+[build.armvirt.aa64]
+desc = ArmVirt build, 64-bit (arm v8)
+conf = ArmVirtPkg/ArmVirtQemu.dsc
+arch = AARCH64
+opts = common
+       armvirt.silent
+pcds = nx.broken.grub
+plat = ArmVirtQemu-AARCH64
+dest = ../pc-bios
+cpy1 = FV/QEMU_EFI.fd  edk2-aarch64-code.fd
+pad1 = edk2-aarch64-code.fd  64m
+
+####################################################################################
+# riscv64
+
+[build.riscv.qemu]
+conf = OvmfPkg/RiscVVirt/RiscVVirtQemu.dsc
+arch = RISCV64
+plat = RiscVVirtQemu
+dest = ../pc-bios
+cpy1 = FV/RISCV_VIRT.fd  edk2-riscv.fd
+pad1 = edk2-riscv.fd     32m
diff --git a/roms/edk2-build.sh b/roms/edk2-build.sh
deleted file mode 100755
index ea79dc27a269..000000000000
--- a/roms/edk2-build.sh
+++ /dev/null
@@ -1,55 +0,0 @@
-#!/bin/bash
-
-# Wrapper shell script for building a  virtual platform firmware in edk2.
-#
-# Copyright (C) 2019 Red Hat, Inc.
-#
-# This program and the accompanying materials are licensed and made available
-# under the terms and conditions of the BSD License that accompanies this
-# distribution. The full text of the license may be found at
-# <http://opensource.org/licenses/bsd-license.php>.
-#
-# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS, WITHOUT
-# WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
-
-set -e -u -C
-
-# Save the command line arguments. We need to reset $# to 0 before sourcing
-# "edksetup.sh", as it will inherit $@.
-emulation_target=$1
-shift
-num_args=0
-args=()
-for arg in "$@"; do
-  args[num_args++]="$arg"
-done
-shift $num_args
-
-cd edk2
-
-export PYTHON_COMMAND=${EDK2_PYTHON_COMMAND:-python3}
-
-# Source "edksetup.sh" carefully.
-set +e +u +C
-source ./edksetup.sh
-ret=$?
-set -e -u -C
-if [ $ret -ne 0 ]; then
-  exit $ret
-fi
-
-# Fetch some option arguments, and set the cross-compilation environment (if
-# any), for the edk2 "build" utility.
-source ../edk2-funcs.sh
-edk2_toolchain=$(qemu_edk2_get_toolchain "$emulation_target")
-MAKEFLAGS=$(qemu_edk2_quirk_tianocore_1607 "$MAKEFLAGS")
-edk2_thread_count=$(qemu_edk2_get_thread_count "$MAKEFLAGS")
-qemu_edk2_set_cross_env "$emulation_target"
-
-# Build the platform firmware.
-build \
-  --cmd-len=65536 \
-  -n "$edk2_thread_count" \
-  --buildtarget=RELEASE \
-  --tagname="$edk2_toolchain" \
-  "${args[@]}"
diff --git a/roms/edk2-funcs.sh b/roms/edk2-funcs.sh
deleted file mode 100644
index cd6e4f2c82d2..000000000000
--- a/roms/edk2-funcs.sh
+++ /dev/null
@@ -1,273 +0,0 @@
-# Shell script that defines functions for determining some environmental
-# characteristics for the edk2 "build" utility.
-#
-# This script is meant to be sourced, in a bash environment.
-#
-# Copyright (C) 2019 Red Hat, Inc.
-#
-# This program and the accompanying materials are licensed and made available
-# under the terms and conditions of the BSD License that accompanies this
-# distribution. The full text of the license may be found at
-# <http://opensource.org/licenses/bsd-license.php>.
-#
-# THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS, WITHOUT
-# WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
-
-
-# Verify whether the QEMU system emulation target is supported by the UEFI spec
-# and edk2. Print a message to the standard error, and return with nonzero
-# status, if verification fails.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_verify_arch()
-{
-  local emulation_target="$1"
-  local program_name=$(basename -- "$0")
-
-  case "$emulation_target" in
-    (arm|aarch64|i386|x86_64)
-      ;;
-    (*)
-      printf '%s: unknown/unsupported QEMU system emulation target "%s"\n' \
-        "$program_name" "$emulation_target" >&2
-      return 1
-      ;;
-  esac
-}
-
-
-# Translate the QEMU system emulation target to the edk2 architecture
-# identifier. Print the result to the standard output.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_get_arch()
-{
-  local emulation_target="$1"
-
-  if ! qemu_edk2_verify_arch "$emulation_target"; then
-    return 1
-  fi
-
-  case "$emulation_target" in
-    (arm)
-      printf 'ARM\n'
-      ;;
-    (aarch64)
-      printf 'AARCH64\n'
-      ;;
-    (i386)
-      printf 'IA32\n'
-      ;;
-    (x86_64)
-      printf 'X64\n'
-      ;;
-  esac
-}
-
-
-# Translate the QEMU system emulation target to the gcc cross-compilation
-# architecture identifier. Print the result to the standard output.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_get_gcc_arch()
-{
-  local emulation_target="$1"
-
-  if ! qemu_edk2_verify_arch "$emulation_target"; then
-    return 1
-  fi
-
-  case "$emulation_target" in
-    (arm|aarch64|x86_64)
-      printf '%s\n' "$emulation_target"
-      ;;
-    (i386)
-      printf 'i686\n'
-      ;;
-  esac
-}
-
-
-# Determine the gcc cross-compiler prefix (if any) for use with the edk2
-# toolchain. Print the result to the standard output.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_get_cross_prefix()
-{
-  local emulation_target="$1"
-  local gcc_arch
-  local host_arch
-
-  if ! gcc_arch=$(qemu_edk2_get_gcc_arch "$emulation_target"); then
-    return 1
-  fi
-
-  host_arch=$(uname -m)
-
-  if [ "$gcc_arch" == "$host_arch" ] ||
-     ( [ "$gcc_arch" == i686 ] && [ "$host_arch" == x86_64 ] ); then
-    # no cross-compiler needed
-    :
-  elif ( [ -e /etc/debian_version ] && [ "$gcc_arch" == arm ] ); then
-    # force soft-float cross-compiler on Debian
-    printf 'arm-linux-gnueabi-'
-  else
-    printf '%s-linux-gnu-\n' "$gcc_arch"
-  fi
-}
-
-
-# Determine the edk2 toolchain tag for the QEMU system emulation target. Print
-# the result to the standard output. Print a message to the standard error, and
-# return with nonzero status, if the (conditional) gcc version check fails.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_get_toolchain()
-{
-  local emulation_target="$1"
-  local program_name=$(basename -- "$0")
-  local cross_prefix
-  local gcc_version
-
-  if ! qemu_edk2_verify_arch "$emulation_target"; then
-    return 1
-  fi
-
-  case "$emulation_target" in
-    (arm|aarch64)
-      printf 'GCC5\n'
-      ;;
-
-    (i386|x86_64)
-      if ! cross_prefix=$(qemu_edk2_get_cross_prefix "$emulation_target"); then
-        return 1
-      fi
-
-      gcc_version=$("${cross_prefix}gcc" -v 2>&1 | tail -1 | awk '{print $3}')
-      # Run "git-blame" on "OvmfPkg/build.sh" in edk2 for more information on
-      # the mapping below.
-      case "$gcc_version" in
-        ([1-3].*|4.[0-7].*)
-          printf '%s: unsupported gcc version "%s"\n' \
-            "$program_name" "$gcc_version" >&2
-          return 1
-          ;;
-        (4.8.*)
-          printf 'GCC48\n'
-          ;;
-        (4.9.*|6.[0-2].*)
-          printf 'GCC49\n'
-          ;;
-        (*)
-          printf 'GCC5\n'
-          ;;
-      esac
-      ;;
-  esac
-}
-
-
-# Determine the name of the environment variable that exposes the
-# cross-compiler prefix to the edk2 "build" utility. Print the result to the
-# standard output.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_get_cross_prefix_var()
-{
-  local emulation_target="$1"
-  local edk2_toolchain
-  local edk2_arch
-
-  if ! edk2_toolchain=$(qemu_edk2_get_toolchain "$emulation_target"); then
-    return 1
-  fi
-
-  case "$emulation_target" in
-    (arm|aarch64)
-      if ! edk2_arch=$(qemu_edk2_get_arch "$emulation_target"); then
-        return 1
-      fi
-      printf '%s_%s_PREFIX\n' "$edk2_toolchain" "$edk2_arch"
-      ;;
-    (i386|x86_64)
-      printf '%s_BIN\n' "$edk2_toolchain"
-      ;;
-  esac
-}
-
-
-# Set and export the environment variable(s) necessary for cross-compilation,
-# whenever needed by the edk2 "build" utility.
-#
-# Parameters:
-#   $1: QEMU system emulation target
-qemu_edk2_set_cross_env()
-{
-  local emulation_target="$1"
-  local cross_prefix
-  local cross_prefix_var
-
-  if ! cross_prefix=$(qemu_edk2_get_cross_prefix "$emulation_target"); then
-    return 1
-  fi
-
-  if [ -z "$cross_prefix" ]; then
-    # Nothing to do.
-    return 0
-  fi
-
-  if ! cross_prefix_var=$(qemu_edk2_get_cross_prefix_var \
-                            "$emulation_target"); then
-    return 1
-  fi
-
-  eval "export $cross_prefix_var=\$cross_prefix"
-}
-
-
-# Determine the "-n" option argument (that is, the number of modules to build
-# in parallel) for the edk2 "build" utility. Print the result to the standard
-# output.
-#
-# Parameters:
-#   $1: the value of the MAKEFLAGS variable
-qemu_edk2_get_thread_count()
-{
-  local makeflags="$1"
-
-  if [[ "$makeflags" == *--jobserver-auth=* ]] ||
-     [[ "$makeflags" == *--jobserver-fds=* ]]; then
-    # If there is a job server, allow the edk2 "build" utility to parallelize
-    # as many module builds as there are logical CPUs in the system. The "make"
-    # instances forked by "build" are supposed to limit themselves through the
-    # job server. The zero value below causes the edk2 "build" utility to fetch
-    # the logical CPU count with Python's multiprocessing.cpu_count() method.
-    printf '0\n'
-  else
-    # Build a single module at a time.
-    printf '1\n'
-  fi
-}
-
-
-# Work around <https://bugzilla.tianocore.org/show_bug.cgi?id=1607> by
-# filtering jobserver-related flags out of MAKEFLAGS. Print the result to the
-# standard output.
-#
-# Parameters:
-#   $1: the value of the MAKEFLAGS variable
-qemu_edk2_quirk_tianocore_1607()
-{
-  local makeflags="$1"
-
-  printf %s "$makeflags" \
-  | LC_ALL=C sed --regexp-extended \
-      --expression='s/--jobserver-(auth|fds)=[0-9]+,[0-9]+//' \
-      --expression='s/-j([0-9]+)?//'
-}
-- 
2.39.2



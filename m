Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23F525ABCE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:10:57 +0200 (CEST)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSXQ-0001Gz-NQ
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMc-0006YE-Jf
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:46 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43011
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMY-0007BF-HN
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wI7hFWx6sPeGb8YbxWYcUWNm467cVi3XKy83JOcRMFk=;
 b=PBrxc7xWBk77n7JI/nEhY0aNIXAL4Iak8xewYtb05iNhQkOdG0l+ZPThil+rE/XYsyVZ+c
 OU3lhZlBP8vsWsNWsTM/iFScdqeg2hIatTSApvnIN6mxluj102dgsFVwoVkkgd3F3w46yE
 OYKzfifnQbjG7A17jOKwfBOXLrmDSfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-hNSDB740NXOsPo0PS4eBPw-1; Wed, 02 Sep 2020 08:59:35 -0400
X-MC-Unique: hNSDB740NXOsPo0PS4eBPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E744B10ABDCB
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:31 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6EA276E01
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 27/39] meson: compute config_all_devices directly
Date: Wed,  2 Sep 2020 08:59:05 -0400
Message-Id: <20200902125917.26021-28-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 03:24:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no need anymore to produce config-all-devices.mak, compute
the resulting dictionary directly instead of going through grepy.sh.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitignore       |  1 -
 meson.build      | 14 ++------------
 scripts/grepy.sh |  3 ---
 3 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100755 scripts/grepy.sh

diff --git a/.gitignore b/.gitignore
index 4ccb9ed975..f3fbd87ce4 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,7 +2,6 @@
 /build/
 /.doctrees
 /config-devices.*
-/config-all-devices.*
 /config-all-disas.*
 /config-host.*
 /config-target.*
diff --git a/meson.build b/meson.build
index b71f561c96..037ccd3f4c 100644
--- a/meson.build
+++ b/meson.build
@@ -455,6 +455,7 @@ endforeach
 genh += configure_file(output: 'config-host.h', configuration: config_host_data)
 
 minikconf = find_program('scripts/minikconf.py')
+config_all_devices = {}
 config_devices_mak_list = []
 config_devices_h = {}
 config_target_h = {}
@@ -523,11 +524,11 @@ foreach target : target_dirs
     config_devices_h += {target: configure_file(output: target + '-config-devices.h',
                                                 configuration: config_devices_data)}
     config_target += config_devices
+    config_all_devices += config_devices
   endif
   config_target_mak += {target: config_target}
 endforeach
 
-grepy = find_program('scripts/grepy.sh')
 # This configuration is used to build files that are shared by
 # multiple binaries, and then extracted out of the "common"
 # static_library target.
@@ -537,17 +538,6 @@ grepy = find_program('scripts/grepy.sh')
 # targets that are not built for this compilation.  The CONFIG_ALL
 # pseudo symbol replaces it.
 
-if have_system
-  config_all_devices_mak = configure_file(
-    output: 'config-all-devices.mak',
-    input: config_devices_mak_list,
-    capture: true,
-    command: [grepy, '@INPUT@'],
-  )
-  config_all_devices = keyval.load(config_all_devices_mak)
-else
-  config_all_devices = {}
-endif
 config_all = config_all_devices
 config_all += config_host
 config_all += config_all_disas
diff --git a/scripts/grepy.sh b/scripts/grepy.sh
deleted file mode 100755
index aee46ddc8d..0000000000
--- a/scripts/grepy.sh
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-grep -h '=y$' "$@" | sort -u
-- 
2.26.2




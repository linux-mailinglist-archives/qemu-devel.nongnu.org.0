Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B4B276DCD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:48:22 +0200 (CEST)
Received: from localhost ([::1]:54434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNrR-0000VO-1T
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTo-00017t-Jk
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTl-00064K-PB
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QP/tfe6eEhE2lmX3KaDtFebzNyOg1zq1GEHNjimZdqQ=;
 b=DpnpFlueqIl+V3ArQV2Dp9zIBfjLLFlxh5Hhzy3l2YXqzg6TD+o2ZCWNgwx1B9bDU0rU8c
 pSqfeNKAN+98bYqQT7QfE+ZokXkNoTnr67yN2iZnujeWH7trcVjKJyqvciPh7+SCQDNIbx
 Z1YSGOjeEYDBFr7cjxYU+bxrUBH4Plw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-nH3JdTfeNeGNA95BQkxk3g-1; Thu, 24 Sep 2020 05:23:51 -0400
X-MC-Unique: nH3JdTfeNeGNA95BQkxk3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3135F85B686
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:23:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2B5660C15
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:23:49 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/92] cutils: introduce get_relocated_path
Date: Thu, 24 Sep 2020 05:22:24 -0400
Message-Id: <20200924092314.1722645-43-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add the function that will compute a relocated version of the
directories in CONFIG_QEMU_*DIR and CONFIG_QEMU_*PATH.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/cutils.h | 12 +++++++++
 meson.build           |  4 +--
 util/cutils.c         | 61 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index eb59852dfd..3a86ec0321 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -184,4 +184,16 @@ int uleb128_decode_small(const uint8_t *in, uint32_t *n);
  */
 int qemu_pstrcmp0(const char **str1, const char **str2);
 
+
+/**
+ * get_relocated_path:
+ * @dir: the directory (typically a `CONFIG_*DIR` variable) to be relocated.
+ *
+ * Returns a path for @dir that uses the directory of the running executable
+ * as the prefix.  For example, if `bindir` is `/usr/bin` and @dir is
+ * `/usr/share/qemu`, the function will append `../share/qemu` to the
+ * directory that contains the running executable and return the result.
+ */
+char *get_relocated_path(const char *dir);
+
 #endif
diff --git a/meson.build b/meson.build
index 9a4ade7f98..ace15dc8c0 100644
--- a/meson.build
+++ b/meson.build
@@ -560,9 +560,9 @@ config_host_data.set('QEMU_VERSION_MINOR', meson.project_version().split('.')[1]
 config_host_data.set('QEMU_VERSION_MICRO', meson.project_version().split('.')[2])
 
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-strings = ['HOST_DSOSUF', 'CONFIG_IASL', 'bindir', 'qemu_confdir', 'qemu_datadir',
+strings = ['HOST_DSOSUF', 'CONFIG_IASL', 'bindir', 'prefix', 'qemu_confdir', 'qemu_datadir',
            'qemu_moddir', 'qemu_localstatedir', 'qemu_helperdir', 'qemu_localedir',
-           'qemu_icondir', 'qemu_desktopdir', 'qemu_firmwarepath']
+           'qemu_icondir', 'qemu_desktopdir', 'qemu_firmwarepath', 'sysconfdir']
 foreach k, v: config_host
   if arrays.contains(k)
     if v != ''
diff --git a/util/cutils.c b/util/cutils.c
index 36ce712271..8da34e04b0 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -889,3 +889,64 @@ int qemu_pstrcmp0(const char **str1, const char **str2)
 {
     return g_strcmp0(*str1, *str2);
 }
+
+static inline bool starts_with_prefix(const char *dir)
+{
+    size_t prefix_len = strlen(CONFIG_PREFIX);
+    return !memcmp(dir, CONFIG_PREFIX, prefix_len) &&
+        (!dir[prefix_len] || G_IS_DIR_SEPARATOR(dir[prefix_len]));
+}
+
+/* Return the next path component in dir, and store its length in *p_len.  */
+static inline const char *next_component(const char *dir, int *p_len)
+{
+    int len;
+    while (*dir && G_IS_DIR_SEPARATOR(*dir)) {
+        dir++;
+    }
+    len = 0;
+    while (dir[len] && !G_IS_DIR_SEPARATOR(dir[len])) {
+        len++;
+    }
+    *p_len = len;
+    return dir;
+}
+
+char *get_relocated_path(const char *dir)
+{
+    size_t prefix_len = strlen(CONFIG_PREFIX);
+    const char *bindir = CONFIG_BINDIR;
+    const char *exec_dir = qemu_get_exec_dir();
+    GString *result;
+    int len_dir, len_bindir;
+
+    /* Fail if qemu_init_exec_dir was not called.  */
+    assert(exec_dir[0]);
+    if (!starts_with_prefix(dir) || !starts_with_prefix(bindir)) {
+        return strdup(dir);
+    }
+
+    result = g_string_new(exec_dir);
+
+    /* Advance over common components.  */
+    len_dir = len_bindir = prefix_len;
+    do {
+        dir += len_dir;
+        bindir += len_bindir;
+        dir = next_component(dir, &len_dir);
+        bindir = next_component(bindir, &len_bindir);
+    } while (len_dir == len_bindir && !memcmp(dir, bindir, len_dir));
+
+    /* Ascend from bindir to the common prefix with dir.  */
+    while (len_bindir) {
+        bindir += len_bindir;
+        g_string_append(result, "/..");
+        bindir = next_component(bindir, &len_bindir);
+    }
+
+    if (*dir) {
+        assert(G_IS_DIR_SEPARATOR(dir[-1]));
+        g_string_append(result, dir - 1);
+    }
+    return result->str;
+}
-- 
2.26.2




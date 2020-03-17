Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB4188C70
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 18:47:33 +0100 (CET)
Received: from localhost ([::1]:37822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGJQ-0006FR-61
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 13:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51870)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <a809679a8b237614dcd050ea1f7e72e97638c0ba@lizzy.crudebyte.com>)
 id 1jEGHh-0004Lt-Au
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <a809679a8b237614dcd050ea1f7e72e97638c0ba@lizzy.crudebyte.com>)
 id 1jEGHf-0005lh-JD
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:45:45 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:49381)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <a809679a8b237614dcd050ea1f7e72e97638c0ba@lizzy.crudebyte.com>)
 id 1jEGHf-000061-7P
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 13:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Cc:To:Subject:Date:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=EHTq3msumhD++7bnwuIomFcIBzVrWCtiHDFC+CRaFqk=; b=Q1WAZ
 uIKiLR748Cp41VXO1WueUSGDXG8fr711QBIdlmFnog45wIKTPeXcfyxClyqJmLodKYbHl0l98Tawx
 KsmLsBPKbia4QI6/+aGqBZiIPiyKNUOZN+71bwhvow+KyHlD6GtBbuPL0ywyPXiuc86XhxAcoeIjt
 dw4Otk6ry03meTkSkWbLPM7smHL8zrgzCM0MiBbf3lmHX5a7PKFXdkzcMKbENCi1v/QXdpH5UnkR/
 AwRhZUNzBQ3QBx6K26W8hLM+Ee2Oz/RPfJKc++AZwY6e5YRcgnYnIGx+CM4DLlk3kowW14Ub5y79Q
 DUcUQEGG7Za1AaYeJaw6J6JQIMthg==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 17 Mar 2020 14:59:18 +0100
Subject: [PATCH 1/1] conf: qemu 9pfs: add 'multidevs' option
To: libvir-list@redhat.com
Cc: qemu-devel@nongnu.org,
    Greg Kurz <groug@kaod.org>
Message-Id: <E1jEFpL-00028n-Qj@lizzy.crudebyte.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.194.90.13
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

Introduce new 'multidevs' option for filesystem.

  <filesystem type='mount' accessmode='mapped' multidevs='remap'>
    <source dir='/path'/>
    <target dir='mount_tag'>
  </filesystem>

This option prevents misbheaviours on guest if a 9pfs export
contains multiple devices, due to the potential file ID collisions
this otherwise may cause.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 docs/formatdomain.html.in     | 47 ++++++++++++++++++++++++++++++++++-
 docs/schemas/domaincommon.rng | 10 ++++++++
 src/conf/domain_conf.c        | 30 ++++++++++++++++++++++
 src/conf/domain_conf.h        | 13 ++++++++++
 src/qemu/qemu_command.c       |  7 ++++++
 5 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/docs/formatdomain.html.in b/docs/formatdomain.html.in
index 594146009d..13c506988b 100644
--- a/docs/formatdomain.html.in
+++ b/docs/formatdomain.html.in
@@ -3967,7 +3967,7 @@
     &lt;source name='my-vm-template'/&gt;
     &lt;target dir='/'/&gt;
   &lt;/filesystem&gt;
-  &lt;filesystem type='mount' accessmode='passthrough'&gt;
+  &lt;filesystem type='mount' accessmode='passthrough' multidevs='remap'&gt;
     &lt;driver type='path' wrpolicy='immediate'/&gt;
     &lt;source dir='/export/to/guest'/&gt;
     &lt;target dir='/import/from/host'/&gt;
@@ -4084,13 +4084,58 @@
         </dd>
         </dl>
 
+      <p>
       <span class="since">Since 5.2.0</span>, the filesystem element
       has an optional attribute <code>model</code> with supported values
       "virtio-transitional", "virtio-non-transitional", or "virtio".
       See <a href="#elementsVirtioTransitional">Virtio transitional devices</a>
       for more details.
+      </p>
+
+      <p>
+      The filesystem element has an optional attribute <code>multidevs</code>
+      which specifies how to deal with a filesystem export containing more than
+      one device, in order to avoid file ID collisions on guest when using 9pfs
+      (<span class="since">since 6.2.0, requires QEMU 4.2</span>).
+      This attribute is not available for virtiofs. The possible values are:
+      </p>
+
+        <dl>
+        <dt><code>default</code></dt>
+        <dd>
+        Use QEMU's default setting (which currently is <code>warn</code>).
+        </dd>
+        <dt><code>remap</code></dt>
+        <dd>
+        This setting allows guest to access multiple devices per export without
+        encountering misbehaviours. Inode numbers from host are automatically
+        remapped on guest to actively prevent file ID collisions if guest
+        accesses one export containing multiple devices.
+        </dd>
+        <dt><code>forbid</code></dt>
+        <dd>
+        Only allow to access one device per export by guest. Attempts to access
+        additional devices on the same export will cause the individual
+        filesystem access by guest to fail with an error and being logged (once)
+        as error on host side.
+        </dd>
+        <dt><code>warn</code></dt>
+        <dd>
+        This setting resembles the behaviour of 9pfs prior to QEMU 4.2, that is
+        no action is performed to prevent any potential file ID collisions if an
+        export contains multiple devices, with the only exception: a warning is
+        logged (once) on host side now. This setting may lead to misbehaviours
+        on guest side if more than one device is exported per export, due to the
+        potential file ID collisions this may cause on guest side in that case.
+        </dd>
+        </dl>
+
       </dd>
 
+      <p>
+      The <code>filesystem</code> element may contain the following subelements:
+      </p>
+
       <dt><code>driver</code></dt>
       <dd>
         The optional driver element allows specifying further details
diff --git a/docs/schemas/domaincommon.rng b/docs/schemas/domaincommon.rng
index 6805420451..9b37740e30 100644
--- a/docs/schemas/domaincommon.rng
+++ b/docs/schemas/domaincommon.rng
@@ -2676,6 +2676,16 @@
             </choice>
           </attribute>
         </optional>
+        <optional>
+          <attribute name="multidevs">
+            <choice>
+              <value>default</value>
+              <value>remap</value>
+              <value>forbid</value>
+              <value>warn</value>
+            </choice>
+          </attribute>
+        </optional>
         <optional>
           <element name='readonly'>
             <empty/>
diff --git a/src/conf/domain_conf.c b/src/conf/domain_conf.c
index 71535f53f5..b96f87063a 100644
--- a/src/conf/domain_conf.c
+++ b/src/conf/domain_conf.c
@@ -501,6 +501,14 @@ VIR_ENUM_IMPL(virDomainFSModel,
               "virtio-non-transitional",
 );
 
+VIR_ENUM_IMPL(virDomainFSMultidevs,
+              VIR_DOMAIN_FS_MULTIDEVS_LAST,
+              "default",
+              "remap",
+              "forbid",
+              "warn",
+);
+
 VIR_ENUM_IMPL(virDomainFSCacheMode,
               VIR_DOMAIN_FS_CACHE_MODE_LAST,
               "default",
@@ -11376,6 +11384,7 @@ virDomainFSDefParseXML(virDomainXMLOptionPtr xmlopt,
     g_autofree char *usage = NULL;
     g_autofree char *units = NULL;
     g_autofree char *model = NULL;
+    g_autofree char *multidevs = NULL;
 
     ctxt->node = node;
 
@@ -11414,6 +11423,17 @@ virDomainFSDefParseXML(virDomainXMLOptionPtr xmlopt,
         }
     }
 
+    multidevs = virXMLPropString(node, "multidevs");
+    if (multidevs) {
+        if ((def->multidevs = virDomainFSMultidevsTypeFromString(multidevs)) < 0) {
+            virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
+                           _("unknown multidevs '%s'"), multidevs);
+            goto error;
+        }
+    } else {
+        def->multidevs = VIR_DOMAIN_FS_MULTIDEVS_DEFAULT;
+    }
+
     if (virDomainParseScaledValue("./space_hard_limit[1]",
                                   NULL, ctxt, &def->space_hard_limit,
                                   1, ULLONG_MAX, false) < 0)
@@ -25397,6 +25417,7 @@ virDomainFSDefFormat(virBufferPtr buf,
     const char *accessmode = virDomainFSAccessModeTypeToString(def->accessmode);
     const char *fsdriver = virDomainFSDriverTypeToString(def->fsdriver);
     const char *wrpolicy = virDomainFSWrpolicyTypeToString(def->wrpolicy);
+    const char *multidevs = virDomainFSMultidevsTypeToString(def->multidevs);
     const char *src = def->src->path;
     g_auto(virBuffer) driverAttrBuf = VIR_BUFFER_INITIALIZER;
     g_auto(virBuffer) driverBuf = VIR_BUFFER_INIT_CHILD(buf);
@@ -25415,6 +25436,12 @@ virDomainFSDefFormat(virBufferPtr buf,
         return -1;
     }
 
+    if (!multidevs) {
+        virReportError(VIR_ERR_INTERNAL_ERROR,
+                       _("unexpected multidevs %d"), def->multidevs);
+        return -1;
+    }
+
     virBufferAsprintf(buf,
                       "<filesystem type='%s' accessmode='%s'",
                       type, accessmode);
@@ -25422,6 +25449,9 @@ virDomainFSDefFormat(virBufferPtr buf,
         virBufferAsprintf(buf, " model='%s'",
                           virDomainFSModelTypeToString(def->model));
     }
+    if (def->multidevs) {
+        virBufferAsprintf(buf, " multidevs='%s'", multidevs);
+    }
     virBufferAddLit(buf, ">\n");
 
     virBufferAdjustIndent(buf, 2);
diff --git a/src/conf/domain_conf.h b/src/conf/domain_conf.h
index 91b776c28a..23b7924781 100644
--- a/src/conf/domain_conf.h
+++ b/src/conf/domain_conf.h
@@ -796,6 +796,18 @@ typedef enum {
     VIR_DOMAIN_FS_WRPOLICY_LAST
 } virDomainFSWrpolicy;
 
+/* How to handle exports containing multiple devices. */
+typedef enum {
+    VIR_DOMAIN_FS_MULTIDEVS_DEFAULT = 0, /* Use QEMU's default setting */
+    VIR_DOMAIN_FS_MULTIDEVS_REMAP, /* Remap inodes from host to guest */
+    VIR_DOMAIN_FS_MULTIDEVS_FORBID, /* Prohibit more than one device */
+    VIR_DOMAIN_FS_MULTIDEVS_WARN, /* Just log a warning if multiple devices */
+
+    VIR_DOMAIN_FS_MULTIDEVS_LAST
+} virDomainFSMultidevs;
+
+VIR_ENUM_DECL(virDomainFSMultidevs);
+
 typedef enum {
     VIR_DOMAIN_FS_MODEL_DEFAULT = 0,
     VIR_DOMAIN_FS_MODEL_VIRTIO,
@@ -820,6 +832,7 @@ struct _virDomainFSDef {
     int wrpolicy; /* enum virDomainFSWrpolicy */
     int format; /* virStorageFileFormat */
     int model; /* virDomainFSModel */
+    int multidevs; /* virDomainFSMultidevs */
     unsigned long long usage; /* in bytes */
     virStorageSourcePtr src;
     char *dst;
diff --git a/src/qemu/qemu_command.c b/src/qemu/qemu_command.c
index 9790c92cf8..7020e5448c 100644
--- a/src/qemu/qemu_command.c
+++ b/src/qemu/qemu_command.c
@@ -2632,6 +2632,13 @@ qemuBuildFSStr(virDomainFSDefPtr fs)
         } else if (fs->accessmode == VIR_DOMAIN_FS_ACCESSMODE_SQUASH) {
             virBufferAddLit(&opt, ",security_model=none");
         }
+        if (fs->multidevs == VIR_DOMAIN_FS_MULTIDEVS_REMAP) {
+            virBufferAddLit(&opt, ",multidevs=remap");
+        } else if (fs->multidevs == VIR_DOMAIN_FS_MULTIDEVS_FORBID) {
+            virBufferAddLit(&opt, ",multidevs=forbid");
+        } else if (fs->multidevs == VIR_DOMAIN_FS_MULTIDEVS_WARN) {
+            virBufferAddLit(&opt, ",multidevs=warn");
+        }
     } else if (fs->fsdriver == VIR_DOMAIN_FS_DRIVER_TYPE_HANDLE) {
         /* removed since qemu 4.0.0 see v3.1.0-29-g93aee84f57 */
         virBufferAddLit(&opt, "handle");
-- 
2.20.1



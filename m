Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815503BBADA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:08:40 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LWp-00010N-Fa
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LS8-000190-BO
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LS3-00018H-Lu
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/XhfYA2g9RCN4drP8vUJy7C+n2pp9jT/Q4HuQU/E7dQ=;
 b=ZJFZZFTskks4KnbHJgC8GOucEZHSPEmQ7it28CvsvYE/l7kIsMT/PI3CCEx0BSKqUuYMSP
 PmEIwRT60/0oEwwr3+HFvOu66rQLp0zGDBn8uwUjjo+vlap2O5fFV6R1qfxnK3KGUAdZd2
 5k0xiK2LfnGXBLMLHoef6tPmsJaayIE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-CzuGJXd1M-KBf3GMZQGGgA-1; Mon, 05 Jul 2021 06:03:40 -0400
X-MC-Unique: CzuGJXd1M-KBf3GMZQGGgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE39802C88;
 Mon,  5 Jul 2021 10:03:39 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7516660C0F;
 Mon,  5 Jul 2021 10:03:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 08/19] docs: describe the security considerations with
 virtiofsd xattr mapping
Date: Mon,  5 Jul 2021 11:02:24 +0100
Message-Id: <20210705100235.157093-9-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Different guest xattr prefixes have distinct access control rules applied
by the guest. When remapping a guest xattr care must be taken that the
remapping does not allow the a guest user to bypass guest kernel access
control rules.

For example if 'trusted.*' which requires CAP_SYS_ADMIN is remapped
to 'user.virtiofs.trusted.*', an unprivileged guest user which can
write to 'user.*' can bypass the CAP_SYS_ADMIN control. Thus the
target of any remapping must be explicitly blocked from read/writes
by the guest, to prevent access control bypass.

The examples shown in the virtiofsd man page already do the right
thing and ensure safety, but the security implications of getting
this wrong were not made explicit. This could lead to host admins
and apps unwittingly creating insecure configurations.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210611120427.49736-1-berrange@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/tools/virtiofsd.rst | 55 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
index 4911e797cb..a6c3502710 100644
--- a/docs/tools/virtiofsd.rst
+++ b/docs/tools/virtiofsd.rst
@@ -127,8 +127,8 @@ Options
   timeout.  ``always`` sets a long cache lifetime at the expense of coherency.
   The default is ``auto``.
 
-xattr-mapping
--------------
+Extended attribute (xattr) mapping
+----------------------------------
 
 By default the name of xattr's used by the client are passed through to the server
 file system.  This can be a problem where either those xattr names are used
@@ -136,6 +136,9 @@ by something on the server (e.g. selinux client/server confusion) or if the
 virtiofsd is running in a container with restricted privileges where it cannot
 access some attributes.
 
+Mapping syntax
+~~~~~~~~~~~~~~
+
 A mapping of xattr names can be made using -o xattrmap=mapping where the ``mapping``
 string consists of a series of rules.
 
@@ -232,8 +235,48 @@ Note: When the 'security.capability' xattr is remapped, the daemon has to do
 extra work to remove it during many operations, which the host kernel normally
 does itself.
 
-xattr-mapping Examples
-----------------------
+Security considerations
+~~~~~~~~~~~~~~~~~~~~~~~
+
+Operating systems typically partition the xattr namespace using
+well defined name prefixes. Each partition may have different
+access controls applied. For example, on Linux there are multiple
+partitions
+
+ * ``system.*`` - access varies depending on attribute & filesystem
+ * ``security.*`` - only processes with CAP_SYS_ADMIN
+ * ``trusted.*`` - only processes with CAP_SYS_ADMIN
+ * ``user.*`` - any process granted by file permissions / ownership
+
+While other OS such as FreeBSD have different name prefixes
+and access control rules.
+
+When remapping attributes on the host, it is important to
+ensure that the remapping does not allow a guest user to
+evade the guest access control rules.
+
+Consider if ``trusted.*`` from the guest was remapped to
+``user.virtiofs.trusted*`` in the host. An unprivileged
+user in a Linux guest has the ability to write to xattrs
+under ``user.*``. Thus the user can evade the access
+control restriction on ``trusted.*`` by instead writing
+to ``user.virtiofs.trusted.*``.
+
+As noted above, the partitions used and access controls
+applied, will vary across guest OS, so it is not wise to
+try to predict what the guest OS will use.
+
+The simplest way to avoid an insecure configuration is
+to remap all xattrs at once, to a given fixed prefix.
+This is shown in example (1) below.
+
+If selectively mapping only a subset of xattr prefixes,
+then rules must be added to explicitly block direct
+access to the target of the remapping. This is shown
+in example (2) below.
+
+Mapping examples
+~~~~~~~~~~~~~~~~
 
 1) Prefix all attributes with 'user.virtiofs.'
 
@@ -271,7 +314,9 @@ stripping of 'user.virtiofs.'.
 The second rule hides unprefixed 'trusted.' attributes
 on the host.
 The third rule stops a guest from explicitly setting
-the 'user.virtiofs.' path directly.
+the 'user.virtiofs.' path directly to prevent access
+control bypass on the target of the earlier prefix
+remapping.
 Finally, the fourth rule lets all remaining attributes
 through.
 
-- 
2.31.1



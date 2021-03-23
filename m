Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAE346BCF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:11:34 +0100 (CET)
Received: from localhost ([::1]:36288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpFN-0007OC-Nw
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1k-0007Lo-Lm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1R-0002nN-3j
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cy5Mfs0692+JnHAjtZDILDF7mAh2stZSel3gqrE5Jhc=;
 b=hYCvvYrDo6A7Aj2WkhhAJvpC47Vxn74D2mkiiVpBf9KNrCS5TWXSqvlRB/bunz1ekiHb2D
 VUmmxbH2eSsT8yCHmTnweMhajk20t5uPSTmhPSjsTWb9Zt3Q2k+Tzx1qlPEktvq2IHGeow
 Qzg9LM1CH+rnb3TlN8GrFTY1YS29v0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-a7i3WGAtPy-htLwHBGn3hw-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: a7i3WGAtPy-htLwHBGn3hw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 867C8108BD0A;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 311E56087C;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A6C311326B2; Tue, 23 Mar 2021 22:56:59 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/29] qapi: Enforce enum member naming rules
Date: Tue, 23 Mar 2021 22:56:56 +0100
Message-Id: <20210323215658.3840228-28-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enum members should use '-', not '_'.  Enforce this.  Fix the fixable
offenders (all in tests/), and add the remainder to pragma
member-name-exceptions.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-28-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/pragma.json                         | 8 ++++++++
 scripts/qapi/expr.py                     | 5 +++--
 tests/qapi-schema/enum-clash-member.err  | 2 +-
 tests/qapi-schema/enum-clash-member.json | 1 +
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/qapi/pragma.json b/qapi/pragma.json
index f422a1a2ac..b4e17167e1 100644
--- a/qapi/pragma.json
+++ b/qapi/pragma.json
@@ -32,12 +32,15 @@
     'member-name-exceptions': [     # visible in:
         'ACPISlotType',             # query-acpi-ospm-status
         'AcpiTableOptions',         # -acpitable
+        'BlkdebugEvent',            # blockdev-add, -blockdev
         'BlkdebugSetStateOptions',  # blockdev-add, -blockdev
         'BlockDeviceInfo',          # query-block
         'BlockDeviceStats',         # query-blockstats
         'BlockDeviceTimedStats',    # query-blockstats
         'BlockIOThrottle',          # block_set_io_throttle
         'BlockInfo',                # query-block
+        'BlockdevAioOptions',       # blockdev-add, -blockdev
+        'BlockdevDriver',           # blockdev-add, query-blockstats, ...
         'BlockdevVmdkAdapterType',  # blockdev-create (to match VMDK spec)
         'BlockdevVmdkSubformat',    # blockdev-create (to match VMDK spec)
         'ColoCompareProperties',    # object_add, -object
@@ -46,10 +49,15 @@
         'FilterRewriterProperties', # object_add, -object
         'InputLinuxProperties',     # object_add, -object
         'NetdevTapOptions',         # netdev_add, query-netdev, -netdev
+        'ObjectType',               # object-add, -object
+        'PCIELinkSpeed',            # internal only
         'PciBusInfo',               # query-pci
         'PciDeviceInfo',            # query-pci
         'PciMemoryRegion',          # query-pci
+        'QKeyCode',                 # send-key, input-sent-event
         'QapiErrorClass',           # QMP error replies
+        'SshHostKeyCheckMode',      # blockdev-add, -blockdev
+        'SysEmuTarget',             # query-cpu-fast, query-target
         'UuidInfo',                 # query-uuid
         'VncClientInfo',            # query-vnc, query-vnc-servers, ...
         'X86CPURegister32'          # qom-get of x86 CPU properties
diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index ba9f7ad350..d968609c48 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -229,7 +229,7 @@ def check_enum(expr, info):
     if prefix is not None and not isinstance(prefix, str):
         raise QAPISemError(info, "'prefix' must be a string")
 
-    permit_upper = name in info.pragma.member_name_exceptions
+    permissive = name in info.pragma.member_name_exceptions
 
     members[:] = [m if isinstance(m, dict) else {'name': m}
                   for m in members]
@@ -243,7 +243,8 @@ def check_enum(expr, info):
         if member_name[0].isdigit():
             member_name = 'd' + member_name # Hack: hide the digit
         check_name_lower(member_name, info, source,
-                         permit_upper, permit_underscore=True)
+                         permit_upper=permissive,
+                         permit_underscore=permissive)
         check_if(member, info, source)
 
 
diff --git a/tests/qapi-schema/enum-clash-member.err b/tests/qapi-schema/enum-clash-member.err
index 5986571427..e4eb102ae2 100644
--- a/tests/qapi-schema/enum-clash-member.err
+++ b/tests/qapi-schema/enum-clash-member.err
@@ -1,2 +1,2 @@
 enum-clash-member.json: In enum 'MyEnum':
-enum-clash-member.json:2: value 'one_two' collides with value 'one-two'
+enum-clash-member.json:3: value 'one_two' collides with value 'one-two'
diff --git a/tests/qapi-schema/enum-clash-member.json b/tests/qapi-schema/enum-clash-member.json
index b6928b8bfd..82bcbf724b 100644
--- a/tests/qapi-schema/enum-clash-member.json
+++ b/tests/qapi-schema/enum-clash-member.json
@@ -1,2 +1,3 @@
 # we reject enums where members will clash when mapped to C enum
+{ 'pragma': { 'member-name-exceptions': [ 'MyEnum' ] } }
 { 'enum': 'MyEnum', 'data': [ 'one-two', 'one_two' ] }
-- 
2.26.3



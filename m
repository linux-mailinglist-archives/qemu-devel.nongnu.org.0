Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C825ABC0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:08:41 +0200 (CEST)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSVE-0005Fy-JH
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMR-00063S-Tf
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMO-00076a-NF
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ote373+rr37GfoSVxXxgWrx4xpHJ21H9c/MjWrwzfNA=;
 b=JM3sEwJHQkco7ZTN3ccDO65RE3bc3FaXfr+9GN3lcpylMqO0TrHp28J9kvTg/W8kc+DYzx
 dRKs/Oy4kb65eYuBH38gaBcF8Z3AziiFj7GlcJfwS+sVzGeC9PPLvL9ax+OgqQXsm68A9l
 HIN8gkbh5bnUOf1HPDcpPa6h1ezOU5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-xfjfRgM2NKGNbpVommp92g-1; Wed, 02 Sep 2020 08:59:28 -0400
X-MC-Unique: xfjfRgM2NKGNbpVommp92g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26EA1107B7C4;
 Wed,  2 Sep 2020 12:59:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9D1D76E01;
 Wed,  2 Sep 2020 12:59:22 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/39] meson: fix libqos linking
Date: Wed,  2 Sep 2020 08:58:48 -0400
Message-Id: <20200902125917.26021-11-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add genh to the sources to avoid race conditions between QAPI
file generation and libqos compilation.

Make the name_suffix .fa for consistency with other link_whole
static libraries and to work around a Meson issue where
lots of linker flags are placed between -Wl,--start-group and
-Wl,--end-group and this breaks the fork-fuzz.ld linker script.

Reported-by: Claudio Fontana <cfontana@suse.de>
Reported-by: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/libqos/meson.build | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/libqos/meson.build b/tests/qtest/libqos/meson.build
index 19931b9248..1cddf5bdaa 100644
--- a/tests/qtest/libqos/meson.build
+++ b/tests/qtest/libqos/meson.build
@@ -1,5 +1,4 @@
-libqos = static_library('qos',
-  files('../libqtest.c',
+libqos_srcs = files('../libqtest.c',
         'qgraph.c',
         'qos_external.c',
         'pci.c',
@@ -52,6 +51,10 @@ libqos = static_library('qos',
         'arm-xilinx-zynq-a9-machine.c',
         'ppc64_pseries-machine.c',
         'x86_64_pc-machine.c',
-), build_by_default: false)
+)
+
+libqos = static_library('qos', libqos_srcs + genh,
+                        name_suffix: 'fa',
+                        build_by_default: false)
 
 qos = declare_dependency(link_whole: libqos)
-- 
2.26.2




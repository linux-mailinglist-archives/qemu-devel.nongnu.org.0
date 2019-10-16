Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E94D8572
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 03:26:34 +0200 (CEST)
Received: from localhost ([::1]:34832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKY5A-0001iD-OS
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 21:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKY3w-0000tu-UL
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 21:25:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKY3v-0003Ce-QW
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 21:25:16 -0400
Received: from mga06.intel.com ([134.134.136.31]:3569)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iKY3v-0003CM-JM
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 21:25:15 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Oct 2019 18:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,301,1566889200"; d="scan'208";a="207752279"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga002.jf.intel.com with ESMTP; 15 Oct 2019 18:25:11 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: pbonzini@redhat.com, philmd@redhat.com, thuth@redhat.com,
 eblake@redhat.com, berrange@redhat.com
Subject: [PATCH] checkpatch: sugguest to use qemu_real_host_page_size instead
 of getpagesize() or sysconf(_SC_PAGESIZE)
Date: Wed, 16 Oct 2019 09:24:32 +0800
Message-Id: <20191016012432.22731-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.31
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
CC: David Gibson <david@gibson.dropbear.id.au>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index aa9a354a0e..4b360ed310 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2915,6 +2915,12 @@ sub process {
 		if ($line =~ /\bbzero\(/) {
 			ERROR("use memset() instead of bzero()\n" . $herecurr);
 		}
+		if ($line =~ /getpagesize\(\)/) {
+			ERROR("use qemu_real_host_page_size instead of getpagesize()\n" . $herecurr);
+		}
+		if ($line =~ /sysconf\(_SC_PAGESIZE\)/) {
+			ERROR("use qemu_real_host_page_size instead of sysconf(_SC_PAGESIZE)\n" . $herecurr);
+		}
 		my $non_exit_glib_asserts = qr{g_assert_cmpstr|
 						g_assert_cmpint|
 						g_assert_cmpuint|
-- 
2.17.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0983DA2CF
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 02:49:05 +0200 (CEST)
Received: from localhost ([::1]:52482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKtyQ-0002jl-NY
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 20:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKtwq-00021G-5r
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 20:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iKtwo-0005Oz-5z
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 20:47:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:23847)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iKtwm-0005O8-6f
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 20:47:22 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 17:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,305,1566889200"; d="scan'208";a="195002123"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga008.fm.intel.com with ESMTP; 16 Oct 2019 17:47:14 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: pbonzini@redhat.com, philmd@redhat.com, eblake@redhat.com,
 thuth@redhat.com, berrange@redhat.com
Subject: [Patch v2] checkpatch: sugguest to use qemu_real_host_page_size
 instead of getpagesize() or sysconf(_SC_PAGESIZE)
Date: Thu, 17 Oct 2019 08:46:33 +0800
Message-Id: <20191017004633.13229-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
CC: Richard Henderson <richard.henderson@linaro.org>
CC: Stefan Hajnoczi <stefanha@redhat.com>

---
v2: add "\b" for better match, suggested by Richard Henderson <richard.henderson@linaro.org>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index aa9a354a0e..ab68a16fd2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2915,6 +2915,12 @@ sub process {
 		if ($line =~ /\bbzero\(/) {
 			ERROR("use memset() instead of bzero()\n" . $herecurr);
 		}
+		if ($line =~ /\bgetpagesize\(\)/) {
+			ERROR("use qemu_real_host_page_size instead of getpagesize()\n" . $herecurr);
+		}
+		if ($line =~ /\bsysconf\(_SC_PAGESIZE\)/) {
+			ERROR("use qemu_real_host_page_size instead of sysconf(_SC_PAGESIZE)\n" . $herecurr);
+		}
 		my $non_exit_glib_asserts = qr{g_assert_cmpstr|
 						g_assert_cmpint|
 						g_assert_cmpuint|
-- 
2.17.1



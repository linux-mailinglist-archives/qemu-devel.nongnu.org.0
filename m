Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFF101AE9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:13 +0100 (CET)
Received: from localhost ([::1]:42470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWyVc-0005o7-Tb
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 03:05:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pawan.kumar.gupta@linux.intel.com>)
 id 1iWxuE-0006ek-St
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 02:26:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pawan.kumar.gupta@linux.intel.com>)
 id 1iWxuA-0005BT-AB
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 02:26:31 -0500
Received: from mga02.intel.com ([134.134.136.20]:35764)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pawan.kumar.gupta@linux.intel.com>)
 id 1iWxu4-00058A-Vh
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 02:26:27 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 23:26:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="209331765"
Received: from guptapadev.jf.intel.com (HELO guptapadev.amr) ([10.7.198.56])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2019 23:26:13 -0800
Date: Mon, 18 Nov 2019 23:23:27 -0800
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: pbonzini@redhat.com
Subject: [PATCH] target/i386: Export TAA_NO bit to guests
Message-ID: <20191119072327.GA30825@guptapadev.amr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
X-Mailman-Approved-At: Tue, 19 Nov 2019 03:03:10 -0500
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
Cc: qemu-devel@nongnu.org, ehabkost@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TSX Async Abort (TAA) is a side channel attack on internal buffers in
some Intel processors similar to Microachitectural Data Sampling (MDS).

Some future Intel processors will use the ARCH_CAP_TAA_NO bit in the
IA32_ARCH_CAPABILITIES MSR to report that they are not vulnerable to
TAA. Make this bit available to guests.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index a624163ac2cd..af84b04951cf 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1205,7 +1205,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
         .feat_names = {
             "rdctl-no", "ibrs-all", "rsba", "skip-l1dfl-vmentry",
             "ssb-no", "mds-no", NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            "taa-no", NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
             NULL, NULL, NULL, NULL,
-- 
2.21.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA263790
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 16:15:37 +0200 (CEST)
Received: from localhost ([::1]:50376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkqu8-0002ys-9P
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 10:15:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54544)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqoq-0007Mh-U5
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hkqop-0008Eu-V6
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:08 -0400
Received: from mga02.intel.com ([134.134.136.20]:42708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hkqop-0008Cb-N2
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:10:07 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 07:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="167426904"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga007.fm.intel.com with ESMTP; 09 Jul 2019 07:09:58 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue,  9 Jul 2019 22:09:21 +0800
Message-Id: <20190709140924.13291-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH 0/3] migration/savevm: move non SaveStateEntry
 condition check out of iteration
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
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_savevm_state_complete_precopy() iterates SaveStateEntry and does proper
tasks for migration.

For each iteration, in_postcopy and iterable_only would be checked to see
whether it should skip. Since these two conditions are not SaveStateEntry
specific, it is proper to move the check out of iteration.

These three patches prepare the code and move the condition check out of the
iteration.


Wei Yang (3):
  migration/savevm: flush file for iterable_only case
  migration/savevm: split qemu_savevm_state_complete_precopy() into two
    parts
  migration/savevm: move non SaveStateEntry condition check out of
    iteration

 migration/savevm.c | 68 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 50 insertions(+), 18 deletions(-)

-- 
2.17.1



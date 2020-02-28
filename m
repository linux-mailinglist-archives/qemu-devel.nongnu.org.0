Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774A172ECC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 03:26:08 +0100 (CET)
Received: from localhost ([::1]:40758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7VLq-0006iy-Vg
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 21:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.hu@linux.intel.com>) id 1j7VL6-0006CS-Us
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 21:25:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.hu@linux.intel.com>) id 1j7VL5-0006LE-K6
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 21:25:20 -0500
Received: from mga03.intel.com ([134.134.136.65]:21701)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <robert.hu@linux.intel.com>)
 id 1j7VL5-0006C9-4j
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 21:25:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 18:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="238622568"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga003.jf.intel.com with ESMTP; 27 Feb 2020 18:25:08 -0800
From: Robert Hoo <robert.hu@linux.intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, philmd@redhat.com, berrange@redhat.com
Subject: [PATCH v3 0/2] Add AVX512F optimization option and
 buffer_zero_avx512()
Date: Fri, 28 Feb 2020 10:24:54 +0800
Message-Id: <1582856696-45663-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: robert.hu@intel.com, chao.p.peng@intel.com,
 Robert Hoo <robert.hu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1) Introduce {enable,disable}-avx512f configure option

2) Implement new buffer_zero_avx512() with AVX512F instructions

Changes in v3:
In init_accel(), init length_to_accel value in every accel case, because
in unit test, it will be invoked several times with different accel cases.
(Thanks Richard's careful review)

Changes in v2:
1. Fixes wrong definition of CACHE_SSE2 in v1.
2. Fixes not handle <256 length case in buffer_zero_avx512() implementaion.
(Follow Richard's suggestion: handle the case in select_accel_fn(), and have a
global variable alongside buffer_accel)
3. Changes avx512f configuration option's default status to disabled.
4. Ran 'make check-unit' on this patch, on both a Ivybridge machine and a
CascadeLake machine.


Robert Hoo (2):
  configure: add configure option avx512f_opt
  util: add util function buffer_zero_avx512()

 configure            | 41 ++++++++++++++++++++++++++++++++
 include/qemu/cpuid.h |  3 +++
 util/bufferiszero.c  | 67 +++++++++++++++++++++++++++++++++++++++++++++-------
 3 files changed, 102 insertions(+), 9 deletions(-)

-- 
1.8.3.1



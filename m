Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8780B16F624
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 04:37:33 +0100 (CET)
Received: from localhost ([::1]:37604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6nVs-0004i6-BV
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 22:37:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48625)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.hu@linux.intel.com>) id 1j6nUx-00046H-36
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 22:36:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.hu@linux.intel.com>) id 1j6nUw-00082b-2H
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 22:36:34 -0500
Received: from mga07.intel.com ([134.134.136.100]:57988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <robert.hu@linux.intel.com>)
 id 1j6nUv-0007ls-Qp
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 22:36:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Feb 2020 19:36:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,486,1574150400"; d="scan'208";a="231256264"
Received: from sqa-gate.sh.intel.com (HELO robert-ivt.tsp.org)
 ([10.239.48.212])
 by orsmga008.jf.intel.com with ESMTP; 25 Feb 2020 19:36:28 -0800
From: Robert Hoo <robert.hu@linux.intel.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, philmd@redhat.com, berrange@redhat.com
Subject: [PATCH v2 0/2] Add AVX512F optimization option and
 buffer_zero_avx512()
Date: Wed, 26 Feb 2020 11:35:40 +0800
Message-Id: <1582688142-113997-1-git-send-email-robert.hu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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

 configure            | 41 +++++++++++++++++++++++++++++++++
 include/qemu/cpuid.h |  3 +++
 util/bufferiszero.c  | 64 ++++++++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 99 insertions(+), 9 deletions(-)

-- 
1.8.3.1



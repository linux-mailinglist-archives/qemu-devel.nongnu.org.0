Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D265B3B4B65
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 01:55:47 +0200 (CEST)
Received: from localhost ([::1]:59144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwvfm-00087W-Fv
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 19:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lwven-0007T6-Q4
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 19:54:45 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37390 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lwvem-00015e-2H
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 19:54:45 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 2C87760310050; Fri, 25 Jun 2021 19:54:43 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v1 openspdm on QEMU CXL/PCIe Device 0/2] Testing PCIe DOE in
 QEMU CXL/PCIe Device using openspdm
Date: Fri, 25 Jun 2021 19:54:40 -0400
Message-Id: <1624665280-3595-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series provides an implementation of the the Data Object Exchange
(DOE) for Component Measurement and Authentication (CMA) of the Security
Protocol and Data Model (SPDM). 

This patch is based on 
[1] Openspdm: https://github.com/jyao1/openspdm.git

Openspdm is an emulator composed of an SPDM requester and an SPDM responder.
The default SpdmEmu usage have the requester and responder communicate with
each other via a TCP socket. 

However to test PCIe DOE support in QEMU PCIe/CXL device directly, the openspdm
requester is modified to use pwrite/pread for MMIO access to the
QEMU CXL Device DOE capability (hw/mem/cxl_type3.c).  The openspdm
requester is run as user application targeting the CXL Device.

Follow the readme.md under [1] to build this enhanced version of openspdm.

This patch series is to be used with a subsequent QEMU patch series to be
concurrently with this patch series.  Full instructions will be included
there.

hchkuo (2):
  build: gcc to CC in GNUMakefile
  requester: Modified for QEMU emulation

 GNUmakefile.Flags                           |   4 +-
 Include/IndustryStandard/PciDoeBinding.h    |  27 +++++++
 SpdmEmu/SpdmEmuCommon/SpdmEmu.c             |  85 ++++++++++++++++++++++
 SpdmEmu/SpdmEmuCommon/SpdmEmu.h             |   7 ++
 SpdmEmu/SpdmRequesterEmu/SpdmRequester.c    | 100 +++++++++++++++++++------
 SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.c | 109 +++++++++++++++++++++++++---
 SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.h |   5 ++
 7 files changed, 302 insertions(+), 35 deletions(-)

-- 
1.8.3.1



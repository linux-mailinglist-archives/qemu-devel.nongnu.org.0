Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5608A320B73
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 16:34:46 +0100 (CET)
Received: from localhost ([::1]:40954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDqkv-00056r-Er
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 10:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDpJo-0005m0-4q; Sun, 21 Feb 2021 09:02:40 -0500
Received: from exmail.andestech.com ([60.248.187.195]:10475
 helo=ATCSQR.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwshu@andestech.com>)
 id 1lDpJl-00057W-5Q; Sun, 21 Feb 2021 09:02:39 -0500
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 11LDuh6R062668;
 Sun, 21 Feb 2021 21:56:43 +0800 (GMT-8)
 (envelope-from cwshu@andestech.com)
Received: from ubuntu1604.andestech.com (10.0.12.177) by
 ATCPCS16.andestech.com (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0; 
 Sun, 21 Feb 2021 22:02:12 +0800
From: Jim Shu <cwshu@andestech.com>
To: <qemu-riscv@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 0/3] target/riscv: fix PMP permission checking when softmmu's
 TLB hits
Date: Sun, 21 Feb 2021 22:01:19 +0800
Message-ID: <1613916082-19528-1-git-send-email-cwshu@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.12.177]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 11LDuh6R062668
Received-SPF: pass client-ip=60.248.187.195; envelope-from=cwshu@andestech.com;
 helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 21 Feb 2021 10:29:58 -0500
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
Cc: listair.Francis@wdc.com, palmer@dabbelt.com, Jim Shu <cwshu@andestech.com>,
 sagark@eecs.berkeley.edu, kbastian@mail.uni-paderborn.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry for sending this patch set again. 
The cover letter of my previous mail doesn't add cc list.
---

Current implementation of PMP permission checking only has effect when
softmmu's TLB miss. PMP checking is bypassed when TLB hits because TLB page
permission isn't affected by PMP permission.

To fix this issue, this patch set addes the feature to propagate PMP
permission to the TLB page and flush TLB pages if PMP permission has
been changed.

The patch set is tested on Zephyr RTOS userspace testsuite on QEMU riscv32
virt machine.

Jim Shu (3):
  target/riscv: propagate PMP permission to TLB page
  target/riscv: add log of PMP permission checking
  target/riscv: flush TLB pages if PMP permission has been changed

 target/riscv/cpu_helper.c | 96 ++++++++++++++++++++++++++++++---------
 target/riscv/pmp.c        | 84 +++++++++++++++++++++++++---------
 target/riscv/pmp.h        |  4 +-
 3 files changed, 141 insertions(+), 43 deletions(-)

-- 
2.30.1



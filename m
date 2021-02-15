Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56BE31B9D4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:54:45 +0100 (CET)
Received: from localhost ([::1]:38578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdOm-0003ql-OP
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFs-00044J-An
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:32 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFo-0000g3-O6
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:32 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MjSDU-1lZNPg2TcI-00kvD8; Mon, 15 Feb 2021 13:45:26 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] linux-user/mmap: Avoid asserts for out of range mremap
 calls
Date: Mon, 15 Feb 2021 13:45:14 +0100
Message-Id: <20210215124519.720265-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215124519.720265-1-laurent@vivier.eu>
References: <20210215124519.720265-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:wLK9PnbttRlOqs1KYkoxkHb02FdEF56FFqOC3w6OLXUEBuq11RR
 H5p8iCxHAbQyYc0Ls+RSjmEf3z+BgA0+apUJlUrXhqOkluE3aEXnurbTRmjeue0J7yVhLUA
 FHFL5xqUrdAd28r0vRfmdIz/ZgkCZ1l1EbRvnw3pe4M+88zmF912djD43Agbf+c/flc5Y7v
 HtRYWkSa7Q387T8jfeFDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mMlOVXykinE=:AXU4WZ1+lyE6/Cn9SpHAhP
 uTtbYYtB4Fo/pHabwPdnc+wfbWy/wjmbC8/TmWD2LJB1LuN9a8JJG0vTIdj7Zr/uScViBhIcz
 lEA99BH0AkKuxAfgmwCFqtDmuE2L5B8CPwu2t42O4ZkJ7Se1FOZM0Tt5KYxBux0cxkHJnuAGv
 pqy6fkrjYeKQnft35oITH3e4SDvOUNhqE//vcEKbO/AnCw3lrQX8NzwUnPIRpcWEBT4IaLuki
 Ylf4VYmQhhHl7UWONogwVdODilqeipGHmIeM+6NO+2idt1HJIrH+BqODnd1Ne4tx6rxdppMZJ
 CON3D/rBLhkpjTN5J3dtvJvISW8lqxPVatYKY2BtQQCiPz0GlPVbzZFIvqURbIni/Qs1R2nN2
 vsWWzqSS+iN3NB2zR7p0w40di4doyO3QDMDDBSVeJ8Vevb1S3lfWRFjzMy8Bqf1t1aIF/cHYc
 C5Zvo5dXew==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If mremap() is called without the MREMAP_MAYMOVE flag with a start address
just before the end of memory (reserved_va) where new_size would exceed
it (and GUEST_ADDR_MAX), the assert(end - 1 <= GUEST_ADDR_MAX) in 
page_set_flags() would trigger.

Add an extra guard to the guest_range_valid() checks to prevent this and
avoid asserting binaries when reserved_va is set.

This meant a bug I was seeing locally now gives the same behaviour 
regardless of whether reserved_va is set or not.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Message-Id: <70c46e7b999bafbb01d54bfafd44b420d0b782e9.camel@linuxfoundation.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 810653c50357..1c9faef47699 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -724,7 +724,9 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
 
     if (!guest_range_valid(old_addr, old_size) ||
         ((flags & MREMAP_FIXED) &&
-         !guest_range_valid(new_addr, new_size))) {
+         !guest_range_valid(new_addr, new_size)) ||
+        ((flags & MREMAP_MAYMOVE) == 0 &&
+         !guest_range_valid(old_addr, new_size))) {
         errno = ENOMEM;
         return -1;
     }
-- 
2.29.2



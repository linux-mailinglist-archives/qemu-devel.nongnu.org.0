Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D41A4D1E
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Sep 2019 03:36:21 +0200 (CEST)
Received: from localhost ([::1]:60942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i4bGV-0000E4-Oh
	for lists+qemu-devel@lfdr.de; Sun, 01 Sep 2019 21:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i4bEy-00086s-GM
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 21:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i4bEx-0000Nn-HY
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 21:34:44 -0400
Received: from nsstlmta05p.bpe.bigpond.com ([203.38.21.5]:55498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1i4bEw-0000KS-UW
 for qemu-devel@nongnu.org; Sun, 01 Sep 2019 21:34:43 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep21p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190902012254.LWWZ15045.nsstlfep21p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Mon, 2 Sep 2019 11:22:54 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudeiledggeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoehpsghonhiiihhnihesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehrthhhsehtfihiuggulhgvrdhnvghtqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D358144105D0F56; Mon, 2 Sep 2019 11:22:54 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Sep 2019 11:26:47 +1000
Message-Id: <20190902012647.1761-1-tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.5
Subject: [Qemu-devel]  [PATCH] memory: Set notdirty_mem_ops validator
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Existing read rejecting validator was mistakenly cleared.

Reads dispatched to io_mem_notdirty then segfaults as there is no read
handler.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 exec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exec.c b/exec.c
index 1df966d17a..05d664541f 100644
--- a/exec.c
+++ b/exec.c
@@ -2796,12 +2796,12 @@ static bool notdirty_mem_accepts(void *opaque, hwaddr addr,
 
 static const MemoryRegionOps notdirty_mem_ops = {
     .write = notdirty_mem_write,
-    .valid.accepts = notdirty_mem_accepts,
     .endianness = DEVICE_NATIVE_ENDIAN,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 8,
         .unaligned = false,
+        .accepts = notdirty_mem_accepts,
     },
     .impl = {
         .min_access_size = 1,
-- 
2.23.0



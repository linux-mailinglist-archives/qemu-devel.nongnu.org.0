Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E32A560E5E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 02:53:55 +0200 (CEST)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iRO-0004F1-8a
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 20:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6iOr-0001id-00
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:51:19 -0400
Received: from mout-u-204.mailbox.org ([2001:67c:2050:101:465::204]:49112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6iOp-0004ne-4J
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:51:16 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LYKWy4xmyz9sX1;
 Thu, 30 Jun 2022 02:51:10 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v4 2/3] tests/data/acpi/q35/SSDT.dimmpxm: Account for new E820
 entry
Date: Thu, 30 Jun 2022 00:50:57 +0000
Message-Id: <20220630005058.500449-3-lkujaw@member.fsf.org>
In-Reply-To: <20220630005058.500449-1-lkujaw@member.fsf.org>
References: <20220630005058.500449-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4LYKWy4xmyz9sX1
Received-SPF: pass client-ip=2001:67c:2050:101:465::204;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-204.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As detailed in the first patch of this series (8e64de1c), the
previously contiguous RAM aliased for the i440FX and Q35 machines was
broken into conventional [0-0xA0000] and extended regions
[0x100000-...], creating a need for a new E820 entry to account for
the ISA MMIO area gap.  This new entry slightly reduces the available
RAM, thus in the Q35's DSDT, the following change occurred:

<     Name (MEMA, 0x07FFF000)
>     Name (MEMA, 0x07FFE000)

accompanied by a corresponding change of checksum.  This patch updates
the above-referenced file to forestall the BIOS table test failure.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
(v4) New patch.

 tests/data/acpi/q35/SSDT.dimmpxm | Bin 734 -> 734 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/tests/data/acpi/q35/SSDT.dimmpxm b/tests/data/acpi/q35/SSDT.dimmpxm
index 98e6f0e3f3bb02dd419e36bdd1db9b94c728c406..ac55387d57e48adb99eb738a102308688a262fb8 100644
GIT binary patch
delta 23
fcmcb|dXJSWIM^lR9uortW7tNni%iT9{<8xBTM-An

delta 23
fcmcb|dXJSWIM^lR9uortquWNVi%iTP{<8xBTCoSc

-- 
2.34.1



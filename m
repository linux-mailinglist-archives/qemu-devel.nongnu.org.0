Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B46137EA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:26:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUni-0006cn-6I; Mon, 31 Oct 2022 09:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnR-0006KE-IW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1opUnP-0007jZ-SI
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:25:45 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7102F5C014D;
 Mon, 31 Oct 2022 09:25:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 31 Oct 2022 09:25:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667222741; x=1667309141; bh=4l
 bP/pTyQ/NHtBGeRHSb+F/+b964vgJ/W7GPaDlyUNk=; b=OLyODfDLEbSoOQRXQ9
 PJC/yLx4p1cgwiEkrTuxeyi7ei5cCgIyKwYqfxgosy8ji9bMexaqFsQCGXdAAsJc
 aaFw5EW1F1LZZJROM15S1rrntzHKIEInKBjiYFqyhWmuteiMxB62AOgTDpVsgowa
 myHZKOdzbCQzoc+2Dce+l9evsJZbmmyBBSA9c5o52Glq0QcTD81RQuNUF8OAftfp
 oTxLfJm7IXA2wkGvQ/ZFwzhXZA6mSXL3fpJp+C3EBf/feoL7RmQTxSIsmbNAAgoh
 lcoAbZ0vFfCjVT1RyU/taMXiZeuwU9zbOf+WML9Uf/Hf5pUMjJnRXAJEAuphFY1r
 DtNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667222741; x=1667309141; bh=4lbP/pTyQ/NHt
 BGeRHSb+F/+b964vgJ/W7GPaDlyUNk=; b=iZa8MdE8BRFmjB58cNj/k0VjfAjAt
 2qY3MfNy6EgbUyGiVmYknEYdf3QZw3ILvdUpQ506WCAj98X47ms/61D7TDNaZq1K
 hIiphvOHYL5QlbaizHggZItfifNK+EFQygGLVLK82ysQ0kE0uf0xN/uszWbx8T3L
 FKCoxplQakwCiIOqZn1H/IzqF00vh+iAb3YynDzS0CLFvj9W+hKk13I1GW0e+2Vm
 InKzPgTXiErewB1eQOF3ZMl7AXggmISicOUzUA7SiYFyoY76UtNtegmJ3mbP2ML4
 Rgj3H/ncbXyKaeqt+qPjVWJ922HkpMVlI7Ijm4F+s6a8yok4nv5YOe05g==
X-ME-Sender: <xms:1cxfYxU6YjbmX7K6IVqR_5VBkuHRCx6lVuy2RnyJxRAcNAfpmzXgzA>
 <xme:1cxfYxm1U3GYX9u6q3FSal4M_hxIXelG0sIBj6OA0Zoja5CYjBFrA9FSBe8FRaegB
 FlWnKoJgYrUQRpuAjc>
X-ME-Received: <xmr:1cxfY9bpxA1Ay-KqYqA_kSI3WwTIiYYk42WQMuqqmW97YF4TQ3MIHX1M5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihu
 nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
 ftrfgrthhtvghrnhepfeeludefheegvdeuvddvgeekgfdvtdettdelieeihfegtedugeek
 hfdvhfejfedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:1cxfY0VAGTGPuHWClByVxewDzPL1dtI0e7l0VEXxm1612myPG8bcJA>
 <xmx:1cxfY7kfXumYVyqT-WyDcTrFwUyHxIkTxHdR__iZpUMrmjw6oDLXCg>
 <xmx:1cxfYxdUBhvYncdkHaTDitCmqFsb5J0skMqa55tEAIhYX58uhURC3g>
 <xmx:1cxfY5iFBsACIPK5U29TVAn72R5HVrZZbydxq2yeLDVDqbtrc47mTw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 09:25:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, pavel.dovgalyuk@ispras.ru,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/3] target/mips: Set CP0St_{KX, SX, UX} for Loongson-2F
Date: Mon, 31 Oct 2022 13:25:29 +0000
Message-Id: <20221031132531.18122-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
References: <20221031132531.18122-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

As per an unpublished document, in later reversion of chips
CP0St_{KX, SX, UX} is not writeable and hardcoded to 1.

Without those bits set, kernel is unable to access XKPHYS address
segmant. So just set them up on CPU reset.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
---
v2:
Rewording to point out the document is unpublished
---
 target/mips/cpu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index d0a76b95f7..a870901bfa 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -304,6 +304,12 @@ static void mips_cpu_reset(DeviceState *dev)
     env->CP0_EntryHi_ASID_mask = (env->CP0_Config5 & (1 << CP0C5_MI)) ?
             0x0 : (env->CP0_Config4 & (1 << CP0C4_AE)) ? 0x3ff : 0xff;
     env->CP0_Status = (1 << CP0St_BEV) | (1 << CP0St_ERL);
+    if (env->insn_flags & INSN_LOONGSON2F) {
+        /* Loongson-2F has those bits hardcoded to 1 */
+        env->CP0_Status |= (1 << CP0St_KX) | (1 << CP0St_SX) |
+                            (1 << CP0St_UX);
+    }
+
     /*
      * Vectored interrupts not implemented, timer on int 7,
      * no performance counters.
-- 
2.34.1



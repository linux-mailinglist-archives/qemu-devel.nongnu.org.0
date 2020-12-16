Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ACD2DB922
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:29:56 +0100 (CET)
Received: from localhost ([::1]:44006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMZf-0007zf-93
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:29:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMVe-0005I0-3d
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:25:47 -0500
Received: from relay3.mymailcheap.com ([217.182.119.155]:48346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMVa-0003eW-Uy
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:25:44 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 70F9F3F1CC;
 Wed, 16 Dec 2020 03:25:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id B450F2A0FF;
 Tue, 15 Dec 2020 21:25:40 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608085540;
 bh=E71JmSHaugjfKT7rsD45XJuDdY3yLsTKvoPl+dGj/sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fEMyF6oytu+4OIM6D0B8qaHJWhGMYEHHKcJeW25C/LpoPXDvnu0WUwscQZd716xML
 weQ01D2kuRBNagugrhf+BKuYO1R3PxggJuc+PVKmK/A5d8gorgVbltUCrbpeS4qBaI
 ALhTy1HkV0VHbp8o37S2ycmGvjVFpWYbWRdgK8Q8=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkTvZqtZCYBW; Tue, 15 Dec 2020 21:25:38 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Tue, 15 Dec 2020 21:25:38 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 9F22D40FF4;
 Wed, 16 Dec 2020 02:25:37 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Y8OBa/J5"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 7A95F40FF4;
 Wed, 16 Dec 2020 02:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608085533;
 bh=E71JmSHaugjfKT7rsD45XJuDdY3yLsTKvoPl+dGj/sw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y8OBa/J5ytl+/fk0WUXJO/tBCzwBndK1wzIoGJtURO+FAbH23ll1RpXckhlt1cKEO
 lnDGXJFBwxZ4Ewk3QdSinidRmqo7TJZh2lUSgLg1zi9V11cTJZ1YEJ4QKHx21sUCRk
 6S+nyE6BsUIA7jQrQOh2NIE24q4SnznSVrm4Y5N4=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] hw/mips/fuloong2e: Relpace fault links
Date: Wed, 16 Dec 2020 10:25:08 +0800
Message-Id: <20201216022513.89451-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
References: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; R_MISSING_CHARSET(2.50)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BROKEN_CONTENT_TYPE(1.50)[]; R_SPF_SOFTFAIL(0.00)[~all:c];
 TO_DN_SOME(0.00)[]; ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 9F22D40FF4
X-Spam: Yes
Received-SPF: pass client-ip=217.182.119.155;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SORBS_WEB=1.5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Websites are downing, but GitHub may last forever.
Loongson even doesn't recogonize 2E as their products nowadays..

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 055b99e378..a5b75b230a 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -14,8 +14,8 @@
  * Fuloong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like, 800MHz)
  * https://www.linux-mips.org/wiki/Fuloong_2E
  *
- * Loongson 2e user manual:
- * http://www.loongsondeveloper.com/doc/Loongson2EUserGuide.pdf
+ * Loongson 2e manuals:
+ * https://github.com/loongson-community/docs/tree/master/2E
  */
 
 #include "qemu/osdep.h"
@@ -61,14 +61,7 @@
  * PMON is not part of qemu and released with BSD license, anyone
  * who want to build a pmon binary please first git-clone the source
  * from the git repository at:
- * http://www.loongson.cn/support/git/pmon
- * Then follow the "Compile Guide" available at:
- * http://dev.lemote.com/code/pmon
- *
- * Notes:
- * 1, don't use the source at http://dev.lemote.com/http_git/pmon.git
- * 2, use "Bonito2edev" to replace "dir_corresponding_to_your_target_hardware"
- * in the "Compile Guide".
+ * https://github.com/loongson-community/pmon-2ef
  */
 #define FULOONG_BIOSNAME "pmon_2e.bin"
 
-- 
2.29.2


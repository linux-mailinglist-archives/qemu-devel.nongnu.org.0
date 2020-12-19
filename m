Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E5F2DEDAC
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 08:16:49 +0100 (CET)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqWTw-0007ke-P2
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 02:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWQV-0005Ze-Hj
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:13:15 -0500
Received: from relay3.mymailcheap.com ([217.182.66.161]:59417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kqWQT-0003yH-Bw
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 02:13:15 -0500
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 63C063F1CC;
 Sat, 19 Dec 2020 08:13:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id 92C3A2A36B;
 Sat, 19 Dec 2020 02:13:10 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608361990;
 bh=2+7b1V6sX6lzEhvcVS0K0xxRl7BGggaKpH0uZu7Hefg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=umlS8epCHUHs1+FiZCbqPi8N3h70/1dXAuHkcjMw7ZXqr/mgIuv/SfIWhRtOyIns7
 Hu3uiXZsSdtwmd1NSyOO5L9s79xWE3QRUFi12TuV4mfIvw730ruHzNVuM9N/oSAOZW
 ZZVLErNL96CMeLhZxiaiMj87XmmVWpOZkG6iYgYY=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2afsN4Dphuoj; Sat, 19 Dec 2020 02:13:09 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Sat, 19 Dec 2020 02:13:09 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 4350F41E18;
 Sat, 19 Dec 2020 07:13:08 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="Ya1LvveA"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from localhost.localdomain (unknown [180.97.240.22])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 3241041009;
 Sat, 19 Dec 2020 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608361980;
 bh=2+7b1V6sX6lzEhvcVS0K0xxRl7BGggaKpH0uZu7Hefg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ya1LvveA2m/yXlY6ixhtDjSMvsRXlKHR00IgViS+YMzz0iSJfe0OnrA652sSm4lSI
 /6z2mnYNBUP3O3/KO3pyhY4Cj4NcXKA4iyUnmDYYiueLHPJ66xvGDAImYVKt4mTxNW
 AHaoiUZ6QnPksbw1oLXHZ98iqVKhLch69le+aR0M=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/mips/fuloong2e: Relpace fault links
Date: Sat, 19 Dec 2020 15:12:29 +0800
Message-Id: <20201219071235.35040-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [8.90 / 10.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 RECEIVED_SPAMHAUS_CSS(1.00)[180.97.240.22:received];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 R_SPF_SOFTFAIL(0.00)[~all:c]; RCPT_COUNT_FIVE(0.00)[6];
 ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RECEIVED_SPAMHAUS_XBL(3.00)[180.97.240.22:received];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 4350F41E18
X-Rspamd-Server: mail20.mymailcheap.com
X-Spam: Yes
Received-SPF: pass client-ip=217.182.66.161;
 envelope-from=jiaxun.yang@flygoat.com; helo=relay3.mymailcheap.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_SBL_CSS=3.335,
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
Cc: chenhuacai@kernel.org, f4bug@amsat.org, wainersm@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Websites are downing, but GitHub may last forever.
Loongson even doesn't recogonize 2E as their products nowadays..

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 055b99e378..d846ef7b00 100644
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
+ * https://github.com/loongson-community/pmon
  */
 #define FULOONG_BIOSNAME "pmon_2e.bin"
 
-- 
2.29.2


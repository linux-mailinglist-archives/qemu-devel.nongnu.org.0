Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2C2DB934
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:34:46 +0100 (CET)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMeL-00032f-3L
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:34:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMba-0001fh-F5
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:31:56 -0500
Received: from relay3.mymailcheap.com ([217.182.119.155]:58733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kpMbQ-0004Vi-Ro
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:31:53 -0500
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 04DB33F15F;
 Wed, 16 Dec 2020 03:31:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id D82F02A4ED;
 Wed, 16 Dec 2020 03:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
 s=default; t=1608085901;
 bh=C7plXyNTcNy8WuC8fLs0exd5Rt4gpKds5Sn5a30FJGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iE5I1OX72PGWM3gq0M/94fPyrTl8HIyPKMm8dSvbsXYMmoMn/k69STbmu/u1dUr6L
 kTToBKs9yXC8k/RUYfPtHWaX2WHGeJ5FBNC/HQVIWytGQS5a3Ry2q7ERpN0KUD1Y5V
 8yzpe9Qw1HonSGq4IAhqzUCFnBhVbtlSjLOWwH1c=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hJTUazurFyVB; Wed, 16 Dec 2020 03:31:40 +0100 (CET)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Wed, 16 Dec 2020 03:31:40 +0100 (CET)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
 by mail20.mymailcheap.com (Postfix) with ESMTP id 9CA6740FF4;
 Wed, 16 Dec 2020 02:31:40 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com; dkim=pass (1024-bit key;
 unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="dtlgtJ8W"; 
 dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 94B1A40FF4;
 Wed, 16 Dec 2020 02:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
 s=default; t=1608085894;
 bh=C7plXyNTcNy8WuC8fLs0exd5Rt4gpKds5Sn5a30FJGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dtlgtJ8WfPSw2wCyJqpaojXMFiWecXZrL6DcbAyMVsOSYy5p3zbIFBKUXgxEoXqdg
 3jN4YHxUptPg1ZgM+i7BFXV3zCg8eFbm3s1fWSMyntIv5zna7X7sbxckSLReJyDPUh
 gJMvDIU5j4ZPAJQ8o4wpW/cjcC3Q97RWtlKs3d48=
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] hw/mips/fuloong2e: Correct cpuclock env
Date: Wed, 16 Dec 2020 10:31:22 +0800
Message-Id: <20201216023123.92335-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
References: <20201216022513.89451-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [4.90 / 10.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 ARC_NA(0.00)[]; R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; R_SPF_SOFTFAIL(0.00)[~all];
 ML_SERVERS(-3.10)[213.133.102.83];
 DKIM_TRACE(0.00)[flygoat.com:+];
 DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
 MID_CONTAINS_FROM(1.00)[];
 DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
 RCVD_COUNT_TWO(0.00)[2];
 HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 9CA6740FF4
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

It should be 533080000.
See clock_set_hz.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 hw/mips/fuloong2e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 256c7867e4..af2d259dc4 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -159,7 +159,7 @@ static uint64_t load_kernel(CPUMIPSState *env)
     }
 
     /* Setup minimum environment variables */
-    prom_set(prom_buf, index++, "cpuclock=100000000");
+    prom_set(prom_buf, index++, "cpuclock=533080000");
     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
     prom_set(prom_buf, index++, NULL);
 
-- 
2.29.2


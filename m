Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F642D72F1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:38:14 +0100 (CET)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knesP-0004tM-PP
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knepj-00036L-PP
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:35:27 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:38685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knepi-00077a-59
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:35:27 -0500
Received: by mail-il1-x142.google.com with SMTP id v3so8210230ilo.5
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 01:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5Fm5DWWfR+EKTZiagvwEBbxnaS08HRfns0Shk/F/B+U=;
 b=V46WrMa9LyGlv8m4XEEvwob/9W7VhZ+skrO2XGDVQrMKU1ixWdorwXnWr/szYVxANN
 Oqr44GcZzj8wIZpuGf5LcGhSvcl45EPuBA9EK4mQiQhf0HomnIP8FTcZnQn6MHfitu4P
 33k3+EY4sUnwDB19yedAPnLLiFhohzn76q7ACDSYiVG7garIuCJMi+eWeJuY17huTxFr
 PzaeztSY18+MJbAHFM+2uJiRjFY1Md345+et3BrZ3MnsPF7qs4lJdsPsPMeTRtm/0Yqo
 0izXj5/tv2u7x1GgKFFeIFbQSnMu52ubmqPFGmNTti6lAqNjG90AGStGJrGBxQ0H2Cv0
 JQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5Fm5DWWfR+EKTZiagvwEBbxnaS08HRfns0Shk/F/B+U=;
 b=gr6YRSP9SSVwjXyc1dQ1y8NYFTZ/0VMM+7tdGQnWwJa7drCEh1OOVzKxpGCr5I9mVw
 OMW4+yr4NqEz5CIWJDr4y6FegdqLof9dBymqhz1zpGS1WAuhR9oii7l8SQ2nV0tdnuZ2
 gGmOJI6S04HXJ7o6BjlJZzuTbqOoy7hphJ2XQysrKeEVJDO0HfOFWUTTG1KwGjxl+Pc1
 dNhvdD/k18hKN/2oI8d4YIxEsi+ROrEx++VsLHUMqUrV8897LEOLcx1Y038QSirSsJog
 nsTYJt0ue+acICDoRauqS6rK5lAJ2naU9Xbzvd+kv8W3DnCrVvuH1v/10ccS/qRLkuVD
 D8iw==
X-Gm-Message-State: AOAM533R/yDVt4Prb/onEvAP/ZJXRo21tv2cGHG6P6dlIw7+zTqsQfoF
 twkz4i94i9dBWHbcoy1T6FaiCCPAg7I=
X-Google-Smtp-Source: ABdhPJxYRSg94JovljgKMdy5n0685HG38+Jnc5Ft6ZHvGt+WUBtQHt+DIfwCjpWO1GbAqXQJ+LDlPA==
X-Received: by 2002:a92:9816:: with SMTP id l22mr15444083ili.243.1607679325091; 
 Fri, 11 Dec 2020 01:35:25 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id g1sm4065362ioh.39.2020.12.11.01.35.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Dec 2020 01:35:24 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] net: checksum: Add IP header checksum calculation
Date: Fri, 11 Dec 2020 17:35:11 +0800
Message-Id: <1607679312-51325-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
References: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x142.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Yabing Liu <yabing.liu@windriver.com>,
 Jason Wang <jasowang@redhat.com>, Guishan Qin <guishan.qin@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guishan Qin <guishan.qin@windriver.com>

At present net_checksum_calculate() only calculates TCP/UDP checksum
in an IP packet, but assumes the IP header checksum to be provided
by the software, e.g.: Linux kernel always calculates the IP header
checksum. However this might not always be the case, e.g.: for an IP
checksum offload enabled stack like VxWorks, the IP header checksum
can be zero.

This adds the checksum calculation of the IP header.

Signed-off-by: Guishan Qin <guishan.qin@windriver.com>
Signed-off-by: Yabing Liu <yabing.liu@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 net/checksum.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/checksum.c b/net/checksum.c
index 5cb8b2c..dabd290 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -61,6 +61,7 @@ void net_checksum_calculate(uint8_t *data, int length)
 {
     int mac_hdr_len, ip_len;
     struct ip_header *ip;
+    uint16_t csum;
 
     /*
      * Note: We cannot assume "data" is aligned, so the all code uses
@@ -106,6 +107,11 @@ void net_checksum_calculate(uint8_t *data, int length)
         return; /* not IPv4 */
     }
 
+    /* Calculate IP checksum */
+    stw_he_p(&ip->ip_sum, 0);
+    csum = net_raw_checksum((uint8_t *)ip, IP_HDR_GET_LEN(ip));
+    stw_be_p(&ip->ip_sum, csum);
+
     if (IP4_IS_FRAGMENT(ip)) {
         return; /* a fragmented IP packet */
     }
@@ -122,7 +128,6 @@ void net_checksum_calculate(uint8_t *data, int length)
     switch (ip->ip_p) {
     case IP_PROTO_TCP:
     {
-        uint16_t csum;
         tcp_header *tcp = (tcp_header *)(ip + 1);
 
         if (ip_len < sizeof(tcp_header)) {
@@ -143,7 +148,6 @@ void net_checksum_calculate(uint8_t *data, int length)
     }
     case IP_PROTO_UDP:
     {
-        uint16_t csum;
         udp_header *udp = (udp_header *)(ip + 1);
 
         if (ip_len < sizeof(udp_header)) {
-- 
2.7.4



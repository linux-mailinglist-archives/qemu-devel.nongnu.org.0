Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285EA2D0041
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Dec 2020 03:18:18 +0100 (CET)
Received: from localhost ([::1]:54094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kljcu-0001Wj-LF
	for lists+qemu-devel@lfdr.de; Sat, 05 Dec 2020 21:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1klja8-00009K-M8
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 21:15:26 -0500
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:46827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1klja2-0004RN-Ar
 for qemu-devel@nongnu.org; Sat, 05 Dec 2020 21:15:24 -0500
Received: by mail-qk1-x742.google.com with SMTP id b144so9364883qkc.13
 for <qemu-devel@nongnu.org>; Sat, 05 Dec 2020 18:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=88/g7x9jWgiFvWvysHBHT2ly75bddWfAdJU3sD69n0k=;
 b=YhV2mC8T5z54WDwC2w35XFe0RLa6IOUGK6voppIUMZPfRQC1ZdjLBqRBojyAIYgMtA
 l7g3zkZMOT8xagCH6cylwUITIybPNTM3PVdPVnOnvlU1K2lNxgZQgEh1U2+Qp0Pls2G9
 GVObkbbFnZ7ykUnfRTlY/2+PHcU0ybc5oc6YeHuUaTajkm878EAU29yxqzNZPdSeSPOO
 RYL0I+gteyXulJAIeJq3nUQSchRJIZc2qcOvp8tnx/K01ffa9qxMLGze4kSi0Ss0zd4o
 UlC/2+ZZgiiqkPUGCOhSL2SftGJww9s2CiZ4eA+VaCgJm94+HVINY/oZUJZBMxJXfhzt
 JBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=88/g7x9jWgiFvWvysHBHT2ly75bddWfAdJU3sD69n0k=;
 b=R/+SiXvmoajIwYMDRpBdiqBxMzt4/pn2rKN6tDqkfiPiW78KPmuiV4ICinAvm5Pp8P
 UYmkiRsQQIx6ySNXJKAn3P8hmRf7ZaJMzBgfYe56Nb/8r3bxSsa0n2kYIi7ZKPCReTOz
 394ZxhgGGO1C4Pmtj7R6GsEJPpHPF+QZpTYhJxANxV+dQ3rm0y8JBnViyL1OHRnlXimG
 mL1G/gkZ3A6sQa+l+1kAFVp9uqfb5D9Exzrit70v8whIzv3/zc6Nfe5cpafqK2UfLsmQ
 SYfdr5UhHSzeldSyENytU3WwkXiIS5hzh54vR8lqqvvIvCCpe/EGUaNQGfoNlkVoKHIA
 xNNw==
X-Gm-Message-State: AOAM530/z3B3fcpYQtuZ1A9UlQBzyKRZ4HWhJgBs8KE0wRZ+TTP8Klek
 +bOYaGC/aZTP2A18dz4y3ew87NrEQmY=
X-Google-Smtp-Source: ABdhPJwEabpIk/HH2VuY6NVnee8puE5hjdJwq33XegPOfYUc2VxC2bNQ2LQlU0BeVo4uQiaijN33GQ==
X-Received: by 2002:a37:afc2:: with SMTP id
 y185mr17656589qke.149.1607220917403; 
 Sat, 05 Dec 2020 18:15:17 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id g18sm9296306qtv.79.2020.12.05.18.15.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 05 Dec 2020 18:15:16 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] net: checksum: Add IP header checksum calculation
Date: Sun,  6 Dec 2020 10:14:06 +0800
Message-Id: <1607220847-24096-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
References: <1607220847-24096-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x742.google.com
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
checksum offload enabled stack like VxWorks, the IP header chcksum
can be zero.

This adds the checksum calculation of the IP header.

Signed-off-by: Guishan Qin <guishan.qin@windriver.com>
Signed-off-by: Yabing Liu <yabing.liu@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

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



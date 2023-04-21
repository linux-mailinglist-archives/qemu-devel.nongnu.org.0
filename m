Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECBD6EAA34
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:21:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppl6-0006TW-4B; Fri, 21 Apr 2023 08:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lwp@luwenpengdeMacBook-Air.local>)
 id 1ppmGc-0002ZB-Nl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:37:18 -0400
Received: from [192.254.94.111] (helo=luwenpengdeMacBook-Air.local)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lwp@luwenpengdeMacBook-Air.local>)
 id 1ppmGa-0001HH-6o
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:37:18 -0400
Received: by luwenpengdeMacBook-Air.local (Postfix, from userid 501)
 id DB6342C1DB4; Fri, 21 Apr 2023 16:21:07 +0800 (CST)
From: luwenpeng <lwp_1994@163.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com,
	luwenpeng <lwp_1994@163.com>
Subject: [PATCH] tools/ebpf: Fix IPv4 fragmentation identify
Date: Fri, 21 Apr 2023 16:20:28 +0800
Message-Id: <20230421082028.53579-1-lwp_1994@163.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 192.254.94.111 (failed)
Received-SPF: none client-ip=192.254.94.111;
 envelope-from=lwp@luwenpengdeMacBook-Air.local;
 helo=luwenpengdeMacBook-Air.local
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 21 Apr 2023 08:20:54 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The meaning of the bit flag in ip.frag_off is Don`t fragmented
When judging IPv4 is_fragmented according to ip.frag_off,
should use !(bpf_ntohs(ip.frag_off) & 0x4000) instead of !!ip.frag_off

Signed-off-by: WenPeng Lu <lwp_1994@163.com>
---
 tools/ebpf/rss.bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ebpf/rss.bpf.c b/tools/ebpf/rss.bpf.c
index 20f227e2ac..e77b764f3d 100644
--- a/tools/ebpf/rss.bpf.c
+++ b/tools/ebpf/rss.bpf.c
@@ -317,7 +317,7 @@ static inline int parse_packet(struct __sk_buff *skb,
 
         info->in_src = ip.saddr;
         info->in_dst = ip.daddr;
-        info->is_fragmented = !!ip.frag_off;
+        info->is_fragmented = !(bpf_ntohs(ip.frag_off) & 0x4000);
 
         l4_protocol = ip.protocol;
         l4_offset = ip.ihl * 4;
-- 
2.30.1 (Apple Git-130)



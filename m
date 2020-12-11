Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4B2D72EF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 10:37:06 +0100 (CET)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knerJ-00041V-DH
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 04:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kneph-000359-3Z
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:35:25 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1knepf-00073w-CZ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 04:35:24 -0500
Received: by mail-il1-x143.google.com with SMTP id u12so8143011ilv.3
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 01:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tnIxINGCJnzOTcqgyovptQF3WZR1zXr6uWcE6iX+KJQ=;
 b=GSHA/K9AXDZRcwkqhPJyAAsEu56isrO+rFNhT2ZEd4qD7iXPteAMNDqiCok8HvfIO0
 WcvOgHKWSKLcv3Xp67l9iaywSWt3Y5y2jsbbkX39hYuGcbkxxvHiGC6YuvsbLiopAIlV
 Tm6uRSTma3rA4yGkK/C1i5xQeS5nuYKb/NRoTmgY8Uzl0rpdkOU2ieFTmlG4UREyNflw
 YNQF9UhOdYqzUO6ilK6k0raoZ3jraFPuve7CCfx2gF94nREuG3R+EMh8O+fmHxtpl/fp
 rbNTPLgV07bobdomSAgNdLXx+W4VSee3Ygr2N352WaDfKxyGelfu4UI18py4aai69gy6
 hPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tnIxINGCJnzOTcqgyovptQF3WZR1zXr6uWcE6iX+KJQ=;
 b=RSKyu+Fz3SfoKQO9OLzWy6u+Ucfy6ArLgB1LT2YIRNt2+yZBtM4LYQA1UwWVYf1png
 Ki8KojL4LLBJklAUEUVlK4ANhAmuQ5Yijv1mFEoO7xcjkktsD3n+FeA15RkLW/dYQJaA
 hEzAvfHUmG6v6RrW5bR+4Q1yxqqs/J/MtV0uRG/Gs48nQmM+VTPROO4RelmqlDuPocH2
 y1brp0Kku0v+1qFHnj5zgN4sm1YgQ3NDbK3zXkEoToMPOnfz0fCM9UJ2BYpyHu/R/4TG
 QAGSwoTYnuqGpsmers8zHOKiJiT7NySaTYtiB2DJhYwojZ/QIedRXoaLW1PueukektqN
 G7KQ==
X-Gm-Message-State: AOAM530/YDpfnF2jYhus3x7Vpl0LHq02bJRb/kcuan9iX5m9rVphdKw/
 LaepUB7EnkUraEytK/jHpPfY2W8luUs=
X-Google-Smtp-Source: ABdhPJyUjVIeQfdR9lRX7QN2D284b6oBtFJ/sNqlKAqd8qVr9eZgG+d9nmZKb+cMZQNeHP2lShrFxA==
X-Received: by 2002:a92:9a42:: with SMTP id t63mr14885835ili.176.1607679322053; 
 Fri, 11 Dec 2020 01:35:22 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id g1sm4065362ioh.39.2020.12.11.01.35.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Dec 2020 01:35:21 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] net: checksum: Skip fragmented IP packets
Date: Fri, 11 Dec 2020 17:35:10 +0800
Message-Id: <1607679312-51325-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x143.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Carlstedt <markus.carlstedt@windriver.com>

To calculate the TCP/UDP checksum we need the whole datagram. Unless
the hardware has some logic to collect all fragments before sending
the whole datagram first, it can only be done by the network stack,
which is normally the case for the NICs we have seen so far.

Skip these fragmented IP packets to avoid checksum corruption.

Signed-off-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 net/checksum.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/checksum.c b/net/checksum.c
index aaa4000..5cb8b2c 100644
--- a/net/checksum.c
+++ b/net/checksum.c
@@ -106,6 +106,10 @@ void net_checksum_calculate(uint8_t *data, int length)
         return; /* not IPv4 */
     }
 
+    if (IP4_IS_FRAGMENT(ip)) {
+        return; /* a fragmented IP packet */
+    }
+
     ip_len = lduw_be_p(&ip->ip_len);
 
     /* Last, check that we have enough data for the all IP frame */
-- 
2.7.4



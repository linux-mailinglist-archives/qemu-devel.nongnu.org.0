Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1043C2FD64A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:02:47 +0100 (CET)
Received: from localhost ([::1]:46500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2GsY-0006xb-27
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:02:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Gmz-0002yp-2Y
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:57:01 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Gmx-0000fw-Ke
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 11:57:00 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ox12so10194759ejb.2
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 08:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h4hxPtm+rYGCJfdoCRFYgTDwGjhhDMc4oSBmziWfU30=;
 b=ZMNibWy7AGoB+TFF8jRFKauE8sYG0LiM4av4aKv0T0/zURoTcR3/7lgVauhI4Bwvg8
 G536cpXtSz9H+eLzNLHC15q+Lym4GWWk8hHtJ3BoAslwSJsDmNhjrouKQajjEclmIBfU
 lnx8Fs/pDF1HXnfP1whdadGeCXmUhO+Xe8gqUTWGb5U68pPlGsR5sYfYZBJ3VJy6GM3r
 J47WE8XYyUmRyRzq5MGI2iScEi3NHj/bot0bE4hglyFnLvaThs7ad8Vid3NlA74VdtYp
 RAeddstF37EJP3UUgRPT+kLE72A7pvRRD74JQVcsj17ZjzJGWzxoXzUgR2wfa3LEu8av
 7zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=h4hxPtm+rYGCJfdoCRFYgTDwGjhhDMc4oSBmziWfU30=;
 b=ZL+xg03OfWW01DhMV9qg61pIsvkywpPDu0T5F4G1c3QuUT6WaCnjpexaYoWSxFN5Al
 2H5ahf8ZEL7TaFbFlo9eSpOCPMADebuLYnfBQ9gEMZB1y+VejefHbx4Sbxxfchoem8/O
 VDAEj30DEjE5y9Y0kKvmJmZ5lWwIJsQB8Oxeysi1EwPG+XROnOffkR7Wlr9Azg6/nDHm
 u5RWC4ulfMN8VWi3ByEmYhCjLo5gDf7hybQq9RVIknzjrOMsHV3m5eZISW+YylKFGEcR
 bVDYisa90gxqV5pzpbiqlkOr5jX/ebWmXprgRDWaD7RGt/+ULPMPS4g9ivBlMJmhHzzZ
 jwyg==
X-Gm-Message-State: AOAM531KMhG3lJZM0XEHSIV/HqEfxePKQ14w8VoI/uGSaYacmBk5ZxLr
 /3bhepu2nELoT+3ruakkojKoET6qAfU=
X-Google-Smtp-Source: ABdhPJzTIDXwGBxdSunVNMDuYv71RFRYVsXE2jinoWBwHPrVeWA9bSjf3VgkZcLFzjbFRMUSFR+/zQ==
X-Received: by 2002:a17:906:4985:: with SMTP id
 p5mr6808866eju.513.1611161817574; 
 Wed, 20 Jan 2021 08:56:57 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m5sm1128756eja.11.2021.01.20.08.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 08:56:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] linux-user: add missing IPv6 get/setsockopt option
Date: Wed, 20 Jan 2021 17:56:55 +0100
Message-Id: <20210120165655.1201363-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

IPV6_ADDR_PREFERENCES (RFC5014: Source address selection) was not supported.

Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20201218193213.3566856-4-scw@google.com>
[PMD: Add missing <linux/in6.h> include for IPV6_ADDR_PREFERENCES]
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d182890ff04..8c9618b9ea1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -51,12 +51,14 @@
 #include <sys/sysinfo.h>
 #include <sys/signalfd.h>
 //#include <sys/user.h>
+#include <netinet/in.h>
 #include <netinet/ip.h>
 #include <netinet/tcp.h>
 #include <linux/wireless.h>
 #include <linux/icmp.h>
 #include <linux/icmpv6.h>
 #include <linux/if_tun.h>
+#include <linux/in6.h>
 #include <linux/errqueue.h>
 #include <linux/random.h>
 #ifdef CONFIG_TIMERFD
@@ -2270,6 +2272,7 @@ static abi_long do_setsockopt(int sockfd, int level, int optname,
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
@@ -2923,6 +2926,7 @@ get_timeout:
         case IPV6_RECVDSTOPTS:
         case IPV6_2292DSTOPTS:
         case IPV6_TCLASS:
+        case IPV6_ADDR_PREFERENCES:
 #ifdef IPV6_RECVPATHMTU
         case IPV6_RECVPATHMTU:
 #endif
-- 
2.26.2



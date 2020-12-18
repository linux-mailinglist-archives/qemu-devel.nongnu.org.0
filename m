Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8BC2DEB6C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 23:09:41 +0100 (CET)
Received: from localhost ([::1]:44426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNwR-0003p1-S4
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 17:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmW-0002Fw-1h
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:20 -0500
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:43117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmL-00039L-FL
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:19 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits)) (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2BE9A7D5ED
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:55:07 +0000 (UTC)
 (envelope-from imp@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org
 [IPv6:2610:1c1:1:6074::16:84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4CyLj70WQYz3hBV;
 Fri, 18 Dec 2020 20:55:07 +0000 (UTC) (envelope-from imp@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bb/F9Ea4b0CvodFIdBceU7QoqC3If5T57HfLRiPeMI8=;
 b=M43GerthNB+r1aun8bkj/LL+J8Jvo1Wre4F8/TBt8Xyfk8xuW/rrR6P857yI8IXUw66lDJ
 pa2gQZAKWt1y/sm3KnaKIMWh1C8OFivfVB2iVeMgePRWF+oVj4yRGuTqceAYgR8vRWTVYc
 PW05A8key3AfO0qeVr21HheQLZ3whGrACgaw1HTKw1+UdXcKWwDZPUizSLk+AqTTw6t+Zv
 stJs6BFvLd8dm4z6j+XY8HdjQr8Uaee3vyfNrv/qLoXeo6ImII2GhDaFvLKVkDO7x6d6NQ
 wn2cOZ5NPXvKbdwpYsDISGkoQLl74RgokeyJ3pCp+eAKhUzhrAFyxRJD6vhq4g==
Received: by freefall.freebsd.org (Postfix, from userid 547)
 id 008ADE6DB; Fri, 18 Dec 2020 20:55:06 +0000 (UTC)
From: imp@freebsd.org
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tcg: Additional Trap type for FreeBSD
Date: Fri, 18 Dec 2020 13:54:49 -0700
Message-Id: <20201218205451.10559-3-imp@freebsd.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201218205451.10559-1-imp@freebsd.org>
References: <20201218205451.10559-1-imp@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bb/F9Ea4b0CvodFIdBceU7QoqC3If5T57HfLRiPeMI8=;
 b=MxPYwOZQJo+AYN0/A2gHyQhTWl2GtLTSm3n5wHjJRfGzuonj9GY0UEr89UdldllQPovzvX
 pf0zoUtYxns7BhJWVvyNAX1UFRBp23NBONKQ3AXG/OPsWF/QtCUasihc78PFdpskxcU0Vg
 EmNho2NWYp3bgH7ambMEp4MdNNYGDqhkZCwbXRjd1CfytAEb50UyfMsJ+m/naICtMq/ecf
 GGud7BjcyM0fzEuD7CvZGtMXK/s28ygzB75PAXk5gaIc0JOnPMcfgpsbYWg0Ij7bjcBL8o
 qMNMm6Stgg6bjIe85skSX6runwekKAAbml25KwO2Os00JZvPvzznP6eoUFqCxQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1608324907; a=rsa-sha256; cv=none;
 b=Qv9mugcYbQ6LUlt55Yc64d7yjh3V1tNXOPJkf8Dep21cLJSZtPs4GAcc+R/vjqVUJobjml
 eNykVxZv5BkyuQsdEkxbEzwjSWSFvbA9lp2xhNDGWfuN9JdFskZoYFCXNm+kcdyKIekYSs
 YHQsx6luZkz7x7Op6S1PSs+bmpDlhyJz+Atv9h+FIqGw+y7ORzDhDONe/Ae+PikI4U6rXP
 X5f5ORxzrLZzvvMNQi/bLSsY3kjxqryYWWwExADfIIN72N/T8rONNusw2MsfJZzpV0k5jC
 QiL7JDvSIMu6wVgFSrDfSJGPBrJNHw4bc62MgSX9Yr/GKX+fFPpiN94di/B20Q==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=imp@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Dec 2020 16:50:11 -0500
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
Cc: Juergen Lock <nox@FreeBSD.org>, Sean Bruno <sbruno@freebsd.org>,
 Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sean Bruno <sbruno@freebsd.org>

FreeBSD can generate a trap 0xc as well as 0xe when writing to a
read-only page.

Signed-off-by: Juergen Lock <nox@FreeBSD.org>
[imp rewored commit message for clarity]
Signed-off-by: Warner Losh <imp@FreeBSD.org>
---
 accel/tcg/user-exec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 4ebe25461a..1f5befa9f9 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -343,7 +343,13 @@ int cpu_signal_handler(int host_signum, void *pinfo,
 
     pc = PC_sig(uc);
     return handle_cpu_signal(pc, info,
-                             TRAP_sig(uc) == 0xe ? (ERROR_sig(uc) >> 1) & 1 : 0,
+#if defined(__FreeBSD__) || defined(__DragonFly__)
+                             (TRAP_sig(uc) == 0xe ||
+                              TRAP_sig(uc) == 0xc) ?
+#else
+                             TRAP_sig(uc) == 0xe ?
+#endif
+                             (ERROR_sig(uc) >> 1) & 1 : 0,
                              &MASK_sig(uc));
 }
 
-- 
2.22.1



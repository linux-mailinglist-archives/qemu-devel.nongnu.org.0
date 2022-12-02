Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D45640C4C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 18:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p19xz-0001Tn-D2; Fri, 02 Dec 2022 12:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1p17ia-0003ea-H5
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:12:49 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1p17iU-0007gs-Ri
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 10:12:48 -0500
Received: by mail-ed1-x536.google.com with SMTP id v8so6895230edi.3
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 07:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spootnik-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:signed-off-by:mime-version:message-id
 :date:subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEcV1S+3XFUKJZ401D1suSh68lRfqO7/ZmcFhdifkPM=;
 b=Ee8Q1vEuubi5bLhMeo3ZZSzN/xJJRlT4zjh8boTvrbEaRDYGeJyEaORKB5LUapKXvA
 OzADJfzUFIROXqe8b5aQGbfbNcim0zPQzVlqL3tc0m41n0NqNSicKGb6J3Z2UPTfeWCj
 JUIWUPX3s15oYh8XYkpzifj2xyFjkg4edwjLMw36WFA19Zfkh38hYY2lpHVX7zUi5sKh
 5tQiJ9NcTizvJtqCYslMwPATn5T5qIIgfjq6rCyQBw6co5Z6IBwAr93y9BaHdzNda0Pb
 QS2os9uOrU0VK7zPpMbFzrPV/nNCk6h89GDwz5oSNT6fKQTwsSI4/7rWZ8/gk9dd6wOl
 H8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:signed-off-by:mime-version:message-id
 :date:subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yEcV1S+3XFUKJZ401D1suSh68lRfqO7/ZmcFhdifkPM=;
 b=ttt/dwQ8rcbHertHi3MTrYfcxyiDdLXeCaGkcB8gmQd7jKJcq4ULDVOh8uPmN5d1dS
 E3ta5vQRn3+9NcwGjTA6bGraY9+1MEYcwnhiJuIEk02yvFwkxmVriqM3ceVT/ELi9Pgd
 q/Soz4sMM0SS4/G/PWrmmXp1AoGc/0IxEkBALbTim7X2CHQDS9f5WxrJfkNTH3FK20Ih
 RVAu5pCv8JtZyNCzH213rKSvC1DCtlHaPPgVjnbaQ6tHVB135Na693Fi9+cmZe8J35vQ
 EZEv014TzwlC+XI5C/eRmdle/+ds8pZkLegCCi7VauYWG8uuOUoaOFFiNEjMVLl9WLot
 NBug==
X-Gm-Message-State: ANoB5pld0NTgT7aspHMDNKbVjtOdTAR+eScTdYmrrNxxss8ixna1q1cn
 7Fu/DEy/DuMfTXVDzDo+wFUeKw==
X-Google-Smtp-Source: AA0mqf7PtSIxJ27O8F6vLzxQCZm/lhhCAFewIG8rihMq9VcTVdbJDanmPw5KtxocUoDNjNGhOu55BQ==
X-Received: by 2002:aa7:cd99:0:b0:462:719:3372 with SMTP id
 x25-20020aa7cd99000000b0046207193372mr64954923edv.361.1669993960417; 
 Fri, 02 Dec 2022 07:12:40 -0800 (PST)
Received: from phoenix.spootnik.org (77-57-210-107.dclient.hispeed.ch.
 [77.57.210.107]) by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cfd2000000b0046b00a9eeb5sm2997152edy.49.2022.12.02.07.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 07:12:39 -0800 (PST)
From: Pierre-Yves Ritschard <pyr@spootnik.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Cc: Pierre-Yves Ritschard <pyr@spootnik.org>
Subject: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
Date: Fri,  2 Dec 2022 16:12:04 +0100
Message-Id: <20221202151202.24851-1-pyr@spootnik.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Signed-off-by: Pierre-Yves Ritschard <pyr@spootnik.org>
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::536;
 envelope-from=pyr@spootnik.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 02 Dec 2022 12:36:48 -0500
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

Hi,

The provided patch allows the VNC websocket server of a qemu process to
be provided over AF_UNIX as it is already possible for standard TCP VNC
servers.

Now that many clients support websocket connections, some exclusively,
it can be useful to expose the VNC server. One such case is when a
proxy is present on a host machine, allowing it to proxy to a
deterministic location withouth having to keep track of port mappings.

Removing the condition as is done in the provided patch creates a 
functional server. If there's a downside to this approach I could not
figure it out while reading the code. My hunch was that the condition
was there for a reason, but it did not jump at me.

Cheers,
  - pyr

---
 ui/vnc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git ui/vnc.c ui/vnc.c
index 88f55cbf3c..b01a655400 100644
--- ui/vnc.c
+++ ui/vnc.c
@@ -3729,11 +3729,6 @@ static int vnc_display_get_address(const char *addrstr,
         addr->type = SOCKET_ADDRESS_TYPE_UNIX;
         addr->u.q_unix.path = g_strdup(addrstr + 5);
 
-        if (websocket) {
-            error_setg(errp, "UNIX sockets not supported with websock");
-            goto cleanup;
-        }
-
         if (to) {
             error_setg(errp, "Port range not support with UNIX socket");
             goto cleanup;
-- 
2.38.1



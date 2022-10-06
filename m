Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA205F6B48
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:13:32 +0200 (CEST)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTV4-0004Hh-ON
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf5-0003yr-1Z
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSf1-0005yn-P4
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id z20so1980855plb.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=ZhwhknIGiG/U++w+Picxj+KnZGanlKXHbjEv5zgh8B0Ewn9NlLBgJRRGIdX4Dn+4bT
 NEuP/1meI63j9s4oXiRU54ILDT+XB5yHE8K0GBBUN4c5ZmR0S8OrcM+5wg0keBlkMveN
 3Q9e8NXap44GUVxevilE1AxTsGJvs76w4IGtpXElYEYSbu5xjeyGsiEC6csEdAILNPoh
 WV2mcv97WCDPpEsmVLkK+nrthzFVWT0ZOWC7HrKfw0CG/B99r2t0iqzcRqohtXcG8rZG
 AHu6LdbY0BxgHXJbjSxpFH+2PgzHES18dJCu3fxJ2M/yRdQ5fAwId5XpWfmTk3FqamHq
 HBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=vzAfQRAifYcPjkiRYUl/jaiMZWpynd1ZRP4odjZbgkgRooBh9zqTxcw9lhqC40od+l
 YslEauuVVEsX+ilSeVGkR/zqsLIewCkj+q9d3+HppzWLYnSiyAx0l5ltPTX3u+gq/eYm
 UaS/N8XCVAMJ3q4FpTtWGbJ0iKR7y1fPSx9lrMQP8WyMgclrRJMfN34OSKv4Vx+nHA/u
 +tI8/vH7krUSi32+0pxfqyg2NHosijd8U7C7Yh/2/hVqOOqoyyqTh61xtvOz+/i0PCnB
 8+zZxW0aRKBn5rin+aRQ6bsmzrdFeXyjkaLCg4fFpsYH4E6srnM2oZ0K168E7/0bgB+u
 FZRw==
X-Gm-Message-State: ACrzQf01v7kGQh4SXa+h7qhLdsrPgioxm6xUg73tB8CSudr1EINgczKj
 uOvp7ac5FvpnddB2EG8/P1+KK0sP6R0=
X-Google-Smtp-Source: AMsMyM4t1WBkaRwZ2pnxrjL3vOeBziQVxpXDmA0vWW+SFvDtZRAnZPukDXQCO7M5+CXqZD0WqGOMLQ==
X-Received: by 2002:a17:903:509:b0:179:ffcf:d275 with SMTP id
 jn9-20020a170903050900b00179ffcfd275mr8754plb.150.1665069582169; 
 Thu, 06 Oct 2022 08:19:42 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v5 03/18] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Thu,  6 Oct 2022 23:19:12 +0800
Message-Id: <20221006151927.2079583-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1



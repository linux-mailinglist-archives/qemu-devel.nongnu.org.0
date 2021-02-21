Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC6320BD7
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 17:53:54 +0100 (CET)
Received: from localhost ([::1]:51442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDrzV-0007cL-C4
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 11:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDryI-0006po-Bd; Sun, 21 Feb 2021 11:52:38 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zpmarvel@gmail.com>)
 id 1lDryF-0006PV-Dy; Sun, 21 Feb 2021 11:52:38 -0500
Received: by mail-il1-x12e.google.com with SMTP id z18so8818968ile.9;
 Sun, 21 Feb 2021 08:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SROigO0Ul3kd1x/yf62ULzF4JTtHRTd7tuWSt0ApTHk=;
 b=tn+79vPh+mnSEisFZuu56Jjh8o+pR6QMuPIvetoklk6MYwkLEsAcKKovpOV2QnuALQ
 XqGb1oXaku52LHk3TVRyR/J8DZ2lZI1dJrnriTklui3zgEeQg1OnBqZtH2Tv7GwNo2Me
 IhITZn1sm7zOID0jq27dyPLb9ELb/9Ajr4oGi1ch/WT0DI9VGUeSV03Yp6HILOoagcZx
 ShRVMKvhaJlZhcDlx9bfvgCAp0lFjTlxNhCzsYQjp5Txko9PfGexSloE4aaHLumzPWuw
 7yLGpFsFoSFRLUXnl5Qoe/0ruzszNqDdvDOD0fNvh4NI0IjL28k8S0wXi/mJS2Dk1eAh
 K1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SROigO0Ul3kd1x/yf62ULzF4JTtHRTd7tuWSt0ApTHk=;
 b=pjVeVxkOMVtPZohDivTQLnTbQHKxAa+kG/M7nxXFT+c4mF63tZYz0nSIouPm29TnZz
 oqJrY86sHNm1n19gtrWN1M9TxoJnEBLBk69+7xopBttpkrkAcuxjglcDDNjH3rjG9KA6
 oXUEuW/iPgIml+5UCA2IpZENuyftD6BPG++sFElOymuINspuJ7+coGx7fVs2peS0vyZy
 ulhmMByRIdZGGPoWNhEGKSr/tMtelijSaHbFGUYQeMfSerhuA7ImUEq3ErQoWPoR1oiR
 C1MtVM8k7m8QPY6xd9povaop3Qouotmsfq8X7+cqYYGIkBcCJaX0lBWo86aQxFPrcx6R
 NFvA==
X-Gm-Message-State: AOAM533cGOoV9IEMZPZ1/LKfWOPzIWgNynMr36yd/6537sn5cfbNkq9o
 NSxXZpb+8224MXTKeWjJrjQ=
X-Google-Smtp-Source: ABdhPJxobH5kA4AJXd+QXQg4B+8s61ESmlpqB2diZ5V9Dpcwi5lTUQ2TpfOq4NbKrs5+vX7fEPNiMQ==
X-Received: by 2002:a05:6e02:1a6e:: with SMTP id
 w14mr11634844ilv.3.1613926350318; 
 Sun, 21 Feb 2021 08:52:30 -0800 (PST)
Received: from gastly (c-67-177-215-41.hsd1.co.comcast.net. [67.177.215.41])
 by smtp.gmail.com with ESMTPSA id f11sm10191990ilc.69.2021.02.21.08.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 08:52:29 -0800 (PST)
Received: from zack by gastly with local (Exim 4.92)
 (envelope-from <zpmarvel@gmail.com>)
 id 1lDry9-0003KH-Bn; Sun, 21 Feb 2021 09:52:29 -0700
From: Zack Marvel <zpmarvel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: vte: fix sending multiple characeters
Date: Sun, 21 Feb 2021 09:52:19 -0700
Message-Id: <20210221165219.12744-1-zpmarvel@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=zpmarvel@gmail.com; helo=mail-il1-x12e.google.com
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
Cc: qemu-trivial@nongnu.org, Zack Marvel <zpmarvel@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using the GTK UI with libvte, multicharacter keystrokes are not
sent correctly (such as arrow keys). gd_vc_in should check the
CharBackend's can_receive instead of assuming multiple characters can be
received. This is not an issue for e.g. the SDL UI because
qemu_chr_be_write is called with len=1 for each character (SDL sends
more than once keystroke).

Buglink: https://bugs.launchpad.net/qemu/+bug/1407808

Signed-off-by: Zack Marvel <zpmarvel@gmail.com>
---
 ui/gtk.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 79dc240120..0311d7d64b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1786,7 +1786,16 @@ static gboolean gd_vc_in(VteTerminal *terminal, gchar *text, guint size,
         }
     }
 
-    qemu_chr_be_write(vc->vte.chr, (uint8_t  *)text, (unsigned int)size);
+    int remaining = size;
+    uint8_t* p = (uint8_t*)text;
+    while (remaining > 0) {
+        int can_write = qemu_chr_be_can_write(vc->vte.chr);
+        int written = MIN(remaining, can_write);
+        qemu_chr_be_write(vc->vte.chr, p, written);
+
+        remaining -= written;
+        p += written;
+    }
     return TRUE;
 }
 
-- 
2.20.1



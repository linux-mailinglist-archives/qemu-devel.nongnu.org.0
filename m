Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860E2B2394
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 19:22:25 +0100 (CET)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kddiK-0001VA-AD
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 13:22:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amphetamachine@gmail.com>)
 id 1kdbgr-0001X4-VV
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:12:46 -0500
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:41013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <amphetamachine@gmail.com>)
 id 1kdbgq-0006UJ-8T
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 11:12:45 -0500
Received: by mail-il1-x143.google.com with SMTP id h6so5301338ilj.8
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCE1j1GHo/AW4ZMXJUfXmmPng+mlb1LXwlnAFMFdo8k=;
 b=SaxuXX5Ti4AvFOlqF070Q7li59o/aTUEt1BvbgRV8FNtMzL/aU3NkIk5W18iQHqiLV
 pdEvZ575BwNLrOIL/2HEPeH66SB39A6HqiLKUZe1NQ/PlFfQdx+cUQH6+SbqOgSxW56i
 smpaPtqipSH4w6Gpyk+t7j137nyXNHaavDoZuZkKnSbfHlQk8F34WNzN1dxkKBGL4a4J
 opVjAwb68owtr1D0Gg19G6avBtOCBEommRccIvV4JYMHvm06UP/1PeZahZGO5CPPlPoa
 iHlO4kJ43/DXFZ588eljgLSbPHA4nJ1NjKbd5dGbkJvYsIE0A6AzIa4dn0CwByyfQ0BZ
 qM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qCE1j1GHo/AW4ZMXJUfXmmPng+mlb1LXwlnAFMFdo8k=;
 b=jao8lg0Gry4WYstlDRI8PyH7967shv9YAiMwVfPpHMZFX1ANqDdec0Wpd+ePYi/z5/
 e4n+8xmIouxM11XhMku5q3LRFsbUdcdTqs9DMLcKmMQDDl9Olj0AfaCQO0aQC8hzmt8R
 l6cqnaRU+GC0zDYXPpxFR3vqERh7T9/vv4SXhnRJBZUfTVfyipYQrpgktd9czAfHbfgN
 pM7+C5BUBFlhnaL9iJdKA8HeuYC/Xj11UJMwE7A7/76pQFSWlPzVEci0ZSxbgMsSfm3v
 KLbYLY8ACkDqmwrb8nR/p2F2cuwXz270xmGPdHbY26KwhFtzuQwESTOGSlmnhEsBq7xH
 Y1Rg==
X-Gm-Message-State: AOAM532epZ0UvRPxO4vKEz3/OZ1fG9h7Q4urrbwugo/IG5fdnURIl2IP
 Luu3vSiveewZ2XdbHoZoWIOFnoiiZvs=
X-Google-Smtp-Source: ABdhPJxIpoix0IZWfV1iZUId4byrmAmgHLYERm4JjoXy7diV2FcCGWil5JSAZAgA9XEfiMsrfqsNsA==
X-Received: by 2002:a92:6e0a:: with SMTP id j10mr423782ilc.272.1605283957083; 
 Fri, 13 Nov 2020 08:12:37 -0800 (PST)
Received: from necronomicon.slackware (c-68-47-17-248.hsd1.mn.comcast.net.
 [68.47.17.248])
 by smtp.gmail.com with ESMTPSA id 10sm4830463ill.75.2020.11.13.08.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 08:12:36 -0800 (PST)
From: Dan Church <amphetamachine@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Force-remove temp dir
Date: Fri, 13 Nov 2020 10:11:46 -0600
Message-Id: <20201113161146.24088-1-amphetamachine@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::143;
 envelope-from=amphetamachine@gmail.com; helo=mail-il1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 13 Nov 2020 13:20:05 -0500
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
Cc: Dan Church <amphetamachine@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sometimes the compiler will leave a write-protected .o file in the temp
directory, and GNU rm will ask before deleting it unless -f is
specified.

Signed-off-by: Dan Church <amphetamachine@gmail.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 4cef321d9d..663b91a334 100755
--- a/configure
+++ b/configure
@@ -7080,4 +7080,4 @@ done
 echo ' "$@"' >>config.status
 chmod +x config.status
 
-rm -r "$TMPDIR1"
+rm -rf "$TMPDIR1"
-- 
2.29.2



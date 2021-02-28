Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F13273AC
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:45:13 +0100 (CET)
Received: from localhost ([::1]:57942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGQ7z-000780-WD
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGQ5t-0006Q5-1c; Sun, 28 Feb 2021 12:43:01 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:39290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGQ5n-0003dj-5S; Sun, 28 Feb 2021 12:43:00 -0500
Received: by mail-oi1-x22e.google.com with SMTP id z126so15678669oiz.6;
 Sun, 28 Feb 2021 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xx3N5y7JG2qOh4yXzByki8P97nwo4NHi+PzHZAl9Mjk=;
 b=Brzq+QG9Ui8dhZuRgFdAXDkzGtXynsTqKPwJXhtjcnt9eLuVts9cNKdqoJVYOUYaF9
 183+4xEQdUDzK7xLU2sOR968Sm4CM1oS5dCbbpTM8uZ/BPSiNSsFL6ooKyaYZ8WGzP8Y
 CwP1Ze6Rb1SN2MLw9V7LSoG31wHf8YzOJ3PQ/NtJBhTWoZZTVdEmGZwlRWqM78VpLjmS
 fu5g1gFXlOr0TjzZXcW1/tNg0ooGQHtvzy1GwaliF6T37h0nGEWwiangWI/nRGzCnze0
 wfRU6IbRkRft5b3B3YyGUOElAR7VSLoEQx+APp8YIvdTMN6OE4GFuEVCnTOeftbB3+jR
 1GnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xx3N5y7JG2qOh4yXzByki8P97nwo4NHi+PzHZAl9Mjk=;
 b=ETTlGPgeqd93KQJClbmNdBLjRtnWtET7QO6IZ+6sJnwpdZxm+IQrrFZcdHR/mkzZdq
 n8s++ls2OQSy+W853UiCzjxwlep5X4/5cIIEEtt7D6xhZcc1nqWaXECrmVYHYQ1sP06y
 iCPVuub3at0jJqWiN/KcPOJjmoZOmiuTw4bKRDyhwyYA5/ZQ87T/AR+vr4kgn2qdiw55
 aEDLIZ6s4N+ehMHXwUvHIahNQYnnNWckWkU0ajePIaOX4+1J9I5zQGjXvGkA8rXDrsIw
 RABI+oZRld0KZCV0txl+SddVGXTE6ZfP2ytR3mQTvwROgHDe/TitcK78mX/DIh6KSW01
 y/Ww==
X-Gm-Message-State: AOAM532r4a6TgAy/UpA14btUOr+/HbpMh89jYXlPytOarY9pF15yPF7O
 fl3AaIa0ferCMyYMEujNlKtQkYHu89bPkw==
X-Google-Smtp-Source: ABdhPJyCpPQoQq5p/h4lvqHH8qPAHnliu7iOFvuaRf3w9OhP4dksRuLT6mMj7VrJ9P12ESZjRuul7A==
X-Received: by 2002:a17:90a:65c4:: with SMTP id
 i4mr12812856pjs.132.1614528672486; 
 Sun, 28 Feb 2021 08:11:12 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:12 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 2/8] hw/block/nvme: fix namespaces array to 1-based
Date: Mon,  1 Mar 2021 01:10:54 +0900
Message-Id: <20210228161100.54015-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-oi1-x22e.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

subsys->namespaces array used to be sized to NVME_SUBSYS_MAX_NAMESPACES.
But subsys->namespaces are being accessed with 1-based namespace id
which means the very first array entry will always be empty(NULL).

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 890d118117dc..574774390c4c 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -24,7 +24,7 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
     /* Allocated namespaces for this subsystem */
-    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
+    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES + 1];
 } NvmeSubsystem;
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-- 
2.25.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FD5F6AD9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:40:58 +0200 (CEST)
Received: from localhost ([::1]:57102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSzY-0007Sh-6W
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:40:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSY1-0003gO-CR
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:31 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXz-0004dD-QQ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:29 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 v10-20020a17090a634a00b00205e48cf845so4598239pjs.4
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=DHx779G3S85pf5a8Ust8Zyz34MSSTB3Q8SpXdN/VEjCZqeB+yHPRKX+Rj4elVQIxoG
 OWU1nWiNJDLXJ/cgUb3enKnd2K3HoIMUxan0zAzEmugXPvGey/Gwc0K2RsyNaJzWHXUY
 HMdYmij8Mi8GidT68vGjUe+Xf/VOnFhNcELiL+KxSBvSVv338S/w4jrWEEFk1LBMsdeG
 aw7WWdoJZeC4Ehc+bdUqgtACAKFnDv3cm+C4NO717qW+0biARg3QGciqykeO1Xv4tkSv
 xWgyriVM+oiY7jo71Wz4xsbqAUxWRSHzX6jGdgpasDUnZa5xhmt6hmAex+UJ76s8acx+
 T9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=7Q7TsN6Zz7dIg8Cdncq3+0AHpLLuk657t7rESmoH5KVjwaLige4ETjbE39TPaaoZKg
 uIDCEy2OmKINuDMzM5NGymt535wgS5g5lrnuS+xDcl77vNO/ov8iY5OiermYNZlWSi3v
 6OvgoU2SmwJHukcdvKtSMuGDzOwD4lPjF+WCvGsTC7qAYGz3qGu0fBQMyKGrcLrWooTD
 2KMFuQf0+4RErNzavTSimC8hLp1FLvYKxGCHAXPF5xYRjLcvDMjqxtHGhRB57dNLQiMy
 qyM8m/guT9ZbUwpu3tgy8ZUFhTXieOPixTCJzF3itrmdurItoinFl+iSzV/WARN2yCgC
 w6Hw==
X-Gm-Message-State: ACrzQf2t8zj3uvVbCV1pHZrthESr7E4ULYaglF4YSTLJ6pL7aKc8xSya
 n3tDkd6s2+DxdfwRfDKq0UIbkLdPvsY=
X-Google-Smtp-Source: AMsMyM5F3E7TReYXhBylrX09pIoyAiiA9WEu0XzzOGhuKDb3K/mQZCTuhPj7Li+UzxmljRp5exuF/w==
X-Received: by 2002:a17:90b:38d1:b0:200:8178:1c94 with SMTP id
 nn17-20020a17090b38d100b0020081781c94mr11207237pjb.219.1665069146237; 
 Thu, 06 Oct 2022 08:12:26 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:25 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 15/18] io/channel-watch: Drop the unnecessary cast
Date: Thu,  6 Oct 2022 23:11:32 +0800
Message-Id: <20221006151135.2078908-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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

There is no need to do a type cast on ssource->socket as it is
already declared as a SOCKET.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- new patch: "io/channel-watch: Drop the unnecessary cast"

 io/channel-watch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 89f3c8a88a..43d38494f7 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -130,13 +130,13 @@ qio_channel_socket_source_check(GSource *source)
     FD_ZERO(&wfds);
     FD_ZERO(&xfds);
     if (ssource->condition & G_IO_IN) {
-        FD_SET((SOCKET)ssource->socket, &rfds);
+        FD_SET(ssource->socket, &rfds);
     }
     if (ssource->condition & G_IO_OUT) {
-        FD_SET((SOCKET)ssource->socket, &wfds);
+        FD_SET(ssource->socket, &wfds);
     }
     if (ssource->condition & G_IO_PRI) {
-        FD_SET((SOCKET)ssource->socket, &xfds);
+        FD_SET(ssource->socket, &xfds);
     }
     ssource->revents = 0;
     if (select(0, &rfds, &wfds, &xfds, &tv0) == 0) {
-- 
2.34.1



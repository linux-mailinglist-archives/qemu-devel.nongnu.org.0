Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089C5BE69D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:03:57 +0200 (CEST)
Received: from localhost ([::1]:50354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacuq-0003Cf-2e
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZV-0001RG-Fn
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:47 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZT-00051V-9U
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:44 -0400
Received: by mail-pl1-x62e.google.com with SMTP id d24so1923894pls.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=UPIr/jdQcVynaJFJUgSyu3ZQ6HyOdiYQ9iafROMaepc=;
 b=OWstQa3zPBq62FQVUaJMU8X9JyMhbgKdTNYm/OLp/o/vsRaCoBqPy9Gy2i8yjwejV1
 4TBmRBORkg2+Wok1IlkodVRJohBHcQ8SteLAvHkVFv0mlaOTe7ESAiE9A600fVRg74uL
 DB59JS3VuJt1mgipuDme94qOtwA9YBvYxNgKNSquuJ1oonFY/rSj+w63PuK3UdMPVoti
 gMvTMHpLugtFtLIPZHWMkpGCRH48jX11AdXghTNNEl40jWV97HIj3gpSFBhotM1G2eo9
 WR0tpbpXehVc0iGVdu/+6HwNwj8NNjFEqtbOd2vNy34DkN//9Q3+b9kkYdq1MMKxbk9a
 IZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UPIr/jdQcVynaJFJUgSyu3ZQ6HyOdiYQ9iafROMaepc=;
 b=wtLaL5tmimWkjip/6aRBlBNc+FbRvfV52pRT1sXz8iXMLfNIgigEL6CgIGO08n+ysz
 SMJMIyx0hNLu8TOS/DyIhK4BgZD9Lmg31uBhXy9xQkx7GdqvM33qBp64gI+t19ZonW1n
 Flb6FNblkvc7eoblukn6zSq0hqjEVjHQIjxEoQ5+pQ0MdSyer3P9nuemUSTf+GsaFnAG
 RRqdlaGi3nBHcQjQ/ZkK3RZgiDwTLoPF0upOx1ZpIP49TC6Xdq07mBOl4FtLv9yjXeEh
 sZX2IyDNPt37g9VDj8N7Yjq/sEvXRGjBgQZGYGOuf0/kqOy3Wy9xemM6omcTs/bA0Gig
 2Vjg==
X-Gm-Message-State: ACrzQf1ux5vXlFnhKIDCI8MTciwxHV356g5xrpPaD/29Swy+gek3Qu/l
 lkXoyU6KE2k/7Y3AgAu+dFxN3vMAyPM=
X-Google-Smtp-Source: AMsMyM4CxzegpuGvFycylOR6YBVEuCyIinpt0iGLb7YyYkUu7XzUYvz6P8SGPK2ds7Nin+atRp2kuQ==
X-Received: by 2002:a17:902:aa83:b0:178:9818:dff with SMTP id
 d3-20020a170902aa8300b0017898180dffmr4145837plr.1.1663670021968; 
 Tue, 20 Sep 2022 03:33:41 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 33/39] io/channel-watch: Drop the unnecessary cast
Date: Tue, 20 Sep 2022 18:31:53 +0800
Message-Id: <20220920103159.1865256-34-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62e.google.com
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
---

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



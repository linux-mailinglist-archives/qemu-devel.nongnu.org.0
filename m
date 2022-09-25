Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2860F5E9310
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:26:01 +0200 (CEST)
Received: from localhost ([::1]:57410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQhs-0008M1-9D
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsL-0003ge-Bv
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:45 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsJ-0006Ui-Px
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:45 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t190so4209835pgd.9
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=b+5s+002U58pVE0pOMSxgvC9taWDLxYNrFddYJprsoSrXGDEQbm2kylGP2KxgfmAJk
 YNLYNxFMBkasehtM68neierp2/4mSfo3J4jyKSCD7/py3jTG8/mqTg+SIeZjF5+ZNlkF
 qpVy50qMWD9BRuzScpFKgSCxWlnvGqeK5/iy1NaQ9cAO9+yfpNnrizoRA0yJPxNNIH2g
 8qyHTCSf6vMkz9ite7C8P8VbAAmzKm4nCcOdZ/zEHcykO5Y9UeftFAiEAqg6OsL+/53f
 R7gdcpz7ULlX0UllKHj/sJ4SappMD5V/jbOWkZ5GcGvApERWYqWqlQ8bud+Rfk+vJ5IC
 DG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=0rAiHsm3rtfXyFQUQAgu4VMn9MdHruRpB5vZpG33NRcbHIuCw7xnscj9R0rusvaAbG
 crFw67haYKmaAF1bHOjwoDjrEAhOwkEZ83FqNuZ9XQt3ksDRk8wsn3m3VvBKcDsDVIf9
 ktv8+gzDAt1EJ49g2UvjR+1uoOJCMAU3/O8KY4ENof+2trMb+HRL4d5jDvVP9gsi8X3J
 Gbo23Bh9SFPe+mX4NxRYXrPcysCcWDStAs5p48NINY8lMooQSsVO3DwyqOrYq7syIXR9
 9ECcdExxy7AybHGjigMQgU3NkTWrGRSfeexyq/tS/++JepYRrc2bYQKLwrIK/bjRXPex
 BOZQ==
X-Gm-Message-State: ACrzQf3cQawab3MkBTvb/mwzrfWfpiR9bnMWCJHhVSFYagM0CEaBte9F
 i22Vr4QqC3RCiQZM48xgmFZk91Jir8I=
X-Google-Smtp-Source: AMsMyM6aEakLRqZMjYGekwKl0kxNwbRlAw9gmeHOSRqlXpCldfBIapn0HKbNW2CviAV8CjXYEYzsZQ==
X-Received: by 2002:a63:87c8:0:b0:43a:c2e4:efcc with SMTP id
 i191-20020a6387c8000000b0043ac2e4efccmr15738344pge.410.1664105562289; 
 Sun, 25 Sep 2022 04:32:42 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:42 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 47/54] io/channel-watch: Drop a superfluous '#ifdef WIN32'
Date: Sun, 25 Sep 2022 19:30:25 +0800
Message-Id: <20220925113032.1949844-48-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
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

In the win32 version qio_channel_create_socket_watch() body there is
no need to do a '#ifdef WIN32'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 io/channel-watch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 0289b3647c..89f3c8a88a 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -285,11 +285,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-#ifdef WIN32
     WSAEventSelect(socket, ioc->event,
                    FD_READ | FD_ACCEPT | FD_CLOSE |
                    FD_CONNECT | FD_WRITE | FD_OOB);
-#endif
 
     source = g_source_new(&qio_channel_socket_source_funcs,
                           sizeof(QIOChannelSocketSource));
-- 
2.34.1



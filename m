Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314275F6BE6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:37:39 +0200 (CEST)
Received: from localhost ([::1]:43872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTsQ-0005FG-97
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfa-0004XK-O3
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:21 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfY-0006E3-MS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:17 -0400
Received: by mail-pf1-x432.google.com with SMTP id y136so2351291pfb.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=Zqjk/nphJPYClpAauW9PZi7lPE2xcLmKmrKgOj9i2xbnBlnod0tLmu38Vx6J1LZ5vd
 2e+KEpLMGyCMLDDTkqjNSxBUo6FmsBX3c9cwBegnJpGmxXWjiROw0grV5++kkQJXbv54
 XDzew7dFbhqYu9hXSGGEBiAZqv/Buh7gwsn/YN5WpzMIqiXRqBYWnjSWnevak9H4dy8N
 a8ulqXKdm9bbywc7kZfZ6Y3Cr9+DkgvhMfn+RPe7k/Tg2Jtg0GlNwCkDhckjUNYVW7Qf
 /CUUVoNd7bAaSYenO/QaLHzCRYOPy5n9VHsk20MJuuBjRGRYl3pFA3pnaKBzDOTlhPjN
 WGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=N97CLYl0K5NxLglop/J2oayCNnxTCmOW1ZK6PejmHdP6wlosqgBaI+/Lv8ZoXR96XY
 KVniUt8pzbXZtmGhTYPwElNFf8aO4p1JJgDvd7uwN4hcpg1rN9q6ttYck7Dl+pxYhpeo
 LAKf8qlZMQZobS6c2x/WuQNA3j9Q5N1I/LB4+lqADfr0hPRtMpt7Dik6/vcT77H/oulm
 RCTPxWROOPgBqrO576xvZKWa6csGorz7yQqHVC6Arhjy9IXW2j4AoQYzyw1tsuLINSb/
 tCwTM1JK9w6gav5SjnEV6PMRYlkBIuytLWiBjKkm6C9SbsinUOPBmZ+uUWyfEpRyT5lX
 GTJQ==
X-Gm-Message-State: ACrzQf38YZRE5cYFNd5tdTMzWfl1qJzRgDc0AeQ9pdZvPfWPICimuXte
 Qwbc6mij2oBz2J3W9kbk14SXD0+q60o=
X-Google-Smtp-Source: AMsMyM4Ecs2u/rG+40QKzlQjiaa9eXr/a2sa6QjdkAbR2XQ/KokpJwWzuEwJiA9f3ynDvwA+rH9AKg==
X-Received: by 2002:a05:6a00:23ca:b0:557:a75c:b430 with SMTP id
 g10-20020a056a0023ca00b00557a75cb430mr37674pfc.16.1665069613292; 
 Thu, 06 Oct 2022 08:20:13 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:12 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v5 14/18] io/channel-watch: Drop a superfluous '#ifdef WIN32'
Date: Thu,  6 Oct 2022 23:19:23 +0800
Message-Id: <20221006151927.2079583-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x432.google.com
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



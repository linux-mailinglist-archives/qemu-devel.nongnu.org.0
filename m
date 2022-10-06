Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22145F6AB9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:35:36 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSuN-0003Mt-0z
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXz-0003gD-6a
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:27 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXx-0004ZE-Db
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:26 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so2047492pjk.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=Rna0mLkdKWhgCJ/ONS7qgZETjRrCNSF0mes0fnT3xScgmTvdcsaWZKimDyemjd/XZm
 VVjK0YAtUXXdqg9Zbhfyt28k2+Jnr1U0L3kbtgxzBGOprCE1tn6cQoJ7Jfb/P6juvF1e
 Kura/+LoPsBOYJhvacPp2ezEE3T/OMZkCZLY9nSMSZqdJgNIDLQCc49jUBlThOAvDs3m
 Ovg3UhdteuopH/8lPINOtRvZkoxG9ue6Pad1QvkjYg6ttgVxR7eOjwJjUDjW2bdj3iWp
 3YJoFeG+wDIZjuhPVHoFV9aIgn2bX4qFtbhD6LECm9A6CJJ2F+dOv5BKHtZbXNBQ4ai1
 Embg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=WZ/KtYq0qCtvyCswak39oViJM0nMQFnsB6YHwZDvyPHyoag8/R1sRoBhEcq10MLWt+
 sSaRDFAsrYtCfyZXVdm+gfqbSfeW583XLEX7URB2fjNvVpVkYTyxKTYAkdxlx5AjtRum
 PanNd/6StFKVxJmlSbx+RPkqqgwzSrkGPDsj1qkCOemFc4N96SXEKYuz0My6YqXb4NbU
 SXu/o8UvfMYmov0BCbq9CWL0mTIHkUsk7PD/0HeOC9OKDIt0MOE/4P6GLgeGgJK1cuub
 GkK5aRpM/1lLnUp0QkF/sd3AX543cLxsuH6io7WrEGG9m5sASlaOSi0kiHzqf2WOhADs
 qA2Q==
X-Gm-Message-State: ACrzQf16K/EzYElVSzX/AbXffkgx2kQyB2ubY/lvfGyVDZe/cy2QWVaz
 pRaaGtEf6OXmujOgWEL7+WRb3+T2eXA=
X-Google-Smtp-Source: AMsMyM5pH0SKJ9BQvbGqcZ7pdz46nmFYY0yZsgSgVi04VaBCJyIRP3c/p+5AH3T2R202+oueYq2ahA==
X-Received: by 2002:a17:90b:3b47:b0:202:d9d4:23f7 with SMTP id
 ot7-20020a17090b3b4700b00202d9d423f7mr11030675pjb.56.1665069144081; 
 Thu, 06 Oct 2022 08:12:24 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:23 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 14/18] io/channel-watch: Drop a superfluous '#ifdef WIN32'
Date: Thu,  6 Oct 2022 23:11:31 +0800
Message-Id: <20221006151135.2078908-15-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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



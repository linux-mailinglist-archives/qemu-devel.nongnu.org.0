Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F75BE72E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:34:57 +0200 (CEST)
Received: from localhost ([::1]:33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadOq-0004Cj-Fx
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZV-0001RH-G0
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:48 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZR-00051N-MY
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so10313227pja.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=GRBlej2hJQEo6TVMxvrEPHNQLJL+YFENFMB3tcerc5lTZ2kDXMTwgACAP5TPmQz9tv
 OmKnkUKhgCn0p80DU+e0GMxI+ZQ5YuqiaC8W0FglsSNBn7w43TYBwRwZEubnLLbolzUS
 I0rf5qz1+wdd2hM1mW3uMWM8XyQ3CTjBqRkn8EpGYQrAKAIpCIbZbfhBkjKQHEkf6lYR
 kVZVWAU52mXGHmtLTUZnKCFaFiKc+0ryn1n+SdZLMa316eJBVckVEoFcTjmOZ6A9l0wr
 96LCVCt4FIXRKfjA9Sm1jbCscBsfosnIAdnnj7tqDFjlrQXUve/XOWbpO7dYYQO2B4kH
 mG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=oeExa+Ufc4UN0LZ/7z5/q/Qr/UXSN3cznOhdDtqx4Xm4fkn4yDPevQCLZyKAqYNn4Z
 nhhxdi65WUbvzCQinJaRH83FjMeN36qeu76v7dMwNYsQMLM0UTVG2OFA1RivwetnL5kL
 b5JyqQhGIj/BWX7I8uH/qv4+SmloZcluOAEI8ewdr7eeFvF2WqNyvC1OwoKKgUYqMMlU
 mgS103CFW4ZhKDND5NGWa/hVYhfZXh2VQjT84vHTN6i38gTKrO3xWEPiXiA+W8navWo9
 OLgOHhaUN+tvTYlhM1lkIxoZmFUG/1PJO14/tTfHbWEt+HK0VwScPsEKq/F5BLj49avh
 P0iQ==
X-Gm-Message-State: ACrzQf33ZcKXRbtpvUql9Rqpi1mWmblEH7DOLicTfnYjJVMSlKQfwdlW
 l1q4gQ7JMenrOr7GzkNT2PMWYi2drYY=
X-Google-Smtp-Source: AMsMyM5LGDwMNTpgZQ7ONMdOHVuCrA8nrn/NDpVItHFKLXBLnQP2MO4aBFamAwMihETzo0uNZGplxA==
X-Received: by 2002:a17:902:f782:b0:173:1206:cee0 with SMTP id
 q2-20020a170902f78200b001731206cee0mr4156957pln.130.1663670019901; 
 Tue, 20 Sep 2022 03:33:39 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:39 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 32/39] io/channel-watch: Drop a superfluous '#ifdef WIN32'
Date: Tue, 20 Sep 2022 18:31:52 +0800
Message-Id: <20220920103159.1865256-33-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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



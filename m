Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8CB5BE761
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:42:36 +0200 (CEST)
Received: from localhost ([::1]:33562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadWF-0002dW-FC
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZX-0001RN-2I
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:48 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZV-00051h-Er
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:46 -0400
Received: by mail-pf1-x433.google.com with SMTP id y136so2347521pfb.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=br4BW6okOefvORkIs0aIO+nDgCNzk1px8msHqMm8mwlp3kJsAcsDb2DyF9a5lq5O0Y
 4p4wdZZXz9wP1UCa5neRdf08g7jwwWKx+LUL0bC50Dv2QAAR2P8Ajlk1Q6BIucOok0Rc
 dhDnCauNfVNM1duHTDm6G+Ryc9nXNJHhVkUpG9sWig9Y41jJ39Ii00QDgV5kQAxAgTaR
 vb2ughF06xNCw3lk4FKhGiUNGb+t86MSb0uLnufq4sa+1L2tbWBmYCj++d9dqBPg2wGZ
 mMjfkNxoHkPSw5KU8ukpeUGEFRtJidQq4ge0f9amNkZqN8TjaVvbC6gxrVniKOBtnqp9
 R3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=cILZKK5IiSJ/ZliKqGorMq4BF+mbOV6LwBF73S3EZQH7dU1Bc8nKf8ikDLEMhtVY9f
 e6hi0ZUugRWLvGgx3oKm8DvQLmxPgfkMvNPKtRuGlpTowOwsqyKUGTdm+HqzlbLwWf3e
 LVm6I/vxbpDHeBpgseoIvCVjUe0bi3vxyPaCHaAFzWwtUJO+egxE9ZAzaa5dILVsH+7A
 jRCkm0fEy2if0LV8FnbyxIXImOpH4AD9o256Qpppei5ZJgRW1HEWqZxXrDdxoeFTTZ9F
 yQLbGDpRCgd5bt5DxnWwHV5ov2gB/EgHSYnv7QD4Ql+XUZAOEkDvJUz0Y/Yr2wX81zgz
 Inxw==
X-Gm-Message-State: ACrzQf0WNXPq7qLNYDV0NmM8bHta7d1FrmYfU9tQZHSsaSJ7NV8lw1aJ
 VAyyxTHnKwG9aBmNupr2xFbYl5MYOR4=
X-Google-Smtp-Source: AMsMyM5M1TMFwFfiuHQrlrpeLoHsKz0RLBRueVCvKT1jTgg8qwa6WHMngssaTKRbZ2H3FBqvu8BIqw==
X-Received: by 2002:a65:464b:0:b0:42c:b0:9643 with SMTP id
 k11-20020a65464b000000b0042c00b09643mr20221531pgr.232.1663670023781; 
 Tue, 20 Sep 2022 03:33:43 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 34/39] io/channel-watch: Fix socket watch on Windows
Date: Tue, 20 Sep 2022 18:31:54 +0800
Message-Id: <20220920103159.1865256-35-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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

Random failure was observed when running qtests on Windows due to
"Broken pipe" detected by qmp_fd_receive(). What happened is that
the qtest executable sends testing data over a socket to the QEMU
under test but no response is received. The errno of the recv()
call from the qtest executable indicates ETIMEOUT, due to the qmp
chardev's tcp_chr_read() is never called to receive testing data
hence no response is sent to the other side.

tcp_chr_read() is registered as the callback of the socket watch
GSource. The reason of the callback not being called by glib, is
that the source check fails to indicate the source is ready. There
are two socket watch sources created to monitor the same socket
event object from the char-socket backend in update_ioc_handlers().
During the source check phase, qio_channel_socket_source_check()
calls WSAEnumNetworkEvents() to discover occurrences of network
events for the indicated socket, clear internal network event records,
and reset the event object. Testing shows that if we don't reset the
event object by not passing the event handle to WSAEnumNetworkEvents()
the symptom goes away and qtest runs very stably.

It seems we don't need to call WSAEnumNetworkEvents() at all, as we
don't parse the result of WSANETWORKEVENTS returned from this API.
We use select() to poll the socket status. Fix this instability by
dropping the WSAEnumNetworkEvents() call.

Some side notes:

During the testing, I removed the following codes in update_ioc_handlers():

  remove_hup_source(s);
  s->hup_source = qio_channel_create_watch(s->ioc, G_IO_HUP);
  g_source_set_callback(s->hup_source, (GSourceFunc)tcp_chr_hup,
                        chr, NULL);
  g_source_attach(s->hup_source, chr->gcontext);

and such change also makes the symptom go away.

And if I moved the above codes to the beginning, before the call to
io_add_watch_poll(), the symptom also goes away.

It seems two sources watching on the same socket event object is
the key that leads to the instability. The order of adding a source
watch seems to also play a role but I can't explain why.
Hopefully a Windows and glib expert could explain this behavior.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

(no changes since v1)

 io/channel-watch.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 43d38494f7..ad7c568a84 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -115,17 +115,13 @@ static gboolean
 qio_channel_socket_source_check(GSource *source)
 {
     static struct timeval tv0;
-
     QIOChannelSocketSource *ssource = (QIOChannelSocketSource *)source;
-    WSANETWORKEVENTS ev;
     fd_set rfds, wfds, xfds;
 
     if (!ssource->condition) {
         return 0;
     }
 
-    WSAEnumNetworkEvents(ssource->socket, ssource->ioc->event, &ev);
-
     FD_ZERO(&rfds);
     FD_ZERO(&wfds);
     FD_ZERO(&xfds);
-- 
2.34.1



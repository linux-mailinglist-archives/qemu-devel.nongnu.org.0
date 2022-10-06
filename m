Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C55F6BB6
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:26:49 +0200 (CEST)
Received: from localhost ([::1]:33258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogThw-0001gA-VF
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfn-0004ak-AX
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:36 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfg-0006EX-Jm
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:31 -0400
Received: by mail-pf1-x435.google.com with SMTP id 204so2315089pfx.10
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=dPAIlMgKwepgRTty/NDEoITtl0JLP7tXGdz52h4rcoo2V8w27NMAMVla/eESrJF9bX
 F1GjM1/ud6p45O7Vyhu8lp5AbDz8LUKfD1Hp7YrZ3AdkOv0xS2C6XFvSmIzQQ4AD3DUB
 Kv8PVdYE2GM7fQQp2xKtx54LF05NRJSbkjZUh/18qib4Ziede/vT2cHpOaqrvWL+ctLM
 vZUbPJ7AbHqwhp0anLUH6iHKSyFDNWBEHJKs3ydDYqwIFBDMNazdkQzozC8vlTuBGk+o
 ozibjA1O13jz2ZY8Om2Vpgk366wIhEgc3oZDsartCBc0obuB+xdJAzcl0XfF4oWmKmpC
 GRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=IYXpFiN/daAZn6E91k7k9Z8p9naz4UBmnJjwZlBoeJQUCD65ae7I6THFJs3IuPOanx
 BG7mVUd9aTYMG9vZYCQaTbRKel/pP2nWQjnHg55dyPaLBe1zxevtEr1BGJCcuSlJ6sk7
 5xudt82U7BorBIIAaCVdAER3d2xMqh9WpWpKz3OZP9qzrs16qqreeOoVrwqQnKDGkZUd
 qxB/0onGFrVv+ZK3i8KsvVhQuBvs8pBFKyyzScNhLvZ4rMDfLxY4OqYiT6f7loKAb4Cz
 UF2SkiIwNjxfuStEPKTHYJxvgXHAbEKTqYYQA4R0f9VRt+BQYiQl9aNiwHxiExgBdzgx
 pBNg==
X-Gm-Message-State: ACrzQf2w+fXn+ExpV0sk0KccbtmkBoV2Ak5BjhJtSx9HA/rVpLGvHSdL
 W/YFptmym3Yr4594nVl+Kqu0k4kjzu0=
X-Google-Smtp-Source: AMsMyM69mSTPVYipH4koxmC8nn5BpHAoul++typ5SuBdVXify7duM1KeEthiontTR73r0KKSnRlRCg==
X-Received: by 2002:a63:f556:0:b0:44e:12bf:2dd8 with SMTP id
 e22-20020a63f556000000b0044e12bf2dd8mr360161pgk.400.1665069617726; 
 Thu, 06 Oct 2022 08:20:17 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:17 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v5 16/18] io/channel-watch: Fix socket watch on Windows
Date: Thu,  6 Oct 2022 23:19:25 +0800
Message-Id: <20221006151927.2079583-17-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x435.google.com
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



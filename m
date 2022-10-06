Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF75F6AFB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:47:00 +0200 (CEST)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogT5P-0005Jc-BR
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSY5-0003hr-V4
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSY3-0004dR-O7
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id 10so2049876pli.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=ptjH96eZLcOPZIa89aXnOna4fjBx+XdIXzRoKJYPVSb5+JOPAdfLboRINLsamvzI4w
 C6shwD/eEmKzJG6s4LgG4aHBvc10M/ClolM7Aaw5Rt1FA6aNnRlcttjwn0hbgZ+83xIb
 i62wPyGLdKMlII0V6mGRQFmgGa3Pf5Zr3/WgQBrmo6wGhqFBW/YGqxgITHZkwwxs7WjM
 sBUDrZvYtZh6biqGVtrWZECtq2WUxi0vKLmPyhtuGd49XC5AJfFuae8bZq7NBANZKdcT
 EpjTwJkch9h7QGE9FC+Fd7OzuI5Y9fEEDq6SczCJpf9D9fHnnO3imlUPUrgqXooc2MMp
 TjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=WrqtrYkjww6eEKJVNSq7UKPnnj+cMOXVlOL6eKrnbaOtVa4dxNyFzxUvMBI+zOgYIk
 Vvz3E+HH2A+0kRA2n3sCml0ldQbM3JAu2Qx6MtRCIFDogYzHqBAfGKNqKpwNaARfstHp
 CLhhbebpeQR+3Hf0cQWs8IfeVRzzzWJmUeZo4rFcXiHBR+utlY97u21zt6YfP5ky4XRt
 ChZLWagDnmfVCpOQ/SF8K429KuAPAlEG7thbSe8kNecb08nRx0hc7WeMmblRRXhuEYF0
 Gm95z++ZwB1HPTIas45kGsxBDie28qy6g4Fnhie4fB2YMu7icwfxH+H4EiUlQjpczEUT
 EZpQ==
X-Gm-Message-State: ACrzQf1ZHW+EhGb2KBKoxYgboxVN1IuJhevfYVtYDMAbG2J+uDv7w17m
 z4j793J18rmlkDZ7X8oB6dGbsaQ8tus=
X-Google-Smtp-Source: AMsMyM7QkylIpN/Rw0Sa9lka17lluY0zgdKUv1quQUllwRo8JObz309J9UrHTvdSutDcqygEh+9CKg==
X-Received: by 2002:a17:90b:1c88:b0:203:8400:13a9 with SMTP id
 oo8-20020a17090b1c8800b00203840013a9mr237936pjb.46.1665069148469; 
 Thu, 06 Oct 2022 08:12:28 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:28 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 16/18] io/channel-watch: Fix socket watch on Windows
Date: Thu,  6 Oct 2022 23:11:33 +0800
Message-Id: <20221006151135.2078908-17-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x631.google.com
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



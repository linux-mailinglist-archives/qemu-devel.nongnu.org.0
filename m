Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3885EC32B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:44:58 +0200 (CEST)
Received: from localhost ([::1]:33096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9xJ-0006WU-Uy
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SO-00042h-6b
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:59 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SM-0005L9-5M
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:55 -0400
Received: by mail-pg1-x533.google.com with SMTP id 78so9063448pgb.13
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=VnQl/uqDqGk2stio0h6KU0wZkAKEYr+iY/DCkbSwWcNsQ7ZPkdQt7tDd2RmIEotVw0
 NfBvbrBZvOVVTvp2cmlR4M6qcjBvPgi7jq4ZeeCwtCqteGslk4wI2ElWdV4gAu4CWnp2
 LIf0g9rGpqwLcDooG3rmpRG146lNnFLJMNZPyX4I+ShVJn8D6NsQG+MVsr3Cs55h9UZ/
 DhBE6sJS9UTpyF1jizMBHrD4473e0jIZ+mi9hUPY2Pt8Fl1bQAa/DyzXex86vE3FHMhS
 /pLsWnEXHE60EK0CqsRaOy1TYh1GoZ7TRgvjMkswBcdbScxhCApyW6JCvBkmQeeSRW+q
 5d/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=wTkWKXqJ+eZdykoVhe9WV6fZPZhj6w/z8Q7O6DtEfAEISsEmk0RLS1PFtosBMS2Cjy
 w+fjMhucaHGIhKi91ujMj1p9m5+OVc0SFBVD538+tnvuh88r+nWTP0GUBbb/QrQy7TWl
 tMd8b2NuTQX+OkRpHpEid+EjtH7izn6o2S+eb+1OD1qzNuo3DDufm1/S73jmC6VvbUjJ
 Z2uuhUmjGU6cy6Lcl/H4tQW59uxBzaj1t7PZlA4ZIimDky36kvURL4iwqbIayfJE3kJd
 wMQxI83s9qkMTyE7E/a6b4reMDIEu+hi/stlwHCogA82g1r+t+tq0Z+5Fu1GblNKhvDm
 synQ==
X-Gm-Message-State: ACrzQf0ImOcDGqCvEUE/fF3Kyc8taELbtOJVs9DTS0lucVIvLLyXwMwK
 SXG21aJVlZ8pmGKRgf2ERoVcgeH9Xcw=
X-Google-Smtp-Source: AMsMyM6fW0RZru0IWqTSjLFFkEbXQlzdc5XLCRVIpnz5d5dhg+gPcKo5L3pZl5sE9wdUZGZRllTjrA==
X-Received: by 2002:a05:6a02:20d:b0:430:3886:59e8 with SMTP id
 bh13-20020a056a02020d00b00430388659e8mr23948641pgb.516.1664276931560; 
 Tue, 27 Sep 2022 04:08:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:51 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 49/54] io/channel-watch: Fix socket watch on Windows
Date: Tue, 27 Sep 2022 19:06:27 +0800
Message-Id: <20220927110632.1973965-50-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x533.google.com
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



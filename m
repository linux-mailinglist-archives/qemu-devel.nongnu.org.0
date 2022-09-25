Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12D5E9304
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:17:52 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQZz-0005NV-IA
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsP-0003mD-2U
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:52 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsN-0006UY-7d
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:48 -0400
Received: by mail-pf1-x435.google.com with SMTP id v186so4155117pfv.11
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=paDsIp/geoV+flWTxrLf9AtfM0yW1S7bTrjVeZ9uuD35w4JdjQVk+IhqZRSbItKpwF
 gK1hoWerc1xk+oK43Z8CjY/8J8r+8fuzzqlkwlRG5A6FpJ3HHNqNua9Lk+h5IP31z+Pt
 pSstGCrHoVaZ0O6d2cXHEBT0HO2pIFPOHTP9e5K0px1LC/ZRNKqigeu0jTdxFVzyu4pA
 3Bx0YSdkupmsq1vW8qksQw807G+nZO6NdybAXkrRzNLJNs1ZrNG6PbDB09eTZBt9nev3
 /iqicJU2GiHmx+v+8ECslc/D95fMJUDg+MPNEd3s3ebO1uTjGAHKO5O1dHw6LxDwdpc8
 OpNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xIwwdkQ/UueIjTq9LmfxXmdWH0OF4K6cF8/Wmny7JFg=;
 b=nYL6Vgyg+9TalxidVmhOyx35DlCyCwlJ3kkW1afpVrY2D+KSgCmVWVbPeA1g2IYQbh
 1TwcCNZ9elv5MbIC4YpU+RobcJqLDzL3t8V4Dq8tcTRJKwgbpiwCkv+GF+Ww9i0mxbMr
 XsbbqAbE9dvP29AP7xJAQxcL/ION5gxv0BUu757VlDaXtusjV6aLp6Vf932Obga3SWsh
 x92MWAFIsWHfNc+IOJoa+wwzIA0d6vujvOKN4X92+f2o0pFW64iHhuStiuXlFtOocn2V
 cMM+O4u8aQo93P3nmE7LGzHfDGpwXw9jo/tIyQCCV19K8c2YQGiVpNDzZy+eNoHacgTB
 63AQ==
X-Gm-Message-State: ACrzQf0M/bRT0xVZ7FHEbrJTWd0vZziF+sO3Dat74XABXqrFPfoZLzYR
 Dhz0llKY+2QlcazZEwYeNUTOkd9O6Wg=
X-Google-Smtp-Source: AMsMyM51g7z7OQwizHuEZxcY19BSb3V1khL7ofAY5/lr5T+5NRb9dBRuoHgEhSVyQoZk7BpCId6QJw==
X-Received: by 2002:a62:2985:0:b0:544:77d4:f43b with SMTP id
 p127-20020a622985000000b0054477d4f43bmr18353833pfp.9.1664105566317; 
 Sun, 25 Sep 2022 04:32:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 49/54] io/channel-watch: Fix socket watch on Windows
Date: Sun, 25 Sep 2022 19:30:27 +0800
Message-Id: <20220925113032.1949844-50-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
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



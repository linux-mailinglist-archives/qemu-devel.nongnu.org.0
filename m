Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A70308DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:58:20 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5ZuN-0006cT-Ji
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:58:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5Zsu-0005mD-DD
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:56:48 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <iris@modwiz.com>) id 1l5Zss-000239-5l
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 14:56:48 -0500
Received: by mail-il1-x12f.google.com with SMTP id e7so9606370ile.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=modwiz-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ORev0UB3RYo7nWO+wO8u1IVfrwkAsTZ9zmT/DnkhgMg=;
 b=a4ujSBej61xovN9GlNEY/CTlAPiAzU1BYsfjPXV40CNYexxY3Ol5HH7xQpfxhfSM6+
 DC5nImpZ4PA4ydAg7OKipZhRiaNre24bSfzz6+0hl1iZoC9bzSQ2GTHLtbzeWaHi3G/D
 uFs57HmiWNeuxJAN0bxIQnkskGn/LG0B94rqn03MrnomAs614Dvy8PXDjbsblvLLetI1
 wkZvvgO73n+JOYRv6/cKSBJic4iWyaIzA6R21tejIfejo7dynDgSS7DueKqKlDcFHX/d
 BpOGhEzy4TddjZ20BPBQsQYPAwATj5rzMWfukGrOJjiJuggj/TUyyBc7S1XxKbcHZYuE
 HQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ORev0UB3RYo7nWO+wO8u1IVfrwkAsTZ9zmT/DnkhgMg=;
 b=cY43T9eKF25Uop8XSxaJFP12yzHyEdgR8WPPBeK2Up37MB3sb/0m4lVfZLMtaozAMA
 ERcIcVHEZHjmEX9HqSTRluDBM7rrcDEkcW57RQuFJLy8ew1OBP0R0N9BVEQEYPs9F6PG
 NZQcY/bLlR3/oDRYxs33DhmwLAKbzQzntVTHjNzDcZq3Mx+XFSAH0XdgMmg5QT3mJJX0
 fDQbWqDJ1O+vU/6YfKDXYzwTUNVNnBXFvvFwRIKx+Ax6VA25EAymyvWrk1/2Ps7cQDqk
 uG1xb+rOqgdmG936VQ+Z9a2+MEoclHb2Aq6u8+4HtUEm9AFptI3Rw2ujTui97fHmuSes
 8giQ==
X-Gm-Message-State: AOAM531B7qodSdj1F1aplTxJ12FiI4wyumg/MfhpuYaf7/zDj3XeAK/v
 4GwinU9ypVY5vhd1nTv8M2R8wA==
X-Google-Smtp-Source: ABdhPJwIemCxr9WDQVW8/rLJbj6OvDqbVcVewIGm9pKQIAJVXphBnJZfoQn/ns8UOlxxf5Fu7pIVjw==
X-Received: by 2002:a92:444e:: with SMTP id a14mr4522863ilm.129.1611950204059; 
 Fri, 29 Jan 2021 11:56:44 -0800 (PST)
Received: from localhost.localdomain (c-98-223-182-45.hsd1.il.comcast.net.
 [98.223.182.45])
 by smtp.gmail.com with ESMTPSA id r1sm4641108iot.8.2021.01.29.11.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:56:43 -0800 (PST)
From: Iris Johnson <iris@modwiz.com>
To: 
Subject: [PATCH] chardev/char-io: Fix polling by not removing polls when
 buffers are full
Date: Fri, 29 Jan 2021 19:56:31 +0000
Message-Id: <20210129195631.1577922-1-iris@modwiz.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=iris@modwiz.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Iris Johnson <iris@modwiz.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the chardev backend code will prepare for IO polling to occur
by potentially adding or removing a watch of the backing channel for the
chardev. The chardev poll is added if the fd_can_read() function reports
more than 0 byte of buffer space, if a poll handler is already setup and
the bufer is now empty, the poll handler is removed.

This causes a bug where the device buffer becomes ready, but the poll is
blocking on a sleep (potentially forever), because the buffer is small
and fills up immediately, while the backend channel has more data. This
leads to a stall condition or potentially a deadlock in the guest.

The guest is looping, waiting for data to be reported as ready to read,
the host sees that the buffer is ready for reading and adds the poll,
the poll returns since data is available and data is made available to
the guest. Before the guest code is able to retrieve the data and clear
the full buffer, the poll code runs again, sees that the buffer is now
full, and removes the poll. At this point only a timeout from another
polled source, or another source having it's poll complete will result
in the loop running again to see that the buffer is now ready and to
add the poll again.

We solve this issue by removing the logic that removes the poll, keeping
the existing logic to only create the poll once there's space for the
first read.

Buglink: https://bugs.launchpad.net/qemu/+bug/1913341
Signed-off-by: Iris Johnson <iris@modwiz.com>
---
 chardev/char-io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/chardev/char-io.c b/chardev/char-io.c
index 8ced184160..fa9e222f78 100644
--- a/chardev/char-io.c
+++ b/chardev/char-io.c
@@ -50,16 +50,14 @@ static gboolean io_watch_poll_prepare(GSource *source,
         return FALSE;
     }
 
-    if (now_active) {
+    if (now_active && !was_active) {
         iwp->src = qio_channel_create_watch(
             iwp->ioc, G_IO_IN | G_IO_ERR | G_IO_HUP | G_IO_NVAL);
         g_source_set_callback(iwp->src, iwp->fd_read, iwp->opaque, NULL);
         g_source_add_child_source(source, iwp->src);
         g_source_unref(iwp->src);
-    } else {
-        g_source_remove_child_source(source, iwp->src);
-        iwp->src = NULL;
     }
+
     return FALSE;
 }
 
-- 
2.25.1



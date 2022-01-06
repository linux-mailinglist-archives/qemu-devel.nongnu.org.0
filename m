Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB648657D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:46:55 +0100 (CET)
Received: from localhost ([::1]:39510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T6U-0006zO-73
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:46:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdk-0004Xc-BI
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdg-0000qm-P8
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NmSRsYDHdSt3mPPWE/VBrC0tl4EEty9M7O4eh0ePIo=;
 b=gKBUJ+kz5md0KXfsw1vuagsDe5ey2724ADDA4vVJDLN2BnFT6X3jaae2NOhuZCxzcN11PI
 ft/dEKeejbTFY+rEcf0F4qMyFvjbMjZQwgO1y3WmKfXZZbq9On187zYR4qbFJ7shKQYEb+
 eX3XCbwns5TN1Aq7ouuJVbppRpJz9GE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-WFlGkHywMzGBkNN1lvBMtQ-1; Thu, 06 Jan 2022 08:17:02 -0500
X-MC-Unique: WFlGkHywMzGBkNN1lvBMtQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so180429wmq.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5NmSRsYDHdSt3mPPWE/VBrC0tl4EEty9M7O4eh0ePIo=;
 b=GZYd1XoKgtifrmgXzUhR4OXvc2pJO02S/m1vrlxbQrrcoTi4JlpkY5lunTYt+74rE1
 QTYCpKQOq3g9blB1Hlm7CjjhRlt6YGW7dqe8Wwij2oiThJw57mPZqA00HiLgbpH1GzjZ
 iatxVYDQG4EifhNnZCW1X8Dy1n7HtyldsO9m8E5k7IY+dhlIr8E/XMf8qD/yZ2b1WYmm
 NNWADGXrlNEJV3Hg+abyYFeGyJtpt4EHNt4ot2u0jhEO7inlDpXgPGQMkYzmv/TJ7Y97
 DjwxuE0B+o5LXP3XUKDbTPupR67/Jm4+llcMa3JwwE32zQFGN9NGzVJtUcpHun9z23Fk
 HHsQ==
X-Gm-Message-State: AOAM531/k56x4eff5e9LD7k0o7SdH5aS5OqE8dIK1su23wvEkMSSUmwK
 qb8SWlZTuJeiOfIFhd4IchpNRleR6xxuoAfpEhymfXhzrI0sR+nWJeDNlHAOQ9RF8p63gbt/0nb
 spPD7YG2iL81MTgmy3mwOHfsMdDbkNQfDlnNE2c5V/eR+VIYVyppvREOHtgw1
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr52339351wrc.326.1641475021183; 
 Thu, 06 Jan 2022 05:17:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkToWx5J8CBcEwUEHBnV45iFfVTvitO7zfZCBcocMJChc+DEMTsv2cMEBIX0nQsIRrHRsSiA==
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr52339333wrc.326.1641475020892; 
 Thu, 06 Jan 2022 05:17:00 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u11sm6033219wmq.41.2022.01.06.05.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:00 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/52] chardev/char-socket: tcp_chr_sync_read: don't clobber
 errno
Message-ID: <20220106131534.423671-17-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

After the return from tcp_chr_recv, tcp_chr_sync_read calls into a
function which eventually makes a system call and may clobber errno.

Make a copy of errno right after tcp_chr_recv and restore the errno on
return from tcp_chr_sync_read.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-4-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 chardev/char-socket.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index 3ddd98ed49..fab2d791d4 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -525,6 +525,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 {
     SocketChardev *s = SOCKET_CHARDEV(chr);
     int size;
+    int saved_errno;
 
     if (s->state != TCP_CHARDEV_STATE_CONNECTED) {
         return 0;
@@ -532,6 +533,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
 
     qio_channel_set_blocking(s->ioc, true, NULL);
     size = tcp_chr_recv(chr, (void *) buf, len);
+    saved_errno = errno;
     if (s->state != TCP_CHARDEV_STATE_DISCONNECTED) {
         qio_channel_set_blocking(s->ioc, false, NULL);
     }
@@ -540,6 +542,7 @@ static int tcp_chr_sync_read(Chardev *chr, const uint8_t *buf, int len)
         tcp_chr_disconnect(chr);
     }
 
+    errno = saved_errno;
     return size;
 }
 
-- 
MST



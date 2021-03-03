Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3632BA2A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:19:02 +0100 (CET)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX1R-0005RZ-Fx
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWv5-0008HQ-0w
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWv0-0006o6-8J
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oFEYxjFynxuNvujTQ+INd8vvNYEulGGn3mpP0DXpTGE=;
 b=Bx5swj7zanq2FsG8AQ6F3FfU+NtSNk60qH3vMY26HoZTuhftw+RWVcSqJo2qbj6YG3h5cj
 Cb86Dq7QV2YhgbO32CAMYMTVwh+Iw4+5f2SAprgmyoTGG/9ll+dAsfkL7TLUw7Bs+elYRL
 w7GKSsQHV5SiGGQmXYT7M5EBGk37hD0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-He0wCmrOPmOiBntIicQY-g-1; Wed, 03 Mar 2021 14:12:19 -0500
X-MC-Unique: He0wCmrOPmOiBntIicQY-g-1
Received: by mail-wr1-f72.google.com with SMTP id z6so4500326wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFEYxjFynxuNvujTQ+INd8vvNYEulGGn3mpP0DXpTGE=;
 b=hrLuZzrcl0fM40HRFMj5NjFP+BTpZGzClyeVdTQwzKyx9XI1NJ4x2MLPFQ5s2l4qIA
 O+185X14INJJ0CTfzzAC7/DlnRICtqVdCOqRyGqFongh5nVu+DG/OTxFgCSX+C+mQvxk
 3lYMhseY/+NLIcAjkR1mcPIPjxcXoTowtKWKTj339NcxCEvlLCEv2cv73zKfC5MmdPpT
 bGv3N2Vf9MvPnWtJTrRfwSjxEq7+R2vGq96Grgj0OKgx5Cbkmkbi9302SFfpGCoIlMTf
 aLfAEyfjaPC5ip3o0gUdI5aj/qg33OOykeew5wLx5EjjmC/JDY6rMu+jHK+me0SuYn0x
 9ENA==
X-Gm-Message-State: AOAM532mu2A1X8CzIY7mIkHqt69lMkpvGA3twEBN/LKstRhRPFpw/bxv
 AFsP6f5ww+3HL/fh4UoRJ+u68jhWgYRi36XkDM/pTEPaei0t5N3OX4ESTEYNoY0V+jSIlVaUlGz
 3Opd2reLFEaTIk9MiPQEIoRPZzBidNanrd66DUg3tRxsRVHp6w13ImRP3ARuMm85t
X-Received: by 2002:a5d:408a:: with SMTP id o10mr204256wrp.294.1614798737727; 
 Wed, 03 Mar 2021 11:12:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh5lDMIz1tJsqk3Q1ZBm72v/BtZudfFjdMLMfKvir4Yb/x/8IWZQ9bsRNdQSXybTHsGavSTw==
X-Received: by 2002:a5d:408a:: with SMTP id o10mr204235wrp.294.1614798737520; 
 Wed, 03 Mar 2021 11:12:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m6sm32937966wrv.73.2021.03.03.11.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
Date: Wed,  3 Mar 2021 20:11:57 +0100
Message-Id: <20210303191205.1656980-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303191205.1656980-1-philmd@redhat.com>
References: <20210303191205.1656980-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends SLiRP/TAP, they don't
expose a way to control the short frame behavior. As of today they
just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from SLiRP/TAP, we
change to pad short frames before sending it out to the other end.
This ensures SLiRP/TAP as an Ethernet sender do not violate the spec.
But with this change, the behavior of dropping short frames in the
NIC model cannot be emulated because it always receives a packet that
is spec complaint. The capability of sending short frames from NIC
models are still supported and short frames can still pass through
SLiRP/TAP interfaces.

This commit should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

The following 2 commits seem to be the one to workaround this issue
in e1000 and vmxenet3 before, and should probably be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-2-git-send-email-bmeng.cn@gmail.com>
[PMD: Use struct iovec for zero-copy]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/net/eth.h |  1 +
 net/net.c         | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/net/eth.h b/include/net/eth.h
index 0671be69165..7c825ecb2f7 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -31,6 +31,7 @@
 
 #define ETH_ALEN 6
 #define ETH_HLEN 14
+#define ETH_ZLEN 60     /* Min. octets in frame sans FCS */
 
 struct eth_header {
     uint8_t  h_dest[ETH_ALEN];   /* destination eth addr */
diff --git a/net/net.c b/net/net.c
index 159e4d0ec25..d42ac9365eb 100644
--- a/net/net.c
+++ b/net/net.c
@@ -620,6 +620,7 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
                                                  const uint8_t *buf, int size,
                                                  NetPacketSent *sent_cb)
 {
+    static const uint8_t null_buf[ETH_ZLEN] = { };
     NetQueue *queue;
     int ret;
     int iovcnt = 1;
@@ -628,6 +629,10 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
             .iov_base = (void *)buf,
             .iov_len = size,
         },
+        [1] = {
+            .iov_base = (void *)null_buf,
+            .iov_len = ETH_ZLEN,
+        },
     };
 
 #ifdef DEBUG_NET
@@ -639,6 +644,15 @@ static ssize_t qemu_send_packet_async_with_flags(NetClientState *sender,
         return size;
     }
 
+    /* Pad to minimum Ethernet frame length for SLiRP and TAP */
+    if (sender->info->type == NET_CLIENT_DRIVER_USER ||
+        sender->info->type == NET_CLIENT_DRIVER_TAP) {
+        if (size < ETH_ZLEN) {
+            iov[1].iov_len = ETH_ZLEN - size;
+            iovcnt = 2;
+        }
+    }
+
     /* Let filters handle the packet first */
     ret = filter_receive_iov(sender, NET_FILTER_DIRECTION_TX,
                              sender, flags, iov, iovcnt, sent_cb);
-- 
2.26.2



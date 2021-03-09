Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEB1332F9E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:11:54 +0100 (CET)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiht-0005y3-A6
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh5B-0000k2-Vd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJh5A-0001Ey-Bk
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 13:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615314467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Q1w6fXMkJ/+WaYRHjG7T+TBBkT12mVGuAnMjp1JEOk=;
 b=fOtKtDyKPvMH4maA7/DcVJO60og+qNKlm9Su8HwSlNXp4h0dkuss4O9kGMScGCGX+hNSnX
 WGCBTSZG9W3h8ZJlTnR2VXbH5pbShV4TiBgCp5tzzwL0xsSKFqqTxtMFiba7KCUgjBgfzg
 UIlJaXmGwNWiqXKgRLjQfz/fVgfx6M8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-HRQwDDV8Mo2Q1F1FnyHqPQ-1; Tue, 09 Mar 2021 13:27:46 -0500
X-MC-Unique: HRQwDDV8Mo2Q1F1FnyHqPQ-1
Received: by mail-ed1-f72.google.com with SMTP id a26so127176edt.23
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 10:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Q1w6fXMkJ/+WaYRHjG7T+TBBkT12mVGuAnMjp1JEOk=;
 b=QLrMiJQv5hgpLmAzQncsMvXqV8XXnIQpgardqcSjlexpdR8ZkZhM39JNdO2uxJko9Y
 Qh9u6weuMc04mK6CMoiAkevKPYZhEHLr06CJTvoF7M2B0EVc5qnBYpqlR1LeTm6a4L4s
 ssgVsMFk/yUEnOi5Q0+0L+Jcq+k/7fNa4wHdIYHYArexUZpNCh7Oy68ijmtcjE19TFDY
 /vNdudnY17FIpZYSK83GCOhI3B5/iNbhHvktv0EK3emEMG0pSr1nG2olXIOIqifkNeUu
 Xmrh6gWsFptP0qYICbMLEByrf3GBy4SKkOAGF2Xe4WOp0DHD06n0qocB/bTja7fgPSUI
 nxBg==
X-Gm-Message-State: AOAM5303dU+8RT76Cw0H2YPm653gtAZN3tRr90Baq/c4RE9dcQ18V5uj
 v4ILKhz0iYuAIhNaY9AmGKUc0v6uMeU1ihCe8CGiqOksc9kRT+Jl0umuRQ8X2HkoBtJ6nmQ/EeY
 YioXO1k7zRTIWXB8pEzhflMY6rWnL+3q5+syJaDCQaiymdfkvsH1QXwq911eP2rX8
X-Received: by 2002:a17:906:c081:: with SMTP id
 f1mr21920816ejz.97.1615314464855; 
 Tue, 09 Mar 2021 10:27:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwT1UTXtzRJxP4PcxxMs61k9mYR2n7eXb2zmrVAYDGW155JhoUC3xQdUt4/pJ8e1T+PYvp7qw==
X-Received: by 2002:a17:906:c081:: with SMTP id
 f1mr21920775ejz.97.1615314464574; 
 Tue, 09 Mar 2021 10:27:44 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bx24sm9035103ejc.88.2021.03.09.10.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 10:27:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] net/eth: Remove now useless size check
Date: Tue,  9 Mar 2021 19:27:08 +0100
Message-Id: <20210309182709.810955-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309182709.810955-1-philmd@redhat.com>
References: <20210309182709.810955-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the previous commit we checked there is enough room
for a ip6_ext_hdr_routing in the buffer.

The ip6_ext_hdr_routing structure starts with a ip6_ext_hdr,
so we already checked that input_size is big enough for a
ip6_ext_hdr :) Remove that now useless check.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/eth.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index f0c8dfe8df7..e984edcfb0b 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -416,10 +416,6 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
     if ((rthdr->rtype == 2) && (rthdr->segleft == 1)) {
         size_t bytes_read;
 
-        if (input_size < ext_hdr_offset + sizeof(*ext_hdr)) {
-            return false;
-        }
-
         bytes_read = iov_to_buf(pkt, pkt_frags,
                                 ext_hdr_offset + sizeof(*ext_hdr),
                                 dst_addr, sizeof(*dst_addr));
-- 
2.26.2



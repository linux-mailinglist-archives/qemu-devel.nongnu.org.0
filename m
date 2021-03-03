Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E70332BA30
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 20:24:54 +0100 (CET)
Received: from localhost ([::1]:56502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHX77-0002kx-DE
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 14:24:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvP-000095-KI
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWvE-0006tt-Vn
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 14:12:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614798756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ne5diQd2gxsPBtDDhKD/phqfjDFTA6zzQ5kRhrkwDo=;
 b=O6JFfd5oKqK3K6Ff/9sf6yHk2GSZ6kweGxGaSeHhiRo4nH7VmFhwae6cgmSOULUMzFLFkS
 kxOl3uDSFyKyD9I/RxrE6LMz6HIvmCb+9nXYpMvnlG43739hVEu4H+fR612gpZgX8Gcwrx
 A3ld80DAl3Z4/+END1iSbAZV5CA/DDw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-Nf1qtPstOBWfSGmp_XcZ4Q-1; Wed, 03 Mar 2021 14:12:34 -0500
X-MC-Unique: Nf1qtPstOBWfSGmp_XcZ4Q-1
Received: by mail-wm1-f69.google.com with SMTP id z26so3435502wml.4
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 11:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ne5diQd2gxsPBtDDhKD/phqfjDFTA6zzQ5kRhrkwDo=;
 b=O2hwYsnaXwYTiojAkSI4RzX/PIJHwbsdK7kkOIjCWaL45fqch9K8EQIfwbUWjQ5rsJ
 bnkNzJIUhiJyrlgYr7CJ9yZllRkqyGnNKeTeAVEZVFIv4ipZ+lXWjgxmWgDVHt6Tu/wx
 CsMtxabLzo7wc6XFrU/5bekmXI60o9zNu/+o6BeEztShnOzrxv5Peh8ep+E7epcC4wdx
 AJsX49tryIJmbPb7PLtNK0vgL3ObMrKyardKKGdTkmMOizvD4MwbzQr1b9I2K+Lzeoku
 IBHo1CWyOgVx7MO+6c+kOQlFYgbXVqzM4ONa12PRBn90v1OplPmvkWCXCVLE04UUr1hs
 OQuA==
X-Gm-Message-State: AOAM53385lghqvgAAkw9ry6ZuwdWVoe8LnpNYI+SV6iXN1oV5znVejBe
 IqIsy0l/sFO6eH3gJ2rfejq8IGn35TNd9SzjsE926nLhHaEhwHwhN9BqNwCBWeo01r57DsbV/Lv
 nNDOIoFGSF0jsTsFkJxvsRYNDz1PlzUV17pwH6cPbDw8uobE5Jol3hfvj3twIT/1o
X-Received: by 2002:a05:600c:3550:: with SMTP id
 i16mr422460wmq.170.1614798753419; 
 Wed, 03 Mar 2021 11:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZA5/B1eI7smmS4ewi3nccrPKKBhVMku1/gpsBY17BdRWDdfNhFoWqUQrKMEk3cvQHqLn/FA==
X-Received: by 2002:a05:600c:3550:: with SMTP id
 i16mr422439wmq.170.1614798753184; 
 Wed, 03 Mar 2021 11:12:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z188sm8934994wme.32.2021.03.03.11.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 11:12:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 05/10] hw/net: i82596: Remove the logic of padding
 short frames in the receive path
Date: Wed,  3 Mar 2021 20:12:00 +0100
Message-Id: <20210303191205.1656980-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Message-Id: <1614763306-18026-5-git-send-email-bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/i82596.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/hw/net/i82596.c b/hw/net/i82596.c
index 055c3a1470c..1eca2e2d816 100644
--- a/hw/net/i82596.c
+++ b/hw/net/i82596.c
@@ -73,10 +73,6 @@ enum commands {
 #define I596_EOF        0x8000
 #define SIZE_MASK       0x3fff
 
-#define ETHER_TYPE_LEN 2
-#define VLAN_TCI_LEN 2
-#define VLAN_HLEN (ETHER_TYPE_LEN + VLAN_TCI_LEN)
-
 /* various flags in the chip config registers */
 #define I596_PREFETCH   (s->config[0] & 0x80)
 #define I596_PROMISC    (s->config[8] & 0x01)
@@ -489,8 +485,6 @@ bool i82596_can_receive(NetClientState *nc)
     return true;
 }
 
-#define MIN_BUF_SIZE 60
-
 ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
 {
     I82596State *s = qemu_get_nic_opaque(nc);
@@ -501,7 +495,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
     size_t bufsz = sz; /* length of data in buf */
     uint32_t crc;
     uint8_t *crc_ptr;
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] = {
                 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -584,17 +577,6 @@ ssize_t i82596_receive(NetClientState *nc, const uint8_t *buf, size_t sz)
         }
     }
 
-    /* if too small buffer, then expand it */
-    if (len < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, len);
-        memset(buf1 + len, 0, MIN_BUF_SIZE + VLAN_HLEN - len);
-        buf = buf1;
-        if (len < MIN_BUF_SIZE) {
-            len = MIN_BUF_SIZE;
-        }
-        bufsz = len;
-    }
-
     /* Calculate the ethernet checksum (4 bytes) */
     len += 4;
     crc = cpu_to_be32(crc32(~0, buf, sz));
-- 
2.26.2



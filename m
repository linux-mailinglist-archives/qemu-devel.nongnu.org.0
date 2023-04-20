Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C46E89D0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAU-0000UP-N6; Thu, 20 Apr 2023 01:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAM-0008Sv-UM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:11 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAL-0001Oc-8N
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:10 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1a6817adde4so8383865ad.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969748; x=1684561748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSx/Q5Zg5D9OUWDD4DVLGcD91xlqvbaERviIetrBRHM=;
 b=2gkXacfkhuIr9qec1q5j1aYGvjpIFJkrEe+qdyImI39W8HDcwpBaOgdZeEQhj3VLvW
 V+V+Nc7nMmVuMPEQmt5M/j3QOaOqsgQhlCSbXSBEC+VshGkgAHG9+XHyUEVOI1GSaDwe
 xqEWZdP+2MOSSGIiDt8joJLfJ9VgsE7c6lUGfJg4MPXow6TBarx+nzq4MD5zTck11NN5
 TXHBuN+nntvAm50jZJfICdHz6uenmTHt/ux/Ryu51Cs6aq2ZoZlb1himiW/opF2QLWdc
 GFHNzSyVaFOgBYH3hQwhkhncDQ48T2BPiZF4+gSAuPgV4qrXe7HanpS5n/mneda8yqKU
 KbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969748; x=1684561748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSx/Q5Zg5D9OUWDD4DVLGcD91xlqvbaERviIetrBRHM=;
 b=F19qZ+aSf/wTXrBDzSoXyaKWbNSMZNLJKXlavaaBM/vtBYcfZZcxjBHw+H36hREtDS
 kr9zUwvQeaF/W9uhjeSLHp4mSXEALX1uUvMGaBW7PqAlSL+Q1O4Ig2u0++xKU6AOJ71x
 gTo1Ie05bXHPKO1eAv0iyH9vMyTFPlU/W6lXZk/cATPe2nWAtogt7E+7TVQCqId9nGG2
 qkzsctz9lo/o6baD4rEiFH/8DllujSu0wMp8qQd4L07Kicss3fFJQrmxbD181/e/QJgW
 qeCGKp8vwGEEV+ngln9aGHq9ZaM1CitACoORAwg4F2aDfGjgsesA+OrWdvJ5/8Dqrlbn
 jPyQ==
X-Gm-Message-State: AAQBX9fP3A13BQgRN14Muqdp9WGAaPch/AsjjX5dot2Qbcfg/owkXdLV
 qlAHPDgZ+IJ3Fw5t2rSTP0jdsQ==
X-Google-Smtp-Source: AKy350bqD67qtnT/P2X7upoOtTn3D3vPwD08n7Vo0KNruAv8E3OQzDqBs4XT1222ZDvrUYPI8FgIsg==
X-Received: by 2002:a17:902:d2cb:b0:19d:611:2815 with SMTP id
 n11-20020a170902d2cb00b0019d06112815mr424599plc.42.1681969747873; 
 Wed, 19 Apr 2023 22:49:07 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:07 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 26/41] net/eth: Use void pointers
Date: Thu, 20 Apr 2023 14:46:42 +0900
Message-Id: <20230420054657.50367-27-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The uses of uint8_t pointers were misleading as they are never accessed
as an array of octets and it even require more strict alignment to
access as struct eth_header.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/net/eth.h | 4 ++--
 net/eth.c         | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/net/eth.h b/include/net/eth.h
index 05f56931e7..95ff24d6b8 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -342,12 +342,12 @@ eth_get_pkt_tci(const void *p)
 
 size_t
 eth_strip_vlan(const struct iovec *iov, int iovcnt, size_t iovoff,
-               uint8_t *new_ehdr_buf,
+               void *new_ehdr_buf,
                uint16_t *payload_offset, uint16_t *tci);
 
 size_t
 eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
-                  uint16_t vet, uint8_t *new_ehdr_buf,
+                  uint16_t vet, void *new_ehdr_buf,
                   uint16_t *payload_offset, uint16_t *tci);
 
 uint16_t
diff --git a/net/eth.c b/net/eth.c
index b6ff89c460..f7ffbda600 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -226,11 +226,11 @@ void eth_get_protocols(const struct iovec *iov, size_t iovcnt, size_t iovoff,
 
 size_t
 eth_strip_vlan(const struct iovec *iov, int iovcnt, size_t iovoff,
-               uint8_t *new_ehdr_buf,
+               void *new_ehdr_buf,
                uint16_t *payload_offset, uint16_t *tci)
 {
     struct vlan_header vlan_hdr;
-    struct eth_header *new_ehdr = (struct eth_header *) new_ehdr_buf;
+    struct eth_header *new_ehdr = new_ehdr_buf;
 
     size_t copied = iov_to_buf(iov, iovcnt, iovoff,
                                new_ehdr, sizeof(*new_ehdr));
@@ -276,7 +276,7 @@ eth_strip_vlan(const struct iovec *iov, int iovcnt, size_t iovoff,
 
 size_t
 eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
-                  uint16_t vet, uint8_t *new_ehdr_buf,
+                  uint16_t vet, void *new_ehdr_buf,
                   uint16_t *payload_offset, uint16_t *tci)
 {
     struct vlan_header vlan_hdr;
-- 
2.40.0



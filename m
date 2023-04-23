Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 481F76EBCEA
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:24:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDR-0004gi-Vy; Sun, 23 Apr 2023 00:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDA-0004Wt-NR
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRD8-0001Bn-Hk
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a52667955dso38486595ad.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223625; x=1684815625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSx/Q5Zg5D9OUWDD4DVLGcD91xlqvbaERviIetrBRHM=;
 b=wVtatYcKGfmLOIVJrgNpWosVMKR1JMWbzCMM9ejfczzn96OhvTo4a5IrSMLuPh/mDQ
 yP+MdK0C/jugQ/7jvXMSKN3R5+S6rNBqnfrWMcaUaNdVVZrsU3VmFq0dkboe2lJCSau6
 WX1JqiTQY8N+NKqKZW0VPw1TZgsojIh8AEN4f1VyLN4mbQfKeDwU2yMNBdWFx0AFHgg7
 11jBWUvuP04Elt54JhLYm4kMKMGNV8tmebCoC/J5AHvXgMyasv0/reDQisonXgLiNBxx
 8oMk21J4pgVyOYwVJCpUTrBvffeJfd/KhHoCZxbMsuDy79zelb5RAQvHAM2Y4Lq3i2o+
 PG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223625; x=1684815625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSx/Q5Zg5D9OUWDD4DVLGcD91xlqvbaERviIetrBRHM=;
 b=WwkWoe1bJQ1e8QNFrz6A8b822u+KuaPvh/1Of5NfyfjPCanK1BDiI9HqqKqqYFiPGa
 n7yJW0pBltCDZEAOdK2mTS2GPJqRk/oWzJqbiOkzlzoDGcqEPMO7rtiXOIUpdC2BO2e8
 jyIvEhpMX2sb4GqSZHAXoWmGX1JLfmwjYVy2QrGubUMJ8Gd+Ef5v+7vKO0vIMmrxrkrF
 j3cfzFo2OjRDCcHstKLqs4fljkblXhIfx8iYJ9P9it1EqaiqDsyXunCJgYakJt4mtaGB
 0Dw8YGqXEWlQYFYL/ZJIkda6MSw+DgYIN7WQlqo+oOlPN+VvRQhxyVxT51yi0g/b5GdQ
 is3w==
X-Gm-Message-State: AAQBX9eFJ03q8lVfPSBgsz5+yIpO3rNx66Fz3+sUb+7UkfWQc1wFGeb3
 bc0VW3LAjzfx1jVXlT6SB7G1Hw==
X-Google-Smtp-Source: AKy350bIzZ8iEBgswPL1vg1b7K6A/rz0eBqZML8/3JgmWC4nU4Y9pbzuxtEwk1ce2FtmyW/tyXiFdA==
X-Received: by 2002:a17:902:da8c:b0:1a6:c2e6:fe27 with SMTP id
 j12-20020a170902da8c00b001a6c2e6fe27mr14370430plx.46.1682223625040; 
 Sat, 22 Apr 2023 21:20:25 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:24 -0700 (PDT)
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
Subject: [PATCH v3 30/47] net/eth: Use void pointers
Date: Sun, 23 Apr 2023 13:18:16 +0900
Message-Id: <20230423041833.5302-31-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 401FE6EF267
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:43:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYM-0004It-H4; Wed, 26 Apr 2023 06:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYK-0004Gj-EU
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:12 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYI-0003JH-UN
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:12 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b70f0b320so8917152b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505550; x=1685097550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSx/Q5Zg5D9OUWDD4DVLGcD91xlqvbaERviIetrBRHM=;
 b=lMXiM2TUCBS/bG+Gnimp14vHsfPrjEz3VLhwSjtYTIgA+K3BFKrVHlcOHNGk5/oJlP
 z4Ei12DVg0sSMUCePBPeT6yLreLZbN+bmychV8rYGuFIj/XE1YtvB5ryM7d3QI4cELzv
 Ca9M5QpY82uhJgT91YPXULaOG9KQ4iiXs4MmJ0+8va+8GVyyshex7ikvD9WRwI3sfOWi
 poOdUFhTQoBCcTZfHE1PImOH95ETZWdNMwGKC0vP4jYpDl2+qUL4aOwGQhbytql3Pijq
 lx3EEt123KK2SVWiMRVd9+RdpJGZF3u7y7pmBH7VgTZBvBKS25agFpxJYZ3iyk7CGQNM
 UYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505550; x=1685097550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSx/Q5Zg5D9OUWDD4DVLGcD91xlqvbaERviIetrBRHM=;
 b=edqzwlevxMlCvLYhXy7cmhA0RXhbzea9u9o0wE/QWenWY796cMclmlNX73AB8RmHEj
 G1dGk5cdAi+BkV/yLTlPIgEUFvbj1gyegpY2Div4vHBTm6K0YhwxtH4wz7s+vqWFIsik
 u50TtWDKPyAz4ARuJlZQ6al6ge3LfZY0JT5qcPBo5mv7HtNzetfy1NTjK3X4LpUVfNJt
 I7MpH3cAxOZ4fJpzmYcZ3RgbiLnUSwJPhUB+4z5sMGDb3IbeElwPtScXh5K1JOciSAYn
 GgxRprZTVbrNEDv/FGdicPm81RWBNLySm0sK3KYrs+xRj4ouYzMOySbovkDKJwX1TTMF
 Xh2Q==
X-Gm-Message-State: AAQBX9eUXMsvJyqM6XfoKi9Hev2KmEZ+/PBuBPEmRuxgH3EYVLdHZZW1
 RVrGbQO8LhFnHKMuGvxqeU4jJQ==
X-Google-Smtp-Source: AKy350YZgyzvuYkRQhMY5TpVs0GFwknaLEonEbXNV7iRWIb/VD7jBqHnpmYPdQGROHjFNqURGdpz+Q==
X-Received: by 2002:a05:6a21:789b:b0:f5:b78b:1a0e with SMTP id
 bf27-20020a056a21789b00b000f5b78b1a0emr10456509pzc.9.1682505549736; 
 Wed, 26 Apr 2023 03:39:09 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:09 -0700 (PDT)
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
Subject: [PATCH v4 30/48] net/eth: Use void pointers
Date: Wed, 26 Apr 2023 19:36:58 +0900
Message-Id: <20230426103716.26279-31-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42e.google.com
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



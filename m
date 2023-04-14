Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BA26E2279
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:42:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmY-000415-O7; Fri, 14 Apr 2023 07:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmL-0002qW-RA
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:45 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHmJ-0001VX-Qp
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id y6so16935608plp.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472381; x=1684064381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2arx7/hFvmYO9YX5SgjLYa26eSb96rkXX0AflDJs7yw=;
 b=4SFeGQsolPF36ClAkF1VRqieQkBNTisSHVsR/2+ROcx+rstiZ/SVSTxxnT19vEHYPX
 uvIKAjNrfSxvPo91nUZuXpghKYLmjtMAWNcAyGCw8plDfCPZaFjm0KwnCsPgXUMEBizp
 7wkA+/3U1yr/N1P3QsB20XufFf6VVOJEZhEI9wa5eLHVbNgRjt1g+Dzqef/xPFLRlZGz
 IwwtkwS2BxJK6ogqPKl2qusaMjv8LLE/ZLNCrFO7iFXT/LtCirVT1TtpGK5O9MXNAoOI
 E5Hc38ZKAck6DD4CtKcW6TubHlIuBUhJHOiMGPOQRZJ61J9SceSx+nuhrVE65bDG3cop
 MTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472381; x=1684064381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2arx7/hFvmYO9YX5SgjLYa26eSb96rkXX0AflDJs7yw=;
 b=ljnRegr/tsWvu7bG6WAJEjd3AVCa1K0/sJQgcKeO0Cy7tHQBSghuR7F1323HUEw3Fa
 cZ+FXGDHZ6p3VFlaTQUWKRu8zTQ4NC72NBj5ijU03J6jJrS1v2ZnT8DqiKSYNoVGt1Es
 +08TBNOC/xcEcV8LpSNQwPptHW7NPTneHAbA/xK3y8y5lonrYe/4zb6QYSpEVPiiLimN
 WgAyWtkWGG/ZpAqM6AvFtWn9VDnJaWHTyoXQ7iauxIPH3q8W5blq5lAxT31UoUf0YNMO
 y/EtJQ3BFsGYNkl88Ltpd1CIfzZkBokH1jhawjOun4ssDgybm0L04FLN77FBzZ5FuDsh
 MvGQ==
X-Gm-Message-State: AAQBX9eAzG+NPaLuUGTH/M3AQAu8f4/HP9BLvh1OjkrFjhpjgJPmKK8V
 0ATRax+Tkgl4HJd7uM1lL399ZQ==
X-Google-Smtp-Source: AKy350bkx107EPSeHClctb5y6i5qGe+V+RTYC4FeEifhEGrYyVEzz/hCLPcM3NBloLeO5pOpZc5G6w==
X-Received: by 2002:a17:90a:f015:b0:246:8c79:caf with SMTP id
 bt21-20020a17090af01500b002468c790cafmr5286912pjb.13.1681472381118; 
 Fri, 14 Apr 2023 04:39:41 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:40 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 25/40] net/eth: Use void pointers
Date: Fri, 14 Apr 2023 20:37:22 +0900
Message-Id: <20230414113737.62803-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x633.google.com
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
---
 include/net/eth.h | 4 ++--
 net/eth.c         | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/net/eth.h b/include/net/eth.h
index e8af5742be..2f87a72170 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -340,12 +340,12 @@ eth_get_pkt_tci(const void *p)
 
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



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E6374ABD
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:42:12 +0200 (CEST)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lePHY-0003r7-0M
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoe-0001fB-2S
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOoY-0004qh-GK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kucBjQtcgLplpmt/EdeRDcsm9+gP7+suZYQbhaTK3U8=;
 b=Ja/RQWtIhnMwc84E46MEWsh5nWe5gWmHnib4hQa2LbweH/5PANGitlWQXH/7+B7cQvRxC5
 GsZoVGklPRGhYWW1TqaYCjeQ+DFc+wnSOKEOVIQvdClvKNVAsqsetpa8mIkxmw6kCMOYfc
 7r3tJ4xVC0GyqhtTdelA6Ie7tgevaoE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--gPc5F9KO02VlxpAVQlfSQ-1; Wed, 05 May 2021 17:12:07 -0400
X-MC-Unique: -gPc5F9KO02VlxpAVQlfSQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n24-20020a7bcbd80000b029014287841063so713630wmi.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kucBjQtcgLplpmt/EdeRDcsm9+gP7+suZYQbhaTK3U8=;
 b=CjAASM8JivvFI9lPT/ALuxw8PN4pO7QQAsNbGui5MlY4esI9VCz46gHiGRbOmtavAt
 2OKIGcmHbNpFUejRtydvMK/YPuL/CurIb8cTPbqYxrf0Vg3Dr8kqVOkkUNUvy1Dgykx1
 xKKZnyLkzmbmUczlPm1yQQ/CGy/raInxGazlzi2h4Ny4idl3eHuV430gRmnGMA/c09bv
 Lq4NWp9rvbwWELR4wE7b9VzX0nWJl81JX1AnBUe2uZzqKSmW6TDcAQlzktsS2cIgAFt2
 W6sTVih8LT9CSSE/FMT8Qlx5YUswXyJxsOzQTGJymL4dlGMoTD+x7xkmmdxcxJD+9Ke6
 77oA==
X-Gm-Message-State: AOAM533FIILOVJFYtl7fmfBcbCd5AuTFkpRzE+b4KH2x+Ng184GG4BB/
 3dM6StOPuJ1FZckPmMyLLd5Ql7+wU+jZJGG2FyrXPm7YO6xnY4RwjoU+FOXcz+buKwruJo2wBaE
 jJMnfzsn4kP4IciyhLnAxhmslkk5iLcyzLmaBpKb78QOWQ4E91M5KsuYIIIg/ylNN
X-Received: by 2002:adf:d223:: with SMTP id k3mr1026877wrh.99.1620249126016;
 Wed, 05 May 2021 14:12:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5tRHEWhSo/5j9x6U8ZvggnSDes7sXlgotB44kpOwkYnlPv+XFtbzO9ez7Pk5cj5Bxs9resA==
X-Received: by 2002:adf:d223:: with SMTP id k3mr1026853wrh.99.1620249125784;
 Wed, 05 May 2021 14:12:05 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id t17sm587584wmq.12.2021.05.05.14.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/23] net: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:39 +0200
Message-Id: <20210505211047.1496765-16-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Jiri Pirko <jiri@resnulli.us>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/fsl_etsec/rings.c      | 9 ++++-----
 hw/net/rocker/rocker_of_dpa.c | 2 +-
 net/dump.c                    | 2 +-
 net/tap.c                     | 2 +-
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/net/fsl_etsec/rings.c b/hw/net/fsl_etsec/rings.c
index 8f084464155..1abdcb5a29c 100644
--- a/hw/net/fsl_etsec/rings.c
+++ b/hw/net/fsl_etsec/rings.c
@@ -381,8 +381,6 @@ static void fill_rx_bd(eTSEC          *etsec,
     uint16_t to_write;
     hwaddr   bufptr = bd->bufptr +
         ((hwaddr)(etsec->regs[TBDBPH].value & 0xF) << 32);
-    uint8_t  padd[etsec->rx_padding];
-    uint8_t  rem;
 
     RING_DEBUG("eTSEC fill Rx buffer @ 0x%016" HWADDR_PRIx
                " size:%zu(padding + crc:%u) + fcb:%u\n",
@@ -423,11 +421,12 @@ static void fill_rx_bd(eTSEC          *etsec,
         /* The remaining bytes are only for padding which is not actually
          * allocated in the data buffer.
          */
-
-        rem = MIN(etsec->regs[MRBLR].value - bd->length, etsec->rx_padding);
+        uint8_t  rem = MIN(etsec->regs[MRBLR].value - bd->length,
+                           etsec->rx_padding);
 
         if (rem > 0) {
-            memset(padd, 0x0, sizeof(padd));
+            g_autofree uint8_t *padd = g_malloc0(etsec->rx_padding);
+
             etsec->rx_padding -= rem;
             *size             -= rem;
             bd->length        += rem;
diff --git a/hw/net/rocker/rocker_of_dpa.c b/hw/net/rocker/rocker_of_dpa.c
index b3b8c5bb6d4..3e400ceaef7 100644
--- a/hw/net/rocker/rocker_of_dpa.c
+++ b/hw/net/rocker/rocker_of_dpa.c
@@ -1043,7 +1043,7 @@ static void of_dpa_flow_ig_tbl(OfDpaFlowContext *fc, uint32_t tbl_id)
 static ssize_t of_dpa_ig(World *world, uint32_t pport,
                          const struct iovec *iov, int iovcnt)
 {
-    struct iovec iov_copy[iovcnt + 2];
+    g_autofree struct iovec *iov_copy = g_new(struct iovec, iovcnt + 2);
     OfDpaFlowContext fc = {
         .of_dpa = world_private(world),
         .in_pport = pport,
diff --git a/net/dump.c b/net/dump.c
index 4d538d82a69..b830302e27d 100644
--- a/net/dump.c
+++ b/net/dump.c
@@ -68,7 +68,7 @@ static ssize_t dump_receive_iov(DumpState *s, const struct iovec *iov, int cnt)
     int64_t ts;
     int caplen;
     size_t size = iov_size(iov, cnt);
-    struct iovec dumpiov[cnt + 1];
+    g_autofree struct iovec *dumpiov = g_new(struct iovec, cnt + 1);
 
     /* Early return in case of previous error. */
     if (s->fd < 0) {
diff --git a/net/tap.c b/net/tap.c
index bae895e2874..2b9ed8a2cd8 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -120,7 +120,7 @@ static ssize_t tap_receive_iov(NetClientState *nc, const struct iovec *iov,
 {
     TAPState *s = DO_UPCAST(TAPState, nc, nc);
     const struct iovec *iovp = iov;
-    struct iovec iov_copy[iovcnt + 1];
+    g_autofree struct iovec *iov_copy = g_new(struct iovec, iovcnt + 1);
     struct virtio_net_hdr_mrg_rxbuf hdr = { };
 
     if (s->host_vnet_hdr_len && !s->using_vnet_hdr) {
-- 
2.26.3



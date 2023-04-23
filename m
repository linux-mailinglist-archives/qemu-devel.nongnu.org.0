Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3446EBCE4
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:22:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRDC-0004Wx-CB; Sun, 23 Apr 2023 00:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRD3-0004JU-G1
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:22 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRD1-00015e-MJ
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:20 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b4a64c72bso2815815b3a.0
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223618; x=1684815618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nkZeqMGrC5T4wD0PKQEIGg+Sarundri/kY+tU5NvW80=;
 b=YEMn5shYpvqtc3DaT1FDjSwK7E37Pb6NU0967d/dMWjusN2dey8hbKs9wBXxMjL0Ro
 1givKhiLhPlpb/JyNKQYYdIOesmVEuhRtdYfFEdpwVQLPmSkAgamwhgpq4b7N7d1Fojs
 Aj3VqPRlYnfKuPRfvmYv7sRKjYeq40hPcILFmOyEkhyBBE4AmS9qzJOTwOM5dujtfUcH
 cZ2KL6ciqcvZkFPl4kH8/j5zrsu6XW8JuIppYGXsXDC0wOUM7ydrme3SJL0MTeT82Of9
 gAtN1AUg9u+Vnd7Z/m9kFELTAUkTPEQ+4J/X07S3QUVjIZ4zOvWx2YiyqJKOFi0fsvci
 VyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223618; x=1684815618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nkZeqMGrC5T4wD0PKQEIGg+Sarundri/kY+tU5NvW80=;
 b=OTv2wNJt/sNUPwCL/VQxzQbIV4r/dM/x3qvCZPduXMfnRNeFDKHqNgLPk9fzG244RC
 VnEApPyVQgJxm7uzfYqojscj1iCTPg4uX5svs41Bt+tIUuFJLOKqcbZ5b6oNvJylkys+
 WVCPDVMz9bo2Ra0hlQg2dz6yRXjkUXGnua/O7w07Q23kQD/LveS/zncGBB5SLEO9e1ss
 SBQZns8fB3Yhs6F6nxlNl1WGxf0tt9R/WKrV1RIlGSti6jf5sxlgBqDkXnHLAlADD560
 o2epyRUzvD/5IE4rH3gHaALQiuCVrsi8vjAHIRRHCFQ/QrXXoYkngdedt9bXbdFP6Rnz
 PDFw==
X-Gm-Message-State: AAQBX9fltOqGUI1xoOl/bdiDOeu2OpS9jGGKKIQIGTFYQmvdubsXSnm1
 HGaRmzrgdRA81SWaKAB6RqeC4w==
X-Google-Smtp-Source: AKy350YbbL5lSwKcKGiZUSWoaEZALyeLUWkReCIBwg883TWnspJntwGuoRQzoFUk3QHHKOm+vFeS7g==
X-Received: by 2002:a17:903:245:b0:1a6:7ed1:7ce4 with SMTP id
 j5-20020a170903024500b001a67ed17ce4mr11645016plh.44.1682223618306; 
 Sat, 22 Apr 2023 21:20:18 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:20:18 -0700 (PDT)
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
Subject: [PATCH v3 28/47] e1000e: Rename a variable in
 e1000e_receive_internal()
Date: Sun, 23 Apr 2023 13:18:14 +0900
Message-Id: <20230423041833.5302-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
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

Rename variable "n" to "causes", which properly represents the content
of the variable.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 27124bba07..0c0c45a6ce 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1650,7 +1650,7 @@ static ssize_t
 e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
                         bool has_vnet)
 {
-    uint32_t n = 0;
+    uint32_t causes = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     size_t size, orig_size;
@@ -1723,32 +1723,32 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
 
         /* Perform small receive detection (RSRPD) */
         if (total_size < core->mac[RSRPD]) {
-            n |= E1000_ICS_SRPD;
+            causes |= E1000_ICS_SRPD;
         }
 
         /* Perform ACK receive detection */
         if  (!(core->mac[RFCTL] & E1000_RFCTL_ACK_DIS) &&
              (e1000e_is_tcp_ack(core, core->rx_pkt))) {
-            n |= E1000_ICS_ACK;
+            causes |= E1000_ICS_ACK;
         }
 
         /* Check if receive descriptor minimum threshold hit */
         rdmts_hit = e1000e_rx_descr_threshold_hit(core, rxr.i);
-        n |= e1000e_rx_wb_interrupt_cause(core, rxr.i->idx, rdmts_hit);
+        causes |= e1000e_rx_wb_interrupt_cause(core, rxr.i->idx, rdmts_hit);
 
         trace_e1000e_rx_written_to_guest(rxr.i->idx);
     } else {
-        n |= E1000_ICS_RXO;
+        causes |= E1000_ICS_RXO;
         retval = 0;
 
         trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
     }
 
-    if (!e1000e_intrmgr_delay_rx_causes(core, &n)) {
-        trace_e1000e_rx_interrupt_set(n);
-        e1000e_set_interrupt_cause(core, n);
+    if (!e1000e_intrmgr_delay_rx_causes(core, &causes)) {
+        trace_e1000e_rx_interrupt_set(causes);
+        e1000e_set_interrupt_cause(core, causes);
     } else {
-        trace_e1000e_rx_interrupt_delayed(n);
+        trace_e1000e_rx_interrupt_delayed(causes);
     }
 
     return retval;
-- 
2.40.0



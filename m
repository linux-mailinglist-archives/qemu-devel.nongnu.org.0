Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F66EF237
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:39:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcYF-0003lL-T0; Wed, 26 Apr 2023 06:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYD-0003Yf-RO
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:05 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcYC-0003I6-9R
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:39:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b60366047so5495198b3a.1
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505543; x=1685097543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TKps3i+/xgR1NdMHKFtK//L/h8EqWJC3mpa9ycy+Xdw=;
 b=0t9Py6Zwd+fJfqIWTOZGSmZkDB0FJFmnWasP03ClAIdGU5gIHBjYWlVGjJgGFvnyit
 Xe6iFjXv3hXW1m4ffXUqpRYmD46xCbDqZahIJ0wjaECBkCgxOZfQVpRz0Uqnw2UGDCHy
 KFsSe9fdt/+4+6Kcet+89SPa8l3ZW733FWVOs2MJC2xeG+KAv/ocUFGI1LR5Z2EN0Vuv
 Dlf41lONOHDuY5Xqa3I7hBYazNYmMHHx50vNp6vacH4TzpZmI3qWevDaFAdkM86kVZlR
 2DQxCprvlAml2OwO62LtPReOoM35qpGgCRGsbZn53S0sfR2ha2sxJ3MlQfDJyTLP5l94
 ljQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505543; x=1685097543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TKps3i+/xgR1NdMHKFtK//L/h8EqWJC3mpa9ycy+Xdw=;
 b=NXFKn0wfT/hfsX4YUHdGXE0xwOvgmw1FfmB1MHaHjzmBoW82Trfe4vPlla0Jv9EByL
 pCb4rAla++ZEBvNeiiTW91znQELgLzsZ18JsxLu6oyf5bFD/1UNxtvxGxs5Dbv9Xicou
 1Tnrtd4R/OfZl+2rrq5YiLy7HlKIi3TmAZ5Em4IUBr2OAULA4y4yikKrYYDLhmOVL0Wu
 dIz54Pedspd7lj7OeuIwz+pEHAoJd3cA4ixkBLrCiRempfnwcwK7+eZQt/XsTA+QFJ22
 xWM62p6SXbrH4gM0gpjpRB44QWhdbSHjSTQ45tv9uDcaAFwSeDB0gOQq+pqlfPud8BPe
 05sw==
X-Gm-Message-State: AAQBX9el089wYM9B/NAbKC5d87nYUwpyFynJFjC/+gDl7l4lU1vkZP60
 tQBrREmMns3RRFbSWsBdkfBeMg==
X-Google-Smtp-Source: AKy350bCXtWvoqnTybP+QK8lOncTq7z9GY5uft4MzTsX5MeEnJtOTFUhIM3gCWyzwUkzzlGh+POY3Q==
X-Received: by 2002:a05:6a00:1825:b0:63d:3aed:44fb with SMTP id
 y37-20020a056a00182500b0063d3aed44fbmr30229450pfa.21.1682505542869; 
 Wed, 26 Apr 2023 03:39:02 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:39:02 -0700 (PDT)
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
Subject: [PATCH v4 28/48] e1000e: Rename a variable in
 e1000e_receive_internal()
Date: Wed, 26 Apr 2023 19:36:56 +0900
Message-Id: <20230426103716.26279-29-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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
index 7dce448657..aea70b74d9 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1650,7 +1650,7 @@ static ssize_t
 e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
                         bool has_vnet)
 {
-    uint32_t n = 0;
+    uint32_t causes = 0;
     uint8_t buf[ETH_ZLEN];
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



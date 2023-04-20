Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B06E89BC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:50:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppN9M-0006sH-Bq; Thu, 20 Apr 2023 01:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9B-0006rC-Qn
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:58 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9A-00014m-As
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:47:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-24736992dd3so367672a91.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969675; x=1684561675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=publPZs1fhxTrshwCuWg7dsVdQXSXv6ynCZ1gW8YOpU=;
 b=X4NvK83zOZ+r26KP3J1dx+4P2v6XpGaC1QxpyKC9z9NqIDbVIt5fK4WT6UcCJmCK1O
 /CGe7BCsx/VjL1rw+xeb/Q9Cqcqa0U+jPGxkbvoBuqUVgaEEtcvGfOE7kIdHLdKm5IWh
 nOJZSgIMAQt6b/9KXwHMYdBWEHVLCaefe1iaM2pfs5JicNzMAshNthjG1PD/67sEreOE
 UtFnnlAhtTaeb4dkH5FgNC0B6OvhjJ30Qyu8w5VBmd1pbfaUDw368oiqNrHyIUa9noc8
 kNUwlolWdnWSUHFkPQjedN4NC2rU82i8dRf+A4cMy6hXyW2vus7oh1QISNLBz4DFt3Ik
 b2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969675; x=1684561675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=publPZs1fhxTrshwCuWg7dsVdQXSXv6ynCZ1gW8YOpU=;
 b=km86/2E5WZfar03e8kmk5zUljBYVBREAne8KIBJFv3yGLZ+Wm4WW9f1dYMzH3BfbkH
 WOqfOqG4Gos48NTlnvMK/JLNUs+AZQby4CRKU7AFrqkZlItJduh9ttad8UwpARcXMJlv
 SnFBYWckWfJQVAOekEk1hl0GU1EYvK6mXCh9rX3V1ACI4oUV9DDXbtnJpk4AOWD0BJ2n
 5oVSSsRU19NIvmxVcV97Ld/866k3vMI2+pFgETY0XhbPZaEjU9oVTnglXKVwaGiF9um/
 G3HDba7hFMAdO6m3Cp3YFZaGShmVRLH94iSS19pjugdG7R/eRJ/GVtBgHav9e1bRqHzz
 mJCA==
X-Gm-Message-State: AAQBX9f40Sq7WmbIGKQXezBO2nws38JZFEnonVIb9b7kJoaHPzBwwE2k
 T5V0WqPhWNvRNQ70lam/b2ctSA==
X-Google-Smtp-Source: AKy350aFAtdhnGUGULtlX/BOHShQPUjdI0jWdMSKbOYrh3CikKLAZD7DNIo+oZGuJog8aZr30yoARg==
X-Received: by 2002:a17:90a:d90e:b0:247:8b5f:59ce with SMTP id
 c14-20020a17090ad90e00b002478b5f59cemr591526pjv.20.1681969675084; 
 Wed, 19 Apr 2023 22:47:55 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:47:54 -0700 (PDT)
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
Subject: [PATCH v2 05/41] igb: Do not require CTRL.VME for tx VLAN tagging
Date: Thu, 20 Apr 2023 14:46:21 +0900
Message-Id: <20230420054657.50367-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102a.google.com
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

While the datasheet of e1000e says it checks CTRL.VME for tx VLAN
tagging, igb's datasheet has no such statements. It also says for
"CTRL.VLE":
> This register only affects the VLAN Strip in Rx it does not have any
> influence in the Tx path in the 82576.
(Appendix A. Changes from the 82575)

There is no "CTRL.VLE" so it is more likely that it is a mistake of
CTRL.VME.

Fixes: fba7c3b788 ("igb: respect VMVIR and VMOLR for VLAN")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index dbd1192a8e..96a118b6c1 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -402,7 +402,7 @@ igb_tx_insert_vlan(IGBCore *core, uint16_t qn, struct igb_tx *tx,
         }
     }
 
-    if (insert_vlan && e1000x_vlan_enabled(core->mac)) {
+    if (insert_vlan) {
         net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan,
             core->mac[VET] & 0xffff);
     }
-- 
2.40.0



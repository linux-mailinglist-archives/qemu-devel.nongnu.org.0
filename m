Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4556EBCEB
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:24:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRBs-0001qY-NK; Sun, 23 Apr 2023 00:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBq-0001pu-AW
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:06 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBo-0000kx-P4
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:06 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b51fd2972so2794214b3a.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223543; x=1684815543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kXRKnm81a5oWp6EqycccsF4Ul8+jyzY9G+OIFomF93w=;
 b=b8l8+qu606EdIg5oc90zJwXplDeKt9RPDBbnqizIKhc0frxkbDd5TUzDy1tfLfXqDD
 UQRLWkRFCw0kAEamOug0E7Mu6xSVYrlduRnZXKlpUAu5c4w+V4YU9C/xP0kboyrFiofN
 AKoCwiNq6C/FTmZ8+MG+AtNEcg/INU/YPlrGM0jJd6QJ4q6LVxthJeRJmuHinsKj3o2p
 +llG+RLTXszH4TlgOpMAaNn1etcQvM6jRkR4Rq2YYFGCpy+03yiV8Bv/vypwqiBlU9Qh
 xZebsXnej+K6yt947jDA8/J17USoJFipkxtjAKIsF1mhEprbWdgnEZdWUG4LbFUXo0jV
 /I+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223543; x=1684815543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kXRKnm81a5oWp6EqycccsF4Ul8+jyzY9G+OIFomF93w=;
 b=FfN84jRdsUKS+GmT6hFvpzco0ktOPau8giY/JJxQrBR22YQoaMJ2QnDTpxYyqTwlGh
 flF9tU5UA6/zZZa1h0ifO3VpnGgf+bPpRs5Y4qSBMC9Afd0Rlc43QJxC1MtapspxyOkd
 +KcQIgVp+Ac5sioN/IfScB7a/4PCJ4vaechUMdOJYrUyP/3795pKYiwKZiSMEftRW7ak
 EU9KawQ/Qp7Qb/EBhuJ9hs7Fo4C9kfa06QO4S2DfFysJmqXfqtxbWMt1IlYYxKqJ9ClG
 k7OWQKO1zuDkCl79MPNnQS42IkogmKP7Vjd9BlaRfwyRvF59hMQ+EG6Vgf9YZyB/CfFU
 nEYA==
X-Gm-Message-State: AAQBX9dguAZz2JwdOFpyTh9vVRNVuDp99lYI/s6AbwuQSn88cK1J94W2
 xAMrlxfUn0EiIS3mds6QChOiAQ==
X-Google-Smtp-Source: AKy350b51T5iRJjrTHF8e3Z6BMwDSeE0oAuP/JYdNKBlbgsh9BgCBZslGqoSjGdRhBAC8P8d5lKhiw==
X-Received: by 2002:a17:902:d58f:b0:1a8:e4:1cfa with SMTP id
 k15-20020a170902d58f00b001a800e41cfamr10037235plh.68.1682223543554; 
 Sat, 22 Apr 2023 21:19:03 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:03 -0700 (PDT)
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
Subject: [PATCH v3 06/47] igb: Clear IMS bits when committing ICR access
Date: Sun, 23 Apr 2023 13:17:52 +0900
Message-Id: <20230423041833.5302-7-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::434;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x434.google.com
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

The datasheet says contradicting statements regarding ICR accesses so it
is not reliable to determine the behavior of ICR accesses. However,
e1000e does clear IMS bits when reading ICR accesses and Linux also
expects ICR accesses will clear IMS bits according to:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/intel/igb/igb_main.c?h=v6.2#n8048

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 96a118b6c1..eaca5bd2b6 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -2452,16 +2452,16 @@ igb_set_ims(IGBCore *core, int index, uint32_t val)
 static void igb_commit_icr(IGBCore *core)
 {
     /*
-     * If GPIE.NSICR = 0, then the copy of IAM to IMS will occur only if at
+     * If GPIE.NSICR = 0, then the clear of IMS will occur only if at
      * least one bit is set in the IMS and there is a true interrupt as
      * reflected in ICR.INTA.
      */
     if ((core->mac[GPIE] & E1000_GPIE_NSICR) ||
         (core->mac[IMS] && (core->mac[ICR] & E1000_ICR_INT_ASSERTED))) {
-        igb_set_ims(core, IMS, core->mac[IAM]);
-    } else {
-        igb_update_interrupt_state(core);
+        igb_clear_ims_bits(core, core->mac[IAM]);
     }
+
+    igb_update_interrupt_state(core);
 }
 
 static void igb_set_icr(IGBCore *core, int index, uint32_t val)
-- 
2.40.0



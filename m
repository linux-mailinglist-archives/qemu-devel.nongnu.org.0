Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9446E2290
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:48:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHrL-0008Ud-GJ; Fri, 14 Apr 2023 07:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHnI-0005Ff-LS
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:48 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHn1-0001sp-NO
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:40:43 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 y11-20020a17090a600b00b0024693e96b58so17245824pji.1
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472414; x=1684064414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lapdvx8DSL6+JLSi7HZJ1a6iA56QIHbib8/tcCY9qxs=;
 b=jE0AHl3b2UjjWRlPcmQgWv+erxeWtFwynLFa3FIRJGZQjZ/QgTyK8LlHDsmNoyhNIZ
 /zctDk5+2/YUVORe9OfGiLBjytZZluUBoLoJTvAu5AVjt/2OrbsxGk9JWnFV/HYpbIzk
 ocMmDsi8C8p6wcAp0fLdS6dTMGSar2cmwPqRuekIApOPftoZEInNvPymsQ3YunGQdRx6
 BH6Hw1c+zWgVqEr9l52x8k9c/QT9N09CNcMrSJaTNFY2Koc5bMzbDxF4n53Vb6tCcWcS
 vRdzl3z0jxDouQtZPfrYqOaKZ+tzhd+IZQi6urzXt7fGDTXKPbwIBD4Uz7mC55zjFdOp
 kM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472414; x=1684064414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lapdvx8DSL6+JLSi7HZJ1a6iA56QIHbib8/tcCY9qxs=;
 b=Pp+DdEm3evgpTzmNQfK3Aeweulzw4O2tBg3LLYq7qlO0wNEmeVJTm9W+ZPByJ+5VR+
 5qawOfzNt7YASk9kI0Zh/HDBTLOwK32eGOL+BIlIFK9WrTYBurnKq7skFsblMMAHQFpW
 5Ll47ryeP/UdH5BpFGdqJJPAqXQkYiiCCKVEkdjj6zbHR+FHRIQvhAPmCcrsiCVJC4wS
 7Ulk2QpkofE9dE2lpFmvVEai8OLcZFyYaWpyNRdIIOSU/S5ssG0fOgtYt6NtJKBHKiaN
 A/Z5Y2K6bHMpaw4/ZqIFLPnWL1TeYhLq4wX0P+MVO1AfW2ajGqrd2pDFPbDidvd69cNc
 XRYg==
X-Gm-Message-State: AAQBX9cXksicx+O4Gqce0UKY8+fkoQrVD3lS31soQrujxwn/b4V2yfYA
 RfqS4ov0B2yFmVC8C56a8RLhgw==
X-Google-Smtp-Source: AKy350a0/JlwnyZ6x1AX2U0FwoAJji+b6ZdVmyD6dcS+yRGsy/0LoH1yhMPqKiAdfWkcJIdoN9+Whw==
X-Received: by 2002:a17:903:41c7:b0:1a5:2585:d09f with SMTP id
 u7-20020a17090341c700b001a52585d09fmr3204062ple.12.1681472413940; 
 Fri, 14 Apr 2023 04:40:13 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:40:13 -0700 (PDT)
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
Subject: [PATCH 35/40] igb: Filter with the second VLAN tag for extended VLAN
Date: Fri, 14 Apr 2023 20:37:32 +0900
Message-Id: <20230414113737.62803-36-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 6e8de9d878..70acc86834 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1017,9 +1017,17 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
         return queues;
     }
 
-    if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
-        !e1000x_rx_vlan_filter(core->mac, PKT_GET_VLAN_HDR(ehdr))) {
-        return queues;
+    if (core->mac[CTRL_EXT] & BIT(26)) {
+        if (be16_to_cpu(ehdr->h_proto) == core->mac[VET] >> 16 &&
+            be16_to_cpu(l2_header->vlan[0].h_proto) == (core->mac[VET] & 0xffff) &&
+            !e1000x_rx_vlan_filter(core->mac, l2_header->vlan + 1)) {
+            return queues;
+        }
+    } else {
+        if (be16_to_cpu(ehdr->h_proto) == (core->mac[VET] & 0xffff) &&
+            !e1000x_rx_vlan_filter(core->mac, l2_header->vlan)) {
+            return queues;
+        }
     }
 
     if (core->mac[MRQC] & 1) {
-- 
2.40.0



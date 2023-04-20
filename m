Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17156E89CB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNA4-0007y3-2u; Thu, 20 Apr 2023 01:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNA1-0007sp-Ki
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:49 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppN9z-0001JS-V4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:48:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b73203e0aso4473084b3a.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969727; x=1684561727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+GBSeBUBaofin94ag2w2hYOc0wx+DM8C5VONJYbDhLg=;
 b=sGLnmRq+GbJoGJ0pALb9S6uVjVM9irnDGk+JSkmdZ7eEqz9BG0LR3NSDf3EvbBsLUO
 LlHcx852qF8ru0gMPFtBmG4LY/hd7qop7ngxl+xpOrHJ/T6pX8RdDepC9sJktrxnQl1z
 ChmwJvQqtj/otYctlhERhpMlJq81zrdNd6QKWXVPyZx+3XT1E4A6EdJQiLrrv70bFpfN
 icKtablVd8R6od6M7XT0YNwewHrdKrdZtsqbtvdaRZyfRYZHy3zw/zQfKHsA/mJpooRH
 kWgVXnsDhkOgqKtm1ALOgmF7KJGfnGLmA12G+nR9PsZSzjokY/AQQrdfjauwd5M5MX0L
 xAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969727; x=1684561727;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GBSeBUBaofin94ag2w2hYOc0wx+DM8C5VONJYbDhLg=;
 b=RQUGCRrpAW6/m87jZp0tD+WWV0kV+spPGpFwZ+uVhq0Fgowi7IKs8E+8Oryr+2R+8P
 xtpCidvKVac1BkXqdkK6a4yYuntXhDAvhj82AXnql7Bk5L1jki9ijvBPbRi6OB+LFA9I
 u6JyXzKKFhwh5gEbITs4upffhLAcauDJmr+PNwpTCqYiS87LYoCbeEi+uoyASv9c3Zlx
 0z6s/ekwEcaQEIopNoz4gQal/afYyaY2RyF2X/Dj5TArZf0OLn468z8DD8iwtzgPeFVp
 9hWgyGhb8fZJ5Aj4785GeacEjFlXFN6rJpMR6/XiQ083nNcTO3RbYK64cJmbDmC4jQOp
 05dQ==
X-Gm-Message-State: AAQBX9e3XfEYP/MYnhI1Yu/GF4uhg82UbrVLknS/vk5nyN2vWoW6mPfg
 JhHkUmJ3bMp4I6odXBCSeBJLgA==
X-Google-Smtp-Source: AKy350aZbyV8iqUhtIBGenueRNZvcRy0enVliULF5QcuQUMTDyd3S1x5uXs4wHh7shs8QB+fXwpu5A==
X-Received: by 2002:a17:90b:3756:b0:247:714e:94e5 with SMTP id
 ne22-20020a17090b375600b00247714e94e5mr5121188pjb.23.1681969727278; 
 Wed, 19 Apr 2023 22:48:47 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:48:47 -0700 (PDT)
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
Subject: [PATCH v2 20/41] igb: Read DCMD.VLE of the first Tx descriptor
Date: Thu, 20 Apr 2023 14:46:36 +0900
Message-Id: <20230420054657.50367-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42d.google.com
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

Section 7.2.2.3 Advanced Transmit Data Descriptor says:
> For frames that spans multiple descriptors, all fields apart from
> DCMD.EOP, DCMD.RS, DCMD.DEXT, DTALEN, Address and DTYP are valid only
> in the first descriptors and are ignored in the subsequent ones.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index d966aa6bfa..5ecb4b6c16 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -613,7 +613,7 @@ igb_process_tx_desc(IGBCore *core,
             idx = (tx->first_olinfo_status >> 4) & 1;
             igb_tx_insert_vlan(core, queue_index, tx,
                 tx->ctx[idx].vlan_macip_lens >> 16,
-                !!(cmd_type_len & E1000_TXD_CMD_VLE));
+                !!(tx->first_cmd_type_len & E1000_TXD_CMD_VLE));
 
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
-- 
2.40.0



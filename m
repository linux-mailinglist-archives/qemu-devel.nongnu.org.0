Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5386EBCE2
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:22:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCq-00038Z-0g; Sun, 23 Apr 2023 00:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCg-000312-0Q
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:20:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCe-0000qz-0w
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:57 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1a68d61579bso27282935ad.1
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223594; x=1684815594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3tcjJdECqHzQHowtvhGwDzeBUVv76McgouuLzHxrMSc=;
 b=Ya7x5s8T1f7PEXJH+aZ+9YAv/V9W5t4z5rxX6tcyLdhfjv45Uz5aS4TD962M7nzsi+
 RdK6moMSYMCaF5oy1oDmydp23iDzO2SN6rxyguKPfNtPZeNHBtAM9h1vWQ60M7GTqai9
 ie5if/M/bSf5u3eEfpBAIgdA1h9B7HfI2wVbI8hYl/xQ3PLItfy0p2iJr2EP95gjYLkI
 THEGPLvLqbSrEjbCBz9Ij0GpztY696cB6ThfE0TSroH/AEm26ER0NXHuGrfc6DwvPOoQ
 bFYK/SgwcsEZLHTa4zWPf92bklIJR7ITkPp2aLVxo3Cj+5kEMkDOK7vEgxy/FHV6Cpqy
 cAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223594; x=1684815594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3tcjJdECqHzQHowtvhGwDzeBUVv76McgouuLzHxrMSc=;
 b=h4mWqA0M5Kh73ruxYQWfv+Tsi1ikQjY6paoXgTnt8wpuvXgtjtH/yCmWblwuiSkWKj
 ozHrFxsv+BpZ02p0qTJjJnx57ucrZygxBQLklm2yGo/K6VyGKPaVOl+LKCfgtOaJ/AtK
 29JreD48YpPr40Xz4oBQh4xaOLvJo4ufQz/gapwkiO/WLqzZih1NOXYDkz1gNBBHmOpf
 ASjCi0isbNFg6snqS2JEQVH3ijai2IkZNJRm/eYFpJ1DXKHpTatnJSmbU7qTw5CMTkVP
 s13TzHVDTxfL2ED4w1Dp7MysevqxQkYBs9LYsS8JKJSqobAgNqnrbiWMgrzCeIW/jWei
 EneQ==
X-Gm-Message-State: AAQBX9fuiKcc8Z9yZ1zOjraOgcYmiAnUnXlXjNWcUs9PxrThqS6ZkcIS
 lNEkCMRYaDu4vJJppTk8XixiIA==
X-Google-Smtp-Source: AKy350bmY+0njkI1ysGYsrx1IMPMMzGzl50cgsngqlcernkHGZIqy6ND68NC2jM/VGmHErP8l38mHA==
X-Received: by 2002:a17:902:ccce:b0:1a6:8442:546f with SMTP id
 z14-20020a170902ccce00b001a68442546fmr10941824ple.19.1682223594345; 
 Sat, 22 Apr 2023 21:19:54 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:54 -0700 (PDT)
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
Subject: [PATCH v3 21/47] igb: Read DCMD.VLE of the first Tx descriptor
Date: Sun, 23 Apr 2023 13:18:07 +0900
Message-Id: <20230423041833.5302-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
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
index 2de04fabfe..4ac7e7af44 100644
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



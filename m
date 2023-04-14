Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2BE6E227E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:44:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHmL-0002ad-M4; Fri, 14 Apr 2023 07:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHm3-0002Nv-HQ
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:28 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHlw-0001SO-N7
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:39:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id p17so6854775pla.3
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472359; x=1684064359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FCUokNzZbEkDde+HTg7GtmJg12hGOkCFl6OVVvHAFw=;
 b=oi8U3uJWgoiUnPyuIEyVKaXQHhVBp74dhKPU5C74hS4t3Yu/opmaZjYeQAGKggv5T+
 S/2odDYTAGGKuSWhcx5usQKNLmREoukEaTla4px3R2DpEyOEP7izn6ywYtklM8i8H7Tz
 UYAOB1MMqifWDntbFFmLCajopUASGjxqS8Ic2cIHu87m09sZD5dk3DYslurI3MYXc+J2
 3lfCLWsEhcZKx3JJIRSvfZHMHDmBZGn5Ermdg/waFgMc5D3T2LdTHf3CAqh72ExzY70W
 t+a1J5X54Fz+fF82pcs9laR97ckztjsEYSy/gH/0bwqtcJlw9OusTcqxjwU4A8h5tetq
 AXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472359; x=1684064359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FCUokNzZbEkDde+HTg7GtmJg12hGOkCFl6OVVvHAFw=;
 b=ezBuaHZ2mR5SFEbMr7PlPOqqtEzkcMsqrlbqGBA0bRBEZLljZiABnyRIFnVXDlJzuG
 gI9a6Yh3svcRo5cVU4NbASIdU86rcUjYB/FUxr4cnHc+sTi8WJztCktmPYpRfy6gayyo
 ZDfRS4wcbBFDqrXNkh3GSdBioUcXa4Q7CWVuEnSTEDvdyQcBtuYDzUal7eNspxte6MgH
 4FDfLzoJ2TMkbK2b7uLz7LBo9L9IbKfOwvjZhPYvNMjFheeJhwdqaQcsiYgS/M7lm7u/
 BsMYTPHNH8BvmAPqdLC/SeObgIHJt39Omo8LnVChZvmRpQZWNkGhq6HZR1qk9yVayicW
 0wUQ==
X-Gm-Message-State: AAQBX9c4NGl6LES9/BhVKm4rRTM7dxIyRFQrv40ge5Z31S5/6MJ/h9+/
 +MD1w1FRgMeQPsFwaUmgBy+i7Q==
X-Google-Smtp-Source: AKy350b4QlNRpWcJQPF0G79mcdEUmffWUfT6ku1AjgyZqJoibayQZ0NLN2aWsooyw7L1HYfoXpdz/g==
X-Received: by 2002:a17:90a:9281:b0:246:938d:db55 with SMTP id
 n1-20020a17090a928100b00246938ddb55mr5326255pjo.13.1681472359610; 
 Fri, 14 Apr 2023 04:39:19 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:39:19 -0700 (PDT)
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
Subject: [PATCH 19/40] igb: Read DCMD.VLE of the first Tx descriptor
Date: Fri, 14 Apr 2023 20:37:16 +0900
Message-Id: <20230414113737.62803-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index cca71611fe..e5a7021c0e 100644
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



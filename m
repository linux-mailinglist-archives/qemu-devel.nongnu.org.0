Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E49E16EF25D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:42:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcXr-0002cQ-Bq; Wed, 26 Apr 2023 06:38:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXp-0002Un-EE
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:41 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcXn-0003DV-QK
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:38:41 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b50a02bffso5718275b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505518; x=1685097518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I5FVG+q2iK4NMFLv4iSqRBvbjAOoFwdqrI/x89PeOJo=;
 b=4d4MKCqSXLs2o8URsDWBAumrXry2pMY0CgqJcqTMUPcVtyGmlfhS+36tH3MzlBn47m
 UEejcTI30OoorJZXgN7KCYJbfBUkvihT22fGGp2tOBcNFtYeGTMeifdhSYG0LCPYE56V
 51UBkV7bJrAOhbaEKGESkyeXLU0ocIjnyXjPi33Sa0HQ9JG8o0gpUB5YrYfu9rYvHDrE
 pgvwN91/1ZH6/uvNgv8+g6gE3Up01mHEuB4IBMW/RywnXTvTEUsOJoMM20M3qwDtiCzf
 tjOl7pOVcCaipPQeKU2R5jomKQr/sAalyvV5dkHRJMpRQy51eB8UhUtbfzXdXXU4KXQq
 XrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505518; x=1685097518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I5FVG+q2iK4NMFLv4iSqRBvbjAOoFwdqrI/x89PeOJo=;
 b=MRTFbGMP6kFTal2xTEBPUdnxA604IcsFjjs1FmpvB93V+sNAWvqD0M5bHDcwwCmrHk
 IGZ8fNYg4egAPkNJptlkixvZfqpNBCnqYv7KgJYMuftTnHdrtRHTrKFGlPQmRIi3352p
 +Bpx1IgqGV2j9bv1AzwOn9a/RoAiBpPhEy3uBqO1LQGQ+ymDDUpMeG7wolu7MFLOsS+u
 nNjcIRMiFD4PypIFwOa6g9WGmoKwcw12aFexqKXedI+tonUWStM0RZY2K6bCbSyyjRlQ
 269yz9aN3deLIGMeAPxf6HXv1rZ/hUOYLpDYwK4XEryHkVM50+JWHz84PmDqvMDX9axo
 KcnQ==
X-Gm-Message-State: AAQBX9cTLAbI/y5Ehg2pMT2xrX6VE5lv6qIJmqRMsLXRechIwsT2fcgA
 OXrWb5ItYFGaAwhjEOmClarVvA==
X-Google-Smtp-Source: AKy350ZuZLCM3o/6G/0WwnkITfRFad0xYinaD6LnXB4VTS12HeCXaoUy1EhaAnyIFe/394s7jEO+9g==
X-Received: by 2002:a05:6a00:10cc:b0:63a:cefa:9d44 with SMTP id
 d12-20020a056a0010cc00b0063acefa9d44mr23259422pfu.14.1682505518682; 
 Wed, 26 Apr 2023 03:38:38 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:38:38 -0700 (PDT)
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
Subject: [PATCH v4 21/48] igb: Read DCMD.VLE of the first Tx descriptor
Date: Wed, 26 Apr 2023 19:36:49 +0900
Message-Id: <20230426103716.26279-22-akihiko.odaki@daynix.com>
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
index bae51cbb63..162ef26789 100644
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



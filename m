Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE1678F5E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:38:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzQ-00030g-DH; Mon, 23 Jan 2023 23:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzN-0002wm-Nd
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:53 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzM-0002Vp-9c
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:32:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id c6so13605783pls.4
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMZNXf1LQaeShgyN+MpgiuScQuKYbGmXM0CXuVBsdv4=;
 b=1ZbXOaucZ6Me2MqstLMPwnQOdlMEoH50MhmRWHiks7e9ZhKpCgPrangN8vVQUXc3nK
 crbP7AWUcMo0CU8JFmYLw0zxlurortIJvHtr5S5ZQpQF+NWkLnO5IxH7zT783xvVOIoI
 FYZq0qivuxy2OCs5VXgYMH8KkzwIddZtF+DUBqerQ5TvfTv/cyjQhQ0Co4C/XiX6OuQi
 kQzTEB9bMP4K6WXVjdoDFOID6FmwcVf8/tgm4kDODz3JB3qkdyE12kdA8c+cYtJI5UQU
 eW1bdtuB+FaszkGI0rvFQti6PPloVAdRQaHCATnN/Ap77iwklzfTbHTBeS+kFK7ZvTgE
 I8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMZNXf1LQaeShgyN+MpgiuScQuKYbGmXM0CXuVBsdv4=;
 b=6lJKDJUjLy1xcyCfPrC7Ff61yP8D7WOB+oVqVsrOKDntbO7/gTfpJfkeDIWFB/cnBf
 Zsila6n1vvboExvfxOtVaOK7utpNAGd2V0gjYZnggGjbr2UkLTEo7ZsDPP3azHMsNZCS
 a++2ePzPmhsyot/JYrf2Wmh4ij4cR17vhl2WRk76CQ8Lg6OilmNSw39UQSBhCQ2RTPYq
 XrxBtQWprBRBT2XCq5d6zvNQu2TJ6NL2qsxz8RM897u5XOa3bEdZlrQZXaqvUmplC06p
 2XBG+stmvNBGueqf3Yse7kV7qR4sHptgLnt2VA7nGbv36dCk3v7jguwtk33ru0CEr5EM
 JSrw==
X-Gm-Message-State: AO0yUKUazVS3IE/b4XS7YJhMhtXfcgADqQzJj8E8nWkvidHWSA6R+vYn
 7lnHQd52yGy95LQk9ySsZ4TvkQ==
X-Google-Smtp-Source: AK7set8JoLxLs0cm1985Uqf3NEgqZqfsRKPwE8P+l7+wXm40FaVlS5P49c7hgV1eC0fSWNNaxx8RMA==
X-Received: by 2002:a17:903:ca:b0:196:186b:cbed with SMTP id
 x10-20020a17090300ca00b00196186bcbedmr58731plc.45.1674534771226; 
 Mon, 23 Jan 2023 20:32:51 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:50 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 19/26] e1000x: Alter the signature of e1000x_is_vlan_packet
Date: Tue, 24 Jan 2023 13:31:36 +0900
Message-Id: <20230124043143.5515-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

e1000x_is_vlan_packet() had a pointer to uint8_t as a parameter, but
it does not have to be uint8_t. Change the type to void *.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000x_common.c | 2 +-
 hw/net/e1000x_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index b3bbf31582..e6387dde53 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -47,7 +47,7 @@ bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac)
     return true;
 }
 
-bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet)
+bool e1000x_is_vlan_packet(const void *buf, uint16_t vet)
 {
     uint16_t eth_proto = lduw_be_p(&PKT_GET_ETH_HDR(buf)->h_proto);
     bool res = (eth_proto == vet);
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index b991d814b1..86a31b69f8 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -178,7 +178,7 @@ uint32_t e1000x_rxbufsize(uint32_t rctl);
 
 bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac);
 
-bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet);
+bool e1000x_is_vlan_packet(const void *buf, uint16_t vet);
 
 bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf);
 
-- 
2.39.0



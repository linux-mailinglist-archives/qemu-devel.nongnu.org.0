Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542FD67C932
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 11:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKznu-0003xN-HX; Thu, 26 Jan 2023 05:48:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKzno-0003XP-3T
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:20 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKznm-0005ep-DR
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:48:19 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 m7-20020a17090a71c700b0022c0c070f2eso4194349pjs.4
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xMZNXf1LQaeShgyN+MpgiuScQuKYbGmXM0CXuVBsdv4=;
 b=Ejtuo3Nkt8oojZlfWlUY/FNYHbCWIf+ki2TSwKA0UKAWjCMNt2dH9N8ZglkRBtrzsj
 t0sRvTG2IGyvqpHSnRum/1v5hWOt7/Kh2///SEH/+s6anju619RaUAVYuPvi47XJ/1L/
 O1Fd9PWtratdYoifJNgPpC8J+gVFwVIqYkvZy7gN82KCMb7/yKueU22vERQtqF0gPtcr
 UYCTTJTkT73UK2MeuZheZ3IEAx6G5LLh2eGj+l+i2JZvAJm4ArG8kk5A4O7FOc1ZMb+n
 ju/t+30GTfcw7eeiz0dB74kZQOewJWqG6W+O126NO3hg10ERjms5YHBxydN+TBHKwpA8
 4Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xMZNXf1LQaeShgyN+MpgiuScQuKYbGmXM0CXuVBsdv4=;
 b=rQfiocMGB9b8GWnqR/oZQjBX3YgqkhrH29AOhLHICUw8SCnvQalhQAbBZc6DT34RUe
 AqwupztJ6003NIqSitftaD4W5cwifvvqw5peUuV105o1EI4SBhKaMY2hz4zItMzqDl2o
 yJ7CGIo5TiRD+HGSDPK7l5YVOs6sDWGGY5ituR8Op28DDL1nuV+oyCR+jya8/6UIknGp
 2Gu8emixfJDXQWegS9+2IsfafI55fFeatWePwKmGRO0pL9ZriBSpoEUZo3F1a0RHCIjO
 BCDgoIxRAAU9dGlXJf54yEdJs0LTJvewlFesNQicckE2W35zhhTpDUyFJ23X+DiVJU05
 +7zg==
X-Gm-Message-State: AFqh2kr4icT+PWwu/+dvX4v0rE3Q+DZNCnWkIXnuP/U+BXWOmSl/aQa2
 +2u7KUJ1smtJwT2MS0253PIpvQ==
X-Google-Smtp-Source: AMrXdXv+cN7yKvytUGfN20q6XIZr+mpBonY6Ez3pfuQesXS2mZPG0HT/KDak5ILNkUcbDwkGf4quog==
X-Received: by 2002:a05:6a20:3d1c:b0:b6:6cf0:2d5f with SMTP id
 y28-20020a056a203d1c00b000b66cf02d5fmr46296647pzi.6.1674730097058; 
 Thu, 26 Jan 2023 02:48:17 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a63af48000000b0046b1dabf9a8sm496789pgo.70.2023.01.26.02.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 02:48:16 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 19/26] e1000x: Alter the signature of e1000x_is_vlan_packet
Date: Thu, 26 Jan 2023 19:46:58 +0900
Message-Id: <20230126104705.35023-20-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126104705.35023-1-akihiko.odaki@daynix.com>
References: <20230126104705.35023-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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



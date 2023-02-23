Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E36A060B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:23:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8kC-0008BJ-5I; Thu, 23 Feb 2023 05:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kA-0008AR-EL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:30 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8k9-0002pV-0M
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:30 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s5so12156758plg.0
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZbOxJlZ5tx8ymjfKgIQaBeKJIwscq3YDNrk13mRmwgU=;
 b=yGzDYVIZan75Q1TULmnIM+OHRtLAl+79thJNdfKlGaY0lo7tvxZuJA49lxVWEzaLaX
 klauZJIN0w1iRqZfCuA0M1xocwqG6LP01fPMMY4Uk8ueZ7adHQKzxlkKzZHlrLpgZr4U
 y+kLzkE2kWWthYIhNwsJDpU8OrmNQNl+9HAq77c9w9lZzJR7Fp+0Ty4FHhLF0lmQQuwr
 zZm9D7R2wt0gf1LV8kAvpvZjBfYDANOUF6rpRuugAPl1+giMH4EfWiTTcrE/v0B+kVs9
 5EMDcgyoI35f2rsgwhBfjZ19d/9+qhoGD/D5UX1BK/QBABzVIza0ZJB3VDdRn6nfWvgN
 D8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZbOxJlZ5tx8ymjfKgIQaBeKJIwscq3YDNrk13mRmwgU=;
 b=blyAYUy0K1Po2M9Ih9Kx3Z/MTVbNxoZTEEH1+VABwPTj2/HwcSwEReFxkb0/E4aURA
 57iRXUaQ5jx9kAduqjCJBtOyIYNkda05p4OJXcJcnKJu21MeHoWcYGhDVp4j96XU+hgx
 RxFxRA5nMLPEQSfsNXDWjRynpLo6O3DHp0MokgHQbC0IV0cmZBO+l9QxoYgXQXi8OQBG
 9HNWPhPNb6eIa6Uzvd2vx4HcMV3kk0z2yu94m5pienSB/ikM0+58cRmA9KG3fOzfSwIV
 f0vPTjALhpADQafuvx1HvobTYJ6kdMs8W5VJ4V3kC/o0wvPYm5LAdvm6yUfXVqFt15+A
 v4Hg==
X-Gm-Message-State: AO0yUKXsIjcg3DX4Zl+RFgzUh3UaFcdY8nVsKbAENqanqb2cmDs3l/OO
 IsKJrzLrATaJYZlwy6JmgCPDAw==
X-Google-Smtp-Source: AK7set/7FuEml7ztYCWwhRSkyY8sNr4I8iGIlZxW2k2TcsxdqBcIlvYKYlI1vZKLD6TPt/C5Eh8psg==
X-Received: by 2002:a17:902:e74f:b0:199:2e77:fe56 with SMTP id
 p15-20020a170902e74f00b001992e77fe56mr15263765plf.52.1677147747900; 
 Thu, 23 Feb 2023 02:22:27 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:27 -0800 (PST)
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
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 31/34] e1000: Count CRC in Tx statistics
Date: Thu, 23 Feb 2023 19:20:15 +0900
Message-Id: <20230223102018.141748-32-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
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

The Software Developer's Manual 13.7.4.5 "Packets Transmitted (64 Bytes)
Count" says:
> This register counts the number of packets transmitted that are
> exactly 64 bytes (from <Destination Address> through <CRC>,
> inclusively) in length.

It also says similar for the other Tx statistics registers. Add the
number of bytes for CRC to those registers.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index c81d914a02..c8307984fc 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -571,7 +571,7 @@ e1000_send_packet(E1000State *s, const uint8_t *buf, int size)
         qemu_send_packet(nc, buf, size);
     }
     inc_tx_bcast_or_mcast_count(s, buf);
-    e1000x_increase_size_stats(s->mac_reg, PTCregs, size);
+    e1000x_increase_size_stats(s->mac_reg, PTCregs, size + 4);
 }
 
 static void
@@ -635,7 +635,7 @@ xmit_seg(E1000State *s)
     }
 
     e1000x_inc_reg_if_not_full(s->mac_reg, TPT);
-    e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size);
+    e1000x_grow_8reg_if_not_full(s->mac_reg, TOTL, s->tx.size + 4);
     s->mac_reg[GPTC] = s->mac_reg[TPT];
     s->mac_reg[GOTCL] = s->mac_reg[TOTL];
     s->mac_reg[GOTCH] = s->mac_reg[TOTH];
-- 
2.39.1



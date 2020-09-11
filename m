Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561D82660EB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 16:08:02 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGjib-0002v5-D6
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 10:08:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dereksu@qnap.com>) id 1kGjhF-00018Z-Lx
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 10:06:37 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dereksu@qnap.com>) id 1kGjhE-0000Hq-6V
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 10:06:37 -0400
Received: by mail-pg1-x542.google.com with SMTP id y1so421933pgk.8
 for <qemu-devel@nongnu.org>; Fri, 11 Sep 2020 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qnap.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PuHXsiU+oecnkGPtxK75s3vxc3sJrd16mO4Uu96aLyk=;
 b=MJz0jshQhaC2jQqeHHma0+tTbBKfOx0y1LfZldKq+1aornWXILLQwqoC5/UZooPa9V
 aivMItigVkM5ps+CugCDf/IAC301w46hNYCEhfM7b+RNOkEU9rJmtSAHp02PSV6lg73A
 efIpF656OrEIRBnOQwrHEX9X4YvwcGKqB4ds0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PuHXsiU+oecnkGPtxK75s3vxc3sJrd16mO4Uu96aLyk=;
 b=PvV5VbyFp6ro24ZQehuHa30AwUmiO1jPBRybGGc5Vsf21/+qwJ86V0mdNtMLMKBfen
 cJGlrt+bcdqSvlBYe/iFnhiS0jMqIfa+36s0NsXhG+8hU78KrCpII6P8b4mWrQQHQifX
 T0YBI5gIao1G03/XZ4wOzXKIvizbOrNGdsyKu2hQvdjA6j6KgN0nL0aRYRSPqeObzUAj
 tg61kx+7F7R2r4AszwnnzI7Y0hgW1tUdj7hM8rOr4yzqlcDv3zoYL61mGU6wbhY9rZs9
 emKn9odkf6qdljGdod1fQMgBvmA8n5PuDP+LGqZsIHarjcUficY4zvT+jHI8wgRdJrtx
 6DLA==
X-Gm-Message-State: AOAM53272MV+WMyCCv5D+8odDu81E1inmeJE4zflUwljklNZ8r9QlVwh
 wcPL5ddL546Bk/oYhqAqEp6jBvjPpQrh4ClP
X-Google-Smtp-Source: ABdhPJwih9I8ju+wpcTvzNlls2UwqN9akI1zGNyPmoh+psPGXx5DOjM77PucWEIkf2il+NgNMnIU9Q==
X-Received: by 2002:a17:902:8bc2:b029:d0:cbe1:e743 with SMTP id
 r2-20020a1709028bc2b02900d0cbe1e743mr2508603plo.30.1599833194567; 
 Fri, 11 Sep 2020 07:06:34 -0700 (PDT)
Received: from localhost.localdomain (211-23-39-77.HINET-IP.hinet.net.
 [211.23.39.77])
 by smtp.googlemail.com with ESMTPSA id y5sm2203179pge.62.2020.09.11.07.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 07:06:33 -0700 (PDT)
From: Derek Su <dereksu@qnap.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/2] colo-compare: Record packet creation time by
 QEMU_CLOCK_REALTIME
Date: Fri, 11 Sep 2020 19:05:08 +0000
Message-Id: <20200911190508.1316487-3-dereksu@qnap.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911190508.1316487-1-dereksu@qnap.com>
References: <20200911190508.1316487-1-dereksu@qnap.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=dereksu@qnap.com; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 43
X-Spam_score: 4.3
X-Spam_bar: ++++
X-Spam_report: (4.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_03_06=3.027,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Derek Su <dereksu@qnap.com>, chen.zhang@intel.com, jasowang@redhat.com,
 lizhijian@cn.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Record packet creation time by QEMU_CLOCK_REALTIME instead of
QEMU_CLOCK_HOST. The time difference between `now` and packet
`creation_ms` has the possibility of an unexpected negative value
and results in wrong comparison after changing the host clock.

Signed-off-by: Derek Su <dereksu@qnap.com>
---
 net/colo-compare.c | 2 +-
 net/colo.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index c4de86ef34..29d7f986e3 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -621,7 +621,7 @@ static int colo_packet_compare_other(Packet *spkt, Packet *ppkt)
 
 static int colo_old_packet_check_one(Packet *pkt, void *user_data)
 {
-    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    int64_t now = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     uint32_t check_time = *(uint32_t *)user_data;
 
     if ((now - pkt->creation_ms) > check_time) {
diff --git a/net/colo.c b/net/colo.c
index a6c66d829a..0441910169 100644
--- a/net/colo.c
+++ b/net/colo.c
@@ -164,7 +164,7 @@ Packet *packet_new(const void *data, int size, int vnet_hdr_len)
 
     pkt->data = g_memdup(data, size);
     pkt->size = size;
-    pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_HOST);
+    pkt->creation_ms = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
     pkt->vnet_hdr_len = vnet_hdr_len;
     pkt->tcp_seq = 0;
     pkt->tcp_ack = 0;
-- 
2.25.1



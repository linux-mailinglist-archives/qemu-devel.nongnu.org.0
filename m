Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61942C68FE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:56:04 +0100 (CET)
Received: from localhost ([::1]:37370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kig6N-0005yK-VP
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifwL-0005T5-CN
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kifwJ-0007Cy-Qx
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 10:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606491939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/jM98+9QzEA24ZSx1+D0MfttLSxhLTxzTuufk7c6+hU=;
 b=CtcOVZH+zT+E00ss1AaoqB1Bi462j4O4XF5P3p5RG/Fch07pa4UeDJJmsHzOux+OLmpaDp
 IolVGC2vQVAt13Hn7XJj+U7M1O4sKegvhUMLA721IRC+P/5AlC4Gs1/EwHQ3xqhF6xltnz
 doGXQJHvctNxb/+XnabwDdipdul1HFs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-RrNZn876N7yF3BQCXp_XNw-1; Fri, 27 Nov 2020 10:45:37 -0500
X-MC-Unique: RrNZn876N7yF3BQCXp_XNw-1
Received: by mail-wr1-f70.google.com with SMTP id z6so1898823wrl.7
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 07:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/jM98+9QzEA24ZSx1+D0MfttLSxhLTxzTuufk7c6+hU=;
 b=WJSPvB6MlCgUGtG/eqE0YcoM00Bz/7E2wacvVbWRBTG+FdnbJh+ehTlxkE5ftTHdDA
 zJQM4RpqqxAuRjYbxiynQ0TTPp/lv0i9IjP8VIDUe7qsHKMKwdaQ4MQBMbk1jujR2skf
 tIr7Rt/X3hhRbVH6tcwxs7kFZWyoLG4JXF5cif9diOu+7H3y4jurQLhUkvhpZYn5lRVU
 fzbqgwAp8HaICOBFXzZbntPrIz3Fm/N6hSPFMWgLUg2D1aJrivhNjLVQ1ahKHQ8dWhOm
 EWN7BC7P3pn9iGq75KBrlvpPYJi/YeGuxdDNLnzIbyuu7JLQHwKuEwU9uZbAuRr07d7D
 Rv6w==
X-Gm-Message-State: AOAM530Gdb7sYKH6AppWwt1Nwr/byyoQg4Z39Mnmq71KhZmnzgy9EYdl
 QIf8GRHsOdSbD5U8WMAzBro6xKXqXxI4yQFWn2wL/TiQcLRSDBnTd4mSyyBBOAJ9wNHYqQaGkkv
 qZveX+D+Jp/W9NVQ=
X-Received: by 2002:a1c:6609:: with SMTP id a9mr4204706wmc.32.1606491936559;
 Fri, 27 Nov 2020 07:45:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwc96KWGczHRzr0LTxPFYU0BHNEdAWXpJh6B2YiZdz+mbVa15jP12d9q1Aeo0uTzmBIxmFamA==
X-Received: by 2002:a1c:6609:: with SMTP id a9mr4204676wmc.32.1606491936366;
 Fri, 27 Nov 2020 07:45:36 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o134sm2399780wme.6.2020.11.27.07.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 07:45:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH-for-5.2 2/2] net: Assert no packet bigger than NET_BUFSIZE
 is queued
Date: Fri, 27 Nov 2020 16:45:24 +0100
Message-Id: <20201127154524.1902024-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127154524.1902024-1-philmd@redhat.com>
References: <20201127154524.1902024-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, P J P <ppandit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure no packet bigger then NET_BUFSIZE is queued via
qemu_net_queue_append*() by adding assertions.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 net/queue.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/queue.c b/net/queue.c
index 221a1c87961..94b98b19ef9 100644
--- a/net/queue.c
+++ b/net/queue.c
@@ -102,6 +102,8 @@ static void qemu_net_queue_append(NetQueue *queue,
     if (queue->nq_count >= queue->nq_maxlen && !sent_cb) {
         return; /* drop if queue full and no callback */
     }
+
+    assert(size <= NET_BUFSIZE);
     packet = g_malloc(sizeof(NetPacket) + size);
     packet->sender = sender;
     packet->flags = flags;
@@ -131,6 +133,7 @@ void qemu_net_queue_append_iov(NetQueue *queue,
         max_len += iov[i].iov_len;
     }
 
+    assert(max_len <= NET_BUFSIZE);
     packet = g_malloc(sizeof(NetPacket) + max_len);
     packet->sender = sender;
     packet->sent_cb = sent_cb;
-- 
2.26.2



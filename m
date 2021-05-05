Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553FC374A0B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:20:09 +0200 (CEST)
Received: from localhost ([::1]:37718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOwC-0001SD-CB
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOo5-0000XV-AI
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOo0-0004Vs-2O
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okjMXaVx8fDoFf7fItgqe0Cv4qcw3tBNnKOpyhy+thg=;
 b=CnndKlNCbD2ShCh6YR/mIZRBTVwvmwRlkPp6LwV4OOoJimauVa5BhMOzMKVMrt7WuTrFii
 GaEGB/Q2Cli/Tzj9LQGTJKPNgBx2utY0sbCvUi8L77qkopnHfoJB/7zTmd/QJH7IwYO6Ci
 gF9l3qfdeqcsx6uaufEbVRj0Gv7MA4o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-8JmwtaPeN3mMXl0g7cRMXQ-1; Wed, 05 May 2021 17:11:38 -0400
X-MC-Unique: 8JmwtaPeN3mMXl0g7cRMXQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so1218210wrc.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=okjMXaVx8fDoFf7fItgqe0Cv4qcw3tBNnKOpyhy+thg=;
 b=aRZH2R9VHMH3De0w+4OROyFRiVYt4Io3ycqWoXWNxKr/Plri61972qD12guYc6BDpj
 ckyheIDVDKewI56MZQ5fgJxbpBllT9almzUX1dp9j72qXngCFznKY5cu4q4L0UTZn3GE
 y+bRiqzKMZRmT7N6GdBUxsu1fjPOTDscELpgh7yJLIqqu3HUCClEqo87uOuAEWvLhIcG
 nz0GGdEAq8KHOKCeZ6VMmuYwPs0PRABLF617LMNPwM4SVn10G4+KK9P8knytYUuHvHjd
 /2QmnntFYL5jSsUvvheEwUD/dJIQlhWw7K8UUKpSe2HekhPtd10U45coxIntHgqNchP+
 OtIA==
X-Gm-Message-State: AOAM531KBW/HnFf1vBOG6TnRrNkf8gGR1R7Q4gCP2DH4aUKUM1BcI4+Z
 AJCb7bz9A93IRJAm5DZ4NXf8xmOHB+0Gl1j1WJAlwEk5Uy7Rj20Cj5WvW1k6X6hUU1Kq+9Rs4FZ
 xe020y8g1H+dBUrXJJLkoIbArnYMfTh14qULxjvd5PCcsPkgsy+6C+zmVJmu1d+XV
X-Received: by 2002:a5d:498c:: with SMTP id r12mr1052504wrq.31.1620249096547; 
 Wed, 05 May 2021 14:11:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygKaQEFEtv8AaUMv9HVvDd6sZKBrSj7AlKCgqWQrVlPcb96sC0MDFakbG/VDWfABiIy17/3g==
X-Received: by 2002:a5d:498c:: with SMTP id r12mr1052482wrq.31.1620249096339; 
 Wed, 05 May 2021 14:11:36 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id b8sm731588wrx.15.2021.05.05.14.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/23] hw/net/e1000e_core: Use definition to avoid dynamic
 stack allocation
Date: Wed,  5 May 2021 23:10:33 +0200
Message-Id: <20210505211047.1496765-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler isn't clever enough to figure 'min_buf_size'
is a constant, so help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/net/e1000e_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b75f2ab8fc1..4b1d4521a50 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1621,15 +1621,16 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
     }
 }
 
+/* Min. octets in an ethernet frame sans FCS */
+#define MIN_BUF_SIZE 60
+
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 {
     static const int maximum_ethernet_hdr_len = (14 + 4);
-    /* Min. octets in an ethernet frame sans FCS */
-    static const int min_buf_size = 60;
 
     uint32_t n = 0;
-    uint8_t min_buf[min_buf_size];
+    uint8_t min_buf[MIN_BUF_SIZE];
     struct iovec min_iov;
     uint8_t *filter_buf;
     size_t size, orig_size;
-- 
2.26.3



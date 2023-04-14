Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E3C6E227A
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 13:42:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnHku-00089a-6C; Fri, 14 Apr 2023 07:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHkr-00088x-Rv
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:13 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pnHkp-0001Em-6z
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 07:38:13 -0400
Received: by mail-pl1-x62d.google.com with SMTP id la3so17846983plb.11
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681472290; x=1684064290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r4unu0FU5hUXEF884PbqXY6L4Q5R2W9kzasMY/H7XCY=;
 b=RQ9ar5J6wZGygWWC5Yh03DIccGPRsaLZ0u2TEVM9deYZdQdAQ4iOpPftKz3/2UT6vY
 k1NjMb0iaVtqv1oMLEM6D2ttBZye8DO4j30KpfzGjnjEZCSQMrPU90iHQnA2t0R/eyuE
 YMKlm8TS1wNzOke+TGyrwdIUL1qG2G0IHcMqdiquC6/pOlj/FGyGoeZcXcMiln9Pe9DP
 sXft/iHXo4Nm/36eYULWJ7UMXB8z9pbsRmPBsuYMSNn2wJFc7FJ6xg4qlADovS8ZJhS3
 PkIU93S1DXtjrFlsg1TLhuJp+cjzIlcw1gv3h21PGkPm3xnh1/XXienQ5vO0Yxg66+UM
 HnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681472290; x=1684064290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r4unu0FU5hUXEF884PbqXY6L4Q5R2W9kzasMY/H7XCY=;
 b=Oucd5u4RZ+FwuzN3vfU8ylJXZ/Mpu9IcfZCuW9dpTyINR/eX3BRB9FWBprSVe9SpPX
 Z/40epWWN/YiNkATyGYWnbR3GdWwVwD1UL50qSLaIx9tvr1w8XFbGgLngb5gaRAvArKX
 fVM7fAmxMeiUcUhLor5olHg1oE2mIAmvqYsqwxjKVFhy7teWQSmu7C0auVrv3aTXis1D
 ovLPRBl1h3Awo62Ad8u6bCWGBOjbVhv7bC1rQMa55uKSi8x0zslzEjByKi6lQthgDYMZ
 0YORWNNNNv6vg8DBWzoCMMiuCcvv+vJonajHE2pPwkoWgnJtjQCMCEtpeMY7d42NGcUr
 DqZw==
X-Gm-Message-State: AAQBX9dx7vuOxI9LLjlzrCKycW/cHkrwSQECXxVuso79pjK7u0TiI3wr
 V+0xo+MwAUTZaokSY9SXLDqDUg==
X-Google-Smtp-Source: AKy350YDswm62VxT5cG8dO/ZSDYjzKAuzc3QaqXNdge79OZFlbemUvyr+39jXX4B7DSy3AYrGOcCrw==
X-Received: by 2002:a17:90a:5315:b0:23f:81c0:eadd with SMTP id
 x21-20020a17090a531500b0023f81c0eaddmr5286964pjh.47.1681472289802; 
 Fri, 14 Apr 2023 04:38:09 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a170902a61300b001a20b31a23fsm2889249plq.293.2023.04.14.04.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 04:38:09 -0700 (PDT)
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
Subject: [PATCH 04/40] igb: Include the second VLAN tag in the buffer
Date: Fri, 14 Apr 2023 20:37:01 +0900
Message-Id: <20230414113737.62803-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414113737.62803-1-akihiko.odaki@daynix.com>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 55de212447..f725ab97ae 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1590,7 +1590,7 @@ static ssize_t
 igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
                      bool has_vnet, bool *external_tx)
 {
-    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
+    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 8);
 
     uint16_t queues = 0;
     uint32_t n = 0;
-- 
2.40.0



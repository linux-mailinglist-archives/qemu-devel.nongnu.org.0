Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296FC6E89D5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNCA-0004Ot-Sl; Thu, 20 Apr 2023 01:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNB8-000406-L4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:50:03 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNB7-0001ZO-2A
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:58 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-246bb512038so402473a91.1
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969796; x=1684561796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWOvNuMYZRWoq2fhDorz4NqQl+9mD4GENe1+ycHRxRI=;
 b=FlLlno9oUJ0v3lTUorKFZyXjhFn9NkgVxm1wZ9/jeZ2TI8P0s0bLZqSSasl8ocDka4
 K45m5LvOlq+9CWAb27aRQmK9jRNNKi6Sxc+60iLURaM1j4m+xWJuNuF9QP3MxDn+1r2/
 EETp0kNK6w8eJa1VdjxTN9428b8ec/8S89m5xepcLaLqYOXwLAwT7Wi0UsbiOx2eRnG8
 95riPTAbvILOMjONkF4hpC8ofdBXnSINNTzjBp1wCcrOMnk/isiQIGUDpyCSFF0kdJLC
 e9j+3xmN/RS3dMsTn0BF2EZTP/Ihbd3W4p8BghhZkWxokeuOF1snn8/wJBi2FFDJC42a
 nkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969796; x=1684561796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWOvNuMYZRWoq2fhDorz4NqQl+9mD4GENe1+ycHRxRI=;
 b=U7ZEOy2qHwGGqsQhzhnWH+vp1SkHKHGkwqzOCIS+W6h7bH9OVUqpwCcOGE8J222AOF
 Wl2PhsFxUKMZYzh1WYD4spbsLfuzIn+koBmPjLdVJJbJsKPRisd2f/Lkdp/bK7WwOp79
 4msVWLXdR86B/aRLmIsLAZB/edmY1PYxPeHzjFNiT7p4U/f4JEDWI9yADay2KsAylAPY
 NRKB1wDxFOQfhopBYpFHGwX7DN5tXdIbVEmWYjlaZNBcNxB/+tz9lR+MS67uwgX8BXAT
 z8qIGXBwNFh3L7sONoiUEQI7kWrNBUvTB3VaX5Tzg7ogzonFf8lDgbBgrFiV1qXWoJg6
 cH5w==
X-Gm-Message-State: AAQBX9dJfHcxVWmFo9/K0hTnV6Kwz0lCZ436LNoG6Mfv/lFGV5aZy0QW
 h2qKxaxZZj2vohxWPPgRhYsysQ==
X-Google-Smtp-Source: AKy350b0txJrlDTgubjF/mPK+PTiYlkLl7j+vXMFdCclihjoNOhMV4p0kUR1rBi+WByy040QNGnjhg==
X-Received: by 2002:a17:90a:2d8a:b0:24b:2e6a:24ed with SMTP id
 p10-20020a17090a2d8a00b0024b2e6a24edmr515347pjd.37.1681969795954; 
 Wed, 19 Apr 2023 22:49:55 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:55 -0700 (PDT)
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
Subject: [PATCH v2 40/41] MAINTAINERS: Add a reviewer for network packet
 abstractions
Date: Thu, 20 Apr 2023 14:46:56 +0900
Message-Id: <20230420054657.50367-41-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1033.google.com
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

I have made significant changes for network packet abstractions so add
me as a reviewer.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c31d2279ab..8b2ef5943c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2214,6 +2214,7 @@ F: tests/qtest/fuzz-megasas-test.c
 
 Network packet abstractions
 M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
 S: Maintained
 F: include/net/eth.h
 F: net/eth.c
-- 
2.40.0



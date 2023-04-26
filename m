Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EDA6EF283
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:45:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZN-0001n3-0M; Wed, 26 Apr 2023 06:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZJ-0001jM-M6
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:13 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZH-0003ga-VD
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:13 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-517bb01bac9so4977280a12.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505609; x=1685097609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWOvNuMYZRWoq2fhDorz4NqQl+9mD4GENe1+ycHRxRI=;
 b=x+6a2c8foxMIXAe6DUo0cXW5/Z6VurrODQVree8oA0mKuC0pGgLn6Uc3sUYZGm4V6I
 XtYZamyyOtolfL80hsYMlCRD6ao9U+FifrTFHUOvsldBw7qLUBL7SqVbYbVXngoeQsUM
 jf50Ve3ja8/VLS968PNbIVagLjShmJrOlp0QUlsPChtWFblQiVna8b1unuL7yp19lf4G
 4p6IvRehuK6UDAzPGVgF+FooNiNB1VgnWCNKAdYoE+Y60HEMo/qWm4UB3bcIviOIMHwq
 Wx0eBGNHlKKyHeQdXiWR4x3m90FelmoOh5an9NcyrmM0rfcFWHo9gRKYFFmtYhj4ScrK
 RZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505609; x=1685097609;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWOvNuMYZRWoq2fhDorz4NqQl+9mD4GENe1+ycHRxRI=;
 b=YT+RMs071d2fEjmhnKHjwVh4/xYtONNW0N5ObWCvuXvT2+t9a5xM39snI5EEYSCDWe
 4zJUsj5H4LYMRMOooTdGWABrIETevE/W37nPmVMdWka+/Ag+oy7rm3CCDgwCesi9f1oa
 1nbnZfSvxseCFUA7cqeIYSiG78sAZH2G02mo2QHJAvig71o4aF0TuKq6lu7DPwTFWjEL
 iujeFJseEa/74O/xfhQ+ZbcGQFbQ63XG9adm3+EllZj5Z0mAqCQBZFiLsNLAWs84+xwg
 pxBQgTI4YdSGP+epBbDK+LqMTpelvYVTJbfJymEf0exomETgHcLBkm/DIM2Vspvzsyos
 ZWEA==
X-Gm-Message-State: AAQBX9fu9LK9pciZRifEiLKxF0ftfrJ0wUC0KQN0AEdJH4yR1QAskgNT
 p0v8M/3NU7mHWSOXdr/pKR8lIg==
X-Google-Smtp-Source: AKy350bEtIH//F+o1GMOrzMMHH8uMNzAm4PVz/rZpOV7GORp0CO1P18ca5eWt9IVIS+1iLiQc3j1Iw==
X-Received: by 2002:a05:6a20:8e05:b0:f1:c0a1:803f with SMTP id
 y5-20020a056a208e0500b000f1c0a1803fmr29635929pzj.45.1682505609739; 
 Wed, 26 Apr 2023 03:40:09 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:40:09 -0700 (PDT)
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
Subject: [PATCH v4 47/48] MAINTAINERS: Add a reviewer for network packet
 abstractions
Date: Wed, 26 Apr 2023 19:37:15 +0900
Message-Id: <20230426103716.26279-48-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::531;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x531.google.com
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



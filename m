Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0313713F1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:03:31 +0200 (CEST)
Received: from localhost ([::1]:37062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWMM-0003Hh-Mm
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKM-0001su-S8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:26 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWKL-0004tI-A7
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:01:26 -0400
Received: by mail-ej1-x62c.google.com with SMTP id l4so7179155ejc.10
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+OffDydTkfXkZuszDV/SXSbi7BWb1yf+LZMphMSDbec=;
 b=b3okjBnBsXD/O+h6jQNVHRjYYPbhWC9oCFMkIkB9joHlryQtFGlxshjqJVe4WqZfX+
 Ow+HeuR828DJAvitcplkuHbEj4hd0hPU58WtwBhv0eeDKNhp9Lr3ILNcXZSDHhSR04cS
 g5h4SCqVUGJCbdLI8WenDkIUFnI+0eCuHMJ7xjspkc/YXg8AzyiYAqhkNp/wYZHz1HUE
 I/Fhaw83f/1CFo1W2bewHv1JZnUzILLNJ8lqrFEGEhp666BusmhfB+dLbfNSu2LA+DVV
 trw/OyXDKISRls3po/NlTXpMxL4piOlPiRNqO2y6BiDHWg36Yd27Khd4HjDPmqzjW8Ml
 9HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+OffDydTkfXkZuszDV/SXSbi7BWb1yf+LZMphMSDbec=;
 b=bjQQxGE0yhLRmvbW6qBIsTRZAJUgxlG1MJVEL5jbeqcv/uo2Fh2hpR1AZ8uyK4/dtn
 qFC9Lt3Ps8I+qPUv6SaDkDvc2ILqaXa9F+zSHCDOEAS0THwA0xLP6ZGunNOTvGus1woA
 IbRD9wSNtRA2pVmZpCitreuVU92wwrGeMlMEXLCWhcNtKiI0tc8gfbNt8kpt6QCMSZM4
 ZagPdA9EXoR1xsvDthe+qYMCjt/ngHGvJVoj8RLWlvYkjVbaQVmnxkTXBgDmDxIyHc4b
 HqcgYsEJdwMh61AqRogreaDi6sTwinYKALKj+KZa9Au0GIuKMNBiph4xNlF/YkvXRfUw
 L3lw==
X-Gm-Message-State: AOAM530o5dreGhWu7V14zb7fJigiQbKfOfD9j3x9IFcHnjg22HJePHCw
 eIZwoUMvBp3Eg+0u5Tuye+yS9/M5BKk=
X-Google-Smtp-Source: ABdhPJxa3aJf4SwnHJjl2Uc0dq9nc8t70IwSzrgM0MT8+OtplP1q/Su8Zq1mI82GzCNiggq6wl9Wxw==
X-Received: by 2002:a17:906:430f:: with SMTP id
 j15mr16055646ejm.543.1620039678548; 
 Mon, 03 May 2021 04:01:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id v16sm12041464edt.53.2021.05.03.04.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:01:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] qemu-iotests: fix case of SOCK_DIR already in the
 environment
Date: Mon,  3 May 2021 13:01:10 +0200
Message-Id: <20210503110110.476887-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503110110.476887-1-pbonzini@redhat.com>
References: <20210503110110.476887-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eesposit@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to a typo, in this case the SOCK_DIR was not being created.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Tested-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20210323181928.311862-6-pbonzini@redhat.com>
---
 tests/qemu-iotests/testenv.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index cd0e39b789..0c3fe75636 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -120,7 +120,7 @@ def init_directories(self) -> None:
         try:
             self.sock_dir = os.environ['SOCK_DIR']
             self.tmp_sock_dir = False
-            Path(self.test_dir).mkdir(parents=True, exist_ok=True)
+            Path(self.sock_dir).mkdir(parents=True, exist_ok=True)
         except KeyError:
             self.sock_dir = tempfile.mkdtemp()
             self.tmp_sock_dir = True
-- 
2.31.1



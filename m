Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88113902C1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:50:36 +0200 (CEST)
Received: from localhost ([::1]:38404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXS7-0008UJ-TS
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMm-0008F1-SD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:04 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMl-0005nN-72
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:04 -0400
Received: by mail-wr1-x431.google.com with SMTP id z17so32310167wrq.7
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UD2dMdGKyLJvMdxSIlQcye8aejj92FAopTvj8ryLMwM=;
 b=BD9CY2/BH4UdxAI5DyYW/pv9YwTpQas0h0NNnBwlLck+Ovo7YN8Z85BL5FTdpRGVns
 2v/BYcX1AgA30xmJKYF48u/3zP7/PAlEa5HFbNyn4bbtuapWBkx/gLqQ//Idr6CqjlFM
 odMTCZrLnKDbopYYNSVDHvEKJSWYEDjoaV+30fZTNK/gREqfZlD3jA5aBJHrxmA8o/bF
 LeslFa7C+RZyqEH6jgqrYdqIJAupatbGB2dcCAOoifrFYkuwO4vnBnJoV5MdZzDj7etH
 YlTClmKJq74YYQPKfUGxq2B8swUJ7K/yM8O8igeiUzGXcmJivTnCmEb6VwebxDcx/8IB
 cviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UD2dMdGKyLJvMdxSIlQcye8aejj92FAopTvj8ryLMwM=;
 b=PpoPkf+bhgF6WAp2D7UxMN2nk36ejorlprTo4qr/4cmzyoCOfS8ZNmklx3KuDOaAM5
 FRJmAE+2+bIbjQkeWw/VXgCjGnikvYgVGBnTTfqiH8OlcKvYumnVvQWg7CpdmO+OGl+K
 GvGubScqMkj1R52mdAusBoOAVJK9cdMOl6v8v+8Hvi8yau2ZQ9KWR8mf1ncwhxKtiR58
 WDf1NSjAbHUHOJbUgcc6kGS2nszIBQ3t/gYb2Z0fkPjO8yimukKKWn77lejWeakOy9xv
 upiURdEbhc9Jv60UWrJMwHLsJcd3oSo/9sRx5ax77oEZhZL7TwxKp0eKaCfa+LqMAPVu
 D6Vw==
X-Gm-Message-State: AOAM530vtDIxWy+yNKXxWC82/j3Srayh6mf6giKiHo9FIFn6kenXLqxk
 9OvJaG1DedAQWkvgZIhOSs7akobR1u1Y0ZXG
X-Google-Smtp-Source: ABdhPJy5QSpHJJUaIdCi8uNiy9u3Gr80CKlB+ln67B8keRD/ebwxqHa3Srbawn6gnKNVVL0ilN4qjQ==
X-Received: by 2002:a5d:5707:: with SMTP id a7mr3032880wrv.193.1621950301828; 
 Tue, 25 May 2021 06:45:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:45:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] tests/qtest/e1000e-test: Check qemu_recv() succeeded
Date: Tue, 25 May 2021 14:44:54 +0100
Message-Id: <20210525134458.6675-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210525134458.6675-1-peter.maydell@linaro.org>
References: <20210525134458.6675-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The e1000e_send_verify() test calls qemu_recv() but doesn't
check that the call succeeded, which annoys Coverity. Add
an explicit test check for the length of the data.

(This is a test check, not a "we assume this syscall always
succeeds", so we use g_assert_cmpint() rather than g_assert().)

Fixes: Coverity CID 1432324
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/e1000e-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index fc226fdfeb5..0273fe4c156 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -93,7 +93,8 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     /* Check data sent to the backend */
     ret = qemu_recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
     g_assert_cmpint(ret, == , sizeof(recv_len));
-    qemu_recv(test_sockets[0], buffer, 64, 0);
+    ret = qemu_recv(test_sockets[0], buffer, 64, 0);
+    g_assert_cmpint(ret, >=, 5);
     g_assert_cmpstr(buffer, == , "TEST");
 
     /* Free test data buffer */
-- 
2.20.1



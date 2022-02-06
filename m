Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45824AAE9E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:41:30 +0100 (CET)
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGe2v-0002mz-Ub
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:41:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdxq-0006hg-18
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:36:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGdxk-0003Nk-Hj
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=yKvvOfUCrkA/xXEMHUCvDWbMmZJ1ATgh5u582Hmw+Us=;
 b=YAtgsrIeN96BXwaXYKwAZ8fo9ZKYLV++TnBddnJPX0zpWRiEufyMJzMl7Xd0ioXAbq68XZ
 87YPMLW2625AIiTEf6v9xek7Ev1/YpqkUPdBfFlq8lNDdXLxO2WNnQhbfY4bTpygeZaqUg
 dyDugNTZ6qH0jX/R04raL8swNJmtMTQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-KZyYYB4IOoKg1BLvCbwYQw-1; Sun, 06 Feb 2022 04:36:01 -0500
X-MC-Unique: KZyYYB4IOoKg1BLvCbwYQw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so3948457wmi.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:36:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=yKvvOfUCrkA/xXEMHUCvDWbMmZJ1ATgh5u582Hmw+Us=;
 b=7KFgUvgpT7WnYPkAeFloaJya2ft1fQk2f1+cpWBQDbchtFmgvSYKkgvCz0XY4Xv4+Q
 EscsJywyIkRuZrlm+z/kpKg/VhrYptY0aVE5YU+205/xU+kziVVvvPa/IO+IlK3eDEIV
 qXpq8iCagq+v9wdrzoT9JICE2/FdEcltDIu1+NZ/dYRNud6tkdQKqYTw3iJobBsyEe8i
 THeZSFhZlRFCcwulMWJwY7LLhFWppX8BQvu6kq0+Axb3NHn/KioPB0RAGQLwTF0OJz6i
 o2kYuR8z1qpo6FGgAlRgYS6aywi9QcRlaSDe5/vuokvJlmZ1BjDF5UHa986IAcf2Q0Mg
 6akw==
X-Gm-Message-State: AOAM5332Y8KRT0KkzZcMhJAa2U0DijssB49g23A5/iq9PbsRvr7sJYhp
 Cd9lomHrESXNd/RB9KVScfkBhb+MyxwEKygal8wYOBXzrYVxKbissurQQ5/QntSQaKmaZ2pDazO
 zeDW3Bx3GAxrN8+szRMMTSZIBeTrhoSfQRNPTUwMb0JWPhRvJ3gnTxN46RMSD
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr5670669wrr.235.1644140160314; 
 Sun, 06 Feb 2022 01:36:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJws5iHkmZgSQS0gHbaGNAZurRe30gIQEUdvFLikhouRNDvxdK+UiX8s8Emh6//H0r2YZDhkVw==
X-Received: by 2002:adf:fa8f:: with SMTP id h15mr5670653wrr.235.1644140160054; 
 Sun, 06 Feb 2022 01:36:00 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id y15sm9385730wry.36.2022.02.06.01.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:35:59 -0800 (PST)
Date: Sun, 6 Feb 2022 04:35:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] erst: drop cast to long long
Message-ID: <20220206093547.1282513-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The way to print uint64_t is with PRIx64, not with
a cast to long long.

Cc: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/erst-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index c6a0ae4013..f94cd8dd8e 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -75,7 +75,7 @@ static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
     uint64_t res;
 
     res = qpci_io_readq(s->dev, s->reg_bar, reg);
-    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
+    g_test_message("*%s -> %016" PRIx64, name, res);
 
     return res;
 }
-- 
MST



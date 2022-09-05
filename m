Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B95AD03E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:37:49 +0200 (CEST)
Received: from localhost ([::1]:40624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9UC-0004Z4-Ej
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV8zw-0007VR-JM
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oV8zr-0003JI-0P
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662372385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FNBQRaVZ7CI39Bd5Dheinzr7qd0hsZuG4ZTl4kqSB2s=;
 b=LPpTjYE4YGHrKctEsrpflKURL2hixppjdaDBt8mXzwPgNre1B/hzBnCKL+E/Neg+YDP4qn
 xxQ2YDbEgHDAeCGJX2KRS6pnJ7dlmy8JZaZ0VUw4J9TL6PzEf2P+mpV7XKCSfezcJ22/v7
 Z9YgdCefkhPIrP2jj8DjQ1g9VcfPSLY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-yo9bOPlQN-CHUlgXrCXubA-1; Mon, 05 Sep 2022 06:06:24 -0400
X-MC-Unique: yo9bOPlQN-CHUlgXrCXubA-1
Received: by mail-ed1-f71.google.com with SMTP id
 m18-20020a056402511200b0044862412596so5539185edd.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 03:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=FNBQRaVZ7CI39Bd5Dheinzr7qd0hsZuG4ZTl4kqSB2s=;
 b=HrK8+B7g360M/JSYE3GX7qyxJCJjkCfmddgwRjLju2SxQQDWlB7mvuZSfSVdU/x3rx
 d6f0DAwRfUUyJaBZbmSE3eZtHgOvzTN7UVVR6poq7mmGxXhzG3VqqbuQ1uvi8v2F9T6H
 h+4C7oN6wCisXaKGf4Y8wu3LXDwiGJfhPlqLgd3nfqsOfdx4MsSI218WRrJJ63zAceoK
 noVEyCs8JyZGzfZKHTwCFjDJfEG+l3xikHsKqmSkXVbAX+7gu2Eq/UF6oKkXZYJpUF65
 8688pAMrjwEFwmrWego7pQTa+dpZYvGlKLPe0fu2sO/EgzoqOMtHlY0CBObbkj+MqQzX
 /v4g==
X-Gm-Message-State: ACgBeo30sAQv81EdnsDucJQEsp5WdDfHMw6iHypC6JHyv8j+RfIDWWem
 HtB0YX9E1P4XcrMZgT6rWpISRANpKP3rbDFEwjrED7pxEYR5no/R0StLCLLq+4ylRfcru+4nXPA
 qmcUVr5UfNyY5Eb2xSKNCVvQtVZGyhvcZvmSqjS3ouO+365VPQX0kmejYtABvqwJpTP0=
X-Received: by 2002:a17:907:d08:b0:72f:b107:c07a with SMTP id
 gn8-20020a1709070d0800b0072fb107c07amr35464151ejc.340.1662372383427; 
 Mon, 05 Sep 2022 03:06:23 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6YPtOFjaDR8nskx5Jr/5jyfq8h6unANe0tLalqdktEFbkjlBdRC04aD7hzpay8eI4acGly/g==
X-Received: by 2002:a17:907:d08:b0:72f:b107:c07a with SMTP id
 gn8-20020a1709070d0800b0072fb107c07amr35464125ejc.340.1662372382994; 
 Mon, 05 Sep 2022 03:06:22 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 n25-20020aa7db59000000b0044e72c99ccbsm2297711edt.82.2022.09.05.03.06.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 03:06:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] kvm: fix memory leak on failure to read stats descriptors
Date: Mon,  5 Sep 2022 12:06:21 +0200
Message-Id: <20220905100621.18289-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reported by Coverity as CID 1490142.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 7c8ce18bdd..208b0c74e3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -3962,6 +3962,7 @@ static StatsDescriptors *find_stats_descriptors(StatsTarget target, int stats_fd
                    size_desc * kvm_stats_header->num_desc, ret);
         g_free(descriptors);
         g_free(kvm_stats_desc);
+        g_free(kvm_stats_header);
         return NULL;
     }
     descriptors->kvm_stats_header = kvm_stats_header;
-- 
2.37.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A51373C01
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:09:19 +0200 (CEST)
Received: from localhost ([::1]:55846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHHC-0004Xf-1I
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6z-0001Vu-5y
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6w-000422-33
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=SFC9nTU+mFLJA6MkEbC3HNImbZTUAjCrRSCKya1XayVjY2ldruyRiXGRvg5VDQOEzI/bqT
 vfShXSoq9Fdv7Y7a7WZkWk/8YWMtTh93+AzaJVz7Lrfy3Hx0iCbFaQzvwvHqdg+yQ8MexD
 1TdHIEdAATRrtmEQIuxO8aVwELNyrsQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-aSundmRSMvO4kRBv4Ws8DQ-1; Wed, 05 May 2021 08:58:38 -0400
X-MC-Unique: aSundmRSMvO4kRBv4Ws8DQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 x7-20020a7bc2070000b0290149dcabfd85so324598wmi.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=KrRAh42f9X0RCMQv9x0Acc3yTZQE+fsiHTqD45Eon5zEl5sztLjj0/4V3ow0keFvYQ
 FpZJ9lxiGHkEyVA2wFhnrK7ndTwNDQ7kX+gOM8J//jfqrcDxmVZ/ShDXXMrDFO5p6JCg
 UoXUGUfZxI4Cd/geohNogo0NKFvR6uLqYktrmvVXlmv1Z8z9QHQG83rrvBRIce9gNz5e
 Fu1rkVM/wB+H+ewMnhNtHHhI46vLet2y+WbXuztDrOOnUfyYnGYPyEgXijGHSLqm8ly2
 cICCAYZxK2m3TGwkYPfnBF90rG2PHlKLIKHrZrRYPLzxTPDz9B9GMYo/DSEhwip7AViB
 DaIw==
X-Gm-Message-State: AOAM530xa4lwFPddvzCg6K/F6zcEEaybadNh/lNG/BzQf6NTVq/9wrYQ
 HJIRtiIeYSgHcVCKMYWcO92hkcKzYBBhddaW9/JBdMFRfrY1wL24rcBfG+chik9Auos+8U9hDCx
 4ghj5L2TlfkvYbDRXyKduDFx1Ml93UeabdHudeGUyoEo4W3Crw8EvQLaMncYQveUX
X-Received: by 2002:adf:f205:: with SMTP id p5mr29122743wro.170.1620219517401; 
 Wed, 05 May 2021 05:58:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydIyZbAlCm6JgUKNFGJf4ccPoehxO33muhY70E5ZpTlJqwvDimAu+HkeBqA2p6cYgwOSSFMA==
X-Received: by 2002:adf:f205:: with SMTP id p5mr29122720wro.170.1620219517193; 
 Wed, 05 May 2021 05:58:37 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id x65sm6912160wmg.36.2021.05.05.05.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM
 specific tests
Date: Wed,  5 May 2021 14:58:00 +0200
Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 66300c3bc20..b1d406542f7 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
-- 
2.26.3



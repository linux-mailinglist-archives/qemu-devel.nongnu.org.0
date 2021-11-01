Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB59442464
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:55:12 +0100 (CET)
Received: from localhost ([::1]:60346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhh8x-0007lc-CC
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgye-0001xL-HC
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyb-0004EN-PW
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t0CVIufzFIccsDBoCkRGFq3WYs0bvTA+xkE09ZtdLKA=;
 b=DqhffrW8+ky2qPu+5qn38WFiKaSQIGAQ9ZhaBoldRJhmpAeJ4d7g0pz6NwtFcUQgtbBQcg
 P58pv1Gx4uZmEie+KhFrOC+2a5mf23y2xUdbHHT8MiCu32pZzExyLjlDzsyLZm5j/EOEdY
 llJjFbD9xHMMTLosGxb3dYEsQOa2Iyw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-EkCow1UtPqKBD2PLGWkYUw-1; Mon, 01 Nov 2021 19:44:27 -0400
X-MC-Unique: EkCow1UtPqKBD2PLGWkYUw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h16-20020a05640250d000b003dd8167857aso17112962edb.0
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t0CVIufzFIccsDBoCkRGFq3WYs0bvTA+xkE09ZtdLKA=;
 b=5+LdFwu2HXx3BEg4Kot2r0O1KpV+MFk3DDfBRoaLTZgr4qR1PtXXmWL8JpkLw+IUgs
 ehw+53Z6CSumQEWLk1jM85ooDl954YugjCaquIS5m3JoxRUJjqB9MIwrJkd3I2ICIJzH
 eIb/GRTiuUKO3J5SEThUmjjUS3sq1+jOSt8Hj09orcr7B7STTcuQGDp1uxktbhRjn8l0
 4Qo4+rK9mjYQLRu7MS+CthkXn1Pl09uy4AV6OLZalrQrZKyzMfTik5tPhWjtasOl/QDx
 mvRBsuxRQ+yWYJj7u572QedRuCc3Dyvm4yHzbGVly369ShmC2OXc6ruk63HOtR8boahE
 ojyw==
X-Gm-Message-State: AOAM532ZfMlNErZsnjNzBntaMBSlbz9BmX3ezDpHaajF95udyaJexsAU
 aiTFR4ESypGaif2pj1/W/M7BVDDgJyIy/fizrGrxJCyslZ2XIP51GcQFeWVkEQgSvsBkKcBaCRa
 /JzXC1z1LPJlhAy/O3WdVJMKjWc7B9Fn/felhVCgb5YHwnqIZquPt/K4WVifj
X-Received: by 2002:a17:906:ce2c:: with SMTP id
 sd12mr13166088ejb.45.1635810266076; 
 Mon, 01 Nov 2021 16:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHPdCyXKSaC/rhWYPjAOVeprUaR2M4VBO/GnFqT6hLqc3HLYkUgPCAtZCQFsHd/k5Bc/eUNw==
X-Received: by 2002:a17:906:ce2c:: with SMTP id
 sd12mr13166059ejb.45.1635810265834; 
 Mon, 01 Nov 2021 16:44:25 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id e11sm3252010ejs.86.2021.11.01.16.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:25 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] qtest: fix 'expression is always false' build failure in
 qtest_has_accel()
Message-ID: <20211101234358.582487-2-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzinni@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

If KVM is disabled or not present, qtest library build
may fail with:
   libqtest.c: In function 'qtest_has_accel':
      comparison of unsigned expression < 0 is always false
      [-Werror=type-limits]
         for (i = 0; i < ARRAY_SIZE(targets); i++) {

due to empty 'targets' array.
Fix it by making sure that CONFIG_KVM_TARGETS isn't empty.

Fixes: e741aff0f43343 ("tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator")
Reported-by: Jason Andryuk <jandryuk@gmail.com>
Suggested-by: "Michael S. Tsirkin" <mst@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211027151012.2639284-1-imammedo@redhat.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b092728397..ab4a5723f0 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ else
   kvm_targets = []
 endif
 
-kvm_targets_c = ''
+kvm_targets_c = '""'
 if not get_option('kvm').disabled() and targetos == 'linux'
   kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
 endif
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F182A70D0
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 23:50:39 +0100 (CET)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaRbt-0001Ef-0R
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 17:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRY7-0005GD-Fc
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kaRY5-0006xI-Jn
 for qemu-devel@nongnu.org; Wed, 04 Nov 2020 17:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604529996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+24Qtjsem3z7nn8q0n3COy79qpz54BrkmBsMuZl5LU=;
 b=ilubzx2avMqTYumjlFCh5toCK8FMSqjqmt4FNTtCSlZFch4UPBH9tfRsM+Pff1xvZsAYWg
 KvE6UFZ74wGD6zjZhe/mWwwVhclx6I3I5Sq3WknpB2IbdAuoeYUTgXdd5W5dHpCwP0PngE
 huIBhLnH7aR+XyFBkCBnO/mF/Bc8A0M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-JW9yMqbGOaeralBmGXbkdA-1; Wed, 04 Nov 2020 17:46:35 -0500
X-MC-Unique: JW9yMqbGOaeralBmGXbkdA-1
Received: by mail-wr1-f69.google.com with SMTP id e11so10422wrw.14
 for <qemu-devel@nongnu.org>; Wed, 04 Nov 2020 14:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r+24Qtjsem3z7nn8q0n3COy79qpz54BrkmBsMuZl5LU=;
 b=NZxH00GcYgeW+mqu+BiIGXghm60+t+qllAhd5WCGLbWFnEcSrqp7/y7tVUxb+yms8h
 ws8BKDcFVCQHCBj/TWXcmRRVpu7tbR53OzjcmlzNgztuRiEsOAJrljN7RxVP8ix4TTnX
 QMFFHrkf5/xhRkhSNpHXtMgGio3avSNLpjqwdh6id72vefy5/YWG3ePKgXkkZAzKUVbv
 s7l09cSaRDGV9FZqhNinsmTH5ov5bNFJheg6dcGnQBhXBVhIBxvYwVgsbF2rJH4wkC6F
 kwJFrYSv4uSWSDgksOzj3v+BLeyQfWxlB6CB4YKLsbkTG5bCP5Jkw6rlA+oyfPvDOdBo
 K6Nw==
X-Gm-Message-State: AOAM532GS59nDOJYfOsKDtizu41OuwBIe+aE+ELZaYVvdd5Wkxhm7dux
 F348YSPRVrW0jCfLaZ4tOIRAnOc5IJ4e+3TEkWSYaHq9JzgjucfhFWcMfLK25NWRKllhBlBW6tG
 xmEInyQG6h1QU+BQ=
X-Received: by 2002:adf:804e:: with SMTP id 72mr274293wrk.114.1604529992805;
 Wed, 04 Nov 2020 14:46:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoqEIJlICdXi9aLQrC+AalYxUawOa4VgrsMJCszoi1YeaLR2L1VdYivyoH/zVt4CmQv0Al7w==
X-Received: by 2002:adf:804e:: with SMTP id 72mr274272wrk.114.1604529992674;
 Wed, 04 Nov 2020 14:46:32 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o3sm4502572wru.15.2020.11.04.14.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:46:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/9] gitlab-ci: Extract common job definition as
 'cross_common_job'
Date: Wed,  4 Nov 2020 23:45:55 +0100
Message-Id: <20201104224558.3384595-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104224558.3384595-1-philmd@redhat.com>
References: <20201104224558.3384595-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 22:09:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the common definitions shared by '.cross_system_build_job'
and '.cross_user_build_job' to '.cross_common_job'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 099949aaef3..701550f028c 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,7 +1,9 @@
-
-.cross_system_build_job:
+.cross_common_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+
+.cross_system_build_job:
+  extends: .cross_common_job
   timeout: 80m
   script:
     - mkdir build
@@ -14,8 +16,7 @@
     - make -j$(expr $(nproc) + 1) all check-build
 
 .cross_user_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  extends: .cross_common_job
   script:
     - mkdir build
     - cd build
-- 
2.26.2



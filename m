Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E162632B7EB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:08:17 +0100 (CET)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHREe-0004kw-Vo
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDS-0003rI-BZ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDQ-0004xL-QO
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614776819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+q2tQGja4QedO+BDlfRcZPe/ilP/4WrfmLbZ/y8xC4=;
 b=H9mLK1et5xGo+eM1jp0yvfMd+J37bMJJlu1urO4LBMO0nijaZqqbFnk+u+AQ+YKWonSTFn
 atfOeyBR8I06tRsmD7KfSrZJMByKJbKgbePrExzW41tinbgZXBXCNsW7n0MHwcyDHuoWQZ
 wcx0H4EmCx8Nlubwi0anRLWSr7loCh4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-cUHPyyh-OB-2qDvgxdaBpA-1; Wed, 03 Mar 2021 08:06:55 -0500
X-MC-Unique: cUHPyyh-OB-2qDvgxdaBpA-1
Received: by mail-wm1-f71.google.com with SMTP id b62so2939117wmc.5
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:06:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E+q2tQGja4QedO+BDlfRcZPe/ilP/4WrfmLbZ/y8xC4=;
 b=EfXpX2ab+0jEtcji/ui8dMgrbRzRTp2vG+g6DjkSZM/i0avoOqAmAbQcbQrXWDC4J4
 dg0/YgscOSVOZ70eRO3GgNg6vGD+NJb4yvPviZ0A5DtrvHA8pia9sqS13l2bFX6mpQTQ
 tCrFzy1Xjda9wr7DT/W1W20s9zrG+9Uo/R8rCPPlgX4epEM5lWRTUKtr8RMHBqBxBwZo
 2Ck6RvxfuU5F/qXMqVJB3h8ETrc8VKFexF3UoClKoysRGUZzIqtz+vXxKV1TgqJk+7Nk
 L81NyF2ERXrkYgltn2B+0nzd2TwdC4u1clDOlU9KsrBwhfBdW+mi3AaStt4ssBEOEFr6
 BP8g==
X-Gm-Message-State: AOAM532yUiWjfv1zCiCeX+mLX29252QVt9UkYh1TJ3d21QvanD9w/O5B
 G2gWw2bA+dO7GZq1C/KmqoiAbnd9c8dkmyPikuSlDucMrgU13ZbmR80RNku3ay3SgRgiTGINrSZ
 jldoFiOlEM2qzaVk=
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr8881697wmi.140.1614776814225; 
 Wed, 03 Mar 2021 05:06:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7J1oUyPmEz2TvesDUKwlVI9t8EtflmoUChm38pVX66saLz6oKKfRkSB/4UGUYYypugpKVhg==
X-Received: by 2002:a05:600c:1405:: with SMTP id
 g5mr8881678wmi.140.1614776814082; 
 Wed, 03 Mar 2021 05:06:54 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z1sm3157976wru.95.2021.03.03.05.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:06:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] docker: Alpine build job depends on Alpine container
Date: Wed,  3 Mar 2021 14:06:44 +0100
Message-Id: <20210303130646.1494015-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303130646.1494015-1-philmd@redhat.com>
References: <20210303130646.1494015-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add missing dependency build-system-alpine -> amd64-alpine-container.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b6d495288d..84eb4b0e5f0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,6 +76,8 @@ include:
 
 build-system-alpine:
   <<: *native_build_job_definition
+  needs:
+    - job: amd64-alpine-container
   variables:
     IMAGE: alpine
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
-- 
2.26.2



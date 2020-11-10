Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21D52ADB45
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:08:06 +0100 (CET)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWBh-0004sy-JH
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:08:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6N-0007nK-DC
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6L-0003c9-Mh
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=msRONXsJPEOWpDURpnGu5FThX3ahWjyI+XOFO40FHAk=;
 b=OPP9PPX3eurKD3kAtG9ZYJPMsS42yqbJ33GKfos78kRcYOpZAq95WwmQI04CdWhuu8WG6N
 cQ4BMISCaCCqNIAgzxLiSmwmnoA197x1lU6x1ko46an+XrT1HnrndVuya/g6EzgZ/LP4f3
 CYEPpWpHEuuZYNXKJHm8BSkttrRarSc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-9Lm-PZkSNS2GksqrhUtGdQ-1; Tue, 10 Nov 2020 11:02:27 -0500
X-MC-Unique: 9Lm-PZkSNS2GksqrhUtGdQ-1
Received: by mail-wr1-f70.google.com with SMTP id q1so5871915wrn.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=msRONXsJPEOWpDURpnGu5FThX3ahWjyI+XOFO40FHAk=;
 b=GMynK4Tf2uKk/etSUxuPjQk7cvlGZln4XFnhdhBGzr+SvB9oO7DTbVPDvDCJQZDc0N
 r3i+G7M+8kkdCQTzvbBszfGHV+nkKPq8kSQ/5Os2i6WAZ94h4lwklDIdwyZqfLoKK9lR
 /YTJ2n+abk3ZBQzjaND7IqIFn4B/NJqcGbaAnTE0Te20GxzHeoGs0GlbAek92aj2Qq+J
 cayXlkZOkpu5zxA4VdO6IWtpIouXJID3hNdzKezaR6QkZ2f2nqAqtgJZQ+X4PzBj+WZ6
 JUvEfYrYI99FyL7+aBOeqSPXGZv9VWuERRQGBqn/Esg/fC6+MakwhKdbRHb9ePCN/gNB
 N7Hw==
X-Gm-Message-State: AOAM530cocxldPVi2uLagNxgtfLZIY02Xd/78OJvqXWM6m1UTiG+TfWB
 1eWLA7eAPt4MCkrPYhIBK4svORc5F8WGxnnynr7dNgQkchTKL57Qld3PcNhwlBlajvQZ1gRhzpR
 o7+1Vu3dp3tgrG5eC0O/jU2JCqHPkvcqqHnt2zexpSJ5GEZABi/+FCObh8tKeIIWP
X-Received: by 2002:adf:f90f:: with SMTP id b15mr25001020wrr.343.1605024144933; 
 Tue, 10 Nov 2020 08:02:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAqVlP68iG89uEcsBsxgiXjaILX8Kw8vDE9NsdHoQAIHWvQ5zJAAntvyh3gPGCrhfUYt2hjg==
X-Received: by 2002:adf:f90f:: with SMTP id b15mr25000992wrr.343.1605024144735; 
 Tue, 10 Nov 2020 08:02:24 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p4sm17349652wrm.51.2020.11.10.08.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 08/16] gitlab-ci: Extract common job definition as
 'native_common_job'
Date: Tue, 10 Nov 2020 17:01:32 +0100
Message-Id: <20201110160140.2859904-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the common definitions shared by '.native_build_job'
and '.native_test_job' to '.native_common_job'.

This will be proven useful later, when we add rules common to
all native jobs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 17520640d7d..7404f95bebf 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,9 +13,12 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
-.native_build_job:
-  stage: build
+.native_common_job:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+
+.native_build_job:
+  extends: .native_common_job
+  stage: build
   before_script:
     - JOBS=$(expr $(nproc) + 1)
     - sed -i s,git.qemu.org/git,gitlab.com/qemu-project, .gitmodules
@@ -35,8 +38,8 @@ include:
       fi
 
 .native_test_job:
+  extends: .native_common_job
   stage: test
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
     - cd build
     - find . -type f -exec touch {} +
-- 
2.26.2



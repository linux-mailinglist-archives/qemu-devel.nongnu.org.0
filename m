Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD042ADB56
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:11:13 +0100 (CET)
Received: from localhost ([::1]:39148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWEi-0000JT-3f
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6e-0008R7-Vo
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6c-0003iE-7T
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjkUheSGP+QsaSF+cD1Dz8cy4IOz1LM6HlmGf7mXv2c=;
 b=g0JjAM8eP3l5IaEdhyvZ1HPiRfQpzXir8FTMKYNyowCf0l5qFLAkuhE87K94CtjQ9SDIt/
 zN+hlWOQhvqqSCYUrG2Q78VF0oHwrQ+2FQC8jGE8fwaL2oI7mwMTvHe+ilnADF4UGpB8ur
 xjIEsBPNXae1gL6FPoJFik32ZZHpzHU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-eFVxUMCXOfC8OIgV4ZvLwg-1; Tue, 10 Nov 2020 11:02:48 -0500
X-MC-Unique: eFVxUMCXOfC8OIgV4ZvLwg-1
Received: by mail-wr1-f70.google.com with SMTP id q1so5872431wrn.5
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjkUheSGP+QsaSF+cD1Dz8cy4IOz1LM6HlmGf7mXv2c=;
 b=YrPRVGbGj84ohWaNloX4ls9slUBucFv10ADc2cAlnm54fDOiKI8avahUIMfRhhkdkD
 2pfbN5oEVBY7tAY81yK7CimKh4/nXHLFalM0iIDkvlTm6MLlvTcem0jj3PXd+A1GGn/5
 c1ZIdX+BYPwQklzB+id8Qzz6hl0ffwY48O0ZZvwOvFVhaGckdP2Tl7tlbWysWxc8afNX
 XkhJzqMMP1ptW5/HjUmItqtj3LnjitYAEjUqhsgILtSYo4Q21VhUwf/9soMtm/r9fLLs
 GrKl6LZQyez9eO8i3Jj/B91JYCBe8f+u9WItFSm3I15HTO6Dyat+L7oo6jUP0xtLlD6B
 PF7A==
X-Gm-Message-State: AOAM531WiM9T88PE5Slpwo2oQY0wVmbcjgHKp//upQF5vEtdQPeS9cD7
 KySq1z+8xXYL4cV1kSwkG59DkhKcZxLW4RDmITHwsb9H+aAiCkpvZTuGdf+WTbt7JIH1fk7+DXF
 MeKtd6Y9b6t2I0oHPFXXwHhs35WL+2lBvMmvztzUWF8DZUkXdVdpdqm5QqbLPYv7L
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr14465635wrm.403.1605024165865; 
 Tue, 10 Nov 2020 08:02:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypA7DNWOZLbpOBiIYmpszroAZZeKpgFcSG8awv3dZtrnXcSGOrsA3UxEl/FHq8EDvJwIRMJw==
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr14465609wrm.403.1605024165689; 
 Tue, 10 Nov 2020 08:02:45 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id u81sm3695157wmb.27.2020.11.10.08.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/16] gitlab-ci: Mark Bin Meng maintainer of the OpenSBI
 job
Date: Tue, 10 Nov 2020 17:01:36 +0100
Message-Id: <20201110160140.2859904-13-philmd@redhat.com>
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

Bin Meng added the OpenSBI jobs in commit c6fc0fc1a71
("gitlab-ci.yml: Add jobs to build OpenSBI firmware binaries").

Cc: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/opensbi.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index b1fa244fda4..94f8d157144 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -4,6 +4,8 @@ docker-opensbi:
  services:
  - docker:19.03.1-dind
  variables:
+  JOB_MAINTAINER_NAME: "Bin Meng"
+  JOB_MAINTAINER_EMAIL: bin.meng@windriver.com
   GIT_DEPTH: 3
   IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
   # We don't use TLS
@@ -32,6 +34,8 @@ build-opensbi:
    - opensbi64-generic-stderr.log
  image: $CI_REGISTRY_IMAGE:opensbi-cross-build
  variables:
+   JOB_MAINTAINER_NAME: "Bin Meng"
+   JOB_MAINTAINER_EMAIL: bin.meng@windriver.com
    GIT_DEPTH: 3
  script: # Clone the required submodules and build OpenSBI
  - git submodule update --init roms/opensbi
-- 
2.26.2



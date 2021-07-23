Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B201D3D392E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:10:28 +0200 (CEST)
Received: from localhost ([::1]:43784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6t4V-00021x-NU
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2O-0008Kg-C5
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2M-00010r-QK
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627038494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8MzHpNZAnKpENgpYi7cnpOvXuv0pKcpWhVnCTIEAsU=;
 b=OyAGK3sd2uw7bWmckZFNXj8q1/J0Zf5wO/n6oyy+W4ebh7ayyNrrs0jtttOI09sBGbai36
 JUFErG0E9tLGog1D7Ncv249Ww6NQ0U2WvugPxBDricJREhsDGhvit04DyLCiQyn26XNaqE
 cnshmoGv+7T7vjc/nvBaK/UFSxVhetQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-wszEulpCOSmQUs-uYTuHVQ-1; Fri, 23 Jul 2021 07:08:13 -0400
X-MC-Unique: wszEulpCOSmQUs-uYTuHVQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u11-20020a5d434b0000b029013e2027cf9aso859379wrr.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8MzHpNZAnKpENgpYi7cnpOvXuv0pKcpWhVnCTIEAsU=;
 b=Mg9bnMiW8g6aPOogjTQJBquvZviCUaCVcdmk69JxRvrsnEIaUPUObd1x+nxy3uVWcD
 hW9Ks9F4lDJoUFG9Qy4nPI2jhEN/LG1P5T43WpE5gpeN/3SB9JEzo8r0VnFXKOB5EYzH
 uM63wpUMj8Cw53+jxdOW+oy/no0L1uAaoljGYPZpd3+rcWZIbWtci4iNEXQsuPh5j/i3
 gI7zfa0XGT1HV1Epu/Nsd9DgiCMUHZC53t3kG3wAixjNIQ9rzNJgneBz3X6cq/DKQJaF
 UEvDk0TkLbDmeJaUtJ0g2NqK6vWDFVGgvWjt4Qt6KZjo7nlaeXPQ57KvjdHriONo4Z7A
 dckw==
X-Gm-Message-State: AOAM533o8i67pxHbTExNUqw5kIAPN/HpJMi6FsDkIUK1H20si7/16eUm
 Jk7yjlCws5G5cbeLG0I8rLsn7tBOEggsZ6VA4ymTjDl7PzRGvRWGW0qTewEIDOCYqvyxpc8RLE1
 w/asj+yrwN4IBD5FgUdiVWQNIClMSChZ6zUz5qAXo9X+YmYzsrRb2QE1t0Q4J7Y1j
X-Received: by 2002:a5d:4010:: with SMTP id n16mr4703110wrp.142.1627038491958; 
 Fri, 23 Jul 2021 04:08:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyzxjfYrFb6YXdKI3FuaKZZGzKz5awc0OnzJj5PlESIoVPcV1ZPhyUj/nONmLtDglRp+09MA==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr4703072wrp.142.1627038491670; 
 Fri, 23 Jul 2021 04:08:11 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 d203sm179149wmd.38.2021.07.23.04.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:08:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 2/4] gitlab-ci: Fix 'when:' condition in
 acceptance_test_job_template
Date: Fri, 23 Jul 2021 13:07:58 +0200
Message-Id: <20210723110800.855648-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723110800.855648-1-philmd@redhat.com>
References: <20210723110800.855648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep
running jobs depending on it. The correct condition is
'when: on_success'.

Fixes: f56bf4caf71 ("gitlab: Run Avocado tests manually (except mainstream CI)")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 3e3e19d96bd..fcbcc4e627a 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -73,9 +73,9 @@
     # in its namespace setting or via git-push option, see documentation
     # in /.gitlab-ci.yml of this repository).
     - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: always
+      when: on_success
     - if: '$QEMU_CI_AVOCADO_TESTING'
-      when: always
+      when: on_success
     # Otherwise, set to manual (the jobs are created but not run).
     - when: manual
       allow_failure: true
-- 
2.31.1



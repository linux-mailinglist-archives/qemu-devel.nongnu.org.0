Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4293D5C97
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:06:33 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Bc-00034K-Cf
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829t-0000ZI-4V
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829r-0003Pj-MC
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0o9YfL6QBLdwGLccWgRGPd+3MwWXJfOAk1JmzEO6pGg=;
 b=Cco15Tn2y14Sg6GsqHcDPZqJ36OlegVC1qAyMUUewZH3V/NIPNDYtEhlNrBWIwmps7cqiV
 /lIVHsFcd5vUEWe2HgXeK8OwSjf+tNGOwW1tF50nkNIuxJF5J0B1DU7DDlPxUJ5Ci2AqmU
 c4cyvr1THg6PfUI3NsXDjIQDLP5OuBs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-oOtPmvaAP7avkVXAbAdXjA-1; Mon, 26 Jul 2021 11:04:41 -0400
X-MC-Unique: oOtPmvaAP7avkVXAbAdXjA-1
Received: by mail-wm1-f69.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso285224wmm.6
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0o9YfL6QBLdwGLccWgRGPd+3MwWXJfOAk1JmzEO6pGg=;
 b=QyN79gsx9CkKR2QKifxuFtqMj81ziD20x/mgOibGpJVt87v5Q3zbmobQE3exnkGIjW
 Bw4G8SErkVbMaW63ElOH+1CkwARrA/Dwa8lKtXdhAzVn1XpcxpJJHOatunfyB01iuOqg
 5ochd24bCZFNTmvxdS597bxRIFvLRvUzJi/dxsdAEghT7P3h5GH1SW18t97qdoI34hJR
 fuVbAYAkMnJ3tif9Tdilhggbq765rvE3ds4cyP8XJZ/KOQ4SmcAUmpkn6iIE0rxxP5XK
 soSaW2Jm/jEf17FE1NQ6w/50SRdvIMHTmEvROpQGdfotNuvKmOr4y6ZWAF4VKeQeq8Dl
 7iyA==
X-Gm-Message-State: AOAM530KGB+pGslGA15OwLvemCLCp8QDZM6bNX92OmlX15l8DFazQEJ6
 JeHsnRdzGdv183kbBMLX57P6iTkfIDhD0cFge96NQbBKCXUlZIItp2f6l7MKn5n/RwOTx1HJeil
 90S1DObTfbf02sU6Z1n8MmsB4Cb/8okSnbaFwpfCfB7H0J1FpFMRYX7QZa4FiPW7G
X-Received: by 2002:a5d:6850:: with SMTP id o16mr19140266wrw.319.1627311880347; 
 Mon, 26 Jul 2021 08:04:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZHtFlUA4mAo4wyma/3yuUV9Ccg1h2zGwVSqUrvQcps01MVuOTB8rRk0/A/ZD8i0zrduJpOg==
X-Received: by 2002:a5d:6850:: with SMTP id o16mr19140241wrw.319.1627311880200; 
 Mon, 26 Jul 2021 08:04:40 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 x15sm51069wrs.57.2021.07.26.08.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:04:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v4 2/4] gitlab-ci: Fix 'when:' condition in
 acceptance_test_job_template
Date: Mon, 26 Jul 2021 17:04:27 +0200
Message-Id: <20210726150429.1216251-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150429.1216251-1-philmd@redhat.com>
References: <20210726150429.1216251-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs depending on another should not use the 'when: always'
condition, because if a dependency failed we should not keep
running jobs depending on it. The correct condition is
'when: on_success'.

Fixes: f56bf4caf71 ("gitlab: Run Avocado tests manually (except mainstream CI)")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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



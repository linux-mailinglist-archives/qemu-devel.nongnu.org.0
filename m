Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17FE37B588
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:39:51 +0200 (CEST)
Received: from localhost ([::1]:53464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lghb4-0003Qp-ID
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYj-00013D-O4
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lghYi-0006V0-Ef
 for qemu-devel@nongnu.org; Wed, 12 May 2021 01:37:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x5so22274717wrv.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 22:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bp3Jtw7C12/rHMWvD6mwBuDijE8hJ1LIDyBcdtavfR0=;
 b=t8T28AY+FdbEwu5EBAwRUTJW8quXTPh6JSKAE2DfJthIhtR6L6s+lOR6RbSknjOPvC
 aQDGOqkDEbHL+b28tDsP+f1Z7XGKpNykzHoiRZW721Hzv6BVmqwqtqB2F85glreURnKd
 aIO3ItioeloO5V1ZrKqXYHYHPrEtiinu2J8dg+F4BGtRaT2XDkM0sZW72UlgFQeUlttz
 haUNUXA2fyYM5I2j3bUjKEeqsa/FSFoQK1/ti6psarNBnkofMa/IPTqIP0pKwe2AjoNM
 icEZ/MaYrm+CqUndWUomNQZ0DAdDcNW2YzBKvygOdiqNU5mZGfJ7WfiWUOtka4R/eB4k
 UPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bp3Jtw7C12/rHMWvD6mwBuDijE8hJ1LIDyBcdtavfR0=;
 b=kaEgTD5Y0XbyL5xjWjMH/1P7458dvVDWuPqgsFxjcWKwdkjHyB3mQDmfm9CyU1KEox
 fkPR/CN2ziU0+rLoA9YrpF6g3rvrJSAjRHS/ymqnFJmKnjFBkAo4tUra4B4XRQFFyzwR
 lLKj5z/1J+WQYuS6Mq8xldWhq+Z5cBZik1uASJf9/Z6fSb7lcqQcigyuJKWnBL3dWMYm
 XKiMrmwXp8rFF7SJpMUp8CH8F5ny+hyzZELMspbwVz41qzAX+RRT5VjAz6FhMCWJ3IUk
 /TABCw7IcuBuVjQ7vwZh6rtg31knu/2wvr1e9zOB0Dq+wMkV/dalznsdDg0go2m1SB/q
 NEbg==
X-Gm-Message-State: AOAM531czjgrW6mTqMYAc5MlQsIN/HT45wMXKxGluJvTPHmi3uq99kbO
 fnKmM02GJigEjUdOwQgDJEMVRs6hY1KpsA==
X-Google-Smtp-Source: ABdhPJyY29fWyOzIAxzQ/+rqBzDDAlA62cnateuuBu5X4ST3wAH7RR40BTylQFiLvwwJrEYzduJvGg==
X-Received: by 2002:a05:6000:1567:: with SMTP id
 7mr43047983wrz.300.1620797842988; 
 Tue, 11 May 2021 22:37:22 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t11sm4359041wrz.57.2021.05.11.22.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 22:37:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] gitlab-ci: Extract &environment_variables template
Date: Wed, 12 May 2021 07:37:09 +0200
Message-Id: <20210512053714.3268162-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512053714.3268162-1-f4bug@amsat.org>
References: <20210512053714.3268162-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to set the same environment variables to multiple jobs,
extract what we currently have as a template.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 32aaef1a213..58b01744751 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -1,8 +1,11 @@
+.environment_variables_template:
+  before_script:
+    - JOBS=$(expr $(nproc) + 1)
+
 .native_build_job_template:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  before_script:
-    - JOBS=$(expr $(nproc) + 1)
+  extends: .environment_variables_template
   script:
     - if test -n "$LD_JOBS";
       then
-- 
2.26.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6D3D3930
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 13:10:34 +0200 (CEST)
Received: from localhost ([::1]:44176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6t4b-0002H9-1M
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 07:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2S-0008UL-NX
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6t2R-00014q-9h
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 07:08:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627038498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XidfJlF9uLw0ONlJoTjRYGZYc29iEXG+CBqqwyBgpGk=;
 b=H26cPRA2T9rYZv0qxcfkmkssvWgnOiP5ZBj1wrWExX+29DcOFlYptvN3J7C1Nga2RWWY48
 ewElNWPqtlMEGv3ePyBNP98xjpF8Cs1PI7lyWpNd8q10gj1AzeOmvnuiiRHtYBHwua6DfM
 fZaCMu3fIF0fAf6v1A0mAbB0TBtL6Aw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-SedXIzv7M76sCl5MK_DsXQ-1; Fri, 23 Jul 2021 07:08:17 -0400
X-MC-Unique: SedXIzv7M76sCl5MK_DsXQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p12-20020a5d68cc0000b02901426384855aso856773wrw.11
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 04:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XidfJlF9uLw0ONlJoTjRYGZYc29iEXG+CBqqwyBgpGk=;
 b=I4/dN9LCbdwUD9tv9p0iJ2KoU4oQ2PJ27b0rerK+EAOFMA3d20LtCh+1hW4yHaeMi7
 mzvxtcoqrms6WLNNbeDgqHPT6Ov+am16AMmBgV6JaI+r8WIAS9SAtV+L/bedq9fcq28y
 2T8zQ4rQK7sC0xkjQ3I9dSB0ZiGsLbUua5PzdfRV3PqXtHcA5vT6LF3touJmZjUfeoCl
 HVrNdYJX9obE8CzLV8YZ4xmPx4HKxl6mmOm/J2mVQPNn+c8d/tza1bUryhFoEwoodogF
 8+zRmsqzw4ajoujxB/xcZYMggux1uJls17hEXq2Ucw9Vczcwu074vk0cMO4wKeJUuCJV
 ZyQQ==
X-Gm-Message-State: AOAM5312Zh5VnhzMosxHNpeq7NJt9XclTmV0FE3H2hq2OH4EBVMC1qau
 lOCHk6W64RuBS6g454Db6WN/hu7DFKEAF1d9ROqDQ5LLdg/gQJ96x9ub7aG0mJ9ilZ00dxlGhS7
 Ztfayjp0rbotGZa5sIvbQj4gZi+o/TU0+IOFZWfnDvkn3i4YlMXAwcCewyGHIEouJ
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr243047wmd.103.1627038496383; 
 Fri, 23 Jul 2021 04:08:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyev2IvkcNXfbbBaa+H25DPErEH/dkOuryws+ARsaH/OFnHtfOHxpbWWxNt84luxEZ2GYPKww==
X-Received: by 2002:a1c:1dcf:: with SMTP id d198mr243018wmd.103.1627038496162; 
 Fri, 23 Jul 2021 04:08:16 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 a10sm32157785wrm.12.2021.07.23.04.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 04:08:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v3 3/4] gitlab-ci: Fix 'when:' condition in EDK2 jobs
Date: Fri, 23 Jul 2021 13:07:59 +0200
Message-Id: <20210723110800.855648-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Fixes: 71920809cea ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries")
Reported-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/edk2.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index aae2f7ad880..62497ba47fb 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -8,11 +8,11 @@
    - .gitlab-ci.d/edk2/Dockerfile
    # or roms/edk2/ is modified (submodule updated)
    - roms/edk2/*
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
-   when: always
+   when: on_success
  - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
-   when: always
+   when: on_success
 
 docker-edk2:
  extends: .edk2_job_rules
-- 
2.31.1



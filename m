Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C33D786E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:26:44 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8O2d-0007ve-6w
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0q-000537-Qy
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m8O0p-0001q8-6Z
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627395890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMJrXb+PFcst+HWZFJy2pURo7XBZnh85p1BTZSd8Zaw=;
 b=GpC8UCdt8VSk2qbzfDEIWNRswaXed5sHT+gDYGzuc0Ukq631jMV32i//LQlY+MXiV7YP5I
 I0SEIImabQ70m2pcG82ZreqJlbNlkOyTrGARc3l0thYoH5p86SjWIRpLs0Gj0zwP2n7INv
 YJ55ZFOvJ0mWLOTvcwWROJxuZtVi7mk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-vNoKblgfNcGuOQa5VkaEyw-1; Tue, 27 Jul 2021 10:24:48 -0400
X-MC-Unique: vNoKblgfNcGuOQa5VkaEyw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1042154wmj.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMJrXb+PFcst+HWZFJy2pURo7XBZnh85p1BTZSd8Zaw=;
 b=kqu+CedMEJ9PN/FbN8Q3eypbfW8iBmpWo/I4nyunPX1xFuOonaEQFNKpYwt0tTZ24h
 quge2bY6+viLMbipxkenqfCfjA8lvM9e+bp0KGCk0/qcjg7yvk5ulAu08R1qvRya2WVA
 af/u1sVxhN6lpZABmA4l/WaihNTrI9KiarZvB2KxMlTK1sOJ+2KDBv3Ipnts/FBcyEYi
 NQVFLNz3CKvKQ2qUA5bUwpWNgRTnGH4rq/+ZGGyOfyp1fmunbEfXtqJMugyF5L3nyEDC
 ZqkXZSHn6cDwSV2g+t86VUCjiNhBvL10E2Dalh5BTPAg49FnXfqJFFT9ObElGWLOI3XF
 i4MA==
X-Gm-Message-State: AOAM532hb44fCkMNGovSIB8xXrP43V7Vz8iFyohIPhrjiztIQn2pj/Ql
 /kP84qRSCYNxiddRxoCYoDScWrlSxWb53LBuGoVGChbAriGQUEJ05Ej1d0HEqf6owu7JnegZgeL
 Dm/2mc2DWGyOcd1QIwOxgjb05SMRtfdKEFLQFtHwTq0vELQG0CbHqqORlWpKBJDmn
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr4522412wmq.31.1627395887478; 
 Tue, 27 Jul 2021 07:24:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuE4bSib957DNFW9/g8fLZdVoDUnKyzOOKvoqS1O7Li7n97dr2AZ/o0zPFOTAVx4J5xyk+eQ==
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr4522391wmq.31.1627395887334; 
 Tue, 27 Jul 2021 07:24:47 -0700 (PDT)
Received: from x1w.redhat.com (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id a8sm3273803wmj.8.2021.07.27.07.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 07:24:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v5 3/4] gitlab-ci: Fix 'when:' condition in EDK2 jobs
Date: Tue, 27 Jul 2021 16:24:30 +0200
Message-Id: <20210727142431.1672530-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727142431.1672530-1-philmd@redhat.com>
References: <20210727142431.1672530-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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



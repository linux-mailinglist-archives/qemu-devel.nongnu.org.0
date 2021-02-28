Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B7E3274D2
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 23:27:54 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGUXZ-0002Mu-Cs
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 17:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTO-0006uY-Nf
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:34 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:55323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGUTN-0005bq-8x
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 17:23:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id w7so11836202wmb.5
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KqdH1ZC9HLAZ6L/AHjwqpygalbv++M74nPdENf9v560=;
 b=ce+yjoVjnc4hb6eR/wrhHiiaU7OO5p/jrw4VbPSxwPXig59SEcQ/V1R7KieyhdiD5Q
 op5mLFot4GexCDvf9gsz4JK33ceEVYoE9QfEhIByTYhYsnSWwQExXRxvvImD+4XoktaC
 +aKrzTYy5d28H+Ja/oHOoWYinXIOkP51IfuhTVXGkqbf2gaEHeBUV4Gg5+DsxAimmf/R
 Wn9n0MeCfMhG1s7DMziKh4f31Qnkwfe9xpagg0AAXX0YrC8KIxLdAY9D6W6teSkyEwfq
 620SzcoznqhkDd5WALUjPf7aUTQnWv39KfiiEYlJZ/GNlnE7NP7ccW1Ho9hJXLXv59gP
 ZE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KqdH1ZC9HLAZ6L/AHjwqpygalbv++M74nPdENf9v560=;
 b=aahyAPXiw4Y1cvgq+tOZJwWyJa10DldwAeQDUnnZn4OuL8K68SpF19M8wm793eRWps
 kwU4ENY/gufrO91AY/awREYOe9hlWHR/Q1akC6bE4ihTduJ24MfyWnGlohuuww7BZSJ7
 MKxooCyrQHLeNU/UGx6q+hKmQ6SFx3rUdaHnrQHTOQpt28rsOWPj23qdkVSXc4m8UOZR
 Dt3nrvQddQWN7JiT2Yigm03pHWc456fe01Qa4bgx/v4isi9fs8j5Ye1hPV50oWrdCReX
 P3rWSIJRuq5vIUmXk4hfDe7/gSSvoc2DXeXYXQ0VG9W7jAkkpRJXpO+tgckZlQrpQQpJ
 zIaQ==
X-Gm-Message-State: AOAM531nks0HUWW+qxcx/V1+YhyFl/rSOnktGju4kyx3PYzGOmL99HKz
 oBRBJ0/NY674N4b8cC9PAz3TWMeXAv8=
X-Google-Smtp-Source: ABdhPJx0+ZlglSjRbgKv0Wcu7mFjF7KSkbmIhYG55NNXGDxPBHSBYYZzRm3jE3134c9gbdiB8zEotA==
X-Received: by 2002:a05:600c:19cf:: with SMTP id
 u15mr12781447wmq.41.1614551011574; 
 Sun, 28 Feb 2021 14:23:31 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q25sm19914929wmq.15.2021.02.28.14.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 14:23:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] gitlab-ci: Build Hexagon cross-toolchain
Date: Sun, 28 Feb 2021 23:23:13 +0100
Message-Id: <20210228222314.304787-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210228222314.304787-1-f4bug@amsat.org>
References: <20210228222314.304787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a job to build the Debian based Hexagon cross-toolchain image.

This image requires a lot of compute time, too much for the common
shared runners. To avoid having the job to timeout, it has to be
built with custom unlimited runner. For this reason we restrict this
job to manual runs.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/containers.yml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 7137cc4184d..ed57e02e769 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -103,6 +103,16 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
+hexagon-debian-cross-container:
+  <<: *container_job_definition
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  when: manual
+  timeout: 3h
+  variables:
+    NAME: debian-hexagon-cross
+    EXTRA_FILES: tests/docker/dockerfiles/debian-hexagon-cross.docker.d/build-toolchain.sh
+
 hppa-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
-- 
2.26.2



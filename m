Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A139538F207
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:08:06 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llE3h-0005EK-Lt
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeW-00057C-RN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:11 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:44966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeP-0004QI-GH
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:42:04 -0400
Received: by mail-ej1-x635.google.com with SMTP id lz27so42791586ejb.11
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUnKL2VXbLNe+f5e2NHSjlxFTJniYAMGMbepsJUE2wI=;
 b=ocN06fzb9xAghfKLNL1YL4HhV3rZ3/kkDUUD5rNVMCnqvIgZlZeFF4EcA8jQuTaT98
 tK6GrgNgiLmKQfc+yKgIv8JSu4/+K5hErKUStdea5LQlqJVp1G+VRjuxt3woSDwDhhuz
 QhdrHJNgGu72jhxMY2mWPkqyLNSLEXbi3j2km/jOFh7lwk/9qWRWPdBTnsTV+NvC+vt9
 x/EIDyDMnOn2aSNH/K1CUSoH/V4syyUIsDHK4CS5hDYN3mPGNtngtGoXyu9sjUWrorzE
 QGnPDuXC8bzdXJztzXLihsrNzz16gdcgh6MchrrK3KmH6J8BNLnKei2fRiU0aLbYSiVW
 BFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CUnKL2VXbLNe+f5e2NHSjlxFTJniYAMGMbepsJUE2wI=;
 b=PxPWupmCPnWZW/J51iQk4QRuiiUxCYj/hA/RhNTGqPcJ4L3V0pUEYDThs5KgVNVxZW
 cNcetF0yKFYSrqsPKALsXHVWB8T+nl08VlNm9h+CNNP+WCR4x3UWFKuwCXv2vMzzF7ev
 faTGnvYlpPHLeb04lU9NodbXSj/6dAR4YWvMpzRsEtKF+NISXw19t7oV5MulqqdTRYn6
 lyojbLoVSVkWGpzXYsoWFqvk3935PNJdHYFB9wWpcUfxqRUKkTXgPtkOLH1NACiYqygI
 KprvaETxbJqBj2IsCBnRfhVFx/9wQHStTVV2Ld8gbfT1mSecZgCvHsMAgtjoXnngRA/p
 Yu+Q==
X-Gm-Message-State: AOAM530h7BSgmlijDW/tIbKavKUtzkfAv+DVTdeGu5dgiIWvYIyDPZWD
 f5js6U78arfmE3UWRwv7XGaxj/ljux/P0w==
X-Google-Smtp-Source: ABdhPJzii5HErbifEbIp/TFXHyn11LtQyholr4tQzUrmtATXbt4L/0yw6gHHINMXzzc98pTcL3dO5A==
X-Received: by 2002:a17:906:bc43:: with SMTP id
 s3mr24579847ejv.76.1621874511798; 
 Mon, 24 May 2021 09:41:51 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.51 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] gitlab-ci: use --meson=git for CFI jobs
Date: Mon, 24 May 2021 18:41:31 +0200
Message-Id: <20210524164131.383778-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ensure that the meson submodule is checked out by the check targets,
as they will need it to run "meson test".

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f718b61fa7..a6290d43bc 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -27,9 +27,9 @@ include:
     - cd build
     - if test -n "$TARGETS";
       then
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS --target-list="$TARGETS" ;
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ;
       else
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS ;
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ;
       fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - if test -n "$LD_JOBS";
       then
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67804D16B5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:55:26 +0100 (CET)
Received: from localhost ([::1]:45708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYR3-0004eC-PM
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7n-0007st-J9
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:32 -0500
Received: from [2a00:1450:4864:20::62a] (port=46634
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY7m-00061x-71
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:35:31 -0500
Received: by mail-ej1-x62a.google.com with SMTP id qx21so38501122ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2EWNx9oBQd7VD3zT0pyDj06sfYhM3+NSwBMbPhDSDAI=;
 b=G4fwL4vQ3vCX97KA3mYgHClvRoXYslfOGOCO6LYxPTwF5VIhVg6BFYzY+3bgMX/q2N
 9hQj9UIjSwPbAl01zdG/f34pC9v32xwG7X8zg61839gjX3o6ShWk5A+ngDgEcEhSnZAh
 t4bhea3aqvzKlbJzT9LM7tHuSHBYubXlVD52n0NKx4V5PzXSIv0fd13yqsgJf/CS2qB+
 MCKOywFmKH/OEANsmrIoXZyJy+fKYfSWV3dSuv29M3ERwgagCJ3BkgQPjAXVKA9jak7e
 hQGh6jLiIitWt9GVdIQN/jLwuDn99+NYeB3sxGAqmbM/EqtQK1+ZPjafS3FJ34C4wjMm
 qO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2EWNx9oBQd7VD3zT0pyDj06sfYhM3+NSwBMbPhDSDAI=;
 b=PcKRNbCelF7UfEzJJJ6k6PmdvDBfOMYafa1/sOJN8RR71EqiCRoqBEPbDakG+Hbazz
 m90j8DftugbL0F8dB//Q0L+jrtTVUIM5JxOsjitjIqklfNarFKfvmpHPPZZrFfJnUGX0
 z7bA4uvlFZ0iyZiwToA7nd4z9jakviz0pVn4Y3EdpStu5iO35fDnEdjVhFtdudruh7jM
 IzXbK6nKQNwyQdzgiZ19NJw6nmz294JbTwHYglz6pyeFTubTcjVKfBZtICzgOmh/+g7Q
 gYuw9EAPKAbiaG5Enoid3tgjNXb4sqVO7tshI3cSfbVmZx54+OB/8QpPOnI4RIPZL2z8
 zkQQ==
X-Gm-Message-State: AOAM531GTbDFY6p5567kEaC/rI1aXr8iHKUJOreAYKW3uDn2HTaXwIpW
 r60AuSqHaoVDle9UDOLllF1/z7Gk6xA=
X-Google-Smtp-Source: ABdhPJykQcAxNZ7+YAi9kQuYg/5anzlEenLTWw480eIQywSfZHHGBex5wXA9tzyQ4O4zumrPoU+Aqw==
X-Received: by 2002:a17:907:970e:b0:6da:9224:7fb3 with SMTP id
 jg14-20020a170907970e00b006da92247fb3mr12941507ejc.502.1646739324859; 
 Tue, 08 Mar 2022 03:35:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7cac2000000b003f9b3ac68d6sm7491868edt.15.2022.03.08.03.35.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:35:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/22] gitlab-ci: do not run tests with address sanitizer
Date: Tue,  8 Mar 2022 12:34:45 +0100
Message-Id: <20220308113445.859669-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308113445.859669-1-pbonzini@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

This is flaky and sometimes fails or hangs unexplicably.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 0aa70213fb..0aea7ab84c 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -515,8 +515,6 @@ build-oss-fuzz:
         echo Testing ${fuzzer} ... ;
         "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
       done
-    # Unrelated to fuzzer: run some tests with -fsanitize=address
-    - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
 build-tci:
   extends: .native_build_job_template
-- 
2.35.1



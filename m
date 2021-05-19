Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AFE38965A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:14:44 +0200 (CEST)
Received: from localhost ([::1]:52968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljReV-0000vq-6U
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:14:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCh-0000A2-RA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:45:59 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRCg-00057U-Eb
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:45:59 -0400
Received: by mail-wr1-x432.google.com with SMTP id y14so12989869wrm.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bp3Jtw7C12/rHMWvD6mwBuDijE8hJ1LIDyBcdtavfR0=;
 b=eRL1oQ7k4OAZrjzf+Cg9MhvHn1GF8kARINOK2hGKPEP4RKhMalANhvSyQ1LfYOz2EZ
 tnzTp0EIaDdz+PnHDJ+NyDxFRhFcGOk1b/nCvqLKODj5lQxswYQ6u8mcl/eC1Nt3OohX
 1BzPAlAn2/fyEv6juCsszphSwRCeZyOY+nQMKVYdOfI6B+/K5SQ0yKABnocXJGB1bMqx
 BX9/NbA7tkga6mO6eSvHpHZIDM3sXU/AOl5omEiildX8W7AAj+AZmR8Nn+/v6LrWDAlb
 SSHsFCw6CyRm7CO8She88lO9E4TNiefNK77TizyHHlFwc/wYhhU3IGTOaUps9QDS6aEr
 8/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bp3Jtw7C12/rHMWvD6mwBuDijE8hJ1LIDyBcdtavfR0=;
 b=i9bT1KjO0/jvizGMUfbuDmfeda8BFZqKuiy3rLywTAX16dHAEOnl08/15421F97xbr
 oXD12+SVGdkejdT2wtKuk1N6E0/+Gba9AuEQq/hT2IUqIwN7mKhKYcSlTqMa+SNDIfqY
 zy6mP38LJ+oieCDdgA+cLiXwzmtYKyOyuN/tECqHtP0sgaNAWh4rA4p52TRAONWGrTah
 PgeGBlL7oskN/748GDmd8FrXwlU2DJx35PIanGsHmSoalpCFHwpXpDt61rEUdq2GU2xB
 S9P+bCWLHX+ESjsPMmqfnWD7LtJh5vApl/j8A0D7+YdCxsZrDD60A51eKs0cS8IlJH4Y
 A8aA==
X-Gm-Message-State: AOAM530w2HZeeg40AwxW5BitIR9SWP0Hjxg0HzOOcO1XBCOdB0Ob5zof
 fQkP5AXMsOIEtLzDnTFy73MeFotGzZHSNw==
X-Google-Smtp-Source: ABdhPJy98CEDzJcOVI7pOSMEaz4qPljb431cmvTUb7YZrx6XitouBehjvbGdJMHDDKnHlX5qP85hKQ==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr327405wrj.119.1621449956622; 
 Wed, 19 May 2021 11:45:56 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id a11sm247625wrx.38.2021.05.19.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:45:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] gitlab-ci: Extract &environment_variables template
Date: Wed, 19 May 2021 20:45:44 +0200
Message-Id: <20210519184549.2192728-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519184549.2192728-1-f4bug@amsat.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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



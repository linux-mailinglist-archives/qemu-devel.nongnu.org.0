Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94555364CF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:39:02 +0200 (CEST)
Received: from localhost ([::1]:41088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc3H-00038s-KA
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0Z-0000Fz-5n
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:11 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:45725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0X-0002PB-F7
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:10 -0400
Received: by mail-ej1-x62a.google.com with SMTP id jx22so9411759ejb.12
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KErS81Vgn7Lot6IwUz1wFytdX1v8OwH0xBAlcOsRbgQ=;
 b=x7+oP23/w+eeCrUfBoOEskGYLJgHq2dHZYZ6FUy3NoFZokguyvIFrQ94GRQBVbIGx3
 0KBCp1e27NOpEGAOrVFPZL6DQb4RVMILn8WLlS0kHQmV8xLPkZljS2Dz9Qc+62/jjE8T
 I0FH0VV1lHLqIMyyCCNvEbTBEomEuYz3J0VC+X30g/sIlpSmRSpJJ5oUXyRm75TogkJp
 5Y1EiMh3PyL9X53M0yQp3DMWb62kiAtoWzIcX67JejiI8aN1kVXkPxYzQGlvoK6zfWfe
 R5wWsZW4k7kYxKmdWSGvKUxhzAc2uWT/BgWGKvq3ANo7KDz+KUiJk2+Z9SUuPovI/trV
 o2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KErS81Vgn7Lot6IwUz1wFytdX1v8OwH0xBAlcOsRbgQ=;
 b=C4NcXWXwfoLuJ5cHfPurOkXKVHROGIq4xdoDX9478L5V2WbE/p+I3/um0wxlvZztAM
 J/RscmKs1sx+moiiDdA7gnco2nlkNaW64tthfqx1RwsFPxeZkphgcmvdrWycDw5DY8pP
 vmEYTcx/chtQActzXpFKUS6V+W9iKRnFguQ+/T7hX3rR9PB/mgPftlKlKneL8lcL3U1H
 BvJdqJxaPNxe68M299+usDKGxZQEt3r8EmUGIMzG/VCmSs+pS4oM1m4xqKWJoz5PfmUU
 ph0CKoz9irJilGZ1xlZ6w7tUDsFIBE0evCrGmsHioEzQeh/EEWmh09bEYjdx1sv7Kjsr
 4gig==
X-Gm-Message-State: AOAM533HQa53JEQclC16YHmAMbJTzmgaDGHvspMdGUiX9aUQWEYbcr+P
 lN9hLnc2Bfxa2dZ77/rmaG/H4E27elpG/A==
X-Google-Smtp-Source: ABdhPJzHBLnB+AUYsmZdd/fglKQtYnUa2tTgXi/I/XRlB+IVAGOBZuSR8UrfIsZpWE63iOPo1/BzMQ==
X-Received: by 2002:a17:907:94c4:b0:6f9:f69f:2fd5 with SMTP id
 dn4-20020a17090794c400b006f9f69f2fd5mr39371717ejc.347.1653665767969; 
 Fri, 27 May 2022 08:36:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x65-20020a50bac7000000b0042617ba63absm2215917ede.53.2022.05.27.08.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C62D01FFB8;
 Fri, 27 May 2022 16:36:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 01/33] .gitlab-ci.d/container-cross: Fix RISC-V container
 dependencies / stages
Date: Fri, 27 May 2022 16:35:31 +0100
Message-Id: <20220527153603.887929-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

The "riscv64-debian-cross-container" job does not depend on any other
container job from the first stage, so we can move it to the first
stage, too.

The "riscv64-debian-test-cross-container" job needs the debian11
container, so we should add a proper "needs:" statement here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220524093141.91012-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-cross.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index e622ac2d21..ac15fce9b6 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -125,7 +125,7 @@ ppc64el-debian-cross-container:
 
 riscv64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   # as we are currently based on 'sid/unstable' we may break so...
   allow_failure: true
   variables:
@@ -135,6 +135,7 @@ riscv64-debian-cross-container:
 riscv64-debian-test-cross-container:
   extends: .container_job_template
   stage: containers-layer2
+  needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
 
-- 
2.30.2



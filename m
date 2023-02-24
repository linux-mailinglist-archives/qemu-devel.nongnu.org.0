Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466C66A23C8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 22:27:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVfaS-0003xv-CL; Fri, 24 Feb 2023 16:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVfaO-0003wE-Ko
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:26:36 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pVfaN-00052n-1N
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 16:26:36 -0500
Received: by mail-pl1-x62b.google.com with SMTP id ky4so861050plb.3
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 13:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677273994;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxs7MpwYKrP+tv/BaMesuw1/gM5ug69Jpg0jF4RGcNc=;
 b=BdWfX+1cjTspIbSaRKkcy0grZZENOZqL8Q2tlU4muvcRx4RblY6QWcTSOLE2krlWgl
 oQVjTkrcfjJaWa2CroSPJkH7r/MCMMiiFn/fzgriq024ZeqcjxwKu+CLyrKJAC4++itP
 aZUAC6rEl8tFSGP6lbVpbj/PhuGLMYG3SqT1tzmenH42cyvi4HgHdt6eNScqzZoEvgS0
 cm+XMfecdZwFoIaqYRRJ3oQWCHTxGMzXLTM8EkYHyKwW5IraxJOAhuCa8zzIcOiQ2LSY
 LfT8+nMtj23hPNMc7E2MdHA0406JDalq+/8qzr/UAeC3kXrgpPyHTXxXeQyVhKQuuf6C
 8wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677273994;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxs7MpwYKrP+tv/BaMesuw1/gM5ug69Jpg0jF4RGcNc=;
 b=D0k/fGhh57ei8DFQZvCwk6KBlSQIuVilOKoMobffke8HQhIZTGr4Ev/KRajCLiWbMJ
 IiiZ3SYBHgimSUKTrCDCa4WBiX9Xl5JZ38gopVTk86hpb/SqmhD+vId+UGpVRzpAWBZl
 ZNHCoxK26m+ZS6Td+05y7GomHr3fH6Hx2F7ccRM30aweQND6DikMn2BvoDa2O5UjovSE
 nRtuS7BGXA1bGcYdzhw7h2ga5zgVLs0dDy3hpTJlTjnakGGxMgaW3JNdhBWsgPsRnAD9
 4pg3F7JRr2OwrmQ4swimDL+C/89QSpV3iNgdUkl9uNq+tpleQoa1E2y7w1WyG/8px38z
 MVyg==
X-Gm-Message-State: AO0yUKUV9fP5IaMBjyNF7MdTs1UKYuxxTa3boCVBTDuTvKGNnVV8HJS8
 oDilJ0AaEWD/XfYEtHJwSv8ErOHtCV/lk+rq
X-Google-Smtp-Source: AK7set8Su/G5H6Zcu2yKZUHVaQIwx7Y9GGGOpnoogaJ4K2Za56feCtd3GXgg+evhV901WRzxIwQDnQ==
X-Received: by 2002:a17:903:32cf:b0:19b:78:539e with SMTP id
 i15-20020a17090332cf00b0019b0078539emr21023083plr.68.1677273993985; 
 Fri, 24 Feb 2023 13:26:33 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 jh18-20020a170903329200b001991f07f41dsm3903404plb.297.2023.02.24.13.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 13:26:33 -0800 (PST)
Subject: [PATCH 1/2] gitlab/opensbi: Move to docker:stable
Date: Fri, 24 Feb 2023 13:25:42 -0800
Message-Id: <20230224212543.20462-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224212543.20462-1-palmer@rivosinc.com>
References: <20230224212543.20462-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,          qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Bin Meng <bmeng.cn@gmail.com>, thuth@redhat.com
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The OpenSBI build has been using docker:19.03.1, which appears to be old
enough that v2 of the manifest is no longer supported.  Something has
started serving us those manifests, resulting in errors along the lines
of

    $ docker build --cache-from $IMAGE_TAG --tag $CI_REGISTRY_IMAGE:$CI_COMMIT_SHA --tag $IMAGE_TAG .gitlab-ci.d/opensbi
    Step 1/7 : FROM ubuntu:18.04
    18.04: Pulling from library/ubuntu
    mediaType in manifest should be 'application/vnd.docker.distribution.manifest.v2+json' not 'application/vnd.oci.image.manifest.v1+json'

This just moves to docker:stable, as was suggested by the template.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 .gitlab-ci.d/opensbi.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 04ed5a3ea1..9a651465d8 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -42,9 +42,9 @@
 docker-opensbi:
   extends: .opensbi_job_rules
   stage: containers
-  image: docker:19.03.1
+  image: docker:stable
   services:
-    - docker:19.03.1-dind
+    - docker:stable-dind
   variables:
     GIT_DEPTH: 3
     IMAGE_TAG: $CI_REGISTRY_IMAGE:opensbi-cross-build
-- 
2.39.1



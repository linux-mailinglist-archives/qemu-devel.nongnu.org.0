Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ABF389FBD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:26:04 +0200 (CEST)
Received: from localhost ([::1]:50028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje0J-0008Ej-RU
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxW-0005Mu-3H
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:14 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxN-0001SZ-5V
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:02 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so4827758wmf.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fUQ8YJtXrhSH943qQE3CrMqyAQUN7ep2I+Z2txiXQbc=;
 b=ArO40I/9ANkpyLT3OcUY9g+z8Jbnxi59kbyeqTiZeibmhbAQ4fgDkxL9aGVTSKgTnc
 0bcKGGUEvaitGuBrv3XBhap+QnvMkpp7RIqPMl1SWuauMGGudRx9z+3w89V7/JcIJgYV
 erbRIAjNlVN/ienTgtGaphAXYAE9Q3SA2eZj2Bo5q7JDkDZfvrsn/S+AOCwhHMiJ+gNn
 SER0H2aHG2SsJx+3L0g12bwSLdk8uUhL8ACwRz1avI45WP37y649sSRUPNnMmvcpU8W7
 Eoi1s8sIJZm9nYS45EEGiInMI0WDfYDFgZugWSEqmObW5pr07aMIzPr9ED2as5TQq3tx
 qLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fUQ8YJtXrhSH943qQE3CrMqyAQUN7ep2I+Z2txiXQbc=;
 b=T99KOvHLfRHKxSRKvHYK8yXV5zHvhMwZulafSG9+gr1H0f3D8hNn9xSX9FvxMyTqU1
 7mnsxsGkGX1vkeAkhqw6/oMceMowjJTiMutYDEuvfhnsDvPWQwVT+fnvNwHVgx1Zt02X
 0xukbFnhs21jjVwCnGxu0MXZDVzKgPW7f6zmhONzmwX/aa8dZVPHRYj/VtmFpE+e+oq7
 8GBWFp7wSJLGR324RkEZ/IE69eknZEnRoa0pRmfD8Czl2AcZEL8wzKLUC/JLXDxjACeh
 KZZnB5WK4uylB41UzPUMwiIuo3Q36vVtCywEDw2WGj5yeZ4Hu1YJ9DAkNoMUi875eUnn
 NDZg==
X-Gm-Message-State: AOAM533UGXUE1zL0KVYy2lwMNFcpO7JObkRMfSSNaTdv2WDyRvQ9gyz6
 I6oH6V8zWgWbF+it4Q7IAEu82zero2vlgQ==
X-Google-Smtp-Source: ABdhPJwxMQFab7s2gVRlGEU+CaeUSaP1VwLLxIaAcZZIe2ryGKwjdQiu457m1NNPJVmb4L1r85DEkQ==
X-Received: by 2002:a05:600c:2056:: with SMTP id
 p22mr1603879wmg.146.1621498979412; 
 Thu, 20 May 2021 01:22:59 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:22:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/26] configure: Only clone softfloat-3 repositories if TCG is
 enabled
Date: Thu, 20 May 2021 10:22:32 +0200
Message-Id: <20210520082257.187061-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210512045821.3257963-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0e4233fd8a..1bb29fcda1 100755
--- a/configure
+++ b/configure
@@ -257,8 +257,6 @@ if test -e "$source_path/.git"
 then
     git_submodules_action="update"
     git_submodules="ui/keycodemapdb"
-    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
-    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
     git_submodules_action="ignore"
     git_submodules=""
@@ -2271,6 +2269,11 @@ if test "$solaris" = "yes" ; then
   fi
 fi
 
+if test "$tcg" = "enabled"; then
+    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
+    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
+fi
+
 if test -z "${target_list+xxx}" ; then
     default_targets=yes
     for target in $default_target_list; do
-- 
2.31.1




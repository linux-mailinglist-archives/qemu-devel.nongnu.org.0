Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED2738F221
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:17:28 +0200 (CEST)
Received: from localhost ([::1]:54802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llECl-00040t-9p
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeQ-0004oa-Dk
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:58 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeI-0004L4-Eo
 for qemu-devel@nongnu.org; Mon, 24 May 2021 12:41:56 -0400
Received: by mail-ed1-x530.google.com with SMTP id g7so20567875edm.4
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 09:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iF4RcJLaBA+Tsqd+K4Whv/EKE42LwUvWQnMGDTznbsc=;
 b=XEWjRHwqpLjvzxHRFHqoOOmvXTtAWB0aAPxxPb08YRiPpdeMjX8hSDA6/sMMpUR/Ag
 Rh7GOrHNSieiw53R6J3LC2toscxDn476ybpLYNztGKJ6RVPMrBuFTUF2SXeCG2KdTnzz
 tRiUdtdTUvKvJ3O3VVsUIa5aPWzDmdjiUVl+vcQyjwjfy8qXJ3/BtjD7stSOFP2e/B8A
 38GVtm4SrHDt5J0V/AmZPU2qdTj2PZCXHwyUVRBqUYc4vori0gKChQ53RVJwR9g6hRBU
 SgXAF/t8jFuP8tuyJuQNAv0Y4O9tPx4eWnaIQ3FRdJntyaRb5gK4S76sO5toBFjBrgj0
 Mdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iF4RcJLaBA+Tsqd+K4Whv/EKE42LwUvWQnMGDTznbsc=;
 b=Uj7vHV0W3blm++jT0OMpf6X+5601h0mE21Yo7d6/df/xd4fMhporThlcehVc1IK/Fn
 6FpqgjPVtN6XWcu96FXv45+u/ydAHEB37coL4aRlqB9ystCR4rskC5QsBVBhk2OtR+OD
 biK9kycdkP9XTOsnzVHkRtYvTIyu8yo0sAatkKT32wgY/miVhUHzdvG7KXDtUxHll9Nb
 ZFN7et0vwynujj3ou7Q+uTWYTWidmI5MMeO1wSjp/d0xjgFPmLXdMvkpi+wgOUuIt2kT
 y+u23kCzgOczHQiIhDAo7G7PRfkks7OWJuK25snVUEiprUMnGgMT/1LJ6QBp4W67vDN0
 9KcQ==
X-Gm-Message-State: AOAM532dpZ18SVhDkSmUJpwXVaGD03qZZULTQTKc+ukbQKhyd6PqBp5s
 Qw04hlJW88aNUrmKDGHsJCTu5M2fvVdfRg==
X-Google-Smtp-Source: ABdhPJw4lfT0skGk65IwU4X1cD1ZqDIy2nVKz5R+ItYEQIJO4t5f2mMn2Wp/uJtrGXRlNBpiee01lw==
X-Received: by 2002:a50:fc91:: with SMTP id f17mr25971641edq.201.1621874493701; 
 Mon, 24 May 2021 09:41:33 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.32 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] configure: check for submodules if
 --with-git-submodules=ignore
Date: Mon, 24 May 2021 18:41:05 +0200
Message-Id: <20210524164131.383778-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
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

Right now --with-git-submodules=ignore has a subtle difference from
just running without a .git directory, in that it does not check
that submodule sources actually exist.  Move the check for
ui/keycodemapdb/README so that it happens even if the user
specified --with-git-submodules=ignore, with a customized
error message that is more suitable for this situation.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/configure b/configure
index 808874cb31..f32c6f1a26 100755
--- a/configure
+++ b/configure
@@ -260,24 +260,6 @@ then
 else
     git_submodules_action="ignore"
     git_submodules=""
-
-    if ! test -f "$source_path/ui/keycodemapdb/README"
-    then
-        echo
-        echo "ERROR: missing file $source_path/ui/keycodemapdb/README"
-        echo
-        echo "This is not a GIT checkout but module content appears to"
-        echo "be missing. Do not use 'git archive' or GitHub download links"
-        echo "to acquire QEMU source archives. Non-GIT builds are only"
-        echo "supported with source archives linked from:"
-        echo
-        echo "  https://www.qemu.org/download/#source"
-        echo
-        echo "Developers working with GIT can use scripts/archive-source.sh"
-        echo "if they need to create valid source archives."
-        echo
-        exit 1
-    fi
 fi
 git="git"
 
@@ -1591,6 +1573,28 @@ case $git_submodules_action in
         fi
     ;;
     ignore)
+        if ! test -f "$source_path/ui/keycodemapdb/README"
+        then
+            echo
+            echo "ERROR: missing GIT submodules"
+            echo
+            if test -e "$source_path/.git"; then
+                echo "--with-git-submodules=ignore specified but submodules were not"
+                echo "checked out.  Please initialize and update submodules."
+            else
+                echo "This is not a GIT checkout but module content appears to"
+                echo "be missing. Do not use 'git archive' or GitHub download links"
+                echo "to acquire QEMU source archives. Non-GIT builds are only"
+                echo "supported with source archives linked from:"
+                echo
+                echo "  https://www.qemu.org/download/#source"
+                echo
+                echo "Developers working with GIT can use scripts/archive-source.sh"
+                echo "if they need to create valid source archives."
+            fi
+            echo
+            exit 1
+        fi
     ;;
     *)
         echo "ERROR: invalid --with-git-submodules= value '$git_submodules_action'"
-- 
2.31.1




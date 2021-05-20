Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42C389FBE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:26:06 +0200 (CEST)
Received: from localhost ([::1]:50108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lje0L-0008IK-SN
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxW-0005Mt-2h
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:14 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxN-0001Sd-C4
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id o127so8608771wmo.4
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bvDJqezYLepT2RXLvaDux71VTpVELHG55s53GJHq5qM=;
 b=kxGeCAJvBhfPmu30v3LFLfmyjHZ3ga07oxKMcnl+c4xLsGB53YyPvgiwMj8fuaWF4U
 pMZzfFSrKGTvgZaBRkBjvpWaLzIU78YBbUsZRsl06ype3ZhPX83UfccFjHscADPdFHR6
 ZClM9eHkQxqKwvj+iugMwENSayPqZJSM+y8Twl0+5ToAZjqGy00p/LK7ORfLOFDNKHu5
 Z08ii/RqfamuD3ZeBTVoiql7oB/Hup7G2UQwq8PROqrENPiXl7X0YfTToSfE9APaKVbD
 DNdhj12ka4fQPP/V7ZEsfDT1KsV/RZgFrq5aG+NcOq9BQb1/KAs1euLKJLjHhw68NWw8
 gGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bvDJqezYLepT2RXLvaDux71VTpVELHG55s53GJHq5qM=;
 b=jxua6011APXZEGyq2CjvQCTci4rwvb/PZLO2u73Z/nvlzvCkXd5f6B4nrkH7W5yqX3
 2z4kEfiqt3DRUUJ9mwS+z29BWOpyiIakqCij1NcBNK8frzakoMP68ZgLltye3HDEKQf7
 sZcroZwnPuBGQDjh4aZMAkie3NkBEdhfZJwh5nuvmHn/qBb3a5f4wpZm429cHmkzuvhM
 sH59gXru7rxZ6xd/Df9+DJf00AXy/Lx08pCgmX8+sjs0jmryrLMBbDSRayJaeyvYHs7A
 QhCzaz3SqofzOgDG5xttEeVGZbs+cYpH4q9e5VJzLOowLNryQx8xVtAnttCmgEjx93s+
 QrNQ==
X-Gm-Message-State: AOAM531U41DuQuVD3yl2sbuZKnk2wYWQ/OSD6iCCXLtfUwOv0ynVp1mf
 8PZVImq4VyCQ2IUUrXA65vePURcPRNXOAw==
X-Google-Smtp-Source: ABdhPJwPGi331u1GWUPOoWMOpfRy81Jm7Pf848iObL9pZ0IT0xmtV+TtA+nQf+AJY5p/Ey8nDEjR9g==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr2827916wmh.69.1621498980017;
 Thu, 20 May 2021 01:23:00 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.22.59 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:22:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/26] configure: check for submodules if
 --with-git-submodules=ignore
Date: Thu, 20 May 2021 10:22:33 +0200
Message-Id: <20210520082257.187061-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
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
index 1bb29fcda1..4681cbe2d7 100755
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
 
@@ -1582,6 +1564,28 @@ case $git_submodules_action in
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




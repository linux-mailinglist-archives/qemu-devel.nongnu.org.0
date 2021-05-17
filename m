Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26435382B33
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:36:27 +0200 (CEST)
Received: from localhost ([::1]:60482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libXu-0006Tr-8X
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIN-00062w-8M
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1libIA-0006LV-GR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:20:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621250406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8bOmXolEevsgY06RDp1x37gAVlf6gEYuUYZ/EsTATU=;
 b=B/2HmtX41k6BplwZo5q0NrJe0pglxlSWc+QumxyZj60nM44jv73BP5tldUJfHzuxO+tNcM
 bonH+mAmoZw4S2ibyVeYQNV8LpxSq1OyQp6j/iYqYdjxTkU9ktoOGxh/UE1ErzzMlAOsvx
 GEwVtM+3c60hltl1KQVJPDN7zbomWlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-eYi0EHDoOpKokYY-Pwf9NA-1; Mon, 17 May 2021 07:20:03 -0400
X-MC-Unique: eYi0EHDoOpKokYY-Pwf9NA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7CE4A80ED9E
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49AB019726
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 11:20:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] configure: check for submodules if
 --with-git-submodules=ignore
Date: Mon, 17 May 2021 07:19:43 -0400
Message-Id: <20210517112001.2564006-3-pbonzini@redhat.com>
In-Reply-To: <20210517112001.2564006-1-pbonzini@redhat.com>
References: <20210517112001.2564006-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
2.27.0




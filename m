Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E807219C02
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 12:55:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP3BF-0005yZ-1b
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 06:55:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hP333-0008Iu-SV
	for qemu-devel@nongnu.org; Fri, 10 May 2019 06:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hP332-00043d-M6
	for qemu-devel@nongnu.org; Fri, 10 May 2019 06:46:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hP332-000436-Ex
	for qemu-devel@nongnu.org; Fri, 10 May 2019 06:46:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB163D77F2;
	Fri, 10 May 2019 10:46:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4209E646BB;
	Fri, 10 May 2019 10:46:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 65D16A1E4; Fri, 10 May 2019 12:46:33 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 12:46:21 +0200
Message-Id: <20190510104633.9428-2-kraxel@redhat.com>
In-Reply-To: <20190510104633.9428-1-kraxel@redhat.com>
References: <20190510104633.9428-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 10 May 2019 10:46:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 01/13] scripts: use git archive in
 archive-source
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use git archive to create tarballs of qemu and submodules instead of
cloning the repository and the submodules.  This is a order of magnitude
faster because it doesn't fetch the submodules from the internet each
time the script runs.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 scripts/archive-source.sh | 72 +++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 41 deletions(-)

diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 8b8994826000..93a48d2063f9 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -19,16 +19,25 @@ if test $# -lt 1; then
 fi
 
 tar_file=$(realpath "$1")
-list_file="${tar_file}.list"
-vroot_dir="${tar_file}.vroot"
+sub_tdir=$(mktemp -d "${tar_file%.tar}.sub.XXXXXXXX")
+sub_file="${sub_tdir}/submodule.tar"
 
 # We want a predictable list of submodules for builds, that is
 # independent of what the developer currently has initialized
 # in their checkout, because the build environment is completely
 # different to the host OS.
 submodules="dtc slirp ui/keycodemapdb tests/fp/berkeley-softfloat-3 tests/fp/berkeley-testfloat-3"
+sub_deinit=""
 
-trap "status=$?; rm -rf \"$list_file\" \"$vroot_dir\"; exit \$status" 0 1 2 3 15
+function cleanup() {
+    local status=$?
+    rm -rf "$sub_tdir"
+    if test "$sub_deinit" != ""; then
+	git submodule deinit $sub_deinit
+    fi
+    exit $status
+}
+trap "cleanup" 0 1 2 3 15
 
 if git diff-index --quiet HEAD -- &>/dev/null
 then
@@ -36,45 +45,26 @@ then
 else
     HEAD=$(git stash create)
 fi
-git clone --shared . "$vroot_dir"
-test $? -ne 0 && error "failed to clone into '$vroot_dir'"
-for sm in $submodules; do
-    if test -d "$sm/.git"
-    then
-       git clone --shared "$sm" "$vroot_dir/$sm"
-       test $? -ne 0 && error "failed to clone submodule $sm"
-    fi
-done
-
-cd "$vroot_dir"
-test $? -ne 0 && error "failed to change into '$vroot_dir'"
-
-git checkout $HEAD
-test $? -ne 0 && error "failed to checkout $HEAD revision"
 
+git archive --format tar $HEAD > "$tar_file"
+test $? -ne 0 && error "failed to archive qemu"
 for sm in $submodules; do
-    git submodule update --init $sm
-    test $? -ne 0 && error "failed to init submodule $sm"
+    status="$(git submodule status "$sm")"
+    smhash="${status#[ +-]}"
+    smhash="${smhash%% *}"
+    case "$status" in
+	-*)
+	    sub_deinit="$sub_deinit $sm"
+	    git submodule update --init "$sm"
+	    test $? -ne 0 && error "failed to update submodule $sm"
+	    ;;
+	+*)
+	    echo "WARNING: submodule $sm is out of sync"
+	    ;;
+    esac
+    (cd $sm; git archive --format tar --prefix "$sm/" $smhash) > "$sub_file"
+    test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
+    tar --concatenate --file "$tar_file" "$sub_file"
+    test $? -ne 0 && error "failed append submodule $sm to $tar_file"
 done
-
-if test -n "$submodules"; then
-    {
-        git ls-files || error "git ls-files failed"
-        for sm in $submodules; do
-            (cd $sm; git ls-files) | sed "s:^:$sm/:"
-            if test "${PIPESTATUS[*]}" != "0 0"; then
-                error "git ls-files in submodule $sm failed"
-            fi
-        done
-    } | grep -x -v $(for sm in $submodules; do echo "-e $sm"; done) > "$list_file"
-else
-    git ls-files > "$list_file"
-fi
-
-if test $? -ne 0; then
-    error "failed to generate list file"
-fi
-
-tar -cf "$tar_file" -T "$list_file" || error "failed to create tar file"
-
 exit 0
-- 
2.18.1



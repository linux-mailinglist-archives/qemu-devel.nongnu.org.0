Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F9C32250B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 06:06:11 +0100 (CET)
Received: from localhost ([::1]:42602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEPti-00043c-HE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 00:06:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1lENeD-0003e3-Uk; Mon, 22 Feb 2021 21:42:01 -0500
Received: from mail.nh2.me ([116.202.188.98]:58973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@nh2.me>)
 id 1lENeB-0008Q5-G7; Mon, 22 Feb 2021 21:42:01 -0500
Cc: qemu-stable@nongnu.org, qemu-trivial@nongnu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nh2.me; s=mail;
 t=1614048114; bh=HjvwI/n7A6NQDKRZHPtT04n7YtekAuRGoR3144EiZ6c=;
 h=Cc:From:Subject:To:Date;
 b=kw15+yqrLtWiZbrMhtsZ1H2mk+NyQJhwjnue0T35tQ/LEhS3hucvsYe2XmYgCrc/9
 00cNrNGRyc7wuQX1up8tGE2lXPYF/lw7qFkczBe05wR9vNp1d+CXIJ5p7b/D3kubd9
 qFXVOoIwmRWWR5xVfMkRHfvcjAT6lAf9lKfcfDkO7Azqlk4NE1w/vtKabbmEr6tpi2
 tKyg+xG4uvquiJeuTc+Qpu+qTKoNhUMyCnnls79s4CJ9Offk4HTSv4MKDdksAcGpJ/
 +yVIT6CHuhZ1KXSW06UeisLhVgQjpNvu38QyUN6NlJmjYlTXY883rgPvOSYYTu5mdJ
 YVpGQlgnOww7A==
From: =?UTF-8?Q?Niklas_Hamb=c3=bcchen?= <mail@nh2.me>
Subject: [PATCH] net/slirp: Fix incorrect permissions on samba >= 2.0.5
To: qemu-devel@nongnu.org
Message-ID: <c2b98872-4649-c291-bfb2-0fd5b3d40ac4@nh2.me>
Date: Tue, 23 Feb 2021 03:41:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=116.202.188.98; envelope-from=mail@nh2.me;
 helo=mail.nh2.me
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Feb 2021 00:04:55 -0500
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

As the added commend and `man smb.conf` explain, starting
with that samba version, `force user` must be configured
in `[global]` in order to access the configured `smb_dir`.

This broke `-net user,smb=/path/to/folder`:

The `chdir` into e.g. `/run/user/0/qemu-smb.DCZ8Y0` failed.
In verbose logs, this manifested as:

    [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.c:159(chdir_current_service)
      chdir (/run/user/0) failed, reason: Permission denied

    [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/service.c:167(chdir_current_service)
      chdir (/run/user/0) failed, reason: Permission denied

    [..., effective(65534, 65534), real(65534, 0)] /source3/smbd/uid.c:448(change_to_user_internal)
      change_to_user_internal: chdir_current_service() failed!

This commit fixes it by setting the `[global]` force user to
the user that owns the directories `smbd` needs to access.

Signed-off-by: Niklas Hambüchen <mail@nh2.me>
---
 net/slirp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..82387bdb19 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -850,6 +850,11 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
     }
     fprintf(f,
             "[global]\n"
+            "# In Samba 2.0.5 and above the 'force user' parameter\n"
+            "# also causes the primary group of the forced user to be used\n"
+            "# as the primary group for all file activity.\n"
+            "# This includes the various directories set below.\n"
+            "force user=%s\n"
             "private dir=%s\n"
             "interfaces=127.0.0.1\n"
             "bind interfaces only=yes\n"
@@ -871,6 +876,7 @@ static int slirp_smb(SlirpState* s, const char *exported_dir,
             "read only=no\n"
             "guest ok=yes\n"
             "force user=%s\n",
+            passwd->pw_name,
             s->smb_dir,
             s->smb_dir,
             s->smb_dir,
-- 
2.25.4


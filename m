Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A97EA32005D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 22:39:47 +0100 (CET)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDV4-0003qx-FV
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 16:39:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1lDDFk-00080k-Dw
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:23:56 -0500
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:32550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1lDDFi-0005ZZ-Ns
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 16:23:56 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A50188252D
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 21:23:53 +0000 (UTC)
 (envelope-from imp@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org
 [IPv6:2610:1c1:1:6074::16:84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4Dj4MF43ylz3LQl;
 Fri, 19 Feb 2021 21:23:53 +0000 (UTC) (envelope-from imp@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1613769833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rmpLpkOXZyDLnSFfOlDHE2GvSknfVJ87wZv0+M4Co3o=;
 b=NhnDJ8Y+l+k2DNYyczEMAFu8mKsHl8CWEkOiptfG/9WFrLKYJVXhmwUj+Uj1ZufDv5kE95
 dcf5UEhJqi6HLYxg9YWV08+/WFRIElKl/yA3VvtemnJ9BBS8SdT9wMVoNSeI6G8konOO3j
 ZV2wFczF2CfkRVaCA7vKZM3fWbFHK/8np8vaASIeMivhDMR4wnPNyR4zSrFiqpIfdVslS2
 C9stu2xFChvaEQBPqiN7nOUeWACYRN+AQBm5fVnGw+q6/DqXQh4JrleIkc9Ami3ge7BKBR
 b6VDgk6UfqMwkWgeEAgtyeZdC3FNSX4bb6J0orUSqJOc0p053nczHxZ20GOFLA==
Received: by freefall.freebsd.org (Postfix, from userid 547)
 id 8470686AE; Fri, 19 Feb 2021 21:23:53 +0000 (UTC)
From: Warner Losh <imp@freefall.freebsd.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] FreeBSD: Upgrade to 12.2 release
Date: Fri, 19 Feb 2021 14:23:52 -0700
Message-Id: <20210219212352.74172-1-imp@freefall.freebsd.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1613769833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rmpLpkOXZyDLnSFfOlDHE2GvSknfVJ87wZv0+M4Co3o=;
 b=Z1PZvFhYy2FZLS3HzxHDR/NWewHtQADuCJaaJnBvKnPoOW5EVleaBUl1ayFFGh3pmMUp+h
 vhmgwTob/BfKH1ynHbliJZzJlnVJ3f68CtbCzq5l1SPwUXXlri6JJdGj5FoT4ZvNZ2jEPY
 SYzHDIfUDL7ahvIyiPTH0HCDS7OdD3xwxUGEYH7rXGOmbISsPc9nLtlOwHlTL8Bq44MC1b
 09JvFMB4ZOr0VU6Y3bbtWDSXN9/6LmP5EX7i/nlNS/nICMTecShE0MbaEJTF6gZ/KTzH+u
 PBZ6coB12ProZElwXE1BbB2vxnuucayFzvGwkvHJKi+Nez2tnkfCyCzcfwpFDg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1613769833; a=rsa-sha256; cv=none;
 b=c0jk5qsk1jYbAHQs6zvbZxgGUdhQ2J9i7bb1R3+5nkEO8wWrJ5CrHboPTErZoBbsuR+Qnv
 f+XeQMB0Vn83WxAmwyGgg5lp6nDjD2bg328+uzCl+oAXx/lCDfRt1lCphBc8NhkmH7iFhZ
 ROxqoToL/aATmUhwZHA5SaQ54AyAsBI4jAY7tHG7z+1CdX9UmPUYxvI+3G7UKd+VbB1XXQ
 QDwFuOKQv8yQQTUNGnMBlo6FNBrViDalTo1Bi4OQKKUvKpw1igieGIJaDE+WysGs7iUeHk
 vORVLKEsgMDVHtMHyDyqQKqWkDOg+sMKN50lL5fHwa9t4M6PiWauXcXxOQijtQ==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=imp@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 19 Feb 2021 16:37:54 -0500
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>, emaste@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

FreeBSD 12.1 has reached end of life. Use 12.2 instead so that FreeBSD's
project's packages will work.

Signed-off-by: Warner Losh <imp@FreeBSD.org>
---
 tests/vm/freebsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 09f3ee6cb8..c5886f6500 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -24,8 +24,8 @@ class FreeBSDVM(basevm.BaseVM):
     name = "freebsd"
     arch = "x86_64"
 
-    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.1/FreeBSD-12.1-RELEASE-amd64-disc1.iso.xz"
-    csum = "7394c3f60a1e236e7bd3a05809cf43ae39a3b8e5d42d782004cf2f26b1cfcd88"
+    link = "https://download.freebsd.org/ftp/releases/ISO-IMAGES/12.2/FreeBSD-12.2-RELEASE-amd64-disc1.iso.xz"
+    csum = "a4530246cafbf1dd42a9bd3ea441ca9a78a6a0cd070278cbdf63f3a6f803ecae"
     size = "20G"
     pkgs = [
         # build tools
-- 
2.30.0



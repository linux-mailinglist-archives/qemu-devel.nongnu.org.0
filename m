Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132DC372159
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 22:33:38 +0200 (CEST)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfG4-0007MA-KF
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 16:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgouttegattat@incenp.org>)
 id 1ldbDO-0002uR-GA; Mon, 03 May 2021 12:14:34 -0400
Received: from mail.incenp.org ([2001:41d0:302:2000::43d4]:43420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dgouttegattat@incenp.org>)
 id 1ldbDJ-0002VA-Ql; Mon, 03 May 2021 12:14:34 -0400
Received: from localhost (dgouttegattat.plus.com [81.174.245.146])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.incenp.org (Postfix) with ESMTPSA id 9DB2D2032F;
 Mon,  3 May 2021 18:14:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=incenp.org; s=202012;
 t=1620058464; bh=R8sqcRUsA0b+Adt0LdlpsjH052s8uc83hTbVNhqkGMo=;
 h=From:To:Cc:Subject:Date;
 b=O+ZwHK0qS70iVQRO/Kt0PzZDxUbrso6Xi/mw8SjqVutq95I9Eml6LaNueVCGzUOld
 8iVHYRRb/qHWjIQJaBaOwahW6y4uRH8aN8JLGMBSPwb6hyN9Eh8mJ7szD21xfigiWo
 GJyEysCM2Mmf8wkAQ64sKYYqIzZUwfUPbFZtBg7w=
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Subject: [PATCH] docs: Fix installation of man pages with Sphinx 4.x
Date: Mon,  3 May 2021 17:14:22 +0100
Message-Id: <20210503161422.15028-1-dgouttegattat@incenp.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:302:2000::43d4;
 envelope-from=dgouttegattat@incenp.org; helo=mail.incenp.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 03 May 2021 16:31:44 -0400
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
Reply-to:  Damien Goutte-Gattat <dgouttegattat@incenp.org>
From:  Damien Goutte-Gattat via <qemu-devel@nongnu.org>

The 4.x branch of Sphinx introduces a breaking change, as generated man
pages are now written to subdirectories corresponding to the manual
section they belong to. This results in `make install` erroring out when
attempting to install the man pages, because they are not where it
expects to find them.

This patch restores the behavior of Sphinx 3.x regarding man pages.

Signed-off-by: Damien Goutte-Gattat <dgouttegattat@incenp.org>
---
 docs/conf.py | 1 +
 1 file changed, 1 insertion(+)

FYI: For more information about this behavior change of Sphinx, see the 
relevant issue: <https://github.com/sphinx-doc/sphinx/issues/7996>.

diff --git a/docs/conf.py b/docs/conf.py
index 2ee6111872..4bc7298ca8 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -269,6 +269,7 @@
      ['Stefan Hajnoczi <stefanha@redhat.com>',
       'Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>'], 1),
 ]
+man_make_section_directory = False
 
 # -- Options for Texinfo output -------------------------------------------
 
-- 
2.27.0



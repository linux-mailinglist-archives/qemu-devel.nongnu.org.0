Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343D124EA02
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Aug 2020 23:24:33 +0200 (CEST)
Received: from localhost ([::1]:37500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9b04-0001yE-Aj
	for lists+qemu-devel@lfdr.de; Sat, 22 Aug 2020 17:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k9axH-0006Yf-6A
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 17:21:39 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:55278 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k9axF-0002sD-FC
 for qemu-devel@nongnu.org; Sat, 22 Aug 2020 17:21:38 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4F24E5604F
 for <qemu-devel@nongnu.org>; Sat, 22 Aug 2020 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1598131293; x=1599945694; bh=BqgzoMCid9ojGf6fIEty6qj4pgzcFFR1Rd2
 kQlnOsx0=; b=J+jL68p3XWAcuZxVysdThZsYfolCwkKyGqBlBlBoFelQdmT6gXX
 8aomqbiLHbb6lKVxm+z9Bic8a2O1ePEd71m/mw6GF9zXM9+6StKKI/UoiPEKXSvv
 OqGbRkIJwg4MdRj7/F9lF0zMgO7huWqRJXenkpTaRC1yTi0U/WDhM4KU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQkc4fLGQILB for <qemu-devel@nongnu.org>;
 Sun, 23 Aug 2020 00:21:33 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 35194574F4
 for <qemu-devel@nongnu.org>; Sun, 23 Aug 2020 00:21:33 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 23
 Aug 2020 00:21:33 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH 1/4] configure: Use discovered make for in-source build
Date: Sun, 23 Aug 2020 00:21:26 +0300
Message-ID: <20200822212129.97758-2-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200822212129.97758-1-r.bolshakov@yadro.com>
References: <20200822212129.97758-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/22 17:21:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recursive make is inovked if in-source build is used but $(MAKE) is
the same as the one used in the original make invocaton.

Some platforms have preference to use gmake, or a make passed as an
option to "configure". Honor the choice.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index 4e5fe33211..9e0d505067 100755
--- a/configure
+++ b/configure
@@ -38,6 +38,8 @@ then
 # This file is auto-generated by configure to support in-source tree
 # 'make' command invocation
 
+include build/config-host.mak
+
 ifeq ($(MAKECMDGOALS),)
 recurse: all
 endif
-- 
2.28.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06725220A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 22:32:05 +0200 (CEST)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAfbw-0001C8-J1
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 16:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kAfYA-0005aH-0v
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 16:28:10 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:35288 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kAfY4-0006Ne-Tq
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 16:28:09 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 746E457502;
 Tue, 25 Aug 2020 20:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1598387280; x=1600201681; bh=b0G63lLIq4mnzK2xfL55xP+40i9MOQJLuKl
 +0XEVZ5w=; b=CQpMNTi/byfL/qpJgx4RasPAJXwUu8C9RSZONQGpyJtOglrVaDc
 VY57uil2g+nHWG4hWB/TRGUIj9E1WYJ5M4iDURpdBp/ARQ4DKeTCciYBIhmbGEz5
 iwATTibxj1Wojs+TANf75+oP7byL7uiA00KI+IjPtkp9QW2QYoCuIiNE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37rjtLfX8I3o; Tue, 25 Aug 2020 23:28:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 6484F574EC;
 Tue, 25 Aug 2020 23:28:00 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 25
 Aug 2020 23:27:59 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/4] configure: Use discovered make for in-source build
Date: Tue, 25 Aug 2020 23:27:52 +0300
Message-ID: <20200825202755.50626-2-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825202755.50626-1-r.bolshakov@yadro.com>
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 16:28:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A recursive make is invoked if in-source build is used but $(MAKE) is
the same as the one used in the original make invocation.

Some platforms have preference to use gmake, or a make passed as an
option to "configure". Honor the choice.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 configure | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configure b/configure
index b1e11397a8..07732bf011 100755
--- a/configure
+++ b/configure
@@ -38,6 +38,11 @@ then
 # This file is auto-generated by configure to support in-source tree
 # 'make' command invocation
 
+ifeq ($(wildcard build/config-host.mak),)
+$(error Incomplete configuration. Please run `configure`)
+endif
+include build/config-host.mak
+
 ifeq ($(MAKECMDGOALS),)
 recurse: all
 endif
@@ -54,6 +59,7 @@ endif
 force: ;
 .PHONY: force
 GNUmakefile: ;
+build/config-host.mak: ;
 
 EOF
     cd build
-- 
2.28.0



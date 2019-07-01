Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CB0277FF
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 10:31:43 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTj8Y-000708-Ji
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 04:31:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTj2U-0002Ef-IA
	for qemu-devel@nongnu.org; Thu, 23 May 2019 04:25:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTit8-0000tk-Mf
	for qemu-devel@nongnu.org; Thu, 23 May 2019 04:15:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTit8-0000t6-HX
	for qemu-devel@nongnu.org; Thu, 23 May 2019 04:15:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9CFFEC057F3B;
	Thu, 23 May 2019 08:15:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 558D367642;
	Thu, 23 May 2019 08:15:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DC8FF1132BB6; Thu, 23 May 2019 10:15:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 23 May 2019 10:15:32 +0200
Message-Id: <20190523081538.2291-2-armbru@redhat.com>
In-Reply-To: <20190523081538.2291-1-armbru@redhat.com>
References: <20190523081538.2291-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 23 May 2019 08:15:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 1/7] Makefile: Remove code to smooth
 transition to config.status
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When commit bdf523e6923 made configure generate config.status, it
added a fallback to Makefile to smooth the transition, with a TODO
"code can be removed after QEMU 1.7."  It's been more than five years.
Remove it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 Makefile | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 155f066a20..8ec833a5fb 100644
--- a/Makefile
+++ b/Makefile
@@ -69,14 +69,7 @@ CONFIG_ALL=y
 
 config-host.mak: $(SRC_PATH)/configure $(SRC_PATH)/pc-bios $(SRC_PATH)/VERSION
 	@echo $@ is out-of-date, running configure
-	@# TODO: The next lines include code which supports a smooth
-	@# transition from old configurations without config.status.
-	@# This code can be removed after QEMU 1.7.
-	@if test -x config.status; then \
-	    ./config.status; \
-        else \
-	    sed -n "/.*Configured with/s/[^:]*: //p" $@ | sh; \
-	fi
+	./config.status
 else
 config-host.mak:
 ifneq ($(filter-out $(UNCHECKED_GOALS),$(MAKECMDGOALS)),$(if $(MAKECMDGOALS),,fail))
-- 
2.17.2



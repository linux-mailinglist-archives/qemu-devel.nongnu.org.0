Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6C1CE86
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 20:06:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQboX-0004Ds-Dn
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 14:06:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQbln-00030h-Qw
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQblm-0002YR-Nz
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQblm-0002YH-It
	for qemu-devel@nongnu.org; Tue, 14 May 2019 14:03:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE3E73002619
	for <qemu-devel@nongnu.org>; Tue, 14 May 2019 18:03:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76BEE5D720;
	Tue, 14 May 2019 18:03:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EBE5611385FA; Tue, 14 May 2019 20:03:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2019 20:03:06 +0200
Message-Id: <20190514180311.16028-2-armbru@redhat.com>
In-Reply-To: <20190514180311.16028-1-armbru@redhat.com>
References: <20190514180311.16028-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 14 May 2019 18:03:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 1/6] qemu-bridge-helper: Fix misuse of
 isspace()
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
Cc: thuth@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

parse_acl_file() passes char values to isspace().  Undefined behavior
when the value is negative.  Not a security issue, because the
characters come from trusted $prefix/etc/qemu/bridge.conf and the
files it includes.

Furthermore, isspace()'s locale-dependence means qemu-bridge-helper
uses the user's locale for parsing $prefix/etc/bridge.conf.  Feels
wrong.

Use g_ascii_isspace() instead.  This fixes the undefined behavior, and
makes parsing of $prefix/etc/bridge.conf locale-independent.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-bridge-helper.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index 5396fbfbb6..f9940deefd 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -75,7 +75,7 @@ static int parse_acl_file(const char *filename, ACLList *acl_list)
         char *ptr = line;
         char *cmd, *arg, *argend;
 
-        while (isspace(*ptr)) {
+        while (g_ascii_isspace(*ptr)) {
             ptr++;
         }
 
@@ -99,12 +99,12 @@ static int parse_acl_file(const char *filename, ACLList *acl_list)
 
         *arg = 0;
         arg++;
-        while (isspace(*arg)) {
+        while (g_ascii_isspace(*arg)) {
             arg++;
         }
 
         argend = arg + strlen(arg);
-        while (arg != argend && isspace(*(argend - 1))) {
+        while (arg != argend && g_ascii_isspace(*(argend - 1))) {
             argend--;
         }
         *argend = 0;
-- 
2.17.2



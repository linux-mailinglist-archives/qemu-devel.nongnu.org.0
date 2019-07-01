Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999411FC3A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 May 2019 23:31:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hR17w-0002kD-9m
	for lists+qemu-devel@lfdr.de; Wed, 15 May 2019 17:07:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0s4-0006Wg-JB
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:51:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hR0s2-0001f0-J2
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:51:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hR0rz-0001XK-BE
	for qemu-devel@nongnu.org; Wed, 15 May 2019 16:51:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0941230B337F
	for <qemu-devel@nongnu.org>; Wed, 15 May 2019 20:51:10 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18ADC5C5B0;
	Wed, 15 May 2019 20:51:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 15 May 2019 22:50:28 +0200
Message-Id: <1557953433-19663-17-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
References: <1557953433-19663-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 15 May 2019 20:51:10 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 16/21] configure: qemu-ga is only needed with
 softmmu targets
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
Cc: Laurent Vivier <lvivier@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Remove it from the list of tools if --disable-system
and --disable-tools are used as we don't need it for
linux-user targets.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
[lv: I also disable it with disable-tools, not only with disable-system]
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20190401141222.30034-4-lvivier@redhat.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 8999698..d2fc346 100755
--- a/configure
+++ b/configure
@@ -6079,7 +6079,9 @@ fi
 # Probe for guest agent support/options
 
 if [ "$guest_agent" != "no" ]; then
-  if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" -o "$mingw32" = "yes" ] ; then
+  if [ "$softmmu" = no -a "$want_tools" = no ] ; then
+      guest_agent=no
+  elif [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" -o "$mingw32" = "yes" ] ; then
       tools="qemu-ga $tools"
       guest_agent=yes
   elif [ "$guest_agent" != yes ]; then
-- 
1.8.3.1




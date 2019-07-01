Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CB131332
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 18:58:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWkqt-0004Jj-RM
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 12:57:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1hWkmf-0001Wg-DC
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1hWkme-0000wy-Ey
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:53:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35370)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1hWkme-0000wD-9o
	for qemu-devel@nongnu.org; Fri, 31 May 2019 12:53:36 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A3A0E30842A9
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 16:53:35 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
	(virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BB034129;
	Fri, 31 May 2019 16:53:35 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 12:53:34 -0400
Message-Id: <20190531165334.20403-2-wainersm@redhat.com>
In-Reply-To: <20190531165334.20403-1-wainersm@redhat.com>
References: <20190531165334.20403-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 31 May 2019 16:53:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/1] accel: Remove unused AccelClass::opt_name
 attribute
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
Cc: thuth@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AccelType type was converted to AccelClass QOM
object on b14a0b7469f, and the original data type had
a field to store the option name which in turn was
used to search an accelerator. The lookup method
(accel_find) changed too, making the option field
unnecessary but it became AccelClass::opt_name despite
that. Therefore, and given that none accelerator
implementation sets AccelClass::opt_name, let's
remove this attribute.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 include/sysemu/accel.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/sysemu/accel.h b/include/sysemu/accel.h
index 70e9e2f2a1..81293cdb08 100644
--- a/include/sysemu/accel.h
+++ b/include/sysemu/accel.h
@@ -36,7 +36,6 @@ typedef struct AccelClass {
     ObjectClass parent_class;
     /*< public >*/
=20
-    const char *opt_name;
     const char *name;
     int (*init_machine)(MachineState *ms);
     void (*setup_post)(MachineState *ms, AccelState *accel);
--=20
2.21.0



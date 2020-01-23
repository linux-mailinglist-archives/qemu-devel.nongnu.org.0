Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBF146E0B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 17:14:06 +0100 (CET)
Received: from localhost ([::1]:60126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuf7N-0000Y8-K0
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 11:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iuctr-0000XI-Vv
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:52:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iuctq-0000Zm-R6
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:51:59 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30839
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iuctq-0000Yy-OI
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579787518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZUTqMJAVFiqA8/M+XBMhMoeNYbFbjZoeV4ynwzaloU=;
 b=U9IAP9OUeEwyynXc2sjl4cfyrH3ITXr9AkQymzcjEsNZAMMtVHJMQWKX6GNPJIhOi5DFuv
 TfO0HDpT0H3d7M2mhV42YR2Qo7Hxx3IXnYbfiugurdTB7UkwA5opYX4ebjbI03Y3+zrJc9
 JxL4PcOj21N/JZF1PbodoGCviEhjZJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-RYEEZG6CP7mZ0xoVXLkuCw-1; Thu, 23 Jan 2020 08:51:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65CA9802567
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 13:51:56 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A94785781;
 Thu, 23 Jan 2020 13:51:54 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/59] accel/tcg: Sanitize include path
Date: Thu, 23 Jan 2020 14:50:20 +0100
Message-Id: <1579787449-27599-31-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
References: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: RYEEZG6CP7mZ0xoVXLkuCw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Commit af0440ae852 moved the qemu_tcg_configure() function,
but introduced extraneous 'include/' in the includes path.
As it is not necessary, remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20200121110349.25842-11-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/tcg/tcg-all.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/tcg-all.c b/accel/tcg/tcg-all.c
index 1802ce0..acfdcfd 100644
--- a/accel/tcg/tcg-all.c
+++ b/accel/tcg/tcg-all.c
@@ -31,9 +31,9 @@
 #include "sysemu/cpus.h"
 #include "qemu/main-loop.h"
 #include "tcg/tcg.h"
-#include "include/qapi/error.h"
-#include "include/qemu/error-report.h"
-#include "include/hw/boards.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
+#include "hw/boards.h"
 #include "qapi/qapi-builtin-visit.h"
=20
 typedef struct TCGState {
--=20
1.8.3.1




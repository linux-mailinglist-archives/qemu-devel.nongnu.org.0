Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB94EC5DB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 15:44:35 +0200 (CEST)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZYck-0004eI-Pa
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 09:44:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZYbR-0003Y3-IC
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nZYbO-0000zl-Gj
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 09:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648647789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UgfpGBW1y7I1vKTPKg8LSAn4vqTuR4OpQUr5z0J9T6c=;
 b=J9ej5adaa98KPZNYdT5fyG6AIeZTdhSG4pY8gfa25Be18mWG5FP21NxXaEzD29/Gv6Skc3
 knSihD48ZUNt/3L45KUl7bNN3PhHwm4WnKaHd+lNijkKXoOG3X6uEVXZhyqN6QyaygWl+2
 +4MmQ7VsgjyRBJSUMmLJaNizgxWvcuM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-aYxWVyUANNWlrXO2cKdJyQ-1; Wed, 30 Mar 2022 09:43:05 -0400
X-MC-Unique: aYxWVyUANNWlrXO2cKdJyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBB0B3811A3F;
 Wed, 30 Mar 2022 13:43:04 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12D23141DECC;
 Wed, 30 Mar 2022 13:43:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH] linux-user/sh4/termbits: Silence warning about TIOCSER_TEMT
 double definition
Date: Wed, 30 Mar 2022 15:43:02 +0200
Message-Id: <20220330134302.979686-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seen while compiling on Alpine:

 In file included from ../linux-user/strace.c:17:
 In file included from ../linux-user/qemu.h:11:
 In file included from ../linux-user/syscall_defs.h:1247:
 ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
  [-Wmacro-redefined]
 # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
          ^
 /usr/include/sys/ioctl.h:50:9: note: previous definition is here
 #define TIOCSER_TEMT 1
         ^
 1 warning generated.

Add the TARGET_ prefix here, too, like we do it on the other architectures.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/sh4/termbits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/sh4/termbits.h b/linux-user/sh4/termbits.h
index f91b5c51cf..eeabd2d7a9 100644
--- a/linux-user/sh4/termbits.h
+++ b/linux-user/sh4/termbits.h
@@ -273,7 +273,7 @@ ebugging only */
 #define TARGET_TIOCSERGETLSR   TARGET_IOR('T', 89, unsigned int) /* 0x5459 */ /* Get line sta
 tus register */
   /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
-# define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
+# define TARGET_TIOCSER_TEMT   0x01   /* Transmitter physically empty */
 #define TARGET_TIOCSERGETMULTI TARGET_IOR('T', 90, int) /* 0x545A
 */ /* Get multiport config  */
 #define TARGET_TIOCSERSETMULTI TARGET_IOW('T', 91, int) /* 0x545B
-- 
2.27.0



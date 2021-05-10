Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3F377D47
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 09:39:27 +0200 (CEST)
Received: from localhost ([::1]:60072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg0Vh-0002DW-V7
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 03:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SH-0001Yp-7g
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lg0SE-0003i3-57
 for qemu-devel@nongnu.org; Mon, 10 May 2021 03:35:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620632147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vg9babYANHygxSPCVO30oT2Da9N8ETqj2zn5uS77xMA=;
 b=YvI8MnqwYqXHOuddCnF21xvce9n3RzrcId3XaP4uBdj0Kl4Sh0HxpX3d9eEL69/Xju1+Wn
 80tQydisbdjocWBa6ZVB5hxfYw/N0F8a+IhUctAg41TSJ5btRoYYD65qV8XVB7wEnFDkkf
 2Sfar+EOu5VkjZJ0v9Ws0JY060nzrcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-KLjkSt0LN5e-neQURist_w-1; Mon, 10 May 2021 03:35:44 -0400
X-MC-Unique: KLjkSt0LN5e-neQURist_w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5462364149;
 Mon, 10 May 2021 07:35:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0680C2BE74;
 Mon, 10 May 2021 07:35:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/9] pc-bios/s390-ccw: Fix the cc-option macro in the Makefile
Date: Mon, 10 May 2021 09:35:21 +0200
Message-Id: <20210510073524.85951-7-thuth@redhat.com>
In-Reply-To: <20210510073524.85951-1-thuth@redhat.com>
References: <20210510073524.85951-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cc-option macro is not doing what it should - compared with the
original from the rules.mak file that got removed with commit
660f793093 ("Makefile: inline the relevant parts of rules.mak"),
the arguments got changed and thus the macro is rather doubling
the QEMU_CFLAGS than adding the flag that should be tested.

Message-Id: <20210502174836.838816-3-thuth@redhat.com>
Fixes: 22fb2ab096 ("pc-bios/s390-ccw: do not use rules.mak")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
index 29fd9019b8..f0fe84c9eb 100644
--- a/pc-bios/s390-ccw/Makefile
+++ b/pc-bios/s390-ccw/Makefile
@@ -6,8 +6,8 @@ include ../../config-host.mak
 CFLAGS = -O2 -g
 
 quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
-cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null > /dev/null \
-	      2>&1 && echo OK), $1, $2)
+cc-option = $(if $(shell $(CC) $1 $2 -S -o /dev/null -xc /dev/null \
+			 >/dev/null 2>&1 && echo OK),$2,$3)
 
 VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
 set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath $(PATTERN) $1)))
-- 
2.27.0



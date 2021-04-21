Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B178367373
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 21:30:29 +0200 (CEST)
Received: from localhost ([::1]:36720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZIYO-0003lP-Ds
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 15:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIR3-0003yk-KQ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZIR1-0005dL-TB
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 15:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619032971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O1UFhIcIO1sB0rYOq17pQK4R3ILF1OU6LlNmhkawpmk=;
 b=Ddft+qdURdtAn5dyon9fVxB4DPKVmJrcsueOTZ2m67sdjpbhECbc2KdaKxjNwvk5+5PcE3
 Y3nm+GD6bzIHsAZ2RX2iDKXcLgPuRRv4hx30AuQl1HaK9cQj4eJLedHxP6WcHBnDrhnj9P
 K5BeCJGnep5h/YuxZmBL/R9+s1/6APg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-37xIrnzTPS2564t1Q9xF3w-1; Wed, 21 Apr 2021 15:22:39 -0400
X-MC-Unique: 37xIrnzTPS2564t1Q9xF3w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B230780432C;
 Wed, 21 Apr 2021 19:22:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDBD25C1D5;
 Wed, 21 Apr 2021 19:22:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v3 4/8] qapi/error: assert QAPISourceInfo is not None
Date: Wed, 21 Apr 2021 15:22:29 -0400
Message-Id: <20210421192233.3542904-5-jsnow@redhat.com>
In-Reply-To: <20210421192233.3542904-1-jsnow@redhat.com>
References: <20210421192233.3542904-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Built-in stuff is not parsed from a source file, and therefore have no
QAPISourceInfo. If such None info was used for reporting an error,
built-in stuff would be broken. Programming error. Instead of reporting
a confusing error with bogus source location then, we better crash.

We currently crash only if self.col was set. Assert that self.info is
not None in order to crash reliably.

We can not yet change the type of the initializer to prove this cannot
happen at static analysis time before the remainder of the code is fully
typed.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/error.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
index d179a3bd0c7..d0bc7af6e76 100644
--- a/scripts/qapi/error.py
+++ b/scripts/qapi/error.py
@@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
         self.col = col
 
     def __str__(self):
+        assert self.info is not None
         loc = str(self.info)
         if self.col is not None:
             assert self.info.line is not None
-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C976A2D625F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:47:42 +0100 (CET)
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knP6T-0001IF-Pm
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrk-0008QP-Uh
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrb-0003Tn-5U
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XZ27pivnTCpVjagT3xZv6YltdtK87FBiuGDMyDsOnQ=;
 b=MGyz2ZyC27pa5UP6MBk8xthQ0wCvlF80ysz0QGlFeEnpOjHOjGqSTt5HKnFX6VoCpbj4NM
 o7MBHNJrSO7DT30UcKWvVBhpu2s5A7aY1Cpv8g4eTkspaYWFzn9UXmdfgyCUPf3xKLTWJk
 9fD/BXjt+Je/M06EnwMP7Biphn51KVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-FbYMJoAsOqSqoKlZIqbUUQ-1; Thu, 10 Dec 2020 11:32:12 -0500
X-MC-Unique: FbYMJoAsOqSqoKlZIqbUUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CA86C2A0;
 Thu, 10 Dec 2020 16:31:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA1A510013C0;
 Thu, 10 Dec 2020 16:31:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D37C310FA0AA; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/13] qga: Replace an unreachable error by abort()
Date: Thu, 10 Dec 2020 17:31:27 +0100
Message-Id: <20201210163132.2919935-9-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

check_suspend_mode()'s error message

    Parameter 'mode' expects GuestSuspendMode

makes no sense to users: GuestSuspendMode is a C enum.  Fortunately,
it is unreachable.  Replace it by abort().

Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-8-armbru@redhat.com>
---
 qga/commands-win32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 300b87c859..87dc43e837 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1441,8 +1441,7 @@ static void check_suspend_mode(GuestSuspendMode mode, Error **errp)
         }
         break;
     default:
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "mode",
-                   "GuestSuspendMode");
+        abort();
     }
 }
 
-- 
2.26.2



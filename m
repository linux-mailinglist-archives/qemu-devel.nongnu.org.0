Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FEB2B173D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 09:33:05 +0100 (CET)
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdUW0-0003E7-FB
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 03:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPl-0006Co-T1
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPj-0005jR-6P
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605255994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa6UcU7GnhGYCWrAd4CKY0zyrE7pm8Zz/JHPSJL+3e4=;
 b=XcXsLdaCyBSxl6mcmnw7OBEagoQQP0FXwgTwLPcgVjNpQCnAiu4AfV6VDCtXfmJXCS1QJF
 cx1jfwaHDHBYQG50XfhSagOBIBYwF9+3bJK/ErHVQQixochHCTpwvpi+DDVBm0//gbmxJ0
 ZpFoNIHgnRf14BElQVhhjlJSUON+XHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-_ekKB961O5mhlR-n87JjSQ-1; Fri, 13 Nov 2020 03:26:30 -0500
X-MC-Unique: _ekKB961O5mhlR-n87JjSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC6698030AE;
 Fri, 13 Nov 2020 08:26:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9049A6EF50;
 Fri, 13 Nov 2020 08:26:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AAE21138401; Fri, 13 Nov 2020 09:26:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] qga: Tweak a guest-shutdown error message
Date: Fri, 13 Nov 2020 09:26:24 +0100
Message-Id: <20201113082626.2725812-9-armbru@redhat.com>
In-Reply-To: <20201113082626.2725812-1-armbru@redhat.com>
References: <20201113082626.2725812-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change

    Parameter 'mode' expects halt|powerdown|reboot

to

    Parameter 'mode' expects 'halt', 'powerdown', or 'reboot'

for consistency with similar error messages elsewhere.

Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qga/commands-win32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 87dc43e837..ba1fd07d06 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -334,7 +334,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
         shutdown_flag |= EWX_REBOOT;
     } else {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "mode",
-                   "halt|powerdown|reboot");
+                   "'halt', 'powerdown', or 'reboot'");
         return;
     }
 
-- 
2.26.2



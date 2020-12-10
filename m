Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69722D6259
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:47:06 +0100 (CET)
Received: from localhost ([::1]:54180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knP5j-0000eV-5K
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrQ-0008HD-2A
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1knOrK-0003S7-O5
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607617921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qvSNPr5nX91x7bAYWO5n2Bq8U95y5FiZEGiuCY2ec6w=;
 b=M/9YutTDEyIJ3XvIle2xcCDPBzx+fSN39rmOaXqmTi8eThagx3GNBj1nIv2J7K/xntAzkU
 j5kbhXrGdfxJmyPz+CvoFWYQPeBHkgdlfOHY1B8QpMj+ReO9+bAeakZdzkyxXMoiEc48Qs
 ZSQ9fvw9/4YWnapjL2maMKtK61ERR9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-XI7PPYgrNZSPo6cYtlFUqQ-1; Thu, 10 Dec 2020 11:31:58 -0500
X-MC-Unique: XI7PPYgrNZSPo6cYtlFUqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C36801AAD;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54C755C6B8;
 Thu, 10 Dec 2020 16:31:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BFDAB11329A6; Thu, 10 Dec 2020 17:31:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/13] qerror: Drop unused QERR_ macros
Date: Thu, 10 Dec 2020 17:31:21 +0100
Message-Id: <20201210163132.2919935-3-armbru@redhat.com>
In-Reply-To: <20201210163132.2919935-1-armbru@redhat.com>
References: <20201210163132.2919935-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QERR_INVALID_BLOCK_FORMAT is dead since commit e6641719fe "block:
Always pass NULL as drv for bdrv_open()", 2015-09-14.

QERR_INVALID_PASSWORD is dead since commit c01c214b69 "block: remove
all encryption handling APIs", 2017-07-11.

Bury them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113082626.2725812-2-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qapi/qmp/qerror.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
index 7c76e24aa7..3eabd451d8 100644
--- a/include/qapi/qmp/qerror.h
+++ b/include/qapi/qmp/qerror.h
@@ -43,9 +43,6 @@
 #define QERR_FEATURE_DISABLED \
     "The feature '%s' is not enabled"
 
-#define QERR_INVALID_BLOCK_FORMAT \
-    "Invalid block format '%s'"
-
 #define QERR_INVALID_PARAMETER \
     "Invalid parameter '%s'"
 
@@ -55,9 +52,6 @@
 #define QERR_INVALID_PARAMETER_VALUE \
     "Parameter '%s' expects %s"
 
-#define QERR_INVALID_PASSWORD \
-    "Password incorrect"
-
 #define QERR_IO_ERROR \
     "An IO error has occurred"
 
-- 
2.26.2



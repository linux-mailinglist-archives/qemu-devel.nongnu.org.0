Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5F51A23D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 16:32:39 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmG3S-0001F3-VU
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwd-0000mC-Vo
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nmFwc-0007ED-Eo
 for qemu-devel@nongnu.org; Wed, 04 May 2022 10:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651674333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JPenWIdohtSBCEhLlxaLO6pPH5tqekKoSOptC+3Z9cE=;
 b=RXNZPYsg/zaixZQxdacfP2Fc0FrzsLprwWoCgNj6zIASInZerkfPX2wcFYSoJjxTN5x+9P
 CvgWDFCekkDJ3fp3LPY6BYyTmcGe6BLNsGh4akCEoVIQ7DIH7Z3LE5zhQmdr8TfFOGzQNU
 M2ulzzTH20Aj3Pr32b58TJTTFmooVjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-uK-ZU5UsMkabA6Apitkwng-1; Wed, 04 May 2022 10:25:30 -0400
X-MC-Unique: uK-ZU5UsMkabA6Apitkwng-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72DEB811E83;
 Wed,  4 May 2022 14:25:30 +0000 (UTC)
Received: from merkur.str.redhat.com (dhcp-192-180.str.redhat.com
 [10.33.192.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7493402189;
 Wed,  4 May 2022 14:25:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 01/13] qemu-img: properly list formats which have consistency
 check implemented
Date: Wed,  4 May 2022 16:25:10 +0200
Message-Id: <20220504142522.167506-2-kwolf@redhat.com>
In-Reply-To: <20220504142522.167506-1-kwolf@redhat.com>
References: <20220504142522.167506-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Denis V. Lunev" <den@openvz.org>

Simple grep for the .bdrv_co_check callback presence gives the following
list of block drivers
* QED
* VDI
* VHDX
* VMDK
* Parallels
which have this callback. The presense of the callback means that
consistency check is supported.

The patch updates documentation accordingly.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220407083932.531965-1-den@openvz.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/tools/qemu-img.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 8885ea11cf..85a6e05b35 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -332,8 +332,8 @@ Command description:
   ``-r all`` fixes all kinds of errors, with a higher risk of choosing the
   wrong fix or hiding corruption that has already occurred.
 
-  Only the formats ``qcow2``, ``qed`` and ``vdi`` support
-  consistency checks.
+  Only the formats ``qcow2``, ``qed``, ``parallels``, ``vhdx``, ``vmdk`` and
+  ``vdi`` support consistency checks.
 
   In case the image does not have any inconsistencies, check exits with ``0``.
   Other exit codes indicate the kind of inconsistency found or if another error
-- 
2.35.1



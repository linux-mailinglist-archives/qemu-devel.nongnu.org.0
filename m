Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45934F79FB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:41:50 +0200 (CEST)
Received: from localhost ([::1]:40924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNiA-000517-2Q
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:41:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1ncNgC-00043k-AI; Thu, 07 Apr 2022 04:39:49 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:57732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1ncNgA-0006TB-5p; Thu, 07 Apr 2022 04:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=ubV5LpIcAIveBZrlRKfIODTIzXx2C6lOGsNPaiESMwg=; b=sY+N21kUPcsP
 Onr5cvLBV9WuhIPtCEFSmfJXPsd0mhV/8QUIvn8eNb9p2Mr3CK2WmAiAsbKfcW23MSTbaDpmAOkvC
 vMl0qMhW4mwE+EJ0qs1etq1+cF28UNpo7UqNYCQaHsul+iCDrONzJIanjkydNYw/1IgVc3fEC16qT
 F8ak8=;
Received: from [185.231.240.5] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.94.2)
 (envelope-from <den@openvz.org>)
 id 1ncNfm-007qOL-NO; Thu, 07 Apr 2022 10:39:33 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/1] qemu-img: properly list formats which have consistency
 check implemented
Date: Thu,  7 Apr 2022 11:39:32 +0300
Message-Id: <20220407083932.531965-1-den@openvz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 docs/tools/qemu-img.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 8885ea11cf..85a6e05b35 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -332,8 +332,8 @@ by the used format or see the format descriptions below for details.
   ``-r all`` fixes all kinds of errors, with a higher risk of choosing the
   wrong fix or hiding corruption that has already occurred.
 
-  Only the formats ``qcow2``, ``qed`` and ``vdi`` support
-  consistency checks.
+  Only the formats ``qcow2``, ``qed``, ``parallels``, ``vhdx``, ``vmdk`` and
+  ``vdi`` support consistency checks.
 
   In case the image does not have any inconsistencies, check exits with ``0``.
   Other exit codes indicate the kind of inconsistency found or if another error
-- 
2.32.0



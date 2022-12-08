Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CAE64719D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:24:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Ho1-0003ct-Hi; Thu, 08 Dec 2022 09:23:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hnu-0003b3-4N
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hns-0000dr-I6
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670509391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b9V4aGV7kbNn55y/PL//dCfI37apzIXh65RAvofpdNc=;
 b=MVMHADjhd+16XfcfyRiXAKYUD2OOIV3EUC2KGpvNycyghR8eAjlSPLFy/TvjqM2IXhbNMc
 MK6mzhrFBiv/kyGnJbZ5lTx81d5T7T1ntKfnOa1BnRBwVGs8SiJOrUDBCCzN0uVk8Vk9LK
 fVE2t8GSKDFQ0+H/cI+d0D8D/kTq7wI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-444-GY37zHHNM7-jNckubJB3VQ-1; Thu, 08 Dec 2022 09:23:09 -0500
X-MC-Unique: GY37zHHNM7-jNckubJB3VQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80D7085A588
 for <qemu-devel@nongnu.org>; Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 553691121333;
 Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4795C21E688F; Thu,  8 Dec 2022 15:23:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 3/4] coroutine: Clean up superfluous inclusion of
 qemu/lockable.h
Date: Thu,  8 Dec 2022 15:23:05 +0100
Message-Id: <20221208142306.2642640-4-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-1-armbru@redhat.com>
References: <20221208142306.2642640-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qemu/progress_meter.h | 2 +-
 block/progress_meter.c        | 2 ++
 tests/unit/test-coroutine.c   | 1 -
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qemu/progress_meter.h b/include/qemu/progress_meter.h
index dadf822bbf..0f2c0a32d2 100644
--- a/include/qemu/progress_meter.h
+++ b/include/qemu/progress_meter.h
@@ -27,7 +27,7 @@
 #ifndef QEMU_PROGRESS_METER_H
 #define QEMU_PROGRESS_METER_H
 
-#include "qemu/lockable.h"
+#include "qemu/thread.h"
 
 typedef struct ProgressMeter {
     /**
diff --git a/block/progress_meter.c b/block/progress_meter.c
index aa2e60248c..31a170a2cd 100644
--- a/block/progress_meter.c
+++ b/block/progress_meter.c
@@ -23,7 +23,9 @@
  * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  * THE SOFTWARE.
  */
+
 #include "qemu/osdep.h"
+#include "qemu/coroutine.h"
 #include "qemu/progress_meter.h"
 
 void progress_init(ProgressMeter *pm)
diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 513800d3db..b0d21d673a 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qemu/coroutine_int.h"
-#include "qemu/lockable.h"
 
 /*
  * Check that qemu_in_coroutine() works
-- 
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4146531D3
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:31:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yvp-0004tI-DK; Wed, 21 Dec 2022 08:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7yvh-0004qL-83
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:14:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p7yvf-0005ee-G2
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671628478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEKOLlqwNgXaAI4cZFQV+6JRlUZBug07TFQp3654L8c=;
 b=DPQS4s5w05+eWNeDfn80e3LZFgeEKAKhE5AT2PN2e3qXG/kuEZ8r+hFaZUqaE01G7yg22s
 n2TqV+DLTznVOxhHkJxGybNE1/V6jIj1NCKEMyuF/+nMpM1GEzSfBEF39TQOkYolWUINhD
 on90gPzJkFB98ONcBgGgo4tEDJXdCyY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-bKfdYjeZM_uEk7xzRcFKjw-1; Wed, 21 Dec 2022 08:14:37 -0500
X-MC-Unique: bKfdYjeZM_uEk7xzRcFKjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D64CF3813F2F
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 13:14:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB1E82166B26;
 Wed, 21 Dec 2022 13:14:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A035C21E6935; Wed, 21 Dec 2022 14:14:35 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com,
	pbonzini@redhat.com
Subject: [PATCH v3 3/5] coroutine: Clean up superfluous inclusion of
 qemu/lockable.h
Date: Wed, 21 Dec 2022 14:14:33 +0100
Message-Id: <20221221131435.3851212-4-armbru@redhat.com>
In-Reply-To: <20221221131435.3851212-1-armbru@redhat.com>
References: <20221221131435.3851212-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
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
2.38.1



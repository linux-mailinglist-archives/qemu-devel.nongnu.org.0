Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD2E2841EC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 23:12:06 +0200 (CEST)
Received: from localhost ([::1]:46614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPXm8-0001UL-QV
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 17:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkJ-00088W-I4
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPXkH-0007Ku-AR
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 17:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601932207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfFoCaY7u2a8bedI085FZLdj/V/rVAXLYLm4VQS+GFk=;
 b=YCApkoGECmUl9eIFBqB3Uldoro40zCKHDKaAqp1F2MDudWfT5otvUssYonScq7g+qJTiCd
 VMdpVpkarAgiUIk66Rt+KM22HOF6LsDTmEl79kc3vkMpxG1kYGDzeqoziOxEj77bRYJflh
 DIRBr9Y4vBG9r7nZx0DAFZhZUKlDAUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-MeIn9L3bOCKyYWW2ljK5qg-1; Mon, 05 Oct 2020 17:10:05 -0400
X-MC-Unique: MeIn9L3bOCKyYWW2ljK5qg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E892104D3E6;
 Mon,  5 Oct 2020 21:10:04 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51BF07368A;
 Mon,  5 Oct 2020 21:10:04 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/21] numa: hmat: require parent cache description before the
 next level one
Date: Mon,  5 Oct 2020 17:09:40 -0400
Message-Id: <20201005211000.710404-2-ehabkost@redhat.com>
In-Reply-To: <20201005211000.710404-1-ehabkost@redhat.com>
References: <20201005211000.710404-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Spec[1] defines 0 - 3 level memory side cache, however QEMU
CLI allows to specify an intermediate cache level without
specifying previous level. Such option(s) silently ignored
when building HMAT table, which leads to incomplete cache
information.
Make sure that previous level exists and error out
if it hasn't been provided.

1) ACPI 6.2A 5.2.27.5 Memory Side Cache Information Structure

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1842877
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20200924091406.1321012-1-imammedo@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/numa.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 7d5d4130016..6dc3d19d282 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -424,7 +424,13 @@ void parse_numa_hmat_cache(MachineState *ms, NumaHmatCacheOptions *node,
     }
 
     if ((node->level > 1) &&
-        ms->numa_state->hmat_cache[node->node_id][node->level - 1] &&
+        ms->numa_state->hmat_cache[node->node_id][node->level - 1] == NULL) {
+        error_setg(errp, "Cache level=%" PRIu8 " shall be defined first",
+                   node->level - 1);
+        return;
+    }
+
+    if ((node->level > 1) &&
         (node->size <=
             ms->numa_state->hmat_cache[node->node_id][node->level - 1]->size)) {
         error_setg(errp, "Invalid size=%" PRIu64 ", the size of level=%" PRIu8
-- 
2.26.2



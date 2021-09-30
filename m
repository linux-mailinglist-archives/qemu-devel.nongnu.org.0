Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C4641D309
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 08:06:47 +0200 (CEST)
Received: from localhost ([::1]:41388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVpDS-0003SK-OJ
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 02:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVosA-00012i-7N; Thu, 30 Sep 2021 01:44:46 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:52465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mVos8-0003W9-GV; Thu, 30 Sep 2021 01:44:45 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HKhyR1NnPz4xbc; Thu, 30 Sep 2021 15:44:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632980671;
 bh=FOcUvm71r/IlEJj0V0eyTaEOb0M2bDP2O9jbSeS+zkw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GTqnJu5V9XksoQPq5zmyorFbQkSjH3IhpHfz7CBQ9igLI8DsMUxjYayp37DCBv4yN
 szWwNdXkLYEyLjtyRDxlClb3cD7HlnPPnpug5pHO5tZxKO+MaJLgMUp5ymLu0MMglC
 uJbYV7bdbDu/uXPAx78bjbTRLrC4wK+7e8QpY2O0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 14/44] memory_hotplug.c: handle dev->id = NULL in
 acpi_memory_hotplug_write()
Date: Thu, 30 Sep 2021 15:43:56 +1000
Message-Id: <20210930054426.357344-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930054426.357344-1-david@gibson.dropbear.id.au>
References: <20210930054426.357344-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, groug@kaod.org, hpoussin@reactos.org, clg@kaod.org,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

qapi_event_send_mem_unplug_error() deals with @device being NULL by
replacing it with an empty string ("") when emitting the event. Aside
from the fact that this behavior (qapi visitor mapping NULL pointer to
"") can be patched/changed someday, there's also the lack of utility
that the event brings to listeners, e.g. "a memory unplug error happened
somewhere".

In theory we should just avoit emitting this event at all if dev->id is
NULL, but this would be an incompatible change to existing guests.
Instead, let's make the forementioned behavior explicit: if dev->id is
NULL, pass an empty string to qapi_event_send_mem_unplug_error().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210907004755.424931-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/acpi/memory_hotplug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af37889423..6a71de408b 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -178,7 +178,7 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
-                qapi_event_send_mem_unplug_error(dev->id,
+                qapi_event_send_mem_unplug_error(dev->id ? : "",
                                                  error_get_pretty(local_err));
                 error_free(local_err);
                 break;
-- 
2.31.1



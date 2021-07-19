Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070C23CECB4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:25:56 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Zpr-0003Lc-3b
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZB-0002zn-Ui; Mon, 19 Jul 2021 16:08:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZA-00024e-Cw; Mon, 19 Jul 2021 16:08:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d12so17578476pfj.2;
 Mon, 19 Jul 2021 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82WS94ROvYpuXPkwrfOvl7UdrcY3ebhz/ICLfEsbpsM=;
 b=sMhZKr0Xq4xaBbIvpePbe48/46eczovUIg18jL8ks1ft/opAdVO0i8j7Oxi8hlom4V
 uKN3OFmyyvVENXVF9F4HrxhFfPENrwRpYyyp1QyVyA35vWksI0rEwjVNNhhVg0WU/6Yf
 fgCA12B6/dCehmoIFnXeSKCMj7TzEuAPBJFvJYaKcR0/R0FUjCR689T3BPoiQpy5zpJ5
 0wIGtp8KDz5bkPIHNFs2ivtPCRkwOFGDHtzSyAmrJrlFVqxbx3vtrippvmh3Rd+VVGje
 AnxeRBLEcsjkkc2DMnLgRWYEwCNV4NoZw9nEE11C1HgKcs0zR9Mw26Un1GCNp1e2KqHm
 hg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82WS94ROvYpuXPkwrfOvl7UdrcY3ebhz/ICLfEsbpsM=;
 b=QfO0euOdQikkT2tj0PDZfcfDJnqIEHPWM7HNg5T4IpBDKmtw9ohlyQq8NHlYpabQ4E
 8QrKj5vBrbVne+R3sm6qjWqbNs4XJDT0bNK7Is53/rMNf1XE5QDI50IxHw1dYz7gR/fZ
 zmkyBAIyDdGE1R63rQcjuJ8e/OVEfTsZMP/QK9hwfR+DQVzURnzFQVHAst3Lvlr+Nsyd
 HqHhoUESpyf9JMWuL/SSIask7whhV2Q5u48qBSCdkWYARurhp91n8VzcPKv/5aYXWyXV
 KkkslZCoZipxqyWdYptRhRTZDiPACAn7runGubqzmF5VJEJ5WzZt68RsB0r5aL/tEfxX
 5oFA==
X-Gm-Message-State: AOAM530af3Muylt+hu04ZwDcajTwF2PJV3GDnOS4sfvxwcQGNfQvkYMr
 nQGsHI6OEwRuzDzVaRq5XcfjCtmrth8j5A==
X-Google-Smtp-Source: ABdhPJyMcv/a5hQLTcirftNNrNcK4Oy7Z5iukNZ+Rbsy6sZadmW4iHGbdyD2bTs7mhaE2cHc76Y+yw==
X-Received: by 2002:a63:c147:: with SMTP id p7mr27260280pgi.415.1626725318777; 
 Mon, 19 Jul 2021 13:08:38 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 1/7] hw/acpi/memory_hotplug.c: avoid sending
 MEM_UNPLUG_ERROR if dev->id is NULL
Date: Mon, 19 Jul 2021 17:08:21 -0300
Message-Id: <20210719200827.1507276-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=danielhb413@gmail.com; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qapi_event_send_mem_unplug_error() deals with @device being NULL by
replacing it with an empty string ("") when emitting the event. Aside
from the fact that this is a side effect that can be patched someday,
there's also the lack of utility that the event brings to listeners,
e.g.  "a memory unplug error happened somewhere".

We're better of not emitting the event if dev->id is NULL. Next patches
will introduce a new device unplug error event that is better suited to
deal with dev->id NULL scenarios. MEM_UNPLUG_ERROR will continue to be
emitted to avoid breaking existing APIs, but it'll be deprecated and
removed in the future.

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/acpi/memory_hotplug.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af37889423..e37acb0367 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -177,9 +177,14 @@ static void acpi_memory_hotplug_write(void *opaque, hwaddr addr, uint64_t data,
             /* call pc-dimm unplug cb */
             hotplug_handler_unplug(hotplug_ctrl, dev, &local_err);
             if (local_err) {
+                const char *error_pretty = error_get_pretty(local_err);
+
                 trace_mhp_acpi_pc_dimm_delete_failed(mem_st->selector);
-                qapi_event_send_mem_unplug_error(dev->id,
-                                                 error_get_pretty(local_err));
+
+                if (dev->id) {
+                    qapi_event_send_mem_unplug_error(dev->id, error_pretty);
+                }
+
                 error_free(local_err);
                 break;
             }
-- 
2.31.1



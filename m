Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CDF3F6CBE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 02:50:54 +0200 (CEST)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIh81-0004ID-7u
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 20:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6C-0001ZK-Jb; Tue, 24 Aug 2021 20:49:00 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:42829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIh6B-0006vu-50; Tue, 24 Aug 2021 20:49:00 -0400
Received: by mail-qk1-x72a.google.com with SMTP id t4so10959853qkb.9;
 Tue, 24 Aug 2021 17:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OYzSxiPLqYYDJju9oYHrYm0nV1on+EwDLiSYp/IyZ5w=;
 b=roJd5tanoKsi+eP6/Und0kjWtPA/7jeaVnBxZGh+m+r98MXucKHpXewdJbYBNbdhuj
 NtdsyU9qzNVpSO+TW7dAJPHiOpqhv711BSdXqUNDLEtO4jNBloeaSlmxjeWioAfRHXRb
 4B+pBmpwSk/vXwYXApVgamsQQNVhkoz0zkiazI4Xx9PjBsGN7L6yvsUh3V/OyENl2+Lv
 qSXPtjJI2q60/8epoYNKIcRGSOCSz1lpEk9IkS+MIJnNiReg7Fby48zaUPhdx18H1w0X
 6JdKzjAopDKjUie7/2HCSSFEyqMna2RN0qy5FsZqKvMV8PeUeIyPnjTI+keeabfIjAQ1
 wOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OYzSxiPLqYYDJju9oYHrYm0nV1on+EwDLiSYp/IyZ5w=;
 b=d6Ukb/6F0ANUho8ihBvQxY9Z7jzL+U0A93bbzCzpGU1xvQd2CJd/6oWkNL+2Kma2aj
 F/pi44QOEwAuR2bAjeYEADIazIoojdDDPWUb9l1o6lGE2ATQC7nA4uosEaOZ37LHvnWi
 RFzhahv1mVg0sT+Rg9x1DWUft3ltyVKACR9wfpKZNK2H3j/6hgn7lRZnszbxThXFuTnQ
 EahGZC6Ziezf351gVXut/KZdRz7/m8XXPFgHqhnV5BB7SJ80ERyyjkj1J5AQ+trtCh6Y
 Hrl0GXGEXKQOZ8R/W5d0+3hiO5GFzNrGTCWk73i5qBk8OLd0f2rJnn/NC0XvkqqsPxM5
 NuMw==
X-Gm-Message-State: AOAM533oJTsvq+Ro1wGOW6DudDJvDjeh+BWrLmca45+oY1eH5Hg6TNt2
 kIjd608CsyAze7YacoRApBfFGLQuT1Q=
X-Google-Smtp-Source: ABdhPJxP6S8tgzt5ATUDexob3lCtmYDCYQoEWiyTV5fpCO9yG6dIk7iWK1d86JLxQS+e6DZ7RwLDWA==
X-Received: by 2002:ae9:ed53:: with SMTP id c80mr29978480qkg.402.1629852537859; 
 Tue, 24 Aug 2021 17:48:57 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id x10sm1515266qto.41.2021.08.24.17.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 17:48:57 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/7] memory_hotplug.c: handle dev->id = NULL in
 acpi_memory_hotplug_write()
Date: Tue, 24 Aug 2021 21:48:29 -0300
Message-Id: <20210825004835.472919-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825004835.472919-1-danielhb413@gmail.com>
References: <20210825004835.472919-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
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
from the fact that this behavior (qapi visitor mapping NULL pointer to
"") can be patched/changed someday, there's also the lack of utility
that the event brings to listeners, e.g. "a memory unplug error happened
somewhere".

In theory we should just avoit emitting this event at all if dev->id is
NULL, but this would be an incompatible change to existing guests.
Instead, let's make the forementioned behavior explicit: if dev->id is
NULL, pass an empty string to qapi_event_send_mem_unplug_error().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
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



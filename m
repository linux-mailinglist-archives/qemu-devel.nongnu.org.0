Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01474416EBD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:18:11 +0200 (CEST)
Received: from localhost ([::1]:59906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThLO-0006r1-1o
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThAA-0004wN-CS
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mThA6-0003Zk-Ci
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632474386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FVk/66SMV9Z14GpKnbeJNn6b61WCANcun218vXI9kbI=;
 b=Gx7Xp6Y9UWlIUSCJxOOJBzqgGVuR0KvglFTYBEdAlvoQNpTXRt2VLITkQRqwzp3hCSyhgj
 XMYMrzfgybfqI21uhu817xnJHUNE6dXcfxf9pD5GYehHvNlqjgU2/oZaUTixa49YmCnTTU
 TsUxOe+U4XfYQImnNxMvcqJmpfYtKzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-z_zn6AEEPh2Mid6NjLgEsw-1; Fri, 24 Sep 2021 05:06:25 -0400
X-MC-Unique: z_zn6AEEPh2Mid6NjLgEsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8526084A5EA;
 Fri, 24 Sep 2021 09:06:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A534D5D9DC;
 Fri, 24 Sep 2021 09:06:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] qemu-option: Allow deleting opts during
 qemu_opts_foreach()
Date: Fri, 24 Sep 2021 11:04:23 +0200
Message-Id: <20210924090427.9218-8-kwolf@redhat.com>
In-Reply-To: <20210924090427.9218-1-kwolf@redhat.com>
References: <20210924090427.9218-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 armbru@redhat.com, its@irrelevant.dk, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use QTAILQ_FOREACH_SAFE() so that the current QemuOpts can be deleted
while iterating through the whole list.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/qemu-option.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 61cb4a97bd..eedd08929b 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -1126,11 +1126,11 @@ int qemu_opts_foreach(QemuOptsList *list, qemu_opts_loopfunc func,
                       void *opaque, Error **errp)
 {
     Location loc;
-    QemuOpts *opts;
+    QemuOpts *opts, *next;
     int rc = 0;
 
     loc_push_none(&loc);
-    QTAILQ_FOREACH(opts, &list->head, next) {
+    QTAILQ_FOREACH_SAFE(opts, &list->head, next, next) {
         loc_restore(&opts->loc);
         rc = func(opaque, opts, errp);
         if (rc) {
-- 
2.31.1



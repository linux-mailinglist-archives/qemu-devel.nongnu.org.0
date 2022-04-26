Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3B7510C87
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 01:18:10 +0200 (CEST)
Received: from localhost ([::1]:35022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njURd-0004rt-CN
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 19:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUI4-0003UW-Eu
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:08:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1njUI2-0000D8-P8
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 19:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651014494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JghpxiChl6cuKnY7pXCN68XGYDcXsIdBNsxh/g1mscg=;
 b=OAbqqOVARiGZyfHJgbzeDzts2M8zbQgGQIW8JFh90eoRCuVZg20vafKvU+xep8H3ritv6S
 iJ6U7+nurBwoFv73v5cRu17MT7WJhbtBRf5eXMyEoQbNsQ3aM4Otp/aRx88k+J2OZ30lvB
 FN6bExpczLIkRwLghJC5myXWc0wpwro=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-bePjE5sNNxSzyB9gu7MgdQ-1; Tue, 26 Apr 2022 19:08:12 -0400
X-MC-Unique: bePjE5sNNxSzyB9gu7MgdQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-db2a59fdc8so104406fac.6
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 16:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JghpxiChl6cuKnY7pXCN68XGYDcXsIdBNsxh/g1mscg=;
 b=Js2edTvKO1Fy88gr1XnakQMIHaJbHGAf0DM9D4wwUH0lnttVoB+DbvAahefI1tZiA+
 Tcg4zuHOSCANYjiGgEIxITG7A1VOujiYH7sbx3u3lPcMv/Wc4EfXeswTaCIvSfeOPPKQ
 Fm0sZyDjiDw35X3SLK+oSXrOBhDszvF9UWT8VdMuRK0EiAAvf0EAm+/G4WtdqQasO7KL
 TySxe5Bbu4Q5z3n1zqbPl9+/w8IzyvtImJ7zIfT7bS2kQH3hHNtOBRO3sz6nx50mra6p
 UzjIG21gOR4RLVWg1JJFZY3pT4D/+17JB/cKhONstX0Pwt7U4qbavKmB0A/nGgSz9eWl
 iNuA==
X-Gm-Message-State: AOAM530l3rHMdwX6E/LwQGUQUx+9sEbIda6AdZwzTh9U7yJ607Gt4sri
 TX4zhYb2fdshFgc78uZN4xEEZBdkFUbeF7kfyfieQS+vEI4qdaXSTrtkCIT7rNK+CHWR37ffQ/2
 bQPnEQ5YQdCOBEQU=
X-Received: by 2002:a05:6871:282:b0:e9:113a:fc6a with SMTP id
 i2-20020a056871028200b000e9113afc6amr8465393oae.200.1651014492058; 
 Tue, 26 Apr 2022 16:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeuJlB+YjSAOART0rrbDUjrsQF4Rgu7Zrl6DcSlZkTWKqf9xLL3iyvc9W7h6XJUNcJu1uA/g==
X-Received: by 2002:a05:6871:282:b0:e9:113a:fc6a with SMTP id
 i2-20020a056871028200b000e9113afc6amr8465386oae.200.1651014491883; 
 Tue, 26 Apr 2022 16:08:11 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a4a3004000000b0035e974ec923sm419855oof.2.2022.04.26.16.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 16:08:11 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Xu <peterx@redhat.com>
Subject: [PATCH v10 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Date: Tue, 26 Apr 2022 20:06:55 -0300
Message-Id: <20220426230654.637939-7-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426230654.637939-1-leobras@redhat.com>
References: <20220426230654.637939-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since d48c3a0445 ("multifd: Use a single writev on the send side"),
sending the header packet and the memory pages happens in the same
writev, which can potentially make the migration faster.

Using channel-socket as example, this works well with the default copying
mechanism of sendmsg(), but with zero-copy-send=true, it will cause
the migration to often break.

This happens because the header packet buffer gets reused quite often,
and there is a high chance that by the time the MSG_ZEROCOPY mechanism get
to send the buffer, it has already changed, sending the wrong data and
causing the migration to abort.

It means that, as it is, the buffer for the header packet is not suitable
for sending with MSG_ZEROCOPY.

In order to enable zero copy for multifd, send the header packet on an
individual write(), without any flags, and the remanining pages with a
writev(), as it was happening before. This only changes how a migration
with zero-copy-send=true works, not changing any current behavior for
migrations with zero-copy-send=false.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 15fb668e64..07b2e92d8d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -617,6 +617,7 @@ static void *multifd_send_thread(void *opaque)
     MultiFDSendParams *p = opaque;
     Error *local_err = NULL;
     int ret = 0;
+    bool use_zero_copy_send = migrate_use_zero_copy_send();
 
     trace_multifd_send_thread_start(p->id);
     rcu_register_thread();
@@ -639,9 +640,14 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->iovs_num = 1;
             p->normal_num = 0;
 
+            if (use_zero_copy_send) {
+                p->iovs_num = 0;
+            } else {
+                p->iovs_num = 1;
+            }
+
             for (int i = 0; i < p->pages->num; i++) {
                 p->normal[p->normal_num] = p->pages->offset[i];
                 p->normal_num++;
@@ -665,8 +671,19 @@ static void *multifd_send_thread(void *opaque)
             trace_multifd_send(p->id, packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
-            p->iov[0].iov_len = p->packet_len;
-            p->iov[0].iov_base = p->packet;
+            if (use_zero_copy_send) {
+                /* Send header first, without zerocopy */
+                ret = qio_channel_write_all(p->c, (void *)p->packet,
+                                            p->packet_len, &local_err);
+                if (ret != 0) {
+                    break;
+                }
+
+            } else {
+                /* Send header using the same writev call */
+                p->iov[0].iov_len = p->packet_len;
+                p->iov[0].iov_base = p->packet;
+            }
 
             ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
                                          &local_err);
-- 
2.36.0



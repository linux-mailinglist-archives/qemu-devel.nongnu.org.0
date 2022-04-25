Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2501F50EB5C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 23:56:43 +0200 (CEST)
Received: from localhost ([::1]:59086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj6hG-0005Z5-8l
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 17:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cl-0005yW-Me
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1nj6cj-00016s-WB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 17:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650923521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hbPgZABDK158e31/mU/kG6uBy4IBjH2iSa4i92TRHlM=;
 b=N96wmm9Wc05Mc535IWWZ5h30BFhZtOOLgnsWJHT9JfcBwE7/8O1wvXT/CtcMcNEjENo0hv
 tTm8oiVl92jnAe53sF13jZwcOQ8cPm68d1jqYGEd0Jjadpw9n+xqUlUn1PdKo5Uev1Dipk
 LgNdBh50xlRGT78u+0m3fW3LiEd2GtQ=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-PEUL7AWuO9aTrjwAz5Zszw-1; Mon, 25 Apr 2022 17:52:00 -0400
X-MC-Unique: PEUL7AWuO9aTrjwAz5Zszw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-e9114e0121so1966150fac.17
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 14:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hbPgZABDK158e31/mU/kG6uBy4IBjH2iSa4i92TRHlM=;
 b=Jm9JW/KMJA2j19WeJ4mDOQcDjCpAoClwSqmixEAVM0EoG7z9EKEskQh0DrCccSyS5r
 CL2WzsJ4kICgy6UI0pbwYmUoXyeV76gR63j4f/+AsvZ/lX5fpOJCE7LU2oV20Pmo6eqk
 DQIpNGBct8l26iPatTFCbiq/BEysKFLPjidCdfSIto7/SyjUBHsLmKU3ecinZbGW6x8k
 FukQCj82NAkWJnyHjMTwSFxCLbyDxAttub/Zumz4pXrAjwoC/37TsVq/hWmdHeRUl97m
 HR9SNUSzBAumHWyIeZUtHq4wUr9n9uPtVLdrnre9w++7OXlZCBULTGpCi6niXo63tIIb
 rYEg==
X-Gm-Message-State: AOAM531qsH94BhZKyNPmVvLCsxqQpOwTKyDnjrV7OELKZUkdkdkFCHOo
 AYcIAyM6ERGnzsgEo4IBlRd23AfJPODJ32V7OLIxUGjLuhj3ISk6PywITNJjTb9slqfz14yOhoy
 +EHC28rFsUnmwCw0=
X-Received: by 2002:a05:6808:2193:b0:322:ce9a:f444 with SMTP id
 be19-20020a056808219300b00322ce9af444mr13792598oib.245.1650923517777; 
 Mon, 25 Apr 2022 14:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAhHXFkTmVhuc30rCqihEfTzUz+f68kUvPGbQB1/HpA4VSCUhfLaWG7eRGeeOYzv5ZsM0etA==
X-Received: by 2002:a05:6808:2193:b0:322:ce9a:f444 with SMTP id
 be19-20020a056808219300b00322ce9af444mr13792544oib.245.1650923516071; 
 Mon, 25 Apr 2022 14:51:56 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:2ba0:92e8:26c9:ce7e:f03e])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056870e60700b000e686d13878sm156807oag.18.2022.04.25.14.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 14:51:55 -0700 (PDT)
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
Subject: [PATCH v9 6/7] multifd: Send header packet without flags if
 zero-copy-send is enabled
Date: Mon, 25 Apr 2022 18:50:55 -0300
Message-Id: <20220425215055.611825-7-leobras@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425215055.611825-1-leobras@redhat.com>
References: <20220425215055.611825-1-leobras@redhat.com>
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
 migration/multifd.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 15fb668e64..6c940aaa98 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -639,6 +639,8 @@ static void *multifd_send_thread(void *opaque)
         if (p->pending_job) {
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
+            int iov_offset = 0;
+
             p->iovs_num = 1;
             p->normal_num = 0;
 
@@ -665,15 +667,36 @@ static void *multifd_send_thread(void *opaque)
             trace_multifd_send(p->id, packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
-            p->iov[0].iov_len = p->packet_len;
-            p->iov[0].iov_base = p->packet;
+            if (migrate_use_zero_copy_send()) {
+                /* Send header without zerocopy */
+                ret = qio_channel_write_all(p->c, (void *)p->packet,
+                                            p->packet_len, &local_err);
+                if (ret != 0) {
+                    break;
+                }
+
+                if (!p->normal_num) {
+                    /* No pages will be sent */
+                    goto skip_send;
+                }
 
-            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
+                /* Skip first iov : header */
+                iov_offset = 1;
+            } else {
+                /* Send header using the same writev call */
+                p->iov[0].iov_len = p->packet_len;
+                p->iov[0].iov_base = p->packet;
+            }
+
+            ret = qio_channel_writev_all(p->c, p->iov + iov_offset,
+                                         p->iovs_num - iov_offset,
                                          &local_err);
+
             if (ret != 0) {
                 break;
             }
 
+skip_send:
             qemu_mutex_lock(&p->mutex);
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
-- 
2.36.0



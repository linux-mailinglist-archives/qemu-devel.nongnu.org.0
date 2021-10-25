Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E717C439447
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 12:55:42 +0200 (CEST)
Received: from localhost ([::1]:53802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mexdl-0004ed-US
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 06:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4a-0005wh-Sa
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mex4Y-0007Kw-TJ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 06:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635157158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U9BZh9Ygo6vLd1ULxxQkmosqAtmQhTG60fJVSic8ncY=;
 b=gCucby3Sjg40RQoCEP+Jx9eHzqKf/SghK1hcwjaMsEUUVuRA/mORifapNtPoPW+cW3/Wf2
 p+7ahJxSomEv+9Txd1w6BWwAOt/Chnh3mHongvle0kpK9Nr3gJHmcZlWoy9PeOiFG4XR++
 XVuvZCR0r0qymo0z2NhHTbacWH45Sfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-cnTXkqsuPjKIjDm74xTEtg-1; Mon, 25 Oct 2021 06:19:17 -0400
X-MC-Unique: cnTXkqsuPjKIjDm74xTEtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FC29101B4A0;
 Mon, 25 Oct 2021 10:19:16 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01BCD17CE1;
 Mon, 25 Oct 2021 10:19:11 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 24/25] job.h: split function pointers in JobDriver
Date: Mon, 25 Oct 2021 06:17:34 -0400
Message-Id: <20211025101735.2060852-25-eesposit@redhat.com>
In-Reply-To: <20211025101735.2060852-1-eesposit@redhat.com>
References: <20211025101735.2060852-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The job API will be handled separately in another serie.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/job.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/qemu/job.h b/include/qemu/job.h
index 6e67b6977f..7e9e59f4b8 100644
--- a/include/qemu/job.h
+++ b/include/qemu/job.h
@@ -169,12 +169,21 @@ typedef struct Job {
  * Callbacks and other information about a Job driver.
  */
 struct JobDriver {
+
+    /* Fields initialized in struct definition and never changed. */
+
     /** Derived Job struct size */
     size_t instance_size;
 
     /** Enum describing the operation */
     JobType job_type;
 
+    /*
+     * Functions run without regard to the BQL and may run in any
+     * arbitrary thread. These functions do not need to be thread-safe
+     * because the caller ensures that are invoked from one thread at time.
+     */
+
     /**
      * Mandatory: Entrypoint for the Coroutine.
      *
@@ -201,6 +210,13 @@ struct JobDriver {
      */
     void coroutine_fn (*resume)(Job *job);
 
+    /*
+     * Global state (GS) API. These functions run under the BQL lock.
+     *
+     * See include/block/block-global-state.h for more information about
+     * the GS API.
+     */
+
     /**
      * Called when the job is resumed by the user (i.e. user_paused becomes
      * false). .user_resume is called before .resume.
-- 
2.27.0



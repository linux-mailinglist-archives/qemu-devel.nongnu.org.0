Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 858BE649F88
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:11:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iPP-0000yz-32; Mon, 12 Dec 2022 07:59:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPK-0000so-Ch
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPI-0000aA-US
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 07:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsVfL5XDIu6LZaIdcZU4pJWqYmJqYM1K2rNCMTcYK2w=;
 b=GE/VHnTQGd+ZePN/1BkpdcdH7OGYOey2C6zq5H+jn6g0GywV3ieizuIgNVEic2Kb98+DLE
 EVXHhJUQDSlFGtIHfPYpcihnQBFR/veqwA4+Og0PkhPGzgira0jkHaEsc0CdajBmV2jV5f
 H4LGCblfbUe8nHA+64iSXPIHyEERQkY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-eUsRFmDdOYKWq56Io7A5sA-1; Mon, 12 Dec 2022 07:59:42 -0500
X-MC-Unique: eUsRFmDdOYKWq56Io7A5sA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso1966947wmk.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rsVfL5XDIu6LZaIdcZU4pJWqYmJqYM1K2rNCMTcYK2w=;
 b=OlafGTHmaQb0JUsFP7KdGtVaa/VY+V59o568MmaTBIqQibkQA7Rzluweggm/WvBlwR
 1qsvq2JIQ13ByptEZfCRAU5D6mIuY7APGC2Lt/8uovb8M0iRq3Es7MWx0PBV476dyEK1
 6jWAzLZqdhmD0A+hvt3bY2J/k3/uxXEWLVOAdsmGERROjR3ZQF0Wo0UjTwCpqFxoeOVQ
 +sXDc7YVleWn/4pFsXRGblqewU08e3nw6zGXbHVZe/5pXZOrqx5LwzkMKPcRHCNej8gn
 E0bZqtDOGLDap4kMfqF0U5rYq5AfUe17FLQa+FcCqdK7GZgc4q5IGKCPbq7UnM1Ly9Pr
 EA/g==
X-Gm-Message-State: ANoB5pm4BGJy2sgGDttxXLjG2T8R9io67vexpdsBlEO52fh20SY7oHLm
 TU+RG+zo32M4pYgG4iVMiG8sXmbU6oRembSX9PkRSZmuIaDUGnfNuOgyoZc11onBELV9l5kkKgD
 wlLgi4rdq521DPJgXMZu6ularVOKEjvmtDNk5tyJT1D+BZhrENnVh5LFpJhcScGsPFHo=
X-Received: by 2002:a5d:5a90:0:b0:242:6af:8a26 with SMTP id
 bp16-20020a5d5a90000000b0024206af8a26mr9976942wrb.70.1670849980961; 
 Mon, 12 Dec 2022 04:59:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4TrapX/VdjyUPZXOxDU3lsrrEtQkqzDYzFhO1tQYbK2kli88ZRtlYEgHaWgvtDsfpLSkDXQg==
X-Received: by 2002:a5d:5a90:0:b0:242:6af:8a26 with SMTP id
 bp16-20020a5d5a90000000b0024206af8a26mr9976925wrb.70.1670849980694; 
 Mon, 12 Dec 2022 04:59:40 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a5d6446000000b002425504ae7dsm8804822wrw.80.2022.12.12.04.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 06/15] tests/qemu-iotests/030: test_stream_parallel should use
 auto_finalize=False
Date: Mon, 12 Dec 2022 13:59:11 +0100
Message-Id: <20221212125920.248567-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

First, use run_job() instead of the current logic to run the
stream job. Then, use auto_finalize=False to be sure that
the job is not automatically deleted once it is done.

In this way, if the job finishes before we want, it is not
finalized yet so the other commands can still execute
without failing. run_job() will then take care of calling
job-finalize.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Suggested-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20220314131854.2202651-11-eesposit@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qemu-iotests/030 | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 98595d47fec3..e5c13cb5fe4c 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -256,7 +256,7 @@ class TestParallelOps(iotests.QMPTestCase):
             pending_jobs.append(job_id)
             result = self.vm.qmp('block-stream', device=node_name,
                                  job_id=job_id, bottom=f'node{i-1}',
-                                 speed=1024)
+                                 speed=1024, auto_finalize=False)
             self.assert_qmp(result, 'return', {})
 
         # Do this in reverse: After unthrottling them, some jobs may finish
@@ -272,14 +272,8 @@ class TestParallelOps(iotests.QMPTestCase):
             result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
             self.assert_qmp(result, 'return', {})
 
-        # Wait for all jobs to be finished.
-        while len(pending_jobs) > 0:
-            for event in self.vm.get_qmp_events(wait=True):
-                if event['event'] == 'BLOCK_JOB_COMPLETED':
-                    job_id = self.dictpath(event, 'data/device')
-                    self.assertTrue(job_id in pending_jobs)
-                    self.assert_qmp_absent(event, 'data/error')
-                    pending_jobs.remove(job_id)
+        for job in pending_jobs:
+            self.vm.run_job(job=job, auto_finalize=False)
 
         self.assert_no_active_block_jobs()
         self.vm.shutdown()
-- 
2.38.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B74E3E41
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:16:41 +0100 (CET)
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdRI-00083A-7x
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:16:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8n-0003RA-Aj
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWd8l-0006Xu-Kb
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647950251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x/nWOWZ4rJg8/bzrORM6fWx6B4c3zOa/QO5cgrz63tE=;
 b=MHNfGEF+j53B/eVBUqVUDzo4wqtTk6RNihV1IMZsF2W0D5Ed+8c9GQKyBVAYBsvnguMfRN
 JWEUQud/Z5O+biX+/VOSi0ROIbVWQSTioU5NkYeAZjfk7+LvBZSL8amKrAsWO+/h0VFLe4
 2PsfibvPS+H5Y+4lhp3zdIJtb/nicWI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134--mShUXKBMh2TqzL-jXhWnw-1; Tue, 22 Mar 2022 07:57:29 -0400
X-MC-Unique: -mShUXKBMh2TqzL-jXhWnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 870691C04B60;
 Tue, 22 Mar 2022 11:57:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 439624010A1C;
 Tue, 22 Mar 2022 11:57:29 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/25] iotests.py: Filters for VM.run_job()
Date: Tue, 22 Mar 2022 12:56:46 +0100
Message-Id: <20220322115647.726044-25-hreitz@redhat.com>
In-Reply-To: <20220322115647.726044-1-hreitz@redhat.com>
References: <20220322115647.726044-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow filters for VM.run_job(), and pass the filters given to
VM.blockdev_create() to it.

(Use this opportunity to annotate VM.run_job()'s parameter types;
unfortunately, for the filter, I could not come up with anything better
than Callable[[Any], Any] that would pass mypy's scrutiny.)

At one point, a plain string is logged, so the filters passed to it must
work fine with plain strings.  The only filters passed to it at this
point are the ones from VM.blockdev_create(), which are
filter_qmp_test_files() (by default) and 207's filter_hash().  Both
cannot handle plain strings yet, but we can make them by amending
filter_qmp() to treat them as plain values with a None key.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220318125304.66131-2-hreitz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4b788c7491..fcec3e51e5 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -607,8 +607,10 @@ def filter_qmp(qmsg, filter_fn):
     # Iterate through either lists or dicts;
     if isinstance(qmsg, list):
         items = enumerate(qmsg)
-    else:
+    elif isinstance(qmsg, dict):
         items = qmsg.items()
+    else:
+        return filter_fn(None, qmsg)
 
     for k, v in items:
         if isinstance(v, (dict, list)):
@@ -944,8 +946,12 @@ def qmp_log(self, cmd, filters=(), indent=None, **kwargs):
         return result
 
     # Returns None on success, and an error string on failure
-    def run_job(self, job, auto_finalize=True, auto_dismiss=False,
-                pre_finalize=None, cancel=False, wait=60.0):
+    def run_job(self, job: str, auto_finalize: bool = True,
+                auto_dismiss: bool = False,
+                pre_finalize: Optional[Callable[[], None]] = None,
+                cancel: bool = False, wait: float = 60.0,
+                filters: Iterable[Callable[[Any], Any]] = (),
+                ) -> Optional[str]:
         """
         run_job moves a job from creation through to dismissal.
 
@@ -975,7 +981,7 @@ def run_job(self, job, auto_finalize=True, auto_dismiss=False,
         while True:
             ev = filter_qmp_event(self.events_wait(events, timeout=wait))
             if ev['event'] != 'JOB_STATUS_CHANGE':
-                log(ev)
+                log(ev, filters=filters)
                 continue
             status = ev['data']['status']
             if status == 'aborting':
@@ -983,18 +989,18 @@ def run_job(self, job, auto_finalize=True, auto_dismiss=False,
                 for j in result['return']:
                     if j['id'] == job:
                         error = j['error']
-                        log('Job failed: %s' % (j['error']))
+                        log('Job failed: %s' % (j['error']), filters=filters)
             elif status == 'ready':
-                self.qmp_log('job-complete', id=job)
+                self.qmp_log('job-complete', id=job, filters=filters)
             elif status == 'pending' and not auto_finalize:
                 if pre_finalize:
                     pre_finalize()
                 if cancel:
-                    self.qmp_log('job-cancel', id=job)
+                    self.qmp_log('job-cancel', id=job, filters=filters)
                 else:
-                    self.qmp_log('job-finalize', id=job)
+                    self.qmp_log('job-finalize', id=job, filters=filters)
             elif status == 'concluded' and not auto_dismiss:
-                self.qmp_log('job-dismiss', id=job)
+                self.qmp_log('job-dismiss', id=job, filters=filters)
             elif status == 'null':
                 return error
 
@@ -1007,7 +1013,7 @@ def blockdev_create(self, options, job_id='job0', filters=None):
 
         if 'return' in result:
             assert result['return'] == {}
-            job_result = self.run_job(job_id)
+            job_result = self.run_job(job_id, filters=filters)
         else:
             job_result = result['error']
 
-- 
2.35.1



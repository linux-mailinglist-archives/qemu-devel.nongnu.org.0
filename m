Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA1128CC50
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 13:11:58 +0200 (CEST)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSIDm-00072I-1V
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 07:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kSHyn-00067D-EF
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 06:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kSHyl-0006JR-Fq
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 06:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602586586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=UDWgvxhfOwQDAvrQeg1nRXMTV7N9IHedPCarRuCerLg=;
 b=Z4srwyC4pbJTAiKwvfnzwxejMvJdadFVxKQjC0mxoltGa232wyI15MR5n7q07tqFcJqDbW
 C0vRPlDtC/x2E+iDrXQQ/cNshog7U2nNIXV7860hPAQlEn1dgVZwr/c/sVzWNM8vOyksAN
 SibdESwvBI0NL9VZSBNNvy5HrMFU7dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-tVZH3tkMOHy4bmBD6z72vw-1; Tue, 13 Oct 2020 06:56:24 -0400
X-MC-Unique: tVZH3tkMOHy4bmBD6z72vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD1628030B5;
 Tue, 13 Oct 2020 10:56:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-151.ams2.redhat.com [10.36.112.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A87296EF41;
 Tue, 13 Oct 2020 10:56:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 23/23] scripts/ci/gitlab-pipeline-status: wait for pipeline
 creation
Date: Tue, 13 Oct 2020 12:55:27 +0200
Message-Id: <20201013105527.20088-24-thuth@redhat.com>
In-Reply-To: <20201013105527.20088-1-thuth@redhat.com>
References: <20201013105527.20088-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

When called in wait mode, this script will also wait for the pipeline
to be get to a "running" state.  Because many more status may be seen
until a pipeline gets to "running", and those need to be handle too.

Reference: https://docs.gitlab.com/ee/api/pipelines.html#list-project-pipelines
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20200904164258.240278-8-crosa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/ci/gitlab-pipeline-status | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
index 628150ce0b..bac8233079 100755
--- a/scripts/ci/gitlab-pipeline-status
+++ b/scripts/ci/gitlab-pipeline-status
@@ -83,13 +83,22 @@ def wait_on_pipeline_success(timeout, interval,
             print(msg)
             return False
 
-        status = get_pipeline_status(project_id, commit_sha)
-        if status['status'] == 'running':
-            print('running...')
+        try:
+            status = get_pipeline_status(project_id, commit_sha)
+        except NoPipelineFound:
+            print('Pipeline has not been found, it may not have been created yet.')
+            time.sleep(1)
+            continue
+
+        pipeline_status = status['status']
+        status_to_wait = ('created', 'waiting_for_resource', 'preparing',
+                          'pending', 'running')
+        if pipeline_status in status_to_wait:
+            print('%s...' % pipeline_status)
             time.sleep(interval)
             continue
 
-        if status['status'] == 'success':
+        if pipeline_status == 'success':
             return True
 
         msg = "Pipeline failed, check: %s" % status['web_url']
-- 
2.18.2



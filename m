Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC3332368
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:55:37 +0100 (CET)
Received: from localhost ([::1]:53144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJa1Y-0003rn-35
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZsz-0005Ix-3I
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJZsx-0006pI-Cd
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r2wMN6IUyNuD/0qAvlFArcems7dUWGmZFrz5Hky9OvU=;
 b=fVRJyhNyGILkilHEvNXZQ/yPPiSt4X+Xm+0jKBs0NVCwWRI/c+ywmYEl8pMQOUw0MiWel0
 POz1o5MqyRUyrFEPhuejebBBVMmVN2M9e3Ihgty3RsSymFSQzy87Ex3qmCEI943iWzCEpH
 dSlY9CzeskyM+K9O8zHWuxksHGfJ+2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-P9EkyyOXN7ixmDoPUTU3gw-1; Tue, 09 Mar 2021 05:46:40 -0500
X-MC-Unique: P9EkyyOXN7ixmDoPUTU3gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4770F8015A0;
 Tue,  9 Mar 2021 10:46:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE53060C04;
 Tue,  9 Mar 2021 10:46:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] scripts/ci/gitlab-pipeline-status: split utlity function
 for HTTP GET
Date: Tue,  9 Mar 2021 11:46:09 +0100
Message-Id: <20210309104617.714908-7-thuth@redhat.com>
In-Reply-To: <20210309104617.714908-1-thuth@redhat.com>
References: <20210309104617.714908-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

This simply splits out the code that does an HTTP GET so that it
can be used for other API requests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210222193240.921250-2-crosa@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/ci/gitlab-pipeline-status | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
index 78e72f6008..0c1e8bd8a7 100755
--- a/scripts/ci/gitlab-pipeline-status
+++ b/scripts/ci/gitlab-pipeline-status
@@ -48,18 +48,25 @@ def get_local_branch_commit(branch):
     return result
 
 
-def get_pipeline_status(project_id, commit_sha1):
+def get_json_http_response(url):
     """
-    Returns the JSON content of the pipeline status API response
+    Returns the JSON content of an HTTP GET request to gitlab.com
     """
-    url = '/api/v4/projects/{}/pipelines?sha={}'.format(project_id,
-                                                        commit_sha1)
     connection = http.client.HTTPSConnection('gitlab.com')
     connection.request('GET', url=url)
     response = connection.getresponse()
     if response.code != http.HTTPStatus.OK:
         raise CommunicationFailure("Failed to receive a successful response")
-    json_response = json.loads(response.read())
+    return json.loads(response.read())
+
+
+def get_pipeline_status(project_id, commit_sha1):
+    """
+    Returns the JSON content of the pipeline status API response
+    """
+    url = '/api/v4/projects/{}/pipelines?sha={}'.format(project_id,
+                                                        commit_sha1)
+    json_response = get_json_http_response(url)
 
     # As far as I can tell, there should be only one pipeline for the same
     # project + commit. If this assumption is false, we can add further
-- 
2.27.0



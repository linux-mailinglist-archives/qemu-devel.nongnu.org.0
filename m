Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58446322039
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 20:35:33 +0100 (CET)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGzT-00033k-Ra
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 14:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEGx6-0001cn-9q
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:33:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEGx4-0006tK-Gp
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 14:33:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614022381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QY0FGERWWHE5xfsMry6Tr/HjO36qGvFs/SsSbcJrSyQ=;
 b=cdBZHAuhYNopL/A2Y578+0vhVlgzfTCBoDn6BfmnQOEfZ+B4yPtxO6khKEZVLmB3OGRfV3
 LjQoP3TMxQ8ixeeO9NtgmRN1II0OfcJiW9CM/plV/PwO44GsX8U4Gyku9sVkFllG7WBNlx
 iofI2nrBmxjlYXbe7qDcoJG+5pEnStI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-ftVn9UBaMjSfh8squNehRA-1; Mon, 22 Feb 2021 14:32:59 -0500
X-MC-Unique: ftVn9UBaMjSfh8squNehRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDFE85B677;
 Mon, 22 Feb 2021 19:32:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-28.rdu2.redhat.com
 [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 80A6A60C04;
 Mon, 22 Feb 2021 19:32:43 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] scripts/ci/gitlab-pipeline-status: split utlity function
 for HTTP GET
Date: Mon, 22 Feb 2021 14:32:38 -0500
Message-Id: <20210222193240.921250-2-crosa@redhat.com>
In-Reply-To: <20210222193240.921250-1-crosa@redhat.com>
References: <20210222193240.921250-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This simply splits out the code that does an HTTP GET so that it
can be used for other API requests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
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
2.25.4



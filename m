Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A52D7F24
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:08:12 +0100 (CET)
Received: from localhost ([::1]:49410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnlz-0008AQ-Rz
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnJe-0005vE-Q5
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnJU-0007oG-U3
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607711921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=obHs8znAefXghjXWQPk5eP9S546U9Y6XxorZiKMkE10=;
 b=Ft9+Tc5kbQnNcB8dkCexw7YM7bL43ZFWy2PJQ2K6vdSlvrb+OW5ATNKBh7eY8u7KT/GCtB
 EEIsq7zrapwzcsZliuxMTN6TI2XcnBEXlDD1rSmjbeHBNZued7HozFil2b4N2Ox81GnT8d
 mZA8FrFds9P4POVvHbHqP3lVCEH0n3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-73Bg8gRwPNe8Vnb2a9NcNA-1; Fri, 11 Dec 2020 13:38:37 -0500
X-MC-Unique: 73Bg8gRwPNe8Vnb2a9NcNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F8BF1E7D0;
 Fri, 11 Dec 2020 18:38:36 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D143F10023AC;
 Fri, 11 Dec 2020 18:38:30 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] gitlab-ci: Refactor show logs code and archive logs
Date: Fri, 11 Dec 2020 15:38:24 -0300
Message-Id: <20201211183827.915232-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: willianr@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the Travis CI time, it has carried (commit 67892c9537d9ac500934) a python
code to print the logs of acceptance tests in case of fail. Recently Avocado
released a new plug-in (called "testlogs") which allow us to configure the
framework to show the logs of tests which finished with a given status. For
example, print the logs of tests which FAIL or CANCEL. This series is about
replacing the old implementation by that native Avocado feature, on the
GitLab CI.

I took that opportunity to also introduce a change in the configuration
to archive the tests results files on GitLab CI for 2 days, regarless the
job failed or not. If the logs are important enough to retain them, it is
possible to do so by clicking on a 'Keep' button on UI; or you can simply
download it to your workstation.

Here is an example of job that succeed:
https://gitlab.com/wainersm/qemu/-/jobs/905873563

And its results files can be found at:
https://gitlab.com/wainersm/qemu/-/jobs/905873563/artifacts/browse/build/tests/results/latest/test-results/

Then an example of job that failed (I changed a test, forcing its fail):
https://gitlab.com/wainersm/qemu/-/jobs/906089498

[1] https://github.com/avocado-framework/avocado/issues/4266

Wainer dos Santos Moschetta (3):
  tests/acceptance: Bump avocado requirements to 83.0
  gitlab-ci: Refactor code that show logs of failed acceptances
  gitlab-ci: Archive logs of acceptance tests

 .gitlab-ci.yml         | 7 ++++++-
 tests/requirements.txt | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.28.0



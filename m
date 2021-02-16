Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156531CB22
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:34:50 +0100 (CET)
Received: from localhost ([::1]:41118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0V7-0007jr-1h
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Qa-00067y-Gc
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0QY-0005aH-30
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613482203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uTSOUPFBBpGdofX2ATTDm8US6qCDB/0GH4z8Fq0SmZM=;
 b=UYGOAur0GdoF4v26f6OZi9hB2QdgAol3XgA6jZ1ATWb21SFr9W1BbNtDL5SVXDVwpwXlp2
 srANik5fZAU82TSd5mEszzxnbB/xSKg321UeAszB3TEWzgvVaBGvJphIBjTSXpFQgfTjh5
 YDTqD3QkjobAScsjWNbtu5wSsCssqbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-3U5X3lHDPQqysma_gQj0ng-1; Tue, 16 Feb 2021 08:30:02 -0500
X-MC-Unique: 3U5X3lHDPQqysma_gQj0ng-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389D7107ACE3;
 Tue, 16 Feb 2021 13:30:01 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF035D9CC;
 Tue, 16 Feb 2021 13:29:56 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] fix build failures from incorrectly skipped container
 build jobs
Date: Tue, 16 Feb 2021 13:29:51 +0000
Message-Id: <20210216132954.295906-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes a problem with our gitlab CI rules that cause=0D
container builds to be skipped. See the commit description in the=0D
first patch for the details on this problem.=0D
=0D
The overall result of this series though is a small increase in overall=0D
pipeline time.=0D
=0D
Previously=0D
=0D
 - When container jobs are skipped: approx 1hr 5 mins=0D
 - When container jobs are run, cached by docker: approx 1hr 15 mins=0D
 - When container jobs are run, not cached by docker: approx 1hr 30 mins=0D
=0D
With this series applied the first scenario no longer exists, so=0D
all piplines are either 1hr 15 or 1hr 30 depending on whether the=0D
container phase is skipped.=0D
=0D
On the plus side the builds are more reliable as we're actually=0D
building container images at correct times.=0D
=0D
There is still a race condition though where build jobs can run=0D
with the wrong containers. This happens if you push two different=0D
branches to gitlab with different docker file content. If the=0D
container jobs for the 2nd branch finish before the 1st=0D
branch runs its build jobs, the 1st branch can end up using=0D
containers fro the second branch.  The only fix to truely fix=0D
that would be to stop using "latest" docker tag and always=0D
use a tag based on the branch name. This would mean we build=0D
up a growing set of docker images in the gitlab registry.=0D
=0D
At least this series is much more correct that what exists in=0D
git currently. I'm intending to continue to investigate a solution=0D
for the remaining race condition, but don't want to block this=0D
series from merging, since this already solves the problem for the=0D
majority of contributors' usage.=0D
=0D
Changed in v2:=0D
=0D
 - Set needs rules for cross jobs too=0D
=0D
Daniel P. Berrang=C3=A9 (3):=0D
  gitlab: always build container images=0D
  gitlab: add fine grained job deps for all build jobs=0D
  gitlab: fix inconsistent indentation=0D
=0D
 .gitlab-ci.d/containers.yml  |  7 ----=0D
 .gitlab-ci.d/crossbuilds.yml | 46 ++++++++++++++++++++++=0D
 .gitlab-ci.yml               | 74 ++++++++++++++++++++++++++++++++----=0D
 3 files changed, 112 insertions(+), 15 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D



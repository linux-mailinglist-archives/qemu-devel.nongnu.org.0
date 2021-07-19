Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99AF3CD479
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:14:05 +0200 (CEST)
Received: from localhost ([::1]:47448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5S9r-0006nB-4Z
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:14:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5S8Q-0004sq-2y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:12:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5S8M-0002V6-Au
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:12:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626696748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9Iq9ODQDddqVuDD+p6HrwiDPGHrnJIPdygUFUGG32Rg=;
 b=b7FZqTwxD7PQ9Tle6bNwLfxMA0k2eS/nO+p/wBhngg7VXB2zZugm7e7rp2eN7uSHLklQdn
 dyrMUgu02992eMCytn+XioUb2FJ2A6a/Cg4OuNt0Y5ikuQ6F2vFU1dzJtq55tl2nHdBMfU
 gvhChrdxDxzUCWnZqJyvatX5eVfq2os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-1BrGGaRzPSad9-hmSXe_VA-1; Mon, 19 Jul 2021 08:12:27 -0400
X-MC-Unique: 1BrGGaRzPSad9-hmSXe_VA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8B11804140;
 Mon, 19 Jul 2021 12:12:25 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-193.ams2.redhat.com
 [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B80B5DA2D;
 Mon, 19 Jul 2021 12:12:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab: limit jobs executed in most pipelines by default
Date: Mon, 19 Jul 2021 13:12:13 +0100
Message-Id: <20210719121215.2356409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU pipeline has as many as 120+ jobs, almost all of which are=0D
always run. This is wasteful in many ways. When merging to the main=0D
repo, Peter runs CI on 'staging' branch, which then gets immediately=0D
re-run on the 'master' branch.  The first patch in this series=0D
culls that redundancy by always skipping CI on pushes to 'master'.=0D
=0D
I suggest we setup a nightly scheduled job that runs on current=0D
contents of 'master' once a day, as a way to catch bitrot from OS=0D
distro's changing under us.=0D
=0D
I think we want the first patch as a high priority, since I think=0D
the duplicated jobs on master are really impacting our integration=0D
with Cirrus CI, delaying jobs since Cirrus has very strictly=0D
applied concurrency limits.=0D
=0D
=0D
=0D
The second patch is more speculative, and illustrates how to we=0D
can reduce the number of CI jobs run for *all* contributors,=0D
when they push to gitlab. There is a key decision to make here=0D
between:=0D
=0D
 a. run no jobs at all by default on push=0D
 b. run a few jobs by default on push to catch 90% of problems=0D
 c. run all jobs on by default on push=0D
=0D
Currently we're doing (c), and patch 2 implements (b), with an=0D
easy opt-in to trigger (c).=0D
=0D
There is a credible variant of patch 2 though, which could easily=0D
implement (a) with an opt-in to run (b), and a further opt-in to=0D
run (c).=0D
=0D
Or we can get more advanced and add ability for individual=0D
contributors to decide between (a) and (b) for default behaviour,=0D
based on a variable configured globally in their gitlab fork.=0D
=0D
There is an illustration of results of (b) here:=0D
=0D
   https://gitlab.com/berrange/qemu/-/pipelines/339281325=0D
=0D
Note that for all the non-defualt jobs, I've left them as=0D
manually triggerable. This makes a the pipeline UI a bit=0D
cluttered by default but lets you trigger jobs from the=0D
web UI individually. An alternative would be to never=0D
create the non-defualt jobs at all. They would have to be=0D
requested explicitly at time of push in some way.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  gitlab: prevent CI jobs running pushes to default branch or tags=0D
  gitlab: cut down on jobs run by default in user forks=0D
=0D
 .gitlab-ci.d/buildtest-template.yml  |  17 +---=0D
 .gitlab-ci.d/buildtest.yml           |  14 +++=0D
 .gitlab-ci.d/cirrus.yml              |   5 +-=0D
 .gitlab-ci.d/container-core.yml      |   3 +=0D
 .gitlab-ci.d/container-cross.yml     |   9 +-=0D
 .gitlab-ci.d/container-template.yml  |   1 +=0D
 .gitlab-ci.d/containers.yml          |   2 +=0D
 .gitlab-ci.d/crossbuild-template.yml |   3 +=0D
 .gitlab-ci.d/crossbuilds.yml         |   3 +=0D
 .gitlab-ci.d/qemu-project.yml        |   1 +=0D
 .gitlab-ci.d/workflow.yml            | 146 +++++++++++++++++++++++++++=0D
 .gitlab-ci.yml                       |  21 +---=0D
 12 files changed, 188 insertions(+), 37 deletions(-)=0D
 create mode 100644 .gitlab-ci.d/workflow.yml=0D
=0D
--=20=0D
2.31.1=0D
=0D



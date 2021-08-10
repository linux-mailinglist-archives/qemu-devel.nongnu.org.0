Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D03E5C8A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:08:27 +0200 (CEST)
Received: from localhost ([::1]:36120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSQc-0003pK-9b
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDSPV-0002NJ-Fs
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDSPS-0001gB-K5
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628604432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hC1J38MJ3ObCVRYOyojG8ZCF+y6PNeEDC4UGUBVVIiw=;
 b=eIosdSN6UAoUDPAro5YpH75YlLoHzk5CfB3wxffTzjlB154vnoyqpEKoJJLdoMRSeiChCu
 n2Ica0mHPwy/QvoIBMaSMu8xIfzATJBZhycOQfQJlpaE4JSArqqY7N6HGYW+iAuUfl52pP
 Loxo21I7RK/jx/jCui6Gov+CCa+lb+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-KrzAa27-PC674o5BpigZxA-1; Tue, 10 Aug 2021 10:07:09 -0400
X-MC-Unique: KrzAa27-PC674o5BpigZxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99E34100E431;
 Tue, 10 Aug 2021 14:07:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.194.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ABF527CA8;
 Tue, 10 Aug 2021 14:06:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] gitlab: avoid timeouts in windows cross builds
Date: Tue, 10 Aug 2021 15:06:51 +0100
Message-Id: <20210810140653.3969823-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.704, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The win64 cross build is quite often hitting the job timeout, despite=0D
having an elevated timeout of 80 minutes. A typical time is 75-78=0D
minutes in my tests, which leaves little headroom.=0D
=0D
I'm not inclined to increase the timeout beyond 80 minutes as this is=0D
already unreasonably long.=0D
=0D
Interestingly the win32 job doesn't timeout in the same way. In local=0D
tests I've found the mingw32 gcc is as much as 50% faster than=0D
mingw64 gcc in building QEMU. This explains at least why we only see=0D
win64 gitlab builds timeout normally.=0D
=0D
None the less, this series thus cuts down on the amount of stuff built=0D
in both win32 and win64 jobs, as well as cross build jobs more=0D
generally.=0D
=0D
With this applied:=0D
=0D
 - win32 job runs in 40 minutes instead of 55 minutes=0D
 - win64 job runs in 50 minutes instead of 75 minutes=0D
 - other cross build jobs are a few minutes faster=0D
=0D
this should give us plenty of headroom to avoid hitting the job=0D
timeouts.=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  gitlab: exclude sparc-softmmu and riscv32-softmmu from cross builds=0D
  gitlab: skip many more targets in windows cross builds=0D
=0D
 .gitlab-ci.d/crossbuild-template.yml | 3 ++-=0D
 .gitlab-ci.d/crossbuilds.yml         | 2 ++=0D
 2 files changed, 4 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



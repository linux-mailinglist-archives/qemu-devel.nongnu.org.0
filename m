Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1005928114C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 13:34:53 +0200 (CEST)
Received: from localhost ([::1]:48464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOJKt-0003sp-S1
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 07:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kOJJ8-0002gs-F7
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 07:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kOJJ4-000760-Az
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 07:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601638376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BHFIw8GjdNkSyO7iD0wPKSZTsRhf2g5fdetjxSe+ick=;
 b=T/OlbXxN+WhY17ruVDyH0b8d4LvtFrQdMRX6ADLLiU+WV4OsQFhYJGPXGbEFCVFVCscG0V
 WkYL+XYPBPnNukH8CJ0AJT34aRFKwBX7Y0wgOB2OyVMHnx0mjeORl6KbmI9SAHgo4uKYe/
 himHYiPbwIryFX8v01vuK+/LhQvUhX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-EsGgSj8SMxu3wKPdmmaJ0g-1; Fri, 02 Oct 2020 07:32:52 -0400
X-MC-Unique: EsGgSj8SMxu3wKPdmmaJ0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4446C186DD2E;
 Fri,  2 Oct 2020 11:32:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-9.ams2.redhat.com
 [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4959360C05;
 Fri,  2 Oct 2020 11:32:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] block: deprecate the sheepdog driver
Date: Fri,  2 Oct 2020 12:32:41 +0100
Message-Id: <20201002113243.2347710-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 sheepdog@lists.wpkg.org, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Yuan <namei.unix@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2 years back I proposed dropping the sheepdog mailing list from the=0D
MAINTAINERS file, but somehow the patch never got picked up:=0D
=0D
  https://lists.gnu.org/archive/html/qemu-block/2018-03/msg01048.html=0D
=0D
So here I am with the same patch again.=0D
=0D
This time I go further and deprecate the sheepdog driver entirely.=0D
See the rationale in the second patch commit message.=0D
=0D
Changes in v3:=0D
=0D
 - A few minor text changes=0D
 - Don't initialize static variable to false=0D
=0D
Daniel P. Berrang=C3=A9 (2):=0D
  block: drop moderated sheepdog mailing list from MAINTAINERS file=0D
  block: deprecate the sheepdog block driver=0D
=0D
 MAINTAINERS                |  1 -=0D
 block/sheepdog.c           | 14 ++++++++++++++=0D
 configure                  |  5 +++--=0D
 docs/system/deprecated.rst |  9 +++++++++=0D
 4 files changed, 26 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D



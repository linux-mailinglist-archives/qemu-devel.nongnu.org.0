Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EA9285456
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 00:11:54 +0200 (CEST)
Received: from localhost ([::1]:45374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPvBZ-0007t6-Ia
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 18:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9M-0006LS-Vc
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kPv9L-0006Mn-8S
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 18:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602022174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C999aiagk6KOyK+M3BSZ4sSc3YbI839m6idgoRIdXvM=;
 b=Nl3q+ADB/pRl3d0opZ94ghEaMNa+pnQCiVckp+qa6DRAe+MfwqXY4/4HCF3c7KTPZdel6I
 fMk+bNZ+27sGiXoOLU4ukTPDlRQmYHJZ3bwTZEVP617C4UnMBnxiboAujyrfVha2Zt37uW
 VftVPMWvY/6gO06ENLFjxofBH1jh0bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-1nACHwCPP3i2uwqSH9Walw-1; Tue, 06 Oct 2020 18:09:32 -0400
X-MC-Unique: 1nACHwCPP3i2uwqSH9Walw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5B380365F;
 Tue,  6 Oct 2020 22:09:31 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0263B619C4;
 Tue,  6 Oct 2020 22:09:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 00/21] machine + QOM queue, 2020-10-06
Date: Tue,  6 Oct 2020 18:09:09 -0400
Message-Id: <20201006220930.908275-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d7c5b788295426c1ef48a9ffc3432c51220f69ba=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2020-10-06 12:15:59 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/ehabkost/qemu.git tags/machine-next-pull-request=0D
=0D
for you to fetch changes up to 1b5e843ab68c4afa611da22f303a5b0daa979ad8:=0D
=0D
  numa: hmat: require parent cache description before the next level one (2=
020-10-06 11:09:41 -0400)=0D
=0D
----------------------------------------------------------------=0D
machine + QOM queue, 2020-10-06=0D
=0D
* QOM documentation fixes and cleanups (Eduardo Habkost)=0D
* user-mode: Prune build dependencies (Philippe Mathieu-Daud=C3=A9)=0D
* qom: Improve error message (Philippe Mathieu-Daud=C3=A9)=0D
* numa: hmat: require parent cache description before the next=0D
  level one (Igor Mammedov)=0D
=0D
----------------------------------------------------------------=0D
=0D
Eduardo Habkost (11):=0D
  qom: Fix DECLARE_*CHECKER documentation=0D
  docs/devel/qom: Fix indentation of bulleted list=0D
  docs/devel/qom: Fix indentation of code blocks=0D
  docs/devel/qom: Use *emphasis* for emphasis=0D
  docs/devel/qom: Remove usage of <code>=0D
  docs/devel/qom: Avoid long lines=0D
  kernel-doc: Handle function typedefs that return pointers=0D
  kernel-doc: Handle function typedefs without asterisks=0D
  qom: Explicitly tag doc comments for typedefs and structs=0D
  memory: Explicitly tag doc comments for structs=0D
  kernel-doc: Remove $decl_type=3D'type name' hack=0D
=0D
Igor Mammedov (1):=0D
  numa: hmat: require parent cache description before the next level one=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  hw/core/qdev-properties: Use qemu_strtol() in set_mac() handler=0D
  hw/core/qdev-properties: Use qemu_strtoul() in set_pci_host_devaddr()=0D
  hw/core/qdev-properties: Fix code style=0D
  hw/core/qdev-properties: Export enum-related functions=0D
  hw/core/qdev-properties: Export qdev_prop_enum=0D
  hw/core/qdev-properties: Export some integer-related functions=0D
  hw/core/qdev-properties: Extract system-mode specific properties=0D
  hw/core/cpu: Add missing 'exec/cpu-common.h' include=0D
  qom: Improve error message displayed with missing object properties=0D
=0D
 docs/devel/qom.rst               |  91 ++--=0D
 hw/core/qdev-prop-internal.h     |  30 ++=0D
 include/exec/memory.h            |   6 +-=0D
 include/hw/qdev-properties.h     |   1 +=0D
 include/qom/object.h             |  38 +-=0D
 hw/core/cpu.c                    |   1 +=0D
 hw/core/numa.c                   |   8 +-=0D
 hw/core/qdev-properties-system.c | 687 ++++++++++++++++++++++++++++-=0D
 hw/core/qdev-properties.c        | 735 ++-----------------------------=0D
 qom/object.c                     |   3 +-=0D
 scripts/kernel-doc               |  16 +-=0D
 11 files changed, 831 insertions(+), 785 deletions(-)=0D
 create mode 100644 hw/core/qdev-prop-internal.h=0D
=0D
--=20=0D
2.26.2=0D
=0D



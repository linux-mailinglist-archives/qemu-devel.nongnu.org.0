Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98F1C5305
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 12:21:00 +0200 (CEST)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVuh9-0005Sx-Ly
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 06:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVufW-0003j8-0j
 for qemu-devel@nongnu.org; Tue, 05 May 2020 06:19:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21379
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jVufU-00081j-Po
 for qemu-devel@nongnu.org; Tue, 05 May 2020 06:19:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588673955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S0kmFUBAFWqWQce0XxOZhwDORIQQB5RK6jNgj6PUn5Q=;
 b=R30geswYX/QshwIp8rWSVbh3Txn3cl+KDffTX2smjRgb/njk/Tpo1zSuUJ6KmSLmls5axJ
 JuoYIsyJ1FUah/pzmlJ6GG4Ph6ehn3HlHR/M1Fy2spw6qOenSZgCL4HHrFLyqhVEz1GTI5
 ZBF6CMxf6UU97o4ShLgZ3Y64BUDb5sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-3TXMPgJVOnmqcYMfxxiYlA-1; Tue, 05 May 2020 06:19:13 -0400
X-MC-Unique: 3TXMPgJVOnmqcYMfxxiYlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0454F1899521;
 Tue,  5 May 2020 10:19:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4163B5D9D3;
 Tue,  5 May 2020 10:19:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C4A0911358BC; Tue,  5 May 2020 12:19:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/10] More miscellaneous error handling fixes
Date: Tue,  5 May 2020 12:18:58 +0200
Message-Id: <20200505101908.6207-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 03:48:16
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Paul Durrant <xadimgnik@gmail.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* PATCH 2: missing return [Paul]
* PATCH 3: commit message typo [David]
* PATCH 5: error message tidied up [Eric, Philippe]
* PATCH 7: commit message pasto
* Old PATCH 4 dropped [Matthew]

Cc: Paul Durrant <xadimgnik@gmail.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Markus Armbruster (10):
  nvdimm: Plug memory leak in uuid property setter
  xen: Fix and improve handling of device_add usb-host errors
  s390x/cpumodel: Fix harmless misuse of visit_check_struct()
  tests/migration: Tighten error checking
  error: Use error_reportf_err() where appropriate
  mips/malta: Fix create_cps() error handling
  mips/boston: Fix boston_mach_init() error handling
  mips/boston: Plug memory leak in boston_mach_init()
  arm/sabrelite: Consistently use &error_fatal in sabrelite_init()
  i386: Fix x86_cpu_load_model() error API violation

 chardev/char-socket.c        |  5 +++--
 hw/arm/sabrelite.c           |  7 +------
 hw/mem/nvdimm.c              |  1 -
 hw/mips/boston.c             | 17 +++++++----------
 hw/mips/mips_malta.c         | 15 ++++++---------
 hw/sd/pxa2xx_mmci.c          |  4 ++--
 hw/sd/sd.c                   |  4 ++--
 hw/usb/dev-mtp.c             |  9 +++++----
 hw/usb/xen-usb.c             | 19 +++++++++----------
 qemu-nbd.c                   |  7 +++----
 scsi/qemu-pr-helper.c        |  4 ++--
 target/i386/cpu.c            | 25 ++++++++++++++++---------
 target/s390x/cpu_models.c    |  2 +-
 tests/qtest/migration-test.c |  4 ++--
 14 files changed, 59 insertions(+), 64 deletions(-)

--=20
2.21.1



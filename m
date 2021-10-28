Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0AF43E59E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:58:54 +0200 (CEST)
Received: from localhost ([::1]:35294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7np-0003fX-7l
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7kk-0001CO-OH
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7kh-00044W-AN
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635436537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1YfU37/aleYiVsCwIIseUMvIi0lD4XGZ/Fuj5eDl/YU=;
 b=bU2u4va1qD6IFoaYLZtwIUQKcKcU0ZwL9hMQELGs6NRYTEsNoMHhkrOUwC46xoib97/UOk
 OZXPf1FvRktlgLxTz9bwx56204ntDADBH4NlAmgW9w2TNX91psIM+XZwx07NpnaFNGJu/R
 JxN0t08McZNc0H3GIDn+C728LI/6f5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-yH9wmjUwMQWN0UoVs-_HsQ-1; Thu, 28 Oct 2021 11:55:35 -0400
X-MC-Unique: yH9wmjUwMQWN0UoVs-_HsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CACD69126B;
 Thu, 28 Oct 2021 15:55:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B2095F4EA;
 Thu, 28 Oct 2021 15:54:58 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/22] monitor: explicitly permit QMP commands to be added
 for all use cases
Date: Thu, 28 Oct 2021 16:54:35 +0100
Message-Id: <20211028155457.967291-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous postings:=0D
=0D
  v1: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02295.html=
=0D
  v2: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg03703.html=
=0D
  v3: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07710.html=
=0D
=0D
We are still adding HMP commands without any QMP counterparts. This is=0D
done because there are a reasonable number of scenarios where the cost=0D
of designing a QAPI data type for the command is not justified.=0D
=0D
This has the downside, however, that we will never be able to fully=0D
isolate the monitor code from the remainder of QEMU internals. It is=0D
desirable to be able to get to a point where subsystems in QEMU are=0D
exclusively implemented using QAPI types and never need to have any=0D
knowledge of the monitor.=0D
=0D
The way to get there is to stop adding commands to HMP only. All=0D
commands must be implemented using QMP and any HMP equivalent be=0D
a shim around the QMP implemetation. We don't want to compromise=0D
our supportability of QMP long term though.=0D
=0D
This series proposes that we relax our requirements around fine grained=0D
QAPI data design, but with the caveat that any command taking this=0D
design approach is mandated to use the 'x-' name prefix. This tradeoff=0D
should be suitable for any commands we have been adding exclusively to=0D
HMP in recent times, and thus mean we have mandate QMP support for all=0D
new commands going forward.=0D
=0D
The series then converts the following HMP commands to be QMP shims.=0D
=0D
    info opcount=0D
    info jit=0D
    info irq=0D
    info lapic=0D
    info cmma=0D
    info skeys=0D
    info ramblock=0D
    info rdma=0D
    info usb=0D
    info numa=0D
    info profile=0D
    info roms=0D
=0D
A full conversion would also enable HMP to be emulated entirely=0D
outside QEMU. This could be interesting if we introduce a new QEMU=0D
system emulator binary which is legacy free and 100% controlled=0D
via QMP, as it would let us provide HMP backcompat around it=0D
without the burden of HMP being integrated directly.=0D
=0D
There are still many HMP commands with no QMP counterpart after=0D
this series.=0D
=0D
 - A few are not relevant to port as they directly=0D
   reflect HMP functionality (help, info history).=0D
 - A few are sort of available in QMP but look quite=0D
   different (drive_add vs blockdev_add)=0D
 - A few are complicated. "info usbhost" is a dynamically=0D
   loaded HMP command inside a loadable module and we=0D
   don't have a way to dynamically register QMP handlers=0D
   at runtime.=0D
 - Most are just tedious gruntwork.=0D
=0D
Changed in v4:=0D
=0D
 - Introduce a 'cmd_info_hrt' callback for HMP commands,=0D
   to handle common case of an info command with no parameters=0D
   that returns humand readable text. This simply needs the=0D
   QMP callback and will print the resulting text=0D
 - Make hmp_handle_error return bool=0D
 - Improve HMP error handling docs=0D
=0D
Changed in v3:=0D
=0D
 - Temporarily spun off the 'info registers' and 'info tlb'=0D
   conversions. These required 30+ patches across all the=0D
   targets and was making this series too large and conflict=0D
   prone and spanning too many subsystems.=0D
=0D
   I'll re-submit those two later=0D
=0D
 - Pull in a fix for the 'info lapic' command=0D
=0D
 - Misc improvements to the documentation after reviews=0D
=0D
 - Add helper for GString -> HumanReadableText conversion=0D
=0D
Changed in v2:=0D
=0D
 - Improved documentation in response to feedback=0D
 - Finished "info registers" conversion on all targets=0D
 - Got a bit carried away and converted many many more=0D
   commands=0D
=0D
Daniel P. Berrang=C3=A9 (21):=0D
  monitor: remove 'info ioapic' HMP command=0D
  monitor: make hmp_handle_error return a boolean=0D
  docs/devel: rename file for writing monitor commands=0D
  docs/devel: tweak headings in monitor command docs=0D
  docs/devel: update error handling guidance for HMP commands=0D
  monitor: introduce HumanReadableText and HMP support=0D
  docs/devel: document expectations for QAPI data modelling for QMP=0D
  docs/devel: add example of command returning unstructured text=0D
  docs/devel: document expectations for HMP commands in the future=0D
  qapi: introduce x-query-roms QMP command=0D
  qapi: introduce x-query-profile QMP command=0D
  qapi: introduce x-query-numa QMP command=0D
  qapi: introduce x-query-usb QMP command=0D
  qapi: introduce x-query-rdma QMP command=0D
  qapi: introduce x-query-ramblock QMP command=0D
  qapi: introduce x-query-skeys QMP command=0D
  qapi: introduce x-query-cmma QMP command=0D
  qapi: introduce x-query-lapic QMP command=0D
  qapi: introduce x-query-irq QMP command=0D
  qapi: introduce x-query-jit QMP command=0D
  qapi: introduce x-query-opcount QMP command=0D
=0D
Dongli Zhang (1):=0D
  hmp: synchronize cpu state for lapic info=0D
=0D
 accel/tcg/cpu-exec.c                          |  51 +++++-=0D
 accel/tcg/hmp.c                               |  22 +--=0D
 accel/tcg/translate-all.c                     |  84 +++++----=0D
 docs/devel/index.rst                          |   2 +-=0D
 ...mands.rst =3D> writing-monitor-commands.rst} | 167 ++++++++++++++++--=
=0D
 hmp-commands-info.hx                          |  29 +--=0D
 hw/core/cpu-common.c                          |   7 +=0D
 hw/core/loader.c                              |  39 ++--=0D
 hw/core/machine-hmp-cmds.c                    |  38 +---=0D
 hw/core/machine-qmp-cmds.c                    |  40 +++++=0D
 hw/rdma/rdma_rm.c                             | 104 +++++------=0D
 hw/rdma/rdma_rm.h                             |   2 +-=0D
 hw/rdma/vmw/pvrdma_main.c                     |  31 ++--=0D
 hw/s390x/s390-skeys.c                         |  35 +++-=0D
 hw/s390x/s390-stattrib.c                      |  56 ++++--=0D
 hw/usb/bus.c                                  |  24 ++-=0D
 include/exec/cpu-all.h                        |   6 +-=0D
 include/exec/ramlist.h                        |   2 +-=0D
 include/hw/core/cpu.h                         |  10 ++=0D
 include/hw/rdma/rdma.h                        |   2 +-=0D
 include/monitor/hmp-target.h                  |   1 -=0D
 include/monitor/hmp.h                         |   5 +-=0D
 include/monitor/monitor.h                     |   2 +=0D
 include/qapi/type-helpers.h                   |  14 ++=0D
 include/tcg/tcg.h                             |   4 +-=0D
 monitor/hmp-cmds.c                            |  99 ++---------=0D
 monitor/hmp.c                                 |  31 +++-=0D
 monitor/misc.c                                |  46 ++---=0D
 monitor/monitor-internal.h                    |   7 +=0D
 monitor/qmp-cmds.c                            | 116 ++++++++++++=0D
 qapi/common.json                              |  11 ++=0D
 qapi/machine-target.json                      |  47 +++++=0D
 qapi/machine.json                             | 110 ++++++++++++=0D
 qapi/meson.build                              |   3 +=0D
 qapi/qapi-type-helpers.c                      |  23 +++=0D
 scripts/qapi/commands.py                      |   1 +=0D
 softmmu/physmem.c                             |  19 +-=0D
 stubs/usb-dev-stub.c                          |   8 +=0D
 target/i386/cpu-dump.c                        | 161 +++++++++--------=0D
 target/i386/cpu.h                             |   4 +-=0D
 target/i386/monitor.c                         |  50 ++++--=0D
 tcg/tcg.c                                     |  98 +++++-----=0D
 tests/qtest/qmp-cmd-test.c                    |   8 +=0D
 43 files changed, 1082 insertions(+), 537 deletions(-)=0D
 rename docs/devel/{writing-qmp-commands.rst =3D> writing-monitor-commands.=
rst} (75%)=0D
 create mode 100644 include/qapi/type-helpers.h=0D
 create mode 100644 qapi/qapi-type-helpers.c=0D
=0D
--=20=0D
2.31.1=0D
=0D



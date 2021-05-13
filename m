Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D620E37FB82
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:32:12 +0200 (CEST)
Received: from localhost ([::1]:52468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEFv-0004uI-Ki
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhED2-0002H6-4G
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lhECx-0003Qb-Li
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4mfvlSDsNcla+aC7qQLetRKjQ9NJr+BLpAhO5Ng7G0g=;
 b=Dll8KxwwrnecXD0M+p1FpWgd1LUKV2aTkHsbTrA8ANe5V+iL0qmiHcPtpX+IwJMerz9Ksl
 tTnQHVLtUiHQSR2gVcsfaFbSyTH5qTvEMHe/yTrtOvHGt2XSrJxvF90s51kVuwfY/sVELx
 kFA9KxKAdcnnVojaGlk8B6IxPPJaqPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-N_3BfFluOeqgjHG4tdgIkQ-1; Thu, 13 May 2021 12:29:03 -0400
X-MC-Unique: N_3BfFluOeqgjHG4tdgIkQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 007D61005D47;
 Thu, 13 May 2021 16:29:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88ACD687C3;
 Thu, 13 May 2021 16:29:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/14] vl: compound properties for machines and accelerators
Date: Thu, 13 May 2021 12:28:47 -0400
Message-Id: <20210513162901.1310239-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: yang.zhong@intel.com, berrange@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series converts -M and -accel to keyval parsing, so that they
can use compound properties.  The series also converts -smp to a
compound property.

This is also a preparatory work for SGX support, which would like to use
an array-type machine property.

Patch 1 removes -writeconfig, which would not be able to cope with -M
and -accel after the conversion.  This is much earlier than the usual
deprecation schedule, as the option was deprecated in 6.0 only.  So,
if people prefer that, I will add the required support to -writeconfig.
For now this was the simplest way to get something that works.

Patches 2-5 introduce the infrastructure and the new functions that
let us support keyval-based options in -readconfig, without going
through QemuOpts.

Patches 6-8 do the actual switch of -M and -accel to keyval.

Patches 9-14 finally validate the concept by implementing -smp as a
compound property; that is "-smp X=Y" is converted to "-machine smp.X=Y"
automatically.  Really the only interesting patches are 12 and 14,
while the others are just cleanups.

The series only supports JSON syntax for -accel.  It is more complicated
for -M because we need to consider what happens if string-based
dictionaries (produced by -M key=val) have to be merged with
strongly-typed dictionaries (produced by -M {'key': 123}).

The plan is to only allow one -M option when JSON syntax is in use;
the problem is that this is a forwards-compatibility landmine.  As soon
as -smp is converted, for example, -smp becomes a shortcut for -M
and it is now forbidden to use -M '{....}' together with -smp.
It would be impossible to know which options in the future will
become incompatible with -M JSON syntax.  Therefore, support for JSON
syntax is delayed until after the main options are converted to QOM
compound properties.  These could be -boot, -acpitable, -smbios, -m,
-semihosting-config, -rtc and -fw_cfg.

Paolo

Paolo Bonzini (14):
  remove -writeconfig
  qemu-config: parse configuration files to a QDict
  vl: plumb keyval-based options into -set and -readconfig
  qom: export more functions for use with non-UserCreatable objects
  keyval: introduce keyval_parse_into
  vl: switch -M parsing to keyval
  qemu-option: remove now-dead code
  vl: switch -accel parsing to keyval
  machine: move dies from X86MachineState to CpuTopology
  machine: move common smp_parse code to caller
  machine: add error propagation to mc->smp_parse
  machine: pass QAPI struct to mc->smp_parse
  machine: reject -smp dies!=1 for non-PC machines
  machine: add smp compound property

 accel/accel-softmmu.c            |   6 +
 docs/system/deprecated.rst       |   7 -
 docs/system/removed-features.rst |   6 +
 hw/core/machine.c                | 184 +++++----
 hw/i386/pc.c                     | 108 +++--
 hw/i386/x86.c                    |  15 +-
 include/block/qdict.h            |   2 -
 include/hw/boards.h              |   3 +-
 include/hw/i386/pc.h             |   3 -
 include/hw/i386/x86.h            |   1 -
 include/qapi/qmp/qdict.h         |   3 +
 include/qemu/accel.h             |   1 +
 include/qemu/config-file.h       |   7 +-
 include/qemu/option.h            |   6 +-
 include/qom/object.h             |  23 ++
 qapi/machine.json                |  27 ++
 qemu-options.hx                  |   8 +-
 qom/object_interfaces.c          |  58 ++-
 softmmu/vl.c                     | 652 +++++++++++++++++--------------
 tests/qtest/numa-test.c          |  22 +-
 tests/unit/test-keyval.c         |  56 +++
 tests/unit/test-qemu-opts.c      |  35 --
 util/keyval.c                    |  90 ++++-
 util/qemu-config.c               | 133 +++----
 util/qemu-option.c               |  51 +--
 25 files changed, 871 insertions(+), 636 deletions(-)

-- 
2.26.2



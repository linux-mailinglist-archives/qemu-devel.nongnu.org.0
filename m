Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA6B40380C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:41:47 +0200 (CEST)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNv1W-0005lU-Is
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxC-0008Rg-E3
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNuxA-0003oh-Ac
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631097435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rj2fMzVz/eKZ1RKb5I2SakgEhXYOE0OhPAey5mleChg=;
 b=ikTyoXe7edsf5Fwais79UCYUT+zIAalSp8NpbWNNQa52UOmdERsUmTS1Q4jamObl9B5lpH
 cruydgtLdA0aFkk4k/IqxTbrqqZtUiI6A7HUVDCv/2Z06aH5S+PzXYAlxpQNkbu1GOnUXc
 +ctxOB0PHqWeADI6GHwgRiIKFa4ccF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-OHqMdfLIPHeEDOawNAqvxw-1; Wed, 08 Sep 2021 06:37:14 -0400
X-MC-Unique: OHqMdfLIPHeEDOawNAqvxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875F919057A0;
 Wed,  8 Sep 2021 10:37:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0630E5C25A;
 Wed,  8 Sep 2021 10:37:11 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] Stop adding HMP-only commands, allow QMP for all
Date: Wed,  8 Sep 2021 11:37:06 +0100
Message-Id: <20210908103711.683940-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are still adding HMP commands without any QMP counterparts. This is=0D
done because there are a reasonable number of scenarios where the cost=0D
of designing a QAPI data type for the command is not justified.=0D
=0D
This has the downside, however, that we will never be able to fully=0D
isolate the monitor code from the remainder of QEMU internals. It is=0D
desirable to be able to get to a point where subsystems in QEMU are=0D
exclusively implemented using QAPI types and never need to have any=0D
knowledge of the monitor APIs.=0D
=0D
The way to get there is to stop adding commands to HMP only. All=0D
commands must be implemented using QMP, and any HMP implementation=0D
be a shim around the QMP implementation.=0D
=0D
We don't want to compromise our supportability of QMP long term though.=0D
=0D
This series proposes that we relax our requirements around fine grained=0D
QAPI data design, but with the caveat that any command taking this=0D
design approach is mandated to use the 'x-' name prefix.=0D
=0D
This tradeoff should be suitable for any commands we have been adding=0D
exclusively to HMP in recent times, and thus mean we have mandate QMP=0D
support for all new commands going forward.=0D
=0D
This series illustrates the concept by converting the "info registers"=0D
HMP to invoke a new 'x-query-registers' QMP command. Note that only=0D
the i386 CPU target is converted to work with this new approach, so=0D
this series needs to be considered incomplete. If we go forward with=0D
this idea, then a subsequent version of this series would need to=0D
obviously convert all other CPU targets.=0D
=0D
After doing that conversion the only use of qemu_fprintf() would be=0D
the disas.c file. Remaining uses of qemu_fprintf and qemu_printf=0D
could be tackled in a similar way and eventually eliminate the need=0D
for any of these printf wrappers in QEMU.=0D
=0D
NB: I added docs to devel/writing-qmp-commands.rst about the two=0D
design approaches to QMP. I didn't see another good place to put=0D
an explicit note that we will not add any more HMP-only commands.=0D
Obviously HMP/QMP maintainers control this in their reviews of=0D
patches, and maybe that's sufficient ?=0D
=0D
NB: if we take this approach we'll want to figure out how many=0D
HMP-only commands we actually have left and then perhaps have=0D
a task to track their conversion to QMP. This could possibly=0D
be a useful task for newbies if we make it clear that they=0D
wouldn't be required to undertake complex QAPI modelling in=0D
doing this conversion.=0D
=0D
Daniel P. Berrang=C3=A9 (5):=0D
  docs/devel: document expectations for QAPI data modelling for QMP=0D
  hw/core: introduce 'format_state' callback to replace 'dump_state'=0D
  target/i386: convert to use format_state instead of dump_state=0D
  qapi: introduce x-query-registers QMP command=0D
  monitor: rewrite 'info registers' in terms of 'x-query-registers'=0D
=0D
 docs/devel/writing-qmp-commands.rst |  25 +++=0D
 hw/core/cpu-common.c                |  15 ++=0D
 hw/core/machine-qmp-cmds.c          |  28 +++=0D
 include/hw/core/cpu.h               |  13 +-=0D
 monitor/misc.c                      |  25 ++-=0D
 qapi/machine.json                   |  37 ++++=0D
 target/i386/cpu-dump.c              | 325 +++++++++++++++-------------=0D
 target/i386/cpu.c                   |   2 +-=0D
 target/i386/cpu.h                   |   2 +-=0D
 9 files changed, 307 insertions(+), 165 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE2930FAE6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 19:13:54 +0100 (CET)
Received: from localhost ([::1]:38040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7j8b-0005re-QP
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 13:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHx-0007Eu-Fh
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7iHk-0005Fn-Bd
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 12:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g5ZJVP5Pl2Nw8rCNIegHKRON3Y03kQ4MgRjIAw6mnRQ=;
 b=V+F1nuIAjOdQ9ubX08Cygr2l9mqhXZQLr0kclfPrudcbjXSuvPRmo1dVQPzMH7Aoo4qoWn
 m8ZVLRSSJPIb0SjcABk8qPczExdBYZ5d6GoYtmqzrw0IQ3CrJC2vSfNl2baB5g0jn+svcz
 E3lby02NGFsMtco1ZzqyBOgZpgWJ57Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-l-R7uCHEOVKykJLFNfXo-Q-1; Thu, 04 Feb 2021 12:19:10 -0500
X-MC-Unique: l-R7uCHEOVKykJLFNfXo-Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78A1519357AF;
 Thu,  4 Feb 2021 17:19:09 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-221.ams2.redhat.com
 [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2289D60C05;
 Thu,  4 Feb 2021 17:19:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/33] migration: capture error reports into Error object
Date: Thu,  4 Feb 2021 17:18:34 +0000
Message-Id: <20210204171907.901471-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Due to its long term heritage most of the migration code just invokes=0D
'error_report' when problems hit. This was fine for HMP, since the=0D
messages get redirected from stderr, into the HMP console. It is not=0D
OK for QMP because the errors will not be fed back to the QMP client.=0D
=0D
This wasn't a terrible real world problem with QMP so far because=0D
live migration happens in the background, so at least on the target side=0D
there is not a QMP command that needs to capture the incoming migration.=0D
It is a problem on the source side but it doesn't hit frequently as the=0D
source side has fewer failure scenarios. None the less on both sides it=0D
would be desirable if 'query-migrate' can report errors correctly.=0D
With the introduction of the load-snapshot QMP commands, the need for=0D
error reporting becomes more pressing.=0D
=0D
Wiring up good error reporting is a large and difficult job, which=0D
this series does NOT complete. The focus here has been on converting=0D
all methods in savevm.c which have an 'int' return value capable of=0D
reporting errors. This covers most of the infrastructure for controlling=0D
the migration state serialization / protocol.=0D
=0D
The remaining part that is missing error reporting are the callbacks in=0D
the VMStateDescription struct which can return failure codes, but have=0D
no "Error **errp" parameter. Thinking about how this might be dealt with=0D
in future, a big bang conversion is likely non-viable. We'll probably=0D
want to introduce a duplicate set of callbacks with the "Error **errp"=0D
parameter and convert impls in batches, eventually removing the=0D
original callbacks. I don't intend todo that myself in the immediate=0D
future.=0D
=0D
IOW, this patch series probably solves 50% of the problem, but we=0D
still do need the rest to get ideal error reporting.=0D
=0D
In doing this savevm conversion I noticed a bunch of places which=0D
see and then ignore errors. I only fixed one or two of them which=0D
were clearly dubious. Other places in savevm.c where it seemed it=0D
was probably ok to ignore errors, I've left using error_report()=0D
on the basis that those are really warnings. Perhaps they could=0D
be changed to warn_report() instead.=0D
=0D
There are alot of patches here, but I felt it was easier to review=0D
for correctness if I converted 1 function at a time. The series=0D
does not neccessarily have to be reviewed/appied in 1 go.=0D
=0D
Daniel P. Berrang=C3=A9 (33):=0D
  migration: push Error **errp into qemu_loadvm_state()=0D
  migration: push Error **errp into qemu_loadvm_state_header()=0D
  migration: push Error **errp into qemu_loadvm_state_setup()=0D
  migration: push Error **errp into qemu_load_device_state()=0D
  migration: push Error **errp into qemu_loadvm_state_main()=0D
  migration: push Error **errp into qemu_loadvm_section_start_full()=0D
  migration: push Error **errp into qemu_loadvm_section_part_end()=0D
  migration: push Error **errp into loadvm_process_command()=0D
  migration: push Error **errp into loadvm_handle_cmd_packaged()=0D
  migration: push Error **errp into loadvm_postcopy_handle_advise()=0D
  migration: push Error **errp into ram_postcopy_incoming_init()=0D
  migration: push Error **errp into loadvm_postcopy_handle_listen()=0D
  migration: push Error **errp into loadvm_postcopy_handle_run()=0D
  migration: push Error **errp into loadvm_postcopy_ram_handle_discard()=0D
  migration: make loadvm_postcopy_handle_resume() void=0D
  migration: push Error **errp into loadvm_handle_recv_bitmap()=0D
  migration: push Error **errp into loadvm_process_enable_colo()=0D
  migration: push Error **errp into colo_init_ram_cache()=0D
  migration: push Error **errp into check_section_footer()=0D
  migration: push Error **errp into global_state_store()=0D
  migration: remove error reporting from qemu_fopen_bdrv() callers=0D
  migration: push Error **errp into qemu_savevm_state_iterate()=0D
  migration: simplify some error reporting in save_snapshot()=0D
  migration: push Error **errp into qemu_savevm_state_setup()=0D
  migration: push Error **errp into qemu_savevm_state_complete_precopy()=0D
  migration: push Error **errp into=0D
    qemu_savevm_state_complete_precopy_non_iterable()=0D
  migration: push Error **errp into qemu_savevm_state_complete_precopy()=0D
  migration: push Error **errp into qemu_savevm_send_packaged()=0D
  migration: push Error **errp into qemu_savevm_live_state()=0D
  migration: push Error **errp into qemu_save_device_state()=0D
  migration: push Error **errp into qemu_savevm_state_resume_prepare()=0D
  migration: push Error **errp into postcopy_resume_handshake()=0D
  migration: push Error **errp into postcopy_do_resume()=0D
=0D
 include/migration/colo.h                      |   2 +-=0D
 include/migration/global_state.h              |   2 +-=0D
 migration/colo.c                              |  12 +-=0D
 migration/global_state.c                      |   6 +-=0D
 migration/migration.c                         |  80 ++-=0D
 migration/postcopy-ram.c                      |   8 +-=0D
 migration/postcopy-ram.h                      |   2 +-=0D
 migration/ram.c                               |  17 +-=0D
 migration/ram.h                               |   4 +-=0D
 migration/savevm.c                            | 594 ++++++++++--------=0D
 migration/savevm.h                            |  23 +-=0D
 .../tests/internal-snapshots-qapi.out         |   3 +-=0D
 12 files changed, 427 insertions(+), 326 deletions(-)=0D
=0D
--=20=0D
2.29.2=0D
=0D



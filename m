Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B16122CB996
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:46:03 +0100 (CET)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOi2-0003GL-Ip
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:46:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3T-0003Ix-UD
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3R-0004Z9-5J
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LzKYMrMQNNfk4hrT8BzlIoUfCz2YMeDEAd4wAoeZ/DI=;
 b=PB02HqA8WIvEE2m4mMDx1ELNPNZeq/dLuLtqxVuOUjjaHFl7pmwS7P3g8ZyrUBveR4b+ie
 SnY67/6ZUzyogIVJXVWcpIVzBoUIoO+ARMaiqp+7Blyni82pG9HEbION1zsyKLJIiQM/OF
 4LvsXezliMeh9D+nf0KyR72rp1t+5WI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-T6Mmum8AMCeeRWyYDzlDEQ-1; Wed, 02 Dec 2020 04:04:01 -0500
X-MC-Unique: T6Mmum8AMCeeRWyYDzlDEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB5A48D9123;
 Wed,  2 Dec 2020 09:03:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8B815D74D;
 Wed,  2 Dec 2020 09:03:05 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/28] qemu-option, keyval,
 vl: switch -object/-M/-accel to keyval parsing
Date: Wed,  2 Dec 2020 04:02:37 -0500
Message-Id: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series switches -object, -M and -accel from QemuOpts to keyval.
Monitor commands device_add and netdev_add are also switched to keyval,
though -device and -netdev for now are not.

Along the way, the syntax of keyval and QemuOpts becomes more consistent
and support for keyval-based options is added to -readconfig.  -writeconfig
instead is removed (see patch 13 for rationale).

The reason to do this is:

- to make qemu-io, qemu-nbd, qemu-img and QEMU's parsing of -object
  consistent with qemu-storage-daemon's

- to allow using compound properties in -object, -M and -accel

Patch 1-5: make QemuOpts parsing a bit more restrictive, warning for
short-form boolean options and removing weird ways to request help
such as "help=foo" or "no?".

Patch 6-12: let keyval accept escaped commas in implied options,
switch comma-separated syntax for HMP from QemuOpts to keyval,
add help support to object_add

Patch 13-18: plumbing for reading keyval-based options in vl.c,
including -set and -readconfig.

Patch 19-23: switch -object to keyval everywhere

Patch 24-28: switch -M and -accel to keyval

Paolo Bonzini (28):
  qemu-option: simplify search for end of key
  qemu-option: pass QemuOptsList to opts_accepts_any
  qemu-option: clean up id vs. list->merge_lists
  qemu-option: move help handling to get_opt_name_value
  qemu-option: warn for short-form boolean options
  keyval: accept escaped commas in implied option
  keyval: simplify keyval_parse_one
  tests: convert check-qom-proplist to keyval
  keyval: introduce keyval_parse_into
  hmp: replace "O" parser with keyval
  qom: use qemu_printf to print help for user-creatable objects
  hmp: special case help options for object_add
  remove -writeconfig
  qemu-config: add error propagation to qemu_config_parse
  qemu-option: support accept-any QemuOptsList in qemu_opts_absorb_qdict
  qemu-config: parse configuration files to a QDict
  vl: plumb keyval-based options into -set and -readconfig
  qom: do not modify QDict argument in user_creatable_add_dict
  qemu-io: use keyval for -object parsing
  qemu-nbd: use keyval for -object parsing
  qemu-img: use keyval for -object parsing
  qemu: use keyval for -object parsing
  storage-daemon: do not register the "object" group with QemuOpts
  qom: export more functions for use with non-UserCreatable objects
  vl: rename local variable in configure_accelerators
  vl: switch -M parsing to keyval
  qemu-option: remove now-dead code
  vl: switch -accel parsing to keyval

 accel/accel.c                        |   6 +
 block/blkdebug.c                     |   3 +-
 docs/system/deprecated.rst           |   6 +
 hmp-commands.hx                      |   6 +-
 include/block/qdict.h                |   2 -
 include/qapi/qmp/qdict.h             |   3 +
 include/qemu/config-file.h           |   9 +-
 include/qemu/help_option.h           |  11 -
 include/qemu/option.h                |   6 +-
 include/qom/object.h                 |  21 +
 include/qom/object_interfaces.h      |  68 +--
 include/sysemu/accel.h               |   1 +
 monitor/hmp-cmds.c                   |  22 +-
 monitor/hmp.c                        |  20 +-
 qemu-img.c                           | 258 ++--------
 qemu-io.c                            |  42 +-
 qemu-nbd.c                           |  42 +-
 qemu-options.hx                      |  13 +-
 qom/object_interfaces.c              | 152 ++----
 softmmu/vl.c                         | 687 ++++++++++++++-------------
 storage-daemon/qemu-storage-daemon.c |  10 -
 tests/check-qom-proplist.c           |  58 ++-
 tests/test-keyval.c                  |  53 ++-
 tests/test-qemu-opts.c               |  37 +-
 util/keyval.c                        | 230 +++++----
 util/qemu-config.c                   | 141 +++---
 util/qemu-option.c                   | 184 ++++---
 27 files changed, 946 insertions(+), 1145 deletions(-)

-- 
2.26.2



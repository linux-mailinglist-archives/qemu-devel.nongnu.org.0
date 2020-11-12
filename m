Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF92B0C22
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:02:04 +0100 (CET)
Received: from localhost ([::1]:51016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdGv5-0002v9-1u
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsb-0000vu-TH
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsX-0000fq-Oo
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zsp2VC7Jaw9Y9CuMqqQt7Z6M5KKo5YEIAgkGXhXrp2M=;
 b=hoohfyIGrFYFAk/Djbq0+XkHm/Od+ik+YKLNuUJegu/pFpMT/ujVXkeQ+KegSxwc/0ROiU
 NhhZzumNKkh7oXT8iCEJFeT1VvFolJlxAJYdsFlbxK+yqPmjVa2UT9214LPEmYRhzTH5R4
 Uq6VwvZxTiW0tPiQv4ytDPdVpNwyUjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-PBlM0Ts2PM-Kd7_mHZsMjQ-1; Thu, 12 Nov 2020 12:59:20 -0500
X-MC-Unique: PBlM0Ts2PM-Kd7_mHZsMjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DC78801FDF
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:19 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96D361002C1B;
 Thu, 12 Nov 2020 17:59:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/13] char: QAPIfy the command line parsing
Date: Thu, 12 Nov 2020 18:58:52 +0100
Message-Id: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The character device subsystem is special in that it uses QAPI objects
(ChardevBackend) internally to configure the backends, but for mapping
the command line to it, instead of making use of QAPI visitors, it uses
a hand-crafted parser. At the same time, the QMP command chardev-add
obviously does use the QAPI parser.

This is nasty because there is nothing that will make sure that the two
parsers provide access to the same feature set or that the syntax to
access features is consistent. We have also seen patches that changed
things for one path, but forgot that the other one needed to be changed,
too, resulting in regressions.

In order to solve this problem and make consistency between both paths
automatic, this series removes the hand-crafted parser that goes from
QemuOpts to ChardevBackend. Instead, QAPI aliases and only a few manual
tweaks of the input are used to make a keyval parser and QAPI visitors
suitable for parsing command lines while retaining backwards
compatibility.

As a welcome side effect, this also makes features available on the
command line that were previously restricted to QMP.

Another welcome side effect is the diffstat. :-)

QemuOpts is not entirely removed from the chardev interfaces yet. This
is mostly because -readconfig still uses it and changing vl.c to work
with a mix of QAPI object and QemuOpts would be harder than just keeping
some QemuOpts based interfaces that just internally translate. This can
be addressed after -readconfig has been reworked (probably resulting in
another nice diffstat).

A git tag is available that contains this series and its prerequisites:

    https://repo.or.cz/qemu/kevin.git qapi-alias-chardev-v1

Based-on: 20201111130834.33985-1-kwolf@redhat.com
('[PATCH 0/2] char: Deprecate backend aliases')

Based-on: 20201112172850.401925-1-kwolf@redhat.com
('[PATCH 0/6] qapi: Add support for aliases')

Kevin Wolf (13):
  char: Factor out qemu_chr_print_types()
  char: Add ChardevOptions and qemu_chr_new_cli()
  char: Some QAPI aliases for CLI compatibility
  char: Add qemu_chr_translate_legacy_options()
  char-socket: Implement compat code for CLI QAPIfication
  char-udp: Implement compat code for CLI QAPIfication
  char: Add qemu_chr_parse_cli_dict/str()
  char: Add mux option to ChardevOptions
  qemu-storage-daemon: QAPIfy --chardev
  char: Implement qemu_chr_new_from_opts() in terms of QAPI
  hmp/char: Use qemu_chr_parse_cli_str() for chardev-change
  char: Remove qemu_chr_parse_opts()
  char: Remove ChardevClass.parse

 qapi/char.json                       |  42 ++++-
 qapi/sockets.json                    |   6 +-
 include/chardev/char.h               |  56 ++++--
 chardev/char-file.c                  |  20 --
 chardev/char-mux.c                   |  17 --
 chardev/char-parallel.c              |  17 --
 chardev/char-pipe.c                  |  17 --
 chardev/char-ringbuf.c               |  18 --
 chardev/char-serial.c                |  17 --
 chardev/char-socket.c                | 121 +++++--------
 chardev/char-stdio.c                 |  13 --
 chardev/char-udp.c                   |  79 +++-----
 chardev/char.c                       | 262 ++++++++++++++++-----------
 chardev/spice.c                      |  34 ----
 monitor/hmp-cmds.c                   |  27 +--
 storage-daemon/qemu-storage-daemon.c |  17 +-
 ui/console.c                         |  35 ----
 ui/gtk.c                             |   1 -
 ui/spice-app.c                       |   1 -
 19 files changed, 321 insertions(+), 479 deletions(-)

-- 
2.28.0



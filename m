Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640154E115
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 14:51:03 +0200 (CEST)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1oxi-0002my-0h
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 08:51:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1oo8-000181-88
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o1onq-0005Ex-G3
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 08:41:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655383242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6HOZtiG5UoVM+px7apheR7bzGdZvyzNjzUNGaUhDB3k=;
 b=HSKG/BhYjxi4oCoSowUdZtv5F9XQkDdg8GIrg62jbyWQNzSLEUAymZhtRhcSCaPkd6KZl8
 FExFSbzKbq1AX7dnJqitk7AWNQtkcBR86wvLOSzMs+xciSlam0fhA7ToQ01M1uiSYeU0dC
 MTEoNoEtHO3QLo8k9U6re7FbmO7omzQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-uhL-t8KrPrey9lF8bhcgKA-1; Thu, 16 Jun 2022 08:40:39 -0400
X-MC-Unique: uhL-t8KrPrey9lF8bhcgKA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 454951C1C1A9;
 Thu, 16 Jun 2022 12:40:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 989F81415106;
 Thu, 16 Jun 2022 12:40:37 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 0/9] Preliminary patches for subproject split
Date: Thu, 16 Jun 2022 16:40:25 +0400
Message-Id: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Hi,

Here is another subset of the large "subproject(qga)"" series I intend to send
soon after (https://gitlab.com/marcandre.lureau/qemu/-/commits/qga).

Thanks

Marc-André Lureau (9):
  monitor: make error_vprintf_unless_qmp() static
  error-report: misc comment fix
  error-report: introduce "detailed" variable
  error-report: simplify print_loc()
  error-report: introduce ErrorReportDetailedFunc
  error-report: add a callback to overwrite error_vprintf
  qapi: move QEMU-specific dispatch code in monitor
  scripts/qapi-gen: add -i option
  scripts/qapi: add required system includes to visitor

 include/monitor/monitor.h            |  2 +-
 include/qapi/qmp/dispatch.h          |  7 ++-
 include/qemu/error-report.h          |  8 +++-
 bsd-user/main.c                      |  2 +-
 linux-user/main.c                    |  2 +-
 monitor/monitor.c                    |  5 +-
 monitor/qmp.c                        | 68 +++++++++++++++++++++++++++-
 qapi/qmp-dispatch.c                  | 64 ++------------------------
 qemu-img.c                           |  2 +-
 qemu-io.c                            |  2 +-
 qemu-nbd.c                           |  2 +-
 qga/main.c                           |  2 +-
 scsi/qemu-pr-helper.c                |  2 +-
 softmmu/vl.c                         |  7 ++-
 storage-daemon/qemu-storage-daemon.c |  7 ++-
 stubs/error-printf.c                 | 23 ----------
 tests/unit/test-qmp-cmds.c           |  6 +--
 util/error-report.c                  | 46 ++++++++++++++-----
 scripts/qapi/commands.py             | 15 ++++--
 scripts/qapi/events.py               | 17 ++++---
 scripts/qapi/gen.py                  | 17 +++++++
 scripts/qapi/introspect.py           | 11 +++--
 scripts/qapi/main.py                 | 17 ++++---
 scripts/qapi/types.py                | 17 ++++---
 scripts/qapi/visit.py                | 21 ++++++---
 stubs/meson.build                    |  1 -
 26 files changed, 226 insertions(+), 147 deletions(-)
 delete mode 100644 stubs/error-printf.c

-- 
2.37.0.rc0



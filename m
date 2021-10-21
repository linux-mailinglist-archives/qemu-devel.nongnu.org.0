Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D876B435E9D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:06:17 +0200 (CEST)
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdUxk-0003ko-Fb
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdUtQ-0001gx-CX
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:01:48 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:23577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mdUtN-0002mm-4U
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:01:47 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id ED718468DC;
 Thu, 21 Oct 2021 12:01:41 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v7 0/4] VNC-related HMP/QMP fixes
Date: Thu, 21 Oct 2021 12:01:31 +0200
Message-Id: <20211021100135.4146766-1-s.reiter@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=s.reiter@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the removal of the generic 'qmp_change' command, one can no longer replace
the 'default' VNC display listen address at runtime (AFAIK). For our users who
need to set up a secondary VNC access port, this means configuring a second VNC
display (in addition to our standard one for web-access), but it turns out one
cannot set a password on this second display at the moment, as the
'set_password' call only operates on the 'default' display.

Additionally, using secret objects, the password is only read once at startup.
This could be considered a bug too, but is not touched in this series and left
for a later date.

v6 -> v7:
* remove g_strdup and g_free, use strings directly
* squash in last patch

v5 -> v6:
* consider feedback from Markus' review, mainly:
  * fix crash bug in patch 1 (sorry, artifact of patch-splitting)
  * rely on '!has_param => param == NULL' to shorten code
  * add note to 'docs/about/deprecated.rst' and touch up comments a bit
* go back to g_free instead of qapi_free_* since the latter apparently tries to
  free the passed in pointer which lives on the stack...
* fix bug in HMP parsing (see patch 1)

v4 -> v5:
* add comment to patch 1 in "monitor-internal.h"
* use qapi_free_SetPasswordOptions and friends, don't leak strdups
* split QAPI change into 3 seperate patches

v3 -> v4:
* drop previously patch 1, this was fixed here instead:
  https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02529.html
* patch 1: add Eric's R-b
* patch 2: remove if-assignment, use 'deprecated' feature in schema

v2 -> v3:
* refactor QMP schema for set/expire_password as suggested by Eric Blake and
  Markus Armbruster

v1 -> v2:
* add Marc-André's R-b on patch 1
* use '-d' flag as suggested by Eric Blake and Gerd Hoffmann
  * I didn't see a way to do this yet, so I added a "flags with values" arg type


Stefan Reiter (4):
  monitor/hmp: add support for flag argument with value
  qapi/monitor: refactor set/expire_password with enums
  qapi/monitor: allow VNC display id in set/expire_password
  qapi/monitor: only allow 'keep' SetPasswordAction for VNC and
    deprecate

 docs/about/deprecated.rst  |   6 ++
 hmp-commands.hx            |  24 +++---
 monitor/hmp-cmds.c         |  48 +++++++++++-
 monitor/hmp.c              |  19 ++++-
 monitor/monitor-internal.h |   3 +-
 monitor/qmp-cmds.c         |  54 ++++---------
 qapi/ui.json               | 156 ++++++++++++++++++++++++++++++++-----
 7 files changed, 236 insertions(+), 74 deletions(-)

-- 
2.30.2



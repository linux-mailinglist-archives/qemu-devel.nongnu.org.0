Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5544A9795
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 11:18:01 +0100 (CET)
Received: from localhost ([::1]:38320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFvfE-0001aW-Nw
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 05:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFvaC-00076w-L8
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:12:50 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:43743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nFva9-0002CR-Ch
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 05:12:47 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 0FDA844857;
 Fri,  4 Feb 2022 11:12:33 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/3] VNC-related HMP/QMP fixes
Date: Fri,  4 Feb 2022 11:12:17 +0100
Message-Id: <20220204101220.343526-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: w.bumiller@proxmox.com, berrange@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, marcandre.lureau@gmail.com, kraxel@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com, eblake@redhat.com,
 t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Original cover letter by Stefan R.:

Since the removal of the generic 'qmp_change' command, one can no
longer replace the 'default' VNC display listen address at runtime
(AFAIK). For our users who need to set up a secondary VNC access port,
this means configuring a second VNC display (in addition to our
standard one for web-access), but it turns out one cannot set a
password on this second display at the moment, as the 'set_password'
call only operates on the 'default' display.

Additionally, using secret objects, the password is only read once at
startup. This could be considered a bug too, but is not touched in
this series and left for a later date.

v7 -> v8:
* drop last patch deprecating SetPasswordAction values besides 'keep'
  for VNC (unfortunately, I don't have enough time to try implementing
  'disconnect' and 'fail' for VNC in the near future)
* drop if conditionals for DisplayProtocol enum to make compilation
  with --disable-spice and/or --disable-vnc work
* order 'keep' first in enum, to fix how patch #3 uses it as an
  implicit default
* also set connected and has_connected for the VNC options in
  hmp_set_password
* fix typo in patch #1
* add missing '#' for description in patch #3

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

Stefan Reiter (3):
  monitor/hmp: add support for flag argument with value
  qapi/monitor: refactor set/expire_password with enums
  qapi/monitor: allow VNC display id in set/expire_password

 hmp-commands.hx            |  24 ++++---
 monitor/hmp-cmds.c         |  52 +++++++++++++-
 monitor/hmp.c              |  19 +++++-
 monitor/monitor-internal.h |   3 +-
 monitor/qmp-cmds.c         |  49 ++++----------
 qapi/ui.json               | 134 ++++++++++++++++++++++++++++++++-----
 6 files changed, 213 insertions(+), 68 deletions(-)

-- 
2.30.2




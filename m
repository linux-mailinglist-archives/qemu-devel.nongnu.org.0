Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113041AB7A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 11:06:46 +0200 (CEST)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mV94W-0000IV-TZ
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 05:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mV91g-0006a6-SU
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:03:49 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:34862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <s.reiter@proxmox.com>)
 id 1mV91d-00052V-KG
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 05:03:48 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 51D014241F;
 Tue, 28 Sep 2021 11:03:34 +0200 (CEST)
From: Stefan Reiter <s.reiter@proxmox.com>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: [PATCH v4] VNC-related HMP/QMP fixes
Date: Tue, 28 Sep 2021 11:03:24 +0200
Message-Id: <20210928090326.1056010-1-s.reiter@proxmox.com>
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


Stefan Reiter (2):
  monitor/hmp: add support for flag argument with value
  monitor: refactor set/expire_password and allow VNC display id

 hmp-commands.hx    |  24 ++++---
 monitor/hmp-cmds.c |  57 ++++++++++++++-
 monitor/hmp.c      |  17 ++++-
 monitor/qmp-cmds.c |  62 ++++++----------
 qapi/ui.json       | 173 +++++++++++++++++++++++++++++++++++++--------
 5 files changed, 251 insertions(+), 82 deletions(-)

-- 
2.30.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3640A342B6D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 10:35:11 +0100 (CET)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNY0j-0004aJ-Lx
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 05:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lNXz3-0003ms-28
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 05:33:25 -0400
Received: from mxe2.seznam.cz ([2a02:598:2::34]:41563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pj@patrikjanousek.cz>)
 id 1lNXz0-0005S9-6z
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 05:33:24 -0400
Received: from email.seznam.cz
 by email-smtpc21a.ng.seznam.cz (email-smtpc21a.ng.seznam.cz [10.23.18.26])
 id 67fc774f07f350fd61cf3c58; Sat, 20 Mar 2021 10:33:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emailprofi.seznam.cz; s=beta; t=1616232793;
 bh=1aa5f3z90UK1TZu226HaIU4XOddyKt/LgWNr7eKnc84=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 b=sHORulyvTwrzbqvsGXWdJZtKFzpMLZqWL6QeuG5AlMKT+15ZtguiTrxhKLDin3ICV
 BrVBa1pJ6srszS2idCoCMYYRr3jNT98w3ShnQ0T15nf793HU7Typ1cG3Ku7wyiCct2
 55faPc+H4GbiUFclfAaL5iNn+dM5nxmiW3Uqyz6w=
Received: from archlinux.localdomain (2a01:510:d502:b200:c1b:ad27:bde0:341a
 [2a01:510:d502:b200:c1b:ad27:bde0:341a])
 by email-relay4.ng.seznam.cz (Seznam SMTPD 1.3.124) with ESMTP;
 Sat, 20 Mar 2021 10:33:08 +0100 (CET)  
From: =?UTF-8?q?Patrik=20Janou=C5=A1ek?= <pj@patrikjanousek.cz>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] block/raw: implemented persistent dirty bitmap and
 ability to dump bitmap content via qapi
Date: Sat, 20 Mar 2021 10:32:33 +0100
Message-Id: <20210320093235.461485-1-pj@patrikjanousek.cz>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:598:2::34; envelope-from=pj@patrikjanousek.cz;
 helo=mxe2.seznam.cz
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Patrik=20Janou=C5=A1ek?= <pj@patrikjanousek.cz>,
 lmatejka@kiv.zcu.cz
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, QEMU doesn't support persistent dirty bitmaps for raw format
and also dirty bitmaps are for internal use only, and cannot be accessed
using third-party applications. These facts are very limiting
in case someone would like to develop their own backup tool becaouse
without access to the dirty bitmap it would be possible to implement
only full backups. And without persistent dirty bitmaps, it wouldn't
be possible to keep track of changed data after QEMU is restarted. And
this is exactly what I do as a part of my bachelor thesis. I've
developed a tool that is able to create incremental backups of drives
in raw format that are LVM volumes (ability to create snapshot is
required).

Please keep in mind that this is my first submission to such a large
project and also the first time when I send patch over the email.
So I hope I did it correctly.

Patrik Janoušek (2):
  block/raw: added support of persistent dirty bitmaps
  qapi: implementation of the block-dirty-bitmap-dump command

 block/meson.build               |   1 +
 block/monitor/bitmap-qmp-cmds.c |  61 ++++++++
 block/raw-format-bitmap.c       | 163 ++++++++++++++++++++
 block/raw-format.c              | 256 ++++++++++++++++++++++++++++++--
 block/raw-format.h              |  50 +++++++
 qapi/block-core.json            |  64 +++++++-
 6 files changed, 583 insertions(+), 12 deletions(-)
 create mode 100644 block/raw-format-bitmap.c
 create mode 100644 block/raw-format.h

-- 
2.31.0



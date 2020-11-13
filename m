Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7C2B1730
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 09:28:07 +0100 (CET)
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdURB-0007oj-J7
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 03:28:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPk-0006Ac-GT
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kdUPg-0005hz-GY
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 03:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605255990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zrmj8/Sci8ae9r6IW7IGvwv1msrwZ9ZDkbHerbomgtc=;
 b=Pd2jzq/TDaWWTMshaA55umsfmzqVW5vwwQf0Ycm/CsYqkBl1eFJvaSB1UeoVRPxr3zXPjj
 RUL/oufqA8LBwXWRy6QfE6fvDWheztn9Xmdi3deex2qSkxLQ14prwx0zKhox4gc7MhZdcU
 fdi7W3498dshAGMUonsMF9eT3wvGM/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Oy_L-gHoPReHmAWlDOOpwg-1; Fri, 13 Nov 2020 03:26:29 -0500
X-MC-Unique: Oy_L-gHoPReHmAWlDOOpwg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F60B11BD343
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:26:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212E45B4C3
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 08:26:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 82B9911386A0; Fri, 13 Nov 2020 09:26:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/10] Chipping away at qerror.h
Date: Fri, 13 Nov 2020 09:26:16 +0100
Message-Id: <20201113082626.2725812-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Obviously not for 5.2.  Please review anyway.

Markus Armbruster (10):
  qerror: Drop unused QERR_ macros
  qerror: Eliminate QERR_ macros used in just one place
  block: Improve some block-commit, block-stream error messages
  ui: Improve some set_passwd, expire_password error messages
  ui: Improve a client_migrate_info error message
  ui: Tweak a client_migrate_info error message
  qga: Replace an unreachable error by abort()
  qga: Tweak a guest-shutdown error message
  qom: Improve {qom,device}-list-properties error messages
  Tweak a few "Parameter 'NAME' expects THING" error message

 include/qapi/qmp/qerror.h        | 23 -------------------
 block/quorum.c                   |  2 +-
 blockdev.c                       | 17 ++++++++------
 chardev/char.c                   |  2 +-
 hw/core/qdev-properties-system.c |  2 +-
 monitor/misc.c                   | 12 +++++-----
 monitor/qmp-cmds.c               | 38 +++++++++++++-------------------
 net/net.c                        |  2 +-
 qga/commands-win32.c             |  5 ++---
 qom/qom-qmp-cmds.c               | 17 +++++---------
 softmmu/qdev-monitor.c           |  4 ++--
 tests/qemu-iotests/040           | 12 +++++-----
 12 files changed, 51 insertions(+), 85 deletions(-)

-- 
2.26.2



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404C63E9C1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:15:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0cp0-0005f7-O9; Thu, 01 Dec 2022 01:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0coy-0005eG-GA
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p0cov-0005la-ND
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:13:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669875197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CZ+HshEJf4Zz93MIwW/6E/HvG1iKHlkHvnRoJUT7oMQ=;
 b=AixfOTRgmAN00VLCzIytYURBp8rvlyq+lsnbAGeBmyXNpMdW/5NOR1cCgYo0WE2+r1Zzov
 9bxAkZwXRTUg3T7bfw5A5HiuSD3nj1BrLQEjTux+VNbpTHfkdeCzpkxTUvwzeOxHvRkfkr
 3TNa/K/a9do9GEUi858oPlJeFuEvrnE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-JKELl7VbPcuw57Iw7FNHsQ-1; Thu, 01 Dec 2022 01:13:15 -0500
X-MC-Unique: JKELl7VbPcuw57Iw7FNHsQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AA108027F5
 for <qemu-devel@nongnu.org>; Thu,  1 Dec 2022 06:13:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212724B3FC6;
 Thu,  1 Dec 2022 06:13:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DED6621E6921; Thu,  1 Dec 2022 07:13:11 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 0/9] ui: Move and clean up monitor command code
Date: Thu,  1 Dec 2022 07:13:02 +0100
Message-Id: <20221201061311.3619052-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is mainly about splitting off monitor-related code.  There's also
a few UI fixes to HMP commands sendkey and change vnc.

PATCH 3 drops long-disabled code.  We could bump the required version
of Spice instead.  Opinions?

Markus Armbruster (9):
  ui: Check numeric part of expire_password argument @time properly
  ui: Fix silent truncation of numeric keys in HMP sendkey
  ui: Drop disabled code for SPICE_CHANNEL_WEBDAV
  ui: Clean up a few things checkpatch.pl would flag later on
  ui: Move QMP commands from monitor to new ui/ui-qmp-cmds.c
  ui: Move HMP commands from monitor to new ui/ui-hmp-cmds.c
  ui: Improve "change vnc" error reporting
  ui: Factor out hmp_change_vnc(), and move to ui/ui-hmp-cmds.c
  ui: Reduce nesting in hmp_change_vnc() slightly

 include/monitor/hmp.h |   5 +
 monitor/hmp-cmds.c    | 370 +--------------------------------------
 monitor/qmp-cmds.c    | 163 ------------------
 ui/ui-hmp-cmds.c      | 390 ++++++++++++++++++++++++++++++++++++++++++
 ui/ui-qmp-cmds.c      | 194 +++++++++++++++++++++
 ui/meson.build        |   2 +
 6 files changed, 592 insertions(+), 532 deletions(-)
 create mode 100644 ui/ui-hmp-cmds.c
 create mode 100644 ui/ui-qmp-cmds.c

-- 
2.37.3



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29DE2B1A3D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:45:58 +0100 (CET)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXWf-0006tY-AE
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUY-0005cb-0W
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdXUT-0002JE-Jq
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605267819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=smH6xB2WMSUmgxWQ4ka5mYG9K2DkrtwvJf3Nv4KVg7I=;
 b=b2pPjILq1skWCy0ZsofL+biWX+ZMMtrsP3EOypRdJfkmWD8JV0biuCDia6HvKqvpdA0eZ5
 iHTzNwcBxBIgYLaECP+lhR470Z3QTM8qDhdF6c77YDu/4e+S523cNApQpFQpCvN0eR8jcB
 Grjl29ilF1SBcNxdIKMry7Pn9kV79SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-_09eYLJ_O7G34zeOv4Yo4w-1; Fri, 13 Nov 2020 06:43:37 -0500
X-MC-Unique: _09eYLJ_O7G34zeOv4Yo4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46FE21074662;
 Fri, 13 Nov 2020 11:43:36 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F178219C66;
 Fri, 13 Nov 2020 11:43:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-5.2 0/3] hmp: Fix arg evaluation crash (regression)
Date: Fri, 13 Nov 2020 12:43:23 +0100
Message-Id: <20201113114326.97663-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lichun@ruijie.com.cn, dgilbert@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When I restricted the section where the current monitor is set to only
the command handler, I missed that monitor_parse_arguments() can use it
indirectly, too, when evaluating register variables. These cases get
NULL now and crash (easy to reproduce with "x $pc").

This series passes the right monitor object down instead of using
monitor_cur(), which fixes the crash.

Kevin Wolf (3):
  hmp: Pass monitor to mon_get_cpu()
  hmp: Pass monitor to MonitorDef.get_value()
  hmp: Pass monitor to mon_get_cpu_env()

 include/monitor/hmp-target.h |  7 ++++---
 monitor/monitor-internal.h   |  2 +-
 monitor/hmp.c                |  2 +-
 monitor/misc.c               | 24 ++++++++++++------------
 target/i386/monitor.c        | 11 ++++++-----
 target/m68k/monitor.c        |  2 +-
 target/nios2/monitor.c       |  2 +-
 target/ppc/monitor.c         | 22 +++++++++++++---------
 target/riscv/monitor.c       |  2 +-
 target/sh4/monitor.c         |  2 +-
 target/sparc/monitor.c       | 12 +++++++-----
 target/xtensa/monitor.c      |  2 +-
 12 files changed, 49 insertions(+), 41 deletions(-)

-- 
2.28.0



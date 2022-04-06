Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F94F668D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:18:33 +0200 (CEST)
Received: from localhost ([::1]:34482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9Id-0005Jz-Qe
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nc9GN-0002XT-2S
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:16:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nc9GG-0005mB-UI
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 13:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649265363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RCJuCPOMHTafvhNZ2SWtmv+aeoedUSVzk2ZQO6TToqE=;
 b=Cy98L0z3CrWZw3Dl58FQGmwlaQWQsgp53T4A2DFVxKlqcoJpFwcesr2oOfBJRymxzPrGzq
 HYNOnfRIwcbWBZ3qIZB5Xbs5mEYrejbinDx6A6wOppfQvxHP2J1LPNgeOSKNb9qZY//jbB
 sRZQ2cv4Pw2lJtIu+Bca+0m9EqiZAYE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-mtfWE13HOxuUFAS1wunjrg-1; Wed, 06 Apr 2022 13:16:02 -0400
X-MC-Unique: mtfWE13HOxuUFAS1wunjrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF7A100BAA9;
 Wed,  6 Apr 2022 17:16:02 +0000 (UTC)
Received: from vp-pc.redhat.com (unknown [10.40.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83F6740D2821;
 Wed,  6 Apr 2022 17:16:00 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: marcandre.lureau@redhat.com,
	dgilbert@redhat.com,
	f4bug@amsat.org
Subject: [PATCH v4 0/4] dump: add 32-bit guest Windows support
Date: Wed,  6 Apr 2022 20:15:54 +0300
Message-Id: <20220406171558.199263-1-viktor.prutyanov@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=viktor.prutyanov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=viktor.prutyanov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: yan@daynix.com, qemu-devel@nongnu.org, viktor.prutyanov@phystech.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viktor Prutyanov <viktor@daynix.com>

Since 32-bit versions of Windows still exist, there is a need to take
live and crash dumps of such guests along with 64-bit guests. So, add
an ability for 'dump-guest-memory -w' to take dumps from 32-bit guest.
When running the command QEMU consumes 32-bit Complete Memory Dump
header passed by guest driver through vmcoreinfo device as it was
previously done for 64-bit headers. 32-bit vmcoreinfo guest driver in
upstream virtio-win can fill such a header.

Changes in v4:
    - dump-guest-memory command help message is updated
Changes in v3:
    - some WIN_DUMP_* macros are replaced by similar functions where it
      is possible
Changes in v2:
    - no change in logic, just split patches
    - first introduce WIN_DUMP_* macros for x64 in a separate patch
    - rename WinContext to WinContext64 in a separate patch

Viktor Prutyanov (4):
  include/qemu: rename Windows context definitions to expose bitness
  dump/win_dump: add helper macros for Windows dump header access
  include/qemu: add 32-bit Windows dump structures
  dump/win_dump: add 32-bit guest Windows support

 contrib/elf2dmp/main.c       |   6 +-
 dump/win_dump.c              | 299 ++++++++++++++++++++++-------------
 hmp-commands.hx              |   2 +-
 include/qemu/win_dump_defs.h | 115 +++++++++++++-
 4 files changed, 306 insertions(+), 116 deletions(-)

-- 
2.35.1



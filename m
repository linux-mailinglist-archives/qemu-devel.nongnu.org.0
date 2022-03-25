Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8694E7AC3
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 22:10:05 +0100 (CET)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXrC8-00064f-Kq
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 17:10:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nXpzT-0001sS-9x
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1nXpzN-0008ND-Tn
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648237968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kZKYYAM1gohDoBwbbJoZ15AxqouNoOaGqqpmBBKLoFs=;
 b=FQVkxRzOw4mJm1KZswHm3ARtvrgsVug05yGGwX8OU831FL6BSNhmFO4GzOS2bMnM9j3LDL
 gej9oG3SReaTJoqWQHwBzyexqu+hRNsczNiswjiJ3ZklXlHlXNgq5c8S6irKS9miJn4wHg
 sSVSXU72fAtMgMaxBAKSufYO6Q8cXUE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-8XsTdwG3NKK93wg8dqOvRA-1; Fri, 25 Mar 2022 15:51:39 -0400
X-MC-Unique: 8XsTdwG3NKK93wg8dqOvRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10FC72A59569;
 Fri, 25 Mar 2022 19:51:39 +0000 (UTC)
Received: from vp-pc.redhat.com (unknown [10.40.192.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAE167AEA;
 Fri, 25 Mar 2022 19:51:32 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: marcandre.lureau@redhat.com,
	f4bug@amsat.org
Subject: [PATCH v3 0/4] dump: add 32-bit guest Windows support
Date: Fri, 25 Mar 2022 22:51:26 +0300
Message-Id: <20220325195130.62090-1-viktor.prutyanov@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=viktor.prutyanov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=viktor.prutyanov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Mar 2022 17:08:08 -0400
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

Since 32-bit versions of Windows still exist, there is a need to take
live and crash dumps of such guests along with 64-bit guests. So, add
an ability for 'dump-guest-memory -w' to take dumps from 32-bit guest.
When running the command QEMU consumes 32-bit Complete Memory Dump
header passed by guest driver through vmcoreinfo device as it was
previously done for 64-bit headers. 32-bit vmcoreinfo guest driver in
upstream virtio-win can fill such a header.

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
 include/qemu/win_dump_defs.h | 115 +++++++++++++-
 3 files changed, 305 insertions(+), 115 deletions(-)

-- 
2.35.1



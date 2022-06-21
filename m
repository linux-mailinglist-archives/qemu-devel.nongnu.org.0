Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE312553439
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 16:09:36 +0200 (CEST)
Received: from localhost ([::1]:53278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3eZT-0005xz-PT
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 10:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVS-0002tL-1V
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3eVK-0008SZ-PC
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 10:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655820317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7tdGPdLz5ONQEiwElBf/idU7Pp+22S3UQ+ww9u5iydo=;
 b=R5eLYXrwQV5MDyoKIdsjubDK618mlXPJTfGYLILs4xuzFeu7EjSYHoh+aO4srWxcCb0FcP
 +qzHECgt3GRQt86grd0f/VzGXwcvcL+wBDF7TNxyz2orY+oApjt4erDZ5ciHAIzULxbj1W
 7dqfmBALGunJk6LFCfD6oZBY1N9CRbw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-CMsHIo_ZPNC5gdKRpPJVMw-1; Tue, 21 Jun 2022 10:05:12 -0400
X-MC-Unique: CMsHIo_ZPNC5gdKRpPJVMw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69A303C17F07;
 Tue, 21 Jun 2022 14:05:12 +0000 (UTC)
Received: from secure.laptop (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 508AE2166B2A;
 Tue, 21 Jun 2022 14:05:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH 0/5] Eliminate multifd flush
Date: Tue, 21 Jun 2022 16:05:02 +0200
Message-Id: <20220621140507.1246-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Upstream multifd code synchronize all threads after each RAM section.  This=
 is suboptimal.=0D
Change it to only flush after we go trough all ram.=0D
=0D
Preserve all semantics for old machine types.=0D
=0D
Juan Quintela (5):=0D
  multifd: Create property multifd-sync-each-iteration=0D
  multifd: Put around all sync calls tests for each iteration=0D
  migration: Simplify ram_find_and_save_block()=0D
  migration: Make find_dirty_block() return a single parameter=0D
  multifd: Only sync once each full round of memory=0D
=0D
 migration/migration.h |  6 ++++=0D
 hw/core/machine.c     |  1 +=0D
 migration/migration.c | 10 ++++++=0D
 migration/ram.c       | 80 ++++++++++++++++++++++++++++---------------=0D
 4 files changed, 70 insertions(+), 27 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2B6ED1F9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:05:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqygM-00017i-MV; Mon, 24 Apr 2023 12:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqygH-00016Z-Py
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:04:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqygF-0008Kx-GJ
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682352282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=oIjH4dbVo/77jylsnkR55u+uyYBzLjVdEhxIEtZDSZ8=;
 b=YnCKaLLuK4IYcKmpwAQexfL9h+Y1ROmm5smL12dR0TVZLobjfyn60i7/9dMcDWoFIHG56e
 NwDLDJS5ggsXzIDEE8lKnUTTLoXgkvCD9fl9hlhQmx6uqY8JHxnHMcgtFBWL+dx5zTt6MZ
 t4wIl9mh8yFiEXnVaw/kKAz/cCxc8XU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-G3bnCnt-OTyDawo2jdUZCg-1; Mon, 24 Apr 2023 12:04:39 -0400
X-MC-Unique: G3bnCnt-OTyDawo2jdUZCg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CE9B887401;
 Mon, 24 Apr 2023 16:04:38 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8CDAF492B03;
 Mon, 24 Apr 2023 16:04:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/3] hw/core: Make machine-qmp-cmds.c target independent
Date: Mon, 24 Apr 2023 18:04:31 +0200
Message-Id: <20230424160434.331175-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For being able to create a universal QEMU binary one day, core files
like machine-qmp-cmds.c must not contain any target specifc macros.
This series reworks the related spots in this file, so we can move
it to the common softmmu_ss source set. This has also the advantage
that we only have to compile this file once, and not multiple times
(one time for each target) anymore.

Thomas Huth (3):
  hw/core: Use a callback for target specific query-cpus-fast
    information
  cpu: Introduce a wrapper for being able to use TARGET_NAME in common
    code
  hw/core: Move machine-qmp-cmds.c into the target independent source
    set

 include/hw/core/cpu.h      |  6 ++++++
 include/qemu/typedefs.h    |  1 +
 cpu.c                      |  5 +++++
 hw/core/machine-qmp-cmds.c | 20 ++++----------------
 target/s390x/cpu.c         |  8 ++++++++
 hw/core/meson.build        |  5 +----
 6 files changed, 25 insertions(+), 20 deletions(-)

-- 
2.31.1



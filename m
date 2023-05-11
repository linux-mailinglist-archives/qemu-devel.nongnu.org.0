Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18736FF3C7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 16:14:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px727-0003NX-SH; Thu, 11 May 2023 10:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px726-0003NJ-EX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1px725-0004nf-3W
 for qemu-devel@nongnu.org; Thu, 11 May 2023 10:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683814356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JYSESqY1qvnK/f7ogKh61jp6DYee5e0H6Cx5ysccg2w=;
 b=gdlWUogpstNNLZsZYO9FHcFPAt2AAkIplqO3dEi7WO2n3fygpoFGYY5c2QRhPXO8SUfnjF
 qPTcRE7/1aGbjzieWnZ5rjUcjRP25n/GfU2FWhQEApnGOaLZdKMdK0BRMVln900nFTCsbh
 IcaTo/Yorq1PPjjW3oJ1LTdWepc9yd8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-_Wbn-W9zMSKhItGQ2TZJmQ-1; Thu, 11 May 2023 10:12:31 -0400
X-MC-Unique: _Wbn-W9zMSKhItGQ2TZJmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FA748533AE;
 Thu, 11 May 2023 14:12:14 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B344114171D5;
 Thu, 11 May 2023 14:12:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Andrei Gudkov <gudkov.andrei@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Hyman Huang <huangy81@chinatelecom.cn>
Subject: [PATCH v2 0/5] migration: Make dirtyrate.c target independent
Date: Thu, 11 May 2023 16:12:03 +0200
Message-Id: <20230511141208.17779-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

In this [v2]
- create qqemu_target_pages_to_MiB() and use it
- fix meson.build

Please review, Juan.

[v1]
The only features that it used that are target dependent are page_size
and page_bits, both of what have an accessor for target independent
code.

Please review, Juan.

Juan Quintela (5):
  softmmu: Create qemu_target_pages_to_MiB()
  Use new created qemu_target_pages_to_MiB()
  migration: Teach dirtyrate about qemu_target_page_size()
  migration: Teach dirtyrate about qemu_target_page_bits()
  migration: Make dirtyrate.c target independent

 include/exec/target_page.h |  1 +
 migration/dirtyrate.c      | 21 +++++++++------------
 softmmu/dirtylimit.c       | 11 +++--------
 softmmu/physmem.c          | 11 +++++++++++
 migration/meson.build      |  4 ++--
 5 files changed, 26 insertions(+), 22 deletions(-)

-- 
2.40.1



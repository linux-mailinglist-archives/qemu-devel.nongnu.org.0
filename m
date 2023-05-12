Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F58C6FFEBF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 04:12:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxIF4-0004gm-P3; Thu, 11 May 2023 22:10:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF2-0004gO-9E
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:10:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pxIF0-0000MB-5J
 for qemu-devel@nongnu.org; Thu, 11 May 2023 22:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683857438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/d9kzZlL/zr+sUwUhEjhX9iE91LRsMo01o8kX+1+bl4=;
 b=daT7ar7bVmsGRzj+ZT7R0/kGxpJh8unouUXgXIXVckyEyzzoZb2WAmtSkitEJhnqCh4HgO
 CvoGuu/5iOnaLyyvBAZjAO0W5S1K7yFyGnOWfZeeg7Vf1fTbg8qW1zSYvnG6qz6Wu8Ooe9
 21Tcl40HzU/AfLnVb4xH+iD+1YScpyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-vxVpEq7SO1qzDS2FAOb4lQ-1; Thu, 11 May 2023 22:10:35 -0400
X-MC-Unique: vxVpEq7SO1qzDS2FAOb4lQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D82BA8037A8;
 Fri, 12 May 2023 02:10:34 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9C82026D16;
 Fri, 12 May 2023 02:10:34 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com,
	armbru@redhat.com,
	richard.henderson@linaro.org
Subject: [PATCH v2 00/19] Fix qemu_strtosz() read-out-of-bounds
Date: Thu, 11 May 2023 21:10:14 -0500
Message-Id: <20230512021033.1378730-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v1 was here:
https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg01988.html

since then:
- make parse_uint easier to use, then use it in qemu_strtosz
- add even more unit tests
- fix a bug in qemu_strtoui
- avoid dereferencing randome memory during unit tests [Hanna]
- other cleanups as I found them
- compress the strtosz unit tests (the major cause of the large
  interdiff statistics)

backport-diff looks like:

001/19:[----] [--] 'test-cutils: Avoid g_assert in unit tests'
002/19:[----] [--] 'test-cutils: Use g_assert_cmpuint where appropriate'
003/19:[----] [--] 'test-cutils: Test integral qemu_strto* value on failures'
004/19:[down] 'test-cutils: Test more integer corner cases'
005/19:[down] 'cutils: Fix wraparound parsing in qemu_strtoui'
006/19:[down] 'cutils: Document differences between parse_uint and qemu_strtou64'
007/19:[down] 'cutils: Adjust signature of parse_uint[_full]'
008/19:[down] 'cutils: Allow NULL endptr in parse_uint()'
009/19:[0147] [FC] 'test-cutils: Add coverage of qemu_strtod'
010/19:[----] [--] 'test-cutils: Prepare for upcoming semantic change in qemu_strtosz'
011/19:[down] 'test-cutils: Refactor qemu_strtosz tests for less boilerplate'
012/19:[down] 'cutils: Allow NULL str in qemu_strtosz'
013/19:[----] [--] 'numa: Check for qemu_strtosz_MiB error'
014/19:[down] 'test-cutils: Add more coverage to qemu_strtosz11;rgb:1e1e/1e1e/1e1e'
015/19:[0178] [FC] 'cutils: Set value in all qemu_strtosz* error paths'
016/19:[----] [--] 'cutils: Set value in all integral qemu_strto* error paths'
017/19:[down] 'cutils: Use parse_uint in qemu_strtosz for negative rejection'
018/19:[0018] [FC] 'cutils: Improve qemu_strtod* error paths'
019/19:[0107] [FC] 'cutils: Improve qemu_strtosz handling of fractions'


Eric Blake (19):
  test-cutils: Avoid g_assert in unit tests
  test-cutils: Use g_assert_cmpuint where appropriate
  test-cutils: Test integral qemu_strto* value on failures
  test-cutils: Test more integer corner cases
  cutils: Fix wraparound parsing in qemu_strtoui
  cutils: Document differences between parse_uint and qemu_strtou64
  cutils: Adjust signature of parse_uint[_full]
  cutils: Allow NULL endptr in parse_uint()
  test-cutils: Add coverage of qemu_strtod
  test-cutils: Prepare for upcoming semantic change in qemu_strtosz
  test-cutils: Refactor qemu_strtosz tests for less boilerplate
  cutils: Allow NULL str in qemu_strtosz
  numa: Check for qemu_strtosz_MiB error
  test-cutils: Add more coverage to qemu_strtosz11;rgb:1e1e/1e1e/1e1e
  cutils: Set value in all qemu_strtosz* error paths
  cutils: Set value in all integral qemu_strto* error paths
  cutils: Use parse_uint in qemu_strtosz for negative rejection
  cutils: Improve qemu_strtod* error paths
  cutils: Improve qemu_strtosz handling of fractions

 include/qemu/cutils.h         |    5 +-
 audio/audio_legacy.c          |    4 +-
 block/gluster.c               |    4 +-
 block/nfs.c                   |    4 +-
 blockdev.c                    |    4 +-
 contrib/ivshmem-server/main.c |    4 +-
 hw/core/numa.c                |   11 +-
 qapi/opts-visitor.c           |   10 +-
 tests/unit/test-cutils.c      | 2340 ++++++++++++++++++++++++---------
 ui/vnc.c                      |    4 +-
 util/cutils.c                 |  251 ++--
 util/guest-random.c           |    4 +-
 util/qemu-sockets.c           |   10 +-
 13 files changed, 1891 insertions(+), 764 deletions(-)


base-commit: 278238505d28d292927bff7683f39fb4fbca7fd1
-- 
2.40.1



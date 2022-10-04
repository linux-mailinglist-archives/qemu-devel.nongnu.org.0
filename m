Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECBD5F3FCE
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 11:36:04 +0200 (CEST)
Received: from localhost ([::1]:54650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofeLL-0001VY-A3
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 05:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHg-0005JP-Ef
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofeHb-00051t-VS
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 05:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664875930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7PEXIW/GdnrqAp0taZk6AQ3iP9GyA509swOGrGg0PKI=;
 b=J9KdJW5POjmnFnocibkYjfoenwcSYfpEoQpWYo3uSsj35+mYJOyG0/R+vExyl9ESlRGDTB
 ragFGJTC/izg5i3v9l9E2MdNaVKZHREUKBDi7w+crz1Ns4KArwNNviz2CQ2HLyGE0pp+dk
 sOyLd4IWrcytG4ap8BYxz1TbxuDShz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-aad3AZtjOjeDOhsN4vXrWQ-1; Tue, 04 Oct 2022 05:32:08 -0400
X-MC-Unique: aad3AZtjOjeDOhsN4vXrWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4329E101A52A;
 Tue,  4 Oct 2022 09:32:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F759492B04;
 Tue,  4 Oct 2022 09:32:07 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/4] linux-user: fix regression with some ioctls with newest
 glibc
Date: Tue,  4 Oct 2022 10:32:02 +0100
Message-Id: <20221004093206.652431-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes a problem where some ioctls lost their definition when we
build with latest glibc that prevents use using linux/fs.h  It further
does some cleanup of conditionals to mitigate against such problems
in future.

Daniel P. Berrangé (4):
  linux-user: add more compat ioctl definitions
  linux-user: remove conditionals for many fs.h ioctls
  meson: enforce a minimum Linux kernel headers version >= 4.18
  linux-user: drop conditionals for obsolete kernel header versions

 linux-user/ioctls.h        | 24 -----------------------
 linux-user/linux_loop.h    |  4 ----
 linux-user/syscall.c       | 39 ++++++++++++++++++++++++++------------
 meson.build                | 12 ++++++++++++
 tests/tcg/i386/test-i386.c | 10 +++-------
 5 files changed, 42 insertions(+), 47 deletions(-)

-- 
2.37.3



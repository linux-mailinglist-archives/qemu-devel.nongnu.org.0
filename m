Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D3966DF69
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmNq-0000vj-85; Tue, 17 Jan 2023 08:52:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNn-0000rf-Bp
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pHmNl-0005vU-Hu
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:52:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673963528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pWlyQjbQbScrarUs8O1IvcNkbBaZsODHsNHzbBi/YR8=;
 b=M0r1qX9JMC6UaOiLiojLoR1DlI3OuUpMCvJN6ytXIJp2hybxX2rpT4xdPel6np9JqNIUtp
 1xOrihlr8X68yORX+E7+NnhrzS6fGyRGN0pyyGxwIooJk+pO4JS5OFje4y1sOsNDURhLRF
 c1+40LP+MNMWKzEHjWYCgloVKSVrW/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-Zcx-rPpbOTakJHsr81GXvw-1; Tue, 17 Jan 2023 08:52:06 -0500
X-MC-Unique: Zcx-rPpbOTakJHsr81GXvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0670F8027FE;
 Tue, 17 Jan 2023 13:52:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD291121315;
 Tue, 17 Jan 2023 13:52:05 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/3]  TSA: make sure QEMU compiles when using clang TSA
Date: Tue, 17 Jan 2023 08:52:00 -0500
Message-Id: <20230117135203.3049709-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

This serie aims to enable clang Thread Safety Analysis (TSA) in QEMU.
The goal is to use it for our multiqueue project aiming to replace the
block layer AioContext lock with a rwlock and make sure the lock is taken
correctly everywhere [1].

By default, TSA covers pthread mutexes, therefore when added in QEMU it
immediately detects some wrappers using pthread_mutex_lock/unlock without
using the proper TSA macros. Since adding such macro requires scanning all
possible callers of the affected wrapper, simply use TSA_NO_TSA to suppress
the warnings.

[1] = https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg00903.html

Emanuele Giuseppe Esposito (2):
  util/qemu-thread-posix: use TSA_NO_TSA to suppress clang TSA warnings
  bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA warnings

Kevin Wolf (1):
  configure: Enable -Wthread-safety if present

 configure                |  1 +
 bsd-user/qemu.h          |  5 +++--
 include/exec/exec-all.h  |  5 +++--
 include/qemu/thread.h    | 14 +++++++++-----
 util/qemu-thread-posix.c |  2 +-
 5 files changed, 17 insertions(+), 10 deletions(-)

-- 
2.39.0



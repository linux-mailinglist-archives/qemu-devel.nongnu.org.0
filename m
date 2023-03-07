Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB726ADDD6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 12:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZVjH-0005Si-1D; Tue, 07 Mar 2023 06:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjE-0005Fr-UF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pZVjD-0008ES-Dk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 06:43:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678189414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UHwdTqVlPXdZ8bfPBTABKl0mOw3QprrPc7C940bCBGU=;
 b=SqPCdJbn7MTS7bH56wgpA63/wguQWzjjlYCxfk9Gd2JJ4MAWAwhosIal1zoft+7jyxH+aE
 N50m3u0pq4TRbs+APrgmMBEKUHIZ/YV2c7LjNu64EtXNarIr36agfmck1zQK5HNOg4tQKj
 SusAfsJbEfAX6vnIzsOP5gZZtjRLrJA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-t_j_BU5HOJORwOwP5xgp9A-1; Tue, 07 Mar 2023 06:43:33 -0500
X-MC-Unique: t_j_BU5HOJORwOwP5xgp9A-1
Received: by mail-ed1-f70.google.com with SMTP id
 y24-20020aa7ccd8000000b004be3955a42eso18705069edt.22
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 03:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678189412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UHwdTqVlPXdZ8bfPBTABKl0mOw3QprrPc7C940bCBGU=;
 b=MuzY302jSjyHoYl4osGiX51PvXesdbsvYHKqX1vnrSrq8XTvgIbYcahEkbO69uQL4D
 C0AVCQcpAB8RpkGtX9QWPqKGfBIM0k8A/pQ1WsB7YQOG087iAymDg8OVHWbBEwsTnPZ0
 lTy/3PB83va+4dcR+qOnOsjlFCxPclLEj9HwEa0hjsm5AMxXTsc206CiWeW8bukVJVyh
 ceoM1uHrjQBvglEiEfzbJsK0jvvFeExxkIVYp/f44vaUVRFQthhci91JNDh+4Uu07b3v
 o/tOC2n14ajQL6Jq10WbtbPfgABhO14gMM2/mOf2H1M1zEiTRZTYuoYc3WGJUHwAa/sw
 vrlA==
X-Gm-Message-State: AO0yUKUy/4HWV9eqCbUQm8cx2u4SxWYi+maEEHuWcyOeRid5MHzuuD/J
 kBrSWA7yZfg7AcopGqUaXJJbkQfYGUd+V8wWiy7EX/aQHy8lEVefD8fA35Sl3GB3BE27KKuo5CL
 wfIFfJrz5aaLBq4hXU0YahufUyVfAX289eK41PMCBAtv/u5fYlCAUGYLOMdzi7B4zpT0Bfqnzbw
 4=
X-Received: by 2002:a17:906:8a9f:b0:8f7:bff0:cbc4 with SMTP id
 mu31-20020a1709068a9f00b008f7bff0cbc4mr10487522ejc.37.1678189412102; 
 Tue, 07 Mar 2023 03:43:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/B1p79HxqNZOnuoVrqdycPcfHDQTSQTI7c7HvlWJB/URy3NNtsPHTsO3IN1zfk5uZxYV4xOQ==
X-Received: by 2002:a17:906:8a9f:b0:8f7:bff0:cbc4 with SMTP id
 mu31-20020a1709068a9f00b008f7bff0cbc4mr10487510ejc.37.1678189411718; 
 Tue, 07 Mar 2023 03:43:31 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 rl10-20020a170907216a00b008baeb5c9bdbsm6030845ejb.141.2023.03.07.03.43.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 03:43:31 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Fix missing memory barriers on ARM
Date: Tue,  7 Mar 2023 12:43:20 +0100
Message-Id: <20230307114329.158094-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The following changes since commit c61d1a066cb6cf90662c82d0e35660fc0ccacbaf:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-03-02 16:13:45 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-mb

for you to fetch changes up to 6229438cca037d42f44a96d38feb15cb102a444f:

  async: clarify usage of barriers in the polling case (2023-03-07 12:39:53 +0100)

----------------------------------------------------------------
* Fix missing memory barriers
* Fix comments about memory ordering

----------------------------------------------------------------
Paolo Bonzini (9):
      qatomic: add smp_mb__before/after_rmw()
      qemu-thread-posix: cleanup, fix, document QemuEvent
      qemu-thread-win32: cleanup, fix, document QemuEvent
      edu: add smp_mb__after_rmw()
      aio-wait: switch to smp_mb__after_rmw()
      qemu-coroutine-lock: add smp_mb__after_rmw()
      physmem: add missing memory barrier
      async: update documentation of the memory barriers
      async: clarify usage of barriers in the polling case

 docs/devel/atomics.rst     | 26 ++++++++++++---
 hw/misc/edu.c              |  5 +++
 include/block/aio-wait.h   |  2 +-
 include/qemu/atomic.h      | 17 +++++++++-
 softmmu/physmem.c          |  3 ++
 util/async.c               | 43 +++++++++++++++---------
 util/qemu-coroutine-lock.c |  9 ++++-
 util/qemu-thread-posix.c   | 69 +++++++++++++++++++++++++++-----------
 util/qemu-thread-win32.c   | 82 +++++++++++++++++++++++++++++++---------------
 9 files changed, 186 insertions(+), 70 deletions(-)
-- 
2.39.1



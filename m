Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034EC64BEB4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 22:44:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5CzV-0000DW-Uj; Tue, 13 Dec 2022 16:39:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzK-0000Aj-NE
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p5CzI-0007dk-H5
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 16:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670967535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JIXTM9a2vYTN1bKFhPwaczFN2eI7nhSZ7SaeysPErMM=;
 b=f8+PjZcGCe2nijTO2ZlKJHqwNlodHs/jBmYaUMIeh9dzULyPtlx/AtdaPjf4bzhcm9vtbM
 dvp945zpXUTBnyApDiG38MMZne3LnQ3mwlolMAM8hjz49ZNSde9mX/sSdPIA806MW1narj
 pI4WBpljncQPW0EnRvSsb8OqNLj5Z2w=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-dHEKLyYiOhudyvLso78oSw-1; Tue, 13 Dec 2022 16:38:53 -0500
X-MC-Unique: dHEKLyYiOhudyvLso78oSw-1
Received: by mail-vk1-f199.google.com with SMTP id
 r23-20020a1f2b17000000b003b89463c349so1767651vkr.0
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 13:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JIXTM9a2vYTN1bKFhPwaczFN2eI7nhSZ7SaeysPErMM=;
 b=K6PwGKM18idSL4Ex3SgKxi4PFXQyjJRXmYO0QLo+exHt68Vk8sALv+6+RAJnu0V0R0
 ZFky6bkNqXyeYgc+mySAFeaZO4ABoTUaiXyaxBK48G7BugANK+bggggritSJCKGpAmEp
 V3WaSjfzgPvE4pySvV3hEltGg1Z3LpcD96omaLX1zdrttGQmHNJ6GyuL6TLdr6330y+0
 OeGtXPLurWdM0nEjira/rNLPaSa19sqfgr2ya4FQ9xlDYk8Um5FQq35ra/ucqttiXGbJ
 wTUtP8KdYXvRDtJcTE1633O2yfbBcElKlffRZO/LogIqv0d+UHuFBVoQiukWEi1VDVLd
 uSxA==
X-Gm-Message-State: ANoB5pncIySYkYEyiLVnFypPscAETM50mlVmc6Ltb+Ht9PpymN8iYuYX
 0FRfLQVEHYCJAPGQoKuzLpdVpFfUtVWbxofrzzeQGLv5/HzhjIvabg0Z5oQ53aE6DSdltbIOW66
 8ZWVSVU/+sYUbi6SAZXakPDLX2AkJLYhxYv6lYO+te1TRF/RDN1l+6SNg8KqiJAwn
X-Received: by 2002:a1f:43c4:0:b0:3bd:ef1a:7e6 with SMTP id
 q187-20020a1f43c4000000b003bdef1a07e6mr12083223vka.1.1670967532631; 
 Tue, 13 Dec 2022 13:38:52 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6X1Mq5ONN7Et8wjPkJSxp4cAKSCBUFqEg8slTm/mVfZ1UNCD7u5sWk3n5lFHahBKTdvUQHhQ==
X-Received: by 2002:a1f:43c4:0:b0:3bd:ef1a:7e6 with SMTP id
 q187-20020a1f43c4000000b003bdef1a07e6mr12083198vka.1.1670967532240; 
 Tue, 13 Dec 2022 13:38:52 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006feb158e5e7sm8607487qkp.70.2022.12.13.13.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 13:38:51 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com
Subject: [PATCH 0/5] migration: Fix disorder of channel creations
Date: Tue, 13 Dec 2022 16:38:45 -0500
Message-Id: <20221213213850.1481858-1-peterx@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

Based-on: <20221011215559.602584-1-peterx@redhat.com>

This whole set is based on the whole set of preempt-full mode being applied
first here:

https://lore.kernel.org/r/20221011215559.602584-1-peterx@redhat.com

I also picked up the latest version from Manish on fixing multifd
counterpart of the problem, here (which are the initial two patches):

https://lore.kernel.org/r/20221123172735.25181-1-manish.mishra@nutanix.com

One trivial change is to fix RDMA builds for patch 1 there.

I verified that I can trigger disordered connections with preempt mode
postcopy (1 out of a few attemps), which can cause migration to hang during
precopy phase, if e.g. I set the NIC packet loss rate to 50%.  So now with
all the 5 patches applied we should fix all the migration disorder issue on
channel creation.

Patch 3 is IMHO a cleanup that I'd think good to have even without patch
4/5.  Patch 5 actually fixes the ordering issue.  For each of the patch,
please refer to the commit message and comments in-code.  Any comment
welcomed.

A side note to Juan: logically it should apply cleanly to your -next tree
as long as Manish's patches are not there - because they're also included
here with a fix to RDMA builds.

Peter Xu (3):
  migration: Rework multi-channel checks on URI
  migration: Add a semaphore to count PONGs
  migration: Postpone postcopy preempt channel to be after main

manish.mishra (2):
  io: Add support for MSG_PEEK for socket channel
  migration: check magic value for deciding the mapping of channels

 chardev/char-socket.c               |   4 +-
 include/io/channel.h                |   6 +
 io/channel-buffer.c                 |   1 +
 io/channel-command.c                |   1 +
 io/channel-file.c                   |   1 +
 io/channel-null.c                   |   1 +
 io/channel-socket.c                 |  17 ++-
 io/channel-tls.c                    |   1 +
 io/channel-websock.c                |   1 +
 io/channel.c                        |  16 ++-
 migration/channel-block.c           |   1 +
 migration/channel.c                 |  45 ++++++++
 migration/channel.h                 |   5 +
 migration/migration.c               | 164 +++++++++++++++++++---------
 migration/migration.h               |  15 ++-
 migration/multifd.c                 |  24 +---
 migration/multifd.h                 |   2 +-
 migration/postcopy-ram.c            |  36 +++---
 migration/postcopy-ram.h            |   6 +-
 migration/rdma.c                    |   1 +
 migration/savevm.c                  |   6 +-
 scsi/qemu-pr-helper.c               |   2 +-
 tests/qtest/tpm-emu.c               |   2 +-
 tests/unit/test-io-channel-socket.c |   1 +
 util/vhost-user-server.c            |   2 +-
 25 files changed, 254 insertions(+), 107 deletions(-)

-- 
2.37.3



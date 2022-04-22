Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898E50BD4A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:41:33 +0200 (CEST)
Received: from localhost ([::1]:37628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwLa-0000pR-ET
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhwJN-0007D8-Bp
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nhwJL-0005Pc-07
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650645550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=v0KJsZwebVujvgz1moNJGsu8yuRkj+YRtGSxR0zXvD8=;
 b=LZDoJSksJzzxnVnfMQIVLwVtYV1OBtAm/cgHUwfsvEq4e6U0Xi8fS/NcNRU1kwtCN5ntf+
 DtymHNPdgEVFWYYkXZbUNZbcaM/QE0RZ+qHxug5goVzGEvyRgCMI1PSVd03+AZmjQfVS0F
 XOy6HJxyVe1TNuDAiyZDX6BjkiaJIhM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-HPH_wW8ZMLeqRmrlKT0YMw-1; Fri, 22 Apr 2022 12:39:09 -0400
X-MC-Unique: HPH_wW8ZMLeqRmrlKT0YMw-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00392b57fbdaaso2729370wma.0
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v0KJsZwebVujvgz1moNJGsu8yuRkj+YRtGSxR0zXvD8=;
 b=rJ2pe2TbfWYdPe3botIvyssswmlQVyI0q7zQPEUGNiSPamnFVFxT1nspbKCyZUgLPA
 fbJ6u2cJMAKuhGc1tQp/B9TfTR27tbnJvd372CrXpwMo10aToK6xtfvwqstNQJrU9uFB
 YXZfFW5nLALRgrPfPPnzyNJnREO0XR3GL+lvA/I+70+iZudoe7HClfhattUqTn8OyuPB
 4zgLdkniJ078WommoU1TVuk5LJf/gzLmGAsG340bozc2xrB1rROcv/qwfJ/MiX9PJFl5
 zfAvk7YA4HgXIO54MGqPOs7kdjM0yvPTRHW1qpYwTNNizpB+aH5Qa3M9KQk+22EJkuxO
 jfTw==
X-Gm-Message-State: AOAM531RGUDMHQMQJeLlN2OiFxcq3ENpRI5mKKFoCZGJYQFd/kyRQnWH
 9o/EOZpu858Vx9R0/z2x9gB9JIOAQTCbskWVyLBOmTOP9bLQOmEcePH0XliMhrjbyy16WozZryj
 CwAD8zzLb6au9xkU=
X-Received: by 2002:adf:c547:0:b0:207:9abc:cfa1 with SMTP id
 s7-20020adfc547000000b002079abccfa1mr4381469wrf.390.1650645548020; 
 Fri, 22 Apr 2022 09:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdOLeLhJ4IGQmWnA3DzeznmDhQ8eo9llbZ12GdhasRQISZCNWM77FND7A2PLYgNOywm0YB0w==
X-Received: by 2002:adf:c547:0:b0:207:9abc:cfa1 with SMTP id
 s7-20020adfc547000000b002079abccfa1mr4381433wrf.390.1650645547653; 
 Fri, 22 Apr 2022 09:39:07 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 f189-20020a1c38c6000000b0038ff83b9792sm4853481wma.43.2022.04.22.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:39:07 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v5 0/3] util/thread-pool: Expose minimun and maximum size
Date: Fri, 22 Apr 2022 18:38:54 +0200
Message-Id: <20220422163857.703111-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
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
Cc: fam@euphon.net, eduardo@habkost.net, qemu-block@nongnu.org,
 michael.roth@amd.com, mtosatti@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As discussed on the previous RFC[1] the thread-pool's dynamic thread
management doesn't play well with real-time and latency sensitive
systems. This series introduces a set of controls that'll permit
achieving more deterministic behaviours, for example by fixing the
pool's size.

We first introduce a new common interface to event loop configuration by
moving iothread's already available properties into an abstract class
called 'EventLooopBackend' and have both 'IOThread' and the newly
created 'MainLoop' inherit the properties from that class.

With this new configuration interface in place it's relatively simple to
introduce new options to fix the even loop's thread pool sizes. The
resulting QAPI looks like this:

    -object main-loop,id=main-loop,thread-pool-min=1,thread-pool-max=1

Note that all patches are bisect friendly and pass all the tests.

[1] https://patchwork.ozlabs.org/project/qemu-devel/patch/20220202175234.656711-1-nsaenzju@redhat.com/

@Stefan I kept your Signed-off-by, since the changes trivial/not
thread-pool related
---

Changes since v4:
 - Address Markus' comments WRT qom.json

Changes since v3:
 - Avoid duplication in qom.json by creating EventLoopBaseProperties.
 - Fix failures on first compilation due to race between
   event-loop-base.o and qapi header generation.

Changes since v2:
 - Get rid of wrong locking/waiting
 - Fix qapi versioning
 - Better commit messages

Changes since v1:
 - Address all Stefan's comments
 - Introduce new fix

Nicolas Saenz Julienne (3):
  Introduce event-loop-base abstract class
  util/main-loop: Introduce the main loop into QOM
  util/event-loop-base: Introduce options to set the thread pool size

 event-loop-base.c                | 140 +++++++++++++++++++++++++++++++
 include/block/aio.h              |  10 +++
 include/block/thread-pool.h      |   3 +
 include/qemu/main-loop.h         |  10 +++
 include/sysemu/event-loop-base.h |  41 +++++++++
 include/sysemu/iothread.h        |   6 +-
 iothread.c                       |  68 +++++----------
 meson.build                      |  26 +++---
 qapi/qom.json                    |  42 ++++++++--
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  55 +++++++++++-
 13 files changed, 418 insertions(+), 69 deletions(-)
 create mode 100644 event-loop-base.c
 create mode 100644 include/sysemu/event-loop-base.h

-- 
2.35.1



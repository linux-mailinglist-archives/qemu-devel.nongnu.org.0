Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7794EEA94
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:38:05 +0200 (CEST)
Received: from localhost ([::1]:41288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDjI-0002iN-35
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:38:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1naDgt-0000GM-6z
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1naDgq-00017t-EH
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648805731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aeIC+csqi+lAytJwqKfeZthLnquLrFIrMfQ/EVJdsZA=;
 b=CxE9xmHtEZsqPwyR8HsUbpZqX0wBQHuzDzfHtWOqwdKBqxfB3ejbHdzzJT0A9E0G/9g0em
 xWVcdPw1vifubisbR+MWv3z4BLhg/m/zOanebf3ffF2snmARoPqKRVWy5OKb0qJuDJ4Ru5
 dP40ntHEv7FHFEcERM3bFwFK0vXQAtc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-skt2b5f5M-OA698HTRcLAA-1; Fri, 01 Apr 2022 05:35:30 -0400
X-MC-Unique: skt2b5f5M-OA698HTRcLAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 12-20020a05600c24cc00b0038c6caa95f7so930281wmu.4
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aeIC+csqi+lAytJwqKfeZthLnquLrFIrMfQ/EVJdsZA=;
 b=5ygA886fF+tmcZ3TtCEweZ9cfzMRtXJv4y4rVsN2ykx2eYpt6atSKH/dDtS6UwarXZ
 +tEDgr1uu6l3RM44zv5VKjO72C5FfhWscxKuRqeGYd/9dDtTa06ss5S6CYIwM+uNXhfd
 CLz+CLx+ecn4JR4JH++WJEXILif4OCpGjdiomf8k/B2uaj/NU1Gdx9CL4i55TuMsUW5d
 SxZuqRQMBMnyg0cvWqQRwwcnvkHwaY+KkLIkY4ikElk0Y2OEcCSz9SOgJr9f/uFDnEVT
 trPAIiHsP1Qxz6FMuXBZLKZHCc/4ruGDvBaAJBx4lQ+E6LsH0mA7oCTEwUF+QXC7i4Gf
 9drA==
X-Gm-Message-State: AOAM533rPLphJKPy9g/9X8YMVW/AGwScnaFKpXnAkvJfyceLfi3+CU3i
 ZOnv+2bl2DMNzIX+V8/5/7xMrUxzdD7od85qbAvEL+vJJJ/thyXkUFFYGlaWM+3zmuohUSyecu6
 ihcyvf2eF9SGvWyA=
X-Received: by 2002:a7b:c955:0:b0:38c:aafb:2991 with SMTP id
 i21-20020a7bc955000000b0038caafb2991mr8071432wml.114.1648805728953; 
 Fri, 01 Apr 2022 02:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvfOhGdElIZFu3lVMkVwMHvf+ScgHNzfpGVdgUUjI1+t6cxu4Z9KsecCwd+cIj1Fde8sSgfA==
X-Received: by 2002:a7b:c955:0:b0:38c:aafb:2991 with SMTP id
 i21-20020a7bc955000000b0038caafb2991mr8071412wml.114.1648805728743; 
 Fri, 01 Apr 2022 02:35:28 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:1c1a:5300:ea85:f79:5235:c7fc])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm14009187wmb.36.2022.04.01.02.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:35:28 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v4 0/4] util/thread-pool: Expose minimun and maximum size
Date: Fri,  1 Apr 2022 11:35:20 +0200
Message-Id: <20220401093523.873508-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 qapi/qom.json                    |  40 +++++++--
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  55 +++++++++++-
 13 files changed, 416 insertions(+), 69 deletions(-)
 create mode 100644 event-loop-base.c
 create mode 100644 include/sysemu/event-loop-base.h

-- 
2.35.1



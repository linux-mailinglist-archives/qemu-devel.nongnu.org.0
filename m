Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3A04DB2DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:20:01 +0100 (CET)
Received: from localhost ([::1]:34522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUVL-0001E0-MN
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:19:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nUU6l-0005Pl-TC
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:54:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nUU6j-0000cB-8k
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:54:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647438872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SIKojt/J2ClEiv3g9qx1oy3TyvYSRkJES07vFCdBgKg=;
 b=CEOGnQXrsJaKjoPdw47FSnro6OxBOR1svBiJgscn8pOUbba4ZLO8tOb0pUg2ZgwqeS+cux
 oXwDFMwklPw5j1Qxoo2TM0GAGNspd39ZVlr/+yJCN7cwZ1cUq5LxtmhXrUhLpQhdN/NnEe
 YaLs1U0KAuahJwo5MyfqyrpJTyI8eqg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-zVJvhvWoPGycQHCNDuBDoA-1; Wed, 16 Mar 2022 09:54:29 -0400
X-MC-Unique: zVJvhvWoPGycQHCNDuBDoA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a5-20020adfdd05000000b001f023fe32ffso582986wrm.18
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SIKojt/J2ClEiv3g9qx1oy3TyvYSRkJES07vFCdBgKg=;
 b=LvWn0sAtuRFZIkS0k5/3Yy98NXDo+jGY7OJEDAna2bxGbam8/04d9p+hkr+3U7GNK1
 jjGZYz7GB84CuQIOro6xTf7uk+iR78LYYpEruT1A4v3PBUbQyHh3PFKBfGWPBXf4nMza
 Q66bUSz0hW1OZfDaEJYnuODB9IyoCBLKy92P57SuJ6W8q06uySPKdWDPAZq3Jz+QV5ud
 99dcVOxhZ7hhvvljyWEF1Pwa1kS2uKXddoOS9aeq98zbPwbq8FBm1mW1Rcz8HLOroWy+
 YeQAS+s1V4zjqc9qr/1JkUenVO9RIbse6oRLbPZaCR465UtDG6AqiIGBlK6gFgtr3woW
 F3tg==
X-Gm-Message-State: AOAM531dq+YNcaP6EUFirn30wYYatql9/CMknO4ZAblXew+mpPvTq/tR
 0NfPTvokfBGKJH12+PSpEYwaPxqBE9JolWSlC0qffKFTITbtIFlkwLHp9D5ytQ0M0g/gRoqEIh8
 eCxB7l/bR++13UeQ=
X-Received: by 2002:a5d:47c4:0:b0:1f0:25ca:6d81 with SMTP id
 o4-20020a5d47c4000000b001f025ca6d81mr54061wrc.247.1647438868107; 
 Wed, 16 Mar 2022 06:54:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjD1BarhlZWh9Wur8R4XIBRpI+YzKsmxOwqpfFSXidZOY70S19KXDuDQI6CXvSCWWMNXKKAQ==
X-Received: by 2002:a5d:47c4:0:b0:1f0:25ca:6d81 with SMTP id
 o4-20020a5d47c4000000b001f025ca6d81mr54040wrc.247.1647438867880; 
 Wed, 16 Mar 2022 06:54:27 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:3506:3400:69b5:c807:1d52:ff67])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a1cf607000000b00389a5390180sm1770157wmc.25.2022.03.16.06.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 06:54:27 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v3 0/3] util/thread-pool: Expose minimun and maximum size
Date: Wed, 16 Mar 2022 14:53:20 +0100
Message-Id: <20220316135321.142850-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsaenzju@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

---
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
 qapi/qom.json                    |  34 +++++++-
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  55 +++++++++++-
 13 files changed, 414 insertions(+), 65 deletions(-)
 create mode 100644 event-loop-base.c
 create mode 100644 include/sysemu/event-loop-base.h

-- 
2.35.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF7950DAD3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 10:03:12 +0200 (CEST)
Received: from localhost ([::1]:58744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nitgd-0005BR-4p
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 04:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nitb9-0002Mr-UU
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 03:57:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nitb8-0006Wu-4q
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 03:57:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650873449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ijveyHBMUsBJ5iSUBHRM++uG9rpWTSon6mx3zNMLDQ=;
 b=fmWUieTkcTypwfokk+dDto8pB+jSSNBEidzJzFD0DO48q0iCbFKldjtHDJNV+1IQ4S9q3l
 xMiuNpcl4VScw5SSzLr11g/vLOb1M/fb38PCxOri+yR77DoinCqkmdL+0d+awcHROmkKMH
 zYwVqJjYZCUFJQFSuUEVyt6hqXDbuWA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-cxvIPW_fPdGCqLt50benYw-1; Mon, 25 Apr 2022 03:57:28 -0400
X-MC-Unique: cxvIPW_fPdGCqLt50benYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i131-20020a1c3b89000000b00392b57fbdaaso6415953wma.0
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 00:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+ijveyHBMUsBJ5iSUBHRM++uG9rpWTSon6mx3zNMLDQ=;
 b=yRBWLbvuGVW6jF9y+amdpy9NBCgaDJ5HNxE4S+fNV0HbcxluJ6vrp124rf4SqaUPYs
 QKJS5yz1YrCuY3KfVEKAlfEXr/j+zDnxtkW9XdIY5QT6Yrj7uiFSh2PEnIrGaD3CzH5b
 agq6h/dFky3zMvuZqh0gxvTwmA9V/sIyH8scevFm29RVSV8nkciNAY5rl7NQzYEEsM6+
 IZjNPc4aR7reGDeT7MTrBpL7KBr4nsJEHU/LNPhiD2A0J1pdYBqHupfTHWAmT7H2HWCP
 ONPus7cY/+ucfvQalmsYONKVj2oA71IGOZMT0dHOqdvEdEyUUkT10fqHSQEMHe8Pkdk7
 9Dsg==
X-Gm-Message-State: AOAM53011k2vHuoE9FapA2zIc7Fr3Ddcm1lDd2/RzYqIUHPp3IDgDX06
 uecfwPeKA5CWlb4M0NjXZhGBExMBr7TS0BmV0JqxKKQDdKHGtFwQzEdFRW44R+RDLQYTXlJd07r
 5gF23n+Wb208hZ7A=
X-Received: by 2002:a05:6000:1a8a:b0:20a:af19:ad12 with SMTP id
 f10-20020a0560001a8a00b0020aaf19ad12mr13072217wry.4.1650873447071; 
 Mon, 25 Apr 2022 00:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW4NCw9UcvaCX2q1vEwQ8aTHxqMLDpQPYBYgOxdnTXvc2TuQtlPAIhcLm+FVwI1LVLrTrc5A==
X-Received: by 2002:a05:6000:1a8a:b0:20a:af19:ad12 with SMTP id
 f10-20020a0560001a8a00b0020aaf19ad12mr13072186wry.4.1650873446751; 
 Mon, 25 Apr 2022 00:57:26 -0700 (PDT)
Received: from vian.redhat.com ([2a0c:5a80:1306:2f00:cfcf:62cf:6f38:dd92])
 by smtp.gmail.com with ESMTPSA id
 v4-20020adfa1c4000000b0020ad7dd409fsm4254434wrv.108.2022.04.25.00.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 00:57:26 -0700 (PDT)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH v6 0/3] util/thread-pool: Expose minimun and maximum size
Date: Mon, 25 Apr 2022 09:57:20 +0200
Message-Id: <20220425075723.20019-1-nsaenzju@redhat.com>
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
---

Changes since v5:
 - Add 'Since' versioning to MainLoopProperties

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
 qapi/qom.json                    |  43 ++++++++--
 util/aio-posix.c                 |   1 +
 util/async.c                     |  20 +++++
 util/main-loop.c                 |  65 ++++++++++++++
 util/thread-pool.c               |  55 +++++++++++-
 13 files changed, 419 insertions(+), 69 deletions(-)
 create mode 100644 event-loop-base.c
 create mode 100644 include/sysemu/event-loop-base.h

-- 
2.35.1



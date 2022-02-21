Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327994BDB43
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:25:00 +0100 (CET)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCQl-0000cI-9g
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:24:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEm-000706-Av
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsaenzju@redhat.com>)
 id 1nMCEi-0005tR-6d
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rh3Y1d2xOT3cn7qbdlXJ9GZDq9XG0Lwg7+IxjMhecYs=;
 b=dBA2u7iHT0FED9mqI+1n2LcMIZIzXSartjIR1XTE6aFCHOu5clvQz6A2mW2AzwPIVBoekv
 UNAS0Mn4+dN7NrD+m3oK1OP1T0nEuVbnpWOA8YYRLyc7H89JW6/b+R4Eu3ymZhNnOK8eTK
 3YxAz/tp+zRrqdaxw10FQnULGc93BWI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-hNrLOh9hPayMtiI7Su0XYA-1; Mon, 21 Feb 2022 12:12:14 -0500
X-MC-Unique: hNrLOh9hPayMtiI7Su0XYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 p13-20020a05600c204d00b0037ea24db798so2558501wmg.2
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rh3Y1d2xOT3cn7qbdlXJ9GZDq9XG0Lwg7+IxjMhecYs=;
 b=a5/ZmqU7U4KMbFcFGkIBQKv5vNRnLe/MVIP28SS41176lXcvMNSsdC3pcD6hLuTB/Y
 fckUEqsBtS83YQxfRQvq25Z7p5TF8sG73CSvCafudzU8frEMtDp+ESHXroo0ULVxtWpK
 Y+xalN+ppdYl08DCa9C2+VdrdUNZEdpelLJxGHZMpMoF4rxbXhPJnQPoXMKkrjFZ6Qot
 8n6wnd9Dj7daKfuOThm8avhpQvKs0oGeDiuBzBHIkgxBEQUfo+UKjO7QN8UfjENM0wZT
 9MoQHbW0oWXdjOYPm2kEuxSbHoOoRXar+5xjFcCQug17sXhHI3WQLMMDX/2EynCdALVe
 RRvg==
X-Gm-Message-State: AOAM530u4TFo6YqTqgUfN3PN6e7KuVLSzfXTQ/9u9o7YZRSzipw0oLC2
 VEK70v+/0DLIU9mJvHnAfr+cfk081VecDMR65T8gbBV6aBw7ML6iG0MaaoYIzzeNbhlYgTGmNDb
 r+QrktXyMflxjRWk=
X-Received: by 2002:a05:600c:502a:b0:37f:aacb:c8b9 with SMTP id
 n42-20020a05600c502a00b0037faacbc8b9mr1495946wmr.81.1645463532989; 
 Mon, 21 Feb 2022 09:12:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyE7ohW52n9uugEHG7/Z//EncHTNU/WS8wlolVvGehzVy1+hO9bj9Y1K8P9Or/uYFS6F2oIAQ==
X-Received: by 2002:a05:600c:502a:b0:37f:aacb:c8b9 with SMTP id
 n42-20020a05600c502a00b0037faacbc8b9mr1495920wmr.81.1645463532689; 
 Mon, 21 Feb 2022 09:12:12 -0800 (PST)
Received: from vian.redhat.com ([2a0c:5a80:1204:1500:37e7:8150:d9df:36f])
 by smtp.gmail.com with ESMTPSA id a10sm24402149wri.74.2022.02.21.09.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 09:12:12 -0800 (PST)
From: Nicolas Saenz Julienne <nsaenzju@redhat.com>
To: kwolf@redhat.com,
	stefanha@redhat.com,
	berrange@redhat.com
Subject: [PATCH 0/3] util/thread-pool: Expose minimun and maximum size
Date: Mon, 21 Feb 2022 18:08:42 +0100
Message-Id: <20220221170843.849084-1-nsaenzju@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsaenzju@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

Nicolas Saenz Julienne (3):
  util & iothread: Introduce event-loop abstract class
  util/main-loop: Introduce the main loop into QOM
  util/event-loop: Introduce options to set the thread pool size

 MAINTAINERS               |   1 +
 include/block/aio.h       |  11 +++
 include/qemu/main-loop.h  |  11 +++
 include/sysemu/iothread.h |  11 +--
 iothread.c                | 171 ++++----------------------------------
 qapi/qom.json             |  14 ++--
 qga/meson.build           |   2 +-
 qom/meson.build           |   1 +
 tests/unit/meson.build    |  10 +--
 util/async.c              |   3 +
 util/event-loop.c         | 168 +++++++++++++++++++++++++++++++++++++
 util/event-loop.h         |  45 ++++++++++
 util/main-loop.c          |  56 +++++++++++++
 util/thread-pool.c        |  41 ++++++++-
 14 files changed, 368 insertions(+), 177 deletions(-)
 create mode 100644 util/event-loop.c
 create mode 100644 util/event-loop.h

-- 
2.35.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256096D8371
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:18:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5po-00025O-NO; Wed, 05 Apr 2023 12:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk5ph-00024V-62
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:18:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk5pf-0007W9-IA
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680711478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=obklXR0o7ni6vG8PFtwTaPlIP0V//HcvLymW6pMIA0c=;
 b=gHXuHhF3n64Vz8XS4rPJapFvMTmL7CB9Cy5BlzE8FLm0OTBXLQphN8R/BXJBvZEf1pd3Rw
 94JeFEErQkvU2U6LrgO0EBtDgtaTYTyHL6zQ7O7T7Iq2emc33urKG07bDL93Qcpu1o6dSf
 A3NjMQegjloxWygEDlJqhiSHSbP8Pmk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-1m1Gpw7oOWqxmd4aJrImtg-1; Wed, 05 Apr 2023 12:17:57 -0400
X-MC-Unique: 1m1Gpw7oOWqxmd4aJrImtg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-930719372dbso46027166b.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:17:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711475; x=1683303475;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=obklXR0o7ni6vG8PFtwTaPlIP0V//HcvLymW6pMIA0c=;
 b=raiTjM17lubRwr12NBAGa/zMaxVXNTJFbPMpLO5ec2xAXSdOhfPy5FK1O3c7AZuf9+
 tERcNzXLMao0A9B4xanAkDSwYjFUX0IyYI0/Qb1pE6QjkSAx7LpOm6QVpgnVFD0bvSay
 a+4hLu7DESU+jhKLsHbXFyNb5gK9qwha5QL2xggE86bU0VFam6Zxk3zxbocMCDyoYhuQ
 BA/n7CnVDYrqODhuLLAOrody4yNKXF3cjSciHoRDn8mkNX5jjZOYih5Sn/K5msXscy5g
 7N4jwluRkeaC4TgFVu6HLW1AitF1oSmRHBR2UyEHRSJz1ZJ3g2eTEMdjif2cZP/6QDV1
 M1xQ==
X-Gm-Message-State: AAQBX9e2LrqJw1dS2qOByhnMBoo6sZi8hdc0bOFUmyVOiuA+LJXDVQFF
 gGV7e57uH9vjy1PEIlbsdXAtIWBq7UTRsUvtrd2kEdo651OzPwo2kFJ5ISHyN9fnF/VyWeG2Zj6
 mr3Sag7sCExjEoUsrQGv/LZ9umJP2a4JfPJL5maYdiwI0csuDe8xY9uWZ5VNg5cEx0ZtDFBFLYA
 E=
X-Received: by 2002:a05:6402:2302:b0:502:67b6:9734 with SMTP id
 l2-20020a056402230200b0050267b69734mr2621686eda.6.1680711475325; 
 Wed, 05 Apr 2023 09:17:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350YNb3d8adbQB6YBg4n85+jw5J83W59Qbt2vG7hHQPMCzPp4vY8MUNuXVkOJPatqSLSafhfiqw==
X-Received: by 2002:a05:6402:2302:b0:502:67b6:9734 with SMTP id
 l2-20020a056402230200b0050267b69734mr2621657eda.6.1680711474952; 
 Wed, 05 Apr 2023 09:17:54 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 h27-20020a50cddb000000b004c19f1891fasm7523896edj.59.2023.04.05.09.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:17:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 f.ebner@proxmox.com
Subject: [PATCH 0/3] block-backend: avoid deadlocks due to early queuing of
 request
Date: Wed,  5 Apr 2023 18:17:49 +0200
Message-Id: <20230405161752.194727-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

IDE TRIM is a BB user that wants to elevate its BB's in-flight counter
for a "macro" operation that consists of several actual I/O operations.
Each of those operations is individually started and awaited.  It does
this so that blk_drain() will drain the whole TRIM, and not just a
single one of the many discard operations it may encompass.

When request queuing is enabled, this leads to a deadlock: The currently
ongoing discard is drained, and the next one is queued, waiting for the
drain to stop.  Meanwhile, TRIM still keeps the in-flight counter
elevated, waiting for all discards to stop -- which will never happen,
because with the in-flight counter elevated, the BB is never considered
drained, so the drained section does not begin and cannot end.

Draining has two purposes, granting exclusive access to a BlockDriverState
and waiting for all previous requests to complete.  Request queuing was
introduced mostly to ensure exclusive access to the BlockDriverState.
However, the implementation is stricter: it prevents new requests from
being submitted to the BlockDriverState, not allowing them to start
instead of just letting them complete before bdrv_drained_begin() returns.

The reason for this was to ensure progress and avoid a livelock
in blk_drain(), blk_drain_all_begin(), bdrv_drained_begin() or
bdrv_drain_all_begin(), if there is an endless stream of requests to
a BlockBackend.  However, as proved by the IDE TRIM testcase, the current
implementation of request queuing is prone to deadlocks and hard to fix
in different ways---even though Hanna tried, all of her attempts were
unsatisfactory one way or the other.

As the name suggests, deadlocks are worse than livelocks :) so let's
avoid them: turn the request queuing on only after the BlockBackend has
quiesced, and leave the second functionality of bdrv_drained_begin()
to the BQL or to the individual BlockDevOps implementations.

And in fact, this is not really a problem.  Of the various users of
BlockBackend, all of them can avoid the livelock:

- for a device that runs in the vCPU thread, requests will only be
submitted while holding the big QEMU lock, meaning they _won't_ be
submitted during bdrv_drained_begin() or bdrv_drain_all_begin().

- for anything that is blocked by aio_disable_external(), the iothread
will not be woken up.  There is still the case of polling, which has
to be disabled with patch 1.  This is slightly hackish but anyway
aio_disable_external() is going away, meaning that these cases will
fall under the third bucket...

- ... i.e. BlockBackends that can use a .drained_begin callback in
their BlockDevOps to temporarily stop I/O submissions.  Note that this
callback is not _absolutely_ necessary, in particular it is not needed
for safety because the patches do not get away with request queuing.

In the end, request queuing should indeed be unnecessary if .drained_begin
is implemented properly in all BlockDevOps.  It should be possible to warn
if a request come at the wrong time.  However, this is left for later.

Paolo


Based-on: <20230405101634.10537-1-pbonzini@redhat.com>


Paolo Bonzini (3):
  aio-posix: disable polling after aio_disable_external()
  block-backend: make global properties write-once
  block-backend: delay application of request queuing

 block/block-backend.c             | 61 +++++++++++++++++++++----------
 block/commit.c                    |  4 +-
 block/export/export.c             |  2 +-
 block/mirror.c                    |  4 +-
 block/parallels.c                 |  2 +-
 block/qcow.c                      |  2 +-
 block/qcow2.c                     |  2 +-
 block/qed.c                       |  2 +-
 block/stream.c                    |  4 +-
 block/vdi.c                       |  2 +-
 block/vhdx.c                      |  2 +-
 block/vmdk.c                      |  4 +-
 block/vpc.c                       |  2 +-
 include/sysemu/block-backend-io.h |  6 +--
 nbd/server.c                      |  3 +-
 tests/unit/test-bdrv-drain.c      |  4 +-
 tests/unit/test-block-iothread.c  |  2 +-
 util/aio-posix.c                  |  2 +-
 18 files changed, 66 insertions(+), 44 deletions(-)

-- 
2.39.2



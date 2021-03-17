Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AE33F7C7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:04:01 +0100 (CET)
Received: from localhost ([::1]:39910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaWW-0002XR-N9
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT0-0000hD-6E; Wed, 17 Mar 2021 14:00:22 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:43284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaSx-0004sq-Ue; Wed, 17 Mar 2021 14:00:21 -0400
Received: by mail-ej1-x636.google.com with SMTP id p8so4047480ejb.10;
 Wed, 17 Mar 2021 11:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dXRI20XOvxWyRJNCmYReaVTN5tCbnPe7h8E3Oy0y1O4=;
 b=qU5FYHyL27c3cHY924YMMf/0RB59gAqqrjZlqEqU9GQG8X/Izvhli1PAcrinkxTezt
 0mbEAfF7PMYKlLR839QDwliyxdTXu/mxrIzK4bH503AcAKjp0tY/Rc+bS94M6eYBicxp
 GaPbNGN0Soeyd3MRKFo/3/fD6xw0omMxHOsl4inF9cQaZtIPbEcbMvxXmoSQBB2rhDh5
 7dQ2z8MBAKI8kI82ET5QEZBSA1VH2cFIA+/UPUXqvvH+YNmcQNZQ7LF15rvnmu+A6ryV
 rvArPneDMMIfy5E6UcZ4dJvTK2Vqc/u59Sue7iKqXgvCtrvzucAH1Osk0RBTiBOQFds8
 qmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=dXRI20XOvxWyRJNCmYReaVTN5tCbnPe7h8E3Oy0y1O4=;
 b=MKenBWgvhlj02TQ6mdUk/He+YUQaSV8ybQ/VqDepBZWuxyN+PQI7rxOhwTCx86PzTl
 Eo+NHbVJuE3MQog30vzqaBpjAHI40DUHnP28U/yRJjBK1qfKK8jV8JD4PWtXnS6cYeRB
 8VhGYsX0jugApYvxPiStH5h7Hso/mmbaiC659uHVW8XlYZop8ViG/DXrOs01kd+tT+Rx
 1oqdN1iCmZxESGxqlRfCyAHTVQJRHOnk/eBiDl8xlWRPLNI+mBtj/ZozReqiLIM/VFfT
 rkl/87gTgdHxkbkfpmAvB9P/fRnK88EJCH3pLqC5GZKV44lqvwRX3sHkpifRTQ8YpSx2
 hDfw==
X-Gm-Message-State: AOAM532HFzOgZthwHtkPIKcyW+ZDaWfk+FU9NpmEurHuonKEOfoiYghy
 e0Q8xHtHeUllwdxuypjO6KBsZ50rxxk=
X-Google-Smtp-Source: ABdhPJwuy9y3AXAhj5IHsz/UpRgk/YTnhBjErMbRqDHk/JDcrQaJgNaj17vlb9eZiBee9SPbtAjLhg==
X-Received: by 2002:a17:906:c005:: with SMTP id
 e5mr36837997ejz.270.1616004015397; 
 Wed, 17 Mar 2021 11:00:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b22sm13159303edv.96.2021.03.17.11.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:00:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] coroutine rwlock downgrade fix, minor VDI changes 
Date: Wed, 17 Mar 2021 19:00:07 +0100
Message-Id: <20210317180013.235231-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david.edmondson@oracle.com, kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a resubmit of David Edmondson's series at
https://patchew.org/QEMU/20210309144015.557477-1-david.edmondson@oracle.com/.
After closer analysis on IRC, the CoRwlock's attempt to ensure
fairness turned out to be flawed.  Therefore, this series
reimplements CoRwlock without using a CoQueue.  Tracking whether
each queued coroutine is a reader/writer makes it possible to
never wake a writer when only readers should be allowed and
vice versa.

v2->v3: new CoRwlock implementation

v3->v4: fix upgrade and add a test for that, too

v4->v5: typo

David Edmondson (4):
  block/vdi: When writing new bmap entry fails, don't leak the buffer
  block/vdi: Don't assume that blocks are larger than VdiHeader
  coroutine/mutex: Store the coroutine in the CoWaitRecord only once
  test-coroutine: Add rwlock downgrade test

Paolo Bonzini (2):
  coroutine-lock: reimplement CoRwlock to fix downgrade bug
  test-coroutine: add rwlock upgrade test

 block/vdi.c                 |  11 ++-
 include/qemu/coroutine.h    |  17 ++--
 tests/unit/test-coroutine.c | 161 ++++++++++++++++++++++++++++++++++++
 util/qemu-coroutine-lock.c  | 149 +++++++++++++++++++++------------
 4 files changed, 274 insertions(+), 64 deletions(-)

-- 
2.29.2



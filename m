Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B5033D8D9
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:14:49 +0100 (CET)
Received: from localhost ([::1]:34670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCLI-0004VY-QP
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC7B-0000tu-Oc; Tue, 16 Mar 2021 12:00:20 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:45167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMC79-0000HD-AC; Tue, 16 Mar 2021 12:00:12 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e10so10732746wro.12;
 Tue, 16 Mar 2021 09:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=itrz6CLd3fj2mHEdKB1Eeo/F30NCpLTRd9Ue0cOohR4=;
 b=Og5r8suKg1G4959uDIV2L+mpSPhz6qPO36l2EdXYFX7EYZnnpHJBvWnFCjE0msjdQo
 vrJ5kqeaOYpFL1P4trG3KDMmSFTOINw3E1lSB31fL+36zI7rHQAcNUXooGm4Dh6O/pLi
 fsYmYdIsY0+1DP3Q+88ek29hs6KnLoT3XMNxOlYZyWNnE5AKtBzHskgVfILMlCVvaWQ3
 VKk/MfPvFTjBNxCubM8fjueN9DnPZ7YbQroP4wm9mvk82ilMM1Gp2PPVuG9BZiisWGVy
 4P+1L0UMPU0Xuuo7vKcExzvKo2YwvJKeBvr/+JgGWujo9ZNXkKPlLwbo+iJupEDgKC7T
 CNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=itrz6CLd3fj2mHEdKB1Eeo/F30NCpLTRd9Ue0cOohR4=;
 b=EEVvCs9DbwXzNdXvjHSv1tUyVq8MMYo6m0U908Oofn8YF72zcGSUxSg9ixd/Ivejmw
 WVIS5cdm8XMMN7vxDN1Jpq4ArIGYlu8TPI666LkLhKCDQytckmm+qQZDWOtZ24BTs2t4
 VALrrJoGbiE7URE6FSjS+cmDSRkaQl5dZr2cq5AhPKgeAMF8BnmVnjdKqoSApGp+f0ke
 MMgfQaoeCNYKZUk8cRt4Qt/fkqwLPnZjSMynxOF8lzgiDT97tVlhdVwFARTPHeUpQXkV
 8gsBEUFeHDswQXng3HpNNKSd0zYvegy7U2FQMXZCwOSkvSfFk7iRZbeds+5+ckZFgmJX
 NOww==
X-Gm-Message-State: AOAM533aIWE+LPFzzlk3WkMaeXrzB667HcDXLDWm4deMI/mF8k/YAkjB
 H83oGj/LSa53gE11xZdNhW9xoDV9Lds=
X-Google-Smtp-Source: ABdhPJz9KfOQdAiA4I+Nq4GYg2waay9lHSTR7JV//9Zv5bdJIldDpmBXkxSLM+svDdlunibzPkTHxw==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr5667387wrq.193.1615910408965; 
 Tue, 16 Mar 2021 09:00:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j14sm22674851wrw.69.2021.03.16.09.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 09:00:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] coroutine rwlock downgrade fix, minor VDI changes 
Date: Tue, 16 Mar 2021 17:00:02 +0100
Message-Id: <20210316160007.135459-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
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
After closer analysis on IRC, the CoRwLock's attempt to ensure
fairness turned out to be flawed.  Therefore, this series
reimplements CoRwLock without using a CoQueue.  Tracking whether
each queued coroutine is a reader/writer makes it possible to
never wake a writer when only readers should be allowed and
vice versa.

David Edmondson (4):
  block/vdi: When writing new bmap entry fails, don't leak the buffer
  block/vdi: Don't assume that blocks are larger than VdiHeader
  coroutine/mutex: Store the coroutine in the CoWaitRecord only once
  test-coroutine: Add rwlock downgrade test

Paolo Bonzini (1):
  coroutine-lock: reimplement CoRwLock to fix downgrade bug

 block/vdi.c                 |  11 ++-
 include/qemu/coroutine.h    |  10 ++-
 tests/unit/test-coroutine.c | 112 ++++++++++++++++++++++++++
 util/qemu-coroutine-lock.c  | 151 +++++++++++++++++++++++-------------
 4 files changed, 225 insertions(+), 59 deletions(-)

-- 
2.29.2



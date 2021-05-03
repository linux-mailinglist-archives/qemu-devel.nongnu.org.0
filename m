Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2377D371446
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:30:41 +0200 (CEST)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWme-0003Tn-4U
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi4-0008KJ-ML
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:56 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:44813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldWi2-0003Vj-Iz
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:25:56 -0400
Received: by mail-ed1-x531.google.com with SMTP id bf4so5822618edb.11
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uPR5Ukx2C16sMgmbIoUtGNR2cnyoctYX61EGPlslb5k=;
 b=SIE1LWMlNAifdQWItI1heaVqh13dmqABnM5LFrEDVvCmqhd0IpH6Fy8xHovKVSGGYq
 PAW6yaU/hnjW1c6jMcKax7zZfE8sbJk1DOy4YYMnTckPCmLMfdxIL86CSUTpJFtYIxzJ
 CTEKC8PcguclezT7Zpuk7kOkTjB/zPpGSSPZlsfZoHsGtez0Lh4oOjy8cpoPZveAnVNp
 Cj9HmmRM1mbK7MxMoP7lm4AiJxFdTeaiidW5oHRtfIoIHsPqkR+ikikvN+sTErEbeMMC
 H9bko1NmANqJ4pl/T0qcxFwXoTiOZZxhJ4J24mu5sKkJ1fdjUAF5uOc3Kp97B0DjLley
 39FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=uPR5Ukx2C16sMgmbIoUtGNR2cnyoctYX61EGPlslb5k=;
 b=HMJgs1VcTpCRj+4HiaTVtWI3qr9c2x7+Lbml9nyNi25GoHA7oRI1Z0W6jY19nF0Fvf
 wnJSm6yRv6Tz5wvFCQXxcsfMv1SbRDrRDa2wwDVEyWMlAPChX55iTgGg2xVV34E+tz9Z
 +o+P/xAeSwMspZW2q7OkRVYkF+/4eDAxmCgnAMNytlVYiIcNXSi1/vjPl0kCmhKc8tGw
 DWswUollccAkHrjKHsPCT83r7Z5VLzwo623olP8vD/e9u90vTYtAlBZhTZ021+bKU13u
 0DlCRnOnRdbD5N4oUxckLeq3QfOCCt0oSkb/j7GJLNRUobqT6GuPXf8lYTMBqERaXtPO
 GDlw==
X-Gm-Message-State: AOAM530ffns+mRShE+9GKzfxxHnMwQBbHkhZE6Dx2jx2nI481+hsAZRa
 DnD1oCJdDF8QRnyJtp5yAZDFhkWv+h0=
X-Google-Smtp-Source: ABdhPJwAliGCAGCbWKoj9jtdxRu8Skc0Wc27a0zHpMWkKNHotU02+Lm0cr60owAGt9S+hiBfFivd1A==
X-Received: by 2002:aa7:cf8d:: with SMTP id z13mr19785795edx.104.1620041153015; 
 Mon, 03 May 2021 04:25:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id gn36sm2981317ejc.23.2021.05.03.04.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 04:25:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] coroutine: new sleep/wake API
Date: Mon,  3 May 2021 13:25:44 +0200
Message-Id: <20210503112550.478521-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: eesposit@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a revamp of the qemu_co_sleep* API that makes it easier to
extend the API: the state that is needed to wake up a coroutine is now
part of the public API instead of hidden behind a pointer-to-pointer;
the API is made more extensible by pushing the rest of QemuCoSleepState
into local variables.

In the future, this will be extended to introduce a prepare/sleep/cancel
API similar to Linux's prepare_to_wait/schedule/finish_wait functions.
For now, this is just a nice refactoring.

Paolo Bonzini (6):
  coroutine-sleep: use a stack-allocated timer
  coroutine-sleep: disallow NULL QemuCoSleepState** argument
  coroutine-sleep: allow qemu_co_sleep_wake(NULL)
  coroutine-sleep: move timer out of QemuCoSleepState
  coroutine-sleep: replace QemuCoSleepState pointer with struct in the
    API
  coroutine-sleep: introduce qemu_co_sleep

 block/block-copy.c          | 10 +++---
 block/nbd.c                 | 14 +++-----
 include/qemu/coroutine.h    | 26 ++++++++------
 util/qemu-coroutine-sleep.c | 69 +++++++++++++++++--------------------
 4 files changed, 57 insertions(+), 62 deletions(-)

-- 
2.31.1



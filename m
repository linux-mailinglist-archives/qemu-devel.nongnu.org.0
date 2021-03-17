Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F133F018
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:18:43 +0100 (CET)
Received: from localhost ([::1]:50278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV8L-0003qS-St
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6X-0002CP-93; Wed, 17 Mar 2021 08:16:49 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6S-0007hu-FY; Wed, 17 Mar 2021 08:16:48 -0400
Received: by mail-ej1-x62f.google.com with SMTP id mj10so2235197ejb.5;
 Wed, 17 Mar 2021 05:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKFdhh/Nl+B5HCHrzntCbboHzkUyX7zK92u6DKCbmu4=;
 b=ONPyVNbFq7SvXHVkaYyKh/8/nUSszeFezpZ32aaqNFE4s7r1X0Mr0W3gtZT7oNm6rG
 t/UVP11aqgC2w2KUHWO5nx37B7SaTMVrrtYUCtTDAAqt2a2IMXzoh26Zqy2Ce6kVNqyQ
 BcPXARmsCUPtA9/gTQwfPYmnpQ6Vado3RYSlvfXL2pTe6eAbwuQeM2aaaU6qvE5bDmKq
 4E1QA3fnyL+nswAV2aJZ3sRd+RX9p5r8pyncp7gBrqhTi0RotLhbVLUFGuXkFbdhU6M/
 2cKN4NfTu1osCNE8j4NcZmrsDgJRytteNqmt6xupbeAGrbcw1rG8N2Bej95pS693gwED
 Lqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gKFdhh/Nl+B5HCHrzntCbboHzkUyX7zK92u6DKCbmu4=;
 b=iF7xgSsx29uNijQgQe5+kGRWh6vRad+3j8fUphlUSbkSwyXqCzPjCjgmHedTyivJAe
 68j3GQtt57XjYs7gNXz0Y33kuQoTX7Nnn6ePoKn3EOg2TXESjdTQnGeyhH9U+9gW9/HR
 yYNsK7ljYITj+1/oKM+tZPo9vtzTk4iJCsC5LWDpALsMWRm9s1bzwtxbBBdHi2RGZcy1
 JHvJx3DvbufpmyWdPTjevb0i/9zLcjbEQGiWzwxAIFoR3cJ23YKCDsrXejUZLjEV+PUR
 jTaLkTb6RZIHMivofSNKq4EeZLTiNDsI9MyXRfP97pDHO/mLzxOetj1diL4sAVuXlTaa
 FRAg==
X-Gm-Message-State: AOAM533lrlBMzyHGwUDSxKB7W9UuAld7KuNtFMqfu3UTaGmrU3CSaZjA
 G8Nqs+Sa2lfdh61xDST29B1mrsgQJZo=
X-Google-Smtp-Source: ABdhPJxqZcur0xH/iWwO01FpY5+FYYdFlCOERvH0sLYsBoK6u7CxtMQxiO/jQHnlsRUP9odkmjewXg==
X-Received: by 2002:a17:906:bfcc:: with SMTP id
 us12mr35834954ejb.266.1615983402947; 
 Wed, 17 Mar 2021 05:16:42 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] coroutine rwlock downgrade fix, minor VDI changes 
Date: Wed, 17 Mar 2021 13:16:35 +0100
Message-Id: <20210317121641.215714-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
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

v3->v4: fix upgrade and add a test for that, too

David Edmondson (4):
  block/vdi: When writing new bmap entry fails, don't leak the buffer
  block/vdi: Don't assume that blocks are larger than VdiHeader
  coroutine/mutex: Store the coroutine in the CoWaitRecord only once
  test-coroutine: Add rwlock downgrade test

Paolo Bonzini (2):
  coroutine-lock: reimplement CoRwLock to fix downgrade bug
  test-coroutine: add rwlock upgrade test

 block/vdi.c                 |  11 ++-
 include/qemu/coroutine.h    |  17 ++--
 tests/unit/test-coroutine.c | 161 ++++++++++++++++++++++++++++++++++++
 util/qemu-coroutine-lock.c  | 149 +++++++++++++++++++++------------
 4 files changed, 274 insertions(+), 64 deletions(-)

-- 
2.29.2



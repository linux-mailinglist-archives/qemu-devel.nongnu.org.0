Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA3511822
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:10:50 +0200 (CEST)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njhRR-0003ya-73
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPJ-0001cT-B4; Wed, 27 Apr 2022 09:08:37 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njhPH-0002a6-6a; Wed, 27 Apr 2022 09:08:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id kq17so3306464ejb.4;
 Wed, 27 Apr 2022 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vF9zHNnoT+9a1/ohbjj3B5AY6L9w3K7sAzistpVWra0=;
 b=bJV1xWCtRcFNXI+TCx1UUzjC/I/MgOf4QRSfTvZ8DaZlkMvxfgQ7kO/MO4jzL1NJ6s
 XI1tZTtQ+3FfYkDH9pC41bUATawDOMIs/nW9fI7+mAuSVQJ2kSJQ+PRBFBFUKu+j3dGv
 5h4lPzkWImdzLWHcoWi3z1IlJZrZtQBjEHGHSfcOvhegHcZV146GB1BeDWFmufZmLOZL
 Zg2U2m2y6H4HSUWvIITwhmZOALI7xFevnuY8C36bQtVZWlspwfE7PTxbkxRxonoj/biv
 y6vGBVZn8E0v99ueCnF9YDYEbFV87pvR8UgoqMFRG73ya+TfZ8q47sHV7WxL7Ctr9iej
 4nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vF9zHNnoT+9a1/ohbjj3B5AY6L9w3K7sAzistpVWra0=;
 b=qqwO4FBvihGx5WQWgQUuThxssL6tl9unm9/335zHzpP1vezpvaL7WDAGBqa8OaV3Zv
 9DurTsl36QVQltJLc9KNsArRX+vxenmNNuR6mTkc9An4UjHp+RVrsYpRF/XGVHCQvfGr
 twTTeKPK4xIEC9WWkFW2rrSSMaJaCYNKHrDj9AiMfkfqiPiPBDdU9ebQflfrgi09CZNR
 CN+au31SQkh8EqDS29iZuOUcWCqepr+MbPP8IjJWRg3KLMEW3XOhru4RphIIeF+xdrzr
 hb1Sltml+adtnqGR3YddMmmifDxzYsmxj6UurdLmmiJRrjfOjURNC9xJ5tGW0yffm0N5
 VCSg==
X-Gm-Message-State: AOAM530/hQ7zbEhMEIydrRvv3ARqX0hypCXpQoTemWj7ygzd1fABPIbD
 VUOjfqLQElNX55SH3anGAjn6YCBbQF4Mkw==
X-Google-Smtp-Source: ABdhPJwTp+4WSDwyidVXMvjGy4uAEqOcU0+BfeyRGn54Nhq/XqLUr9pw4fR1ym04Yj7sF1wAInmxFA==
X-Received: by 2002:a17:906:c116:b0:6f3:832f:3c8 with SMTP id
 do22-20020a170906c11600b006f3832f03c8mr18522369ejc.235.1651064912041; 
 Wed, 27 Apr 2022 06:08:32 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a170906654800b006f38daa8447sm4712447ejn.145.2022.04.27.06.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 06:08:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] Cleanup CoQueue restart functions
Date: Wed, 27 Apr 2022 15:08:27 +0200
Message-Id: <20220427130830.150180-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sending this out now that NBD's incorrect uses have been fixed.

There is no equivalent of qemu_co_queue_enter_next that restarts all
coroutines but that is incorrect because qemu_co_queue_restart_all should
really be a coroutine_fn.  The NBD uses have been fixed by removing the
calls to qemu_co_queue_restart_all; graphic_hw_update_done works just
because it uses the BQL; but the new rwlock for the BlockDriverState
graph will need it.

The series introduces the new function, removes some duplicated code
around it, and marks qemu_co_queue_next and qemu_co_queue_restart_all
as coroutine_fn.

Paolo

Paolo Bonzini (3):
  coroutine-lock: qemu_co_queue_next is a coroutine-only
    qemu_co_enter_next
  coroutine-lock: introduce qemu_co_queue_enter_all
  coroutine-lock: qemu_co_queue_restart_all is a coroutine-only
    qemu_co_enter_all

 block/io.c                 |  2 +-
 include/qemu/coroutine.h   | 27 +++++++++++++++++-----
 ui/console.c               |  2 +-
 util/qemu-coroutine-lock.c | 47 +++++++++++++++-----------------------
 4 files changed, 42 insertions(+), 36 deletions(-)

-- 
2.35.1



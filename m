Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 459034D7EEA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:44:03 +0100 (CET)
Received: from localhost ([::1]:48470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThFB-0007jg-4w
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:44:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3k-0007qq-Fx; Mon, 14 Mar 2022 05:32:12 -0400
Received: from [2a00:1450:4864:20::435] (port=43654
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3i-000834-1p; Mon, 14 Mar 2022 05:32:11 -0400
Received: by mail-wr1-x435.google.com with SMTP id e24so22799468wrc.10;
 Mon, 14 Mar 2022 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JhDIQxDqCPprjiFX7fjeM02MtJUWpp9N84+HyMb6wac=;
 b=Y/s0zR1dMmEFDpz4kUDfGIcFaYjAnxdOENjV1ZKQqSLtg3nAORLh/0PBamC+Zlv1Nw
 iNz3jXtJPaXvFbqctqkWieZlii/jAvYEKeHe9vErHYA2Exi3583+kbHh0PQf8mavSRCl
 HgpDsJMSSYF2tkqBoWKggXwk7olY03pHuwVMash97/tYKA35iAp0wuEBV5ezLihnwphP
 s/B+hlaYWJ8NR96uFEdW/m8eDaGGP1Ka98CO6A/Cm2aFa90Z4sJBFIvHKCH6csPy5ZJC
 mD8Kp62k3zk7EotB+BmxfM31+j5RNxCpIve7tAERbRv9XLXnFeHmIc2DCIKu7MFrK6tw
 8Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JhDIQxDqCPprjiFX7fjeM02MtJUWpp9N84+HyMb6wac=;
 b=12vvCGfjpRyd7I06pH6Ohzp4pcjgJDiWac+JPZ8vXnFDg45X/hC8cwDTTEfyK63zcg
 Dj66HDyQd+8JnXLfjb5mrHbVLGaBS/XhBQ+3+4Qji5zFihmgCnMu3GMrNvjg/1jtunhC
 SS0NXoLP86a/CP6a8FXxwgDuMkix0BDgOro+f4xanxuMK3CTD7RFrxeg5Oq2h77GkNCj
 pXulrO1UFDoNx4bErrqkHm+VCFU6lGugaj9nca5gMx9wQ0x3mipNOFMi53DS/c1Qj8Ap
 5PXhkgLtMniGTxsReKOeMtR5J2jNtXr3NAfFVnuP1lFOwAls6stNjGViy7445k6Lpx7e
 yWmA==
X-Gm-Message-State: AOAM532A4Hec7Gj3cEPJ1V85EBHrb0BgyS+nf/tRdW8OD66rYnTG9fsK
 aTZPggvVdV4un83UOPYV0Jb6MIx/5R0=
X-Google-Smtp-Source: ABdhPJzNAOdkpRZj5cwb/dKz7LS/QE4wZ8t5+3cSMBQBObSKFA+6eqY1/T5qcnmGzNoU66mKvP3sHA==
X-Received: by 2002:adf:e8ca:0:b0:1f1:d8be:e20c with SMTP id
 k10-20020adfe8ca000000b001f1d8bee20cmr16366190wrn.373.1647250327618; 
 Mon, 14 Mar 2022 02:32:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 03/16] coroutine: small code cleanup in
 qemu_co_rwlock_wrlock
Date: Mon, 14 Mar 2022 10:31:50 +0100
Message-Id: <20220314093203.1420404-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_co_rwlock_wrlock stores the current coroutine in a loc variable,
use it instead of calling qemu_coroutine_self() again.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index 2669403839..490fb32891 100644
--- a/util/qemu-coroutine-lock.c
+++ b/util/qemu-coroutine-lock.c
@@ -436,7 +436,7 @@ void qemu_co_rwlock_wrlock(CoRwlock *lock)
         lock->owners = -1;
         qemu_co_mutex_unlock(&lock->mutex);
     } else {
-        CoRwTicket my_ticket = { false, qemu_coroutine_self() };
+        CoRwTicket my_ticket = { false, self };
 
         QSIMPLEQ_INSERT_TAIL(&lock->tickets, &my_ticket, next);
         qemu_co_mutex_unlock(&lock->mutex);
-- 
2.35.1




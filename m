Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00E4D482D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:37:32 +0100 (CET)
Received: from localhost ([::1]:34148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSIyx-0003ts-E3
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:37:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9b-0006d0-Eg; Thu, 10 Mar 2022 07:44:29 -0500
Received: from [2a00:1450:4864:20::436] (port=41655
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9Y-0005Ai-Qo; Thu, 10 Mar 2022 07:44:27 -0500
Received: by mail-wr1-x436.google.com with SMTP id i8so7759854wrr.8;
 Thu, 10 Mar 2022 04:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkDt/izp2j6Oiv3m+c6ng2LauFU8ekC/1Rot470iJKQ=;
 b=OHCPh2KJ/BKh7qFLFSL6XRCBnr3e15GvckVElqE2c5LmhDxei5QA0qQA0Yfe7MVd0X
 KDMMpswdEbtgrKzRUJH3NGPWy76ZFZPRUmWW58x1d96fmRWCr71CQ2eFzotdMcxIxzwq
 w2pJaTQRMI7w/1xt99U8ePqxklq0rnMPGDpL9Gy28Vr2siYpnemHpK1bwFGR10+36gGT
 G8vhMskG39PKRNXv5G0TEgAJ2Aa2FIpPYhm+Tp9DWFrcIhy7baxmQh0EUbJJmmGm4iKP
 QDNYYKXN6wqhCo3Be+90Hhm9vbNJKiLymxyzkK0+F3YOCXiPT+/OsvZafrL81wPJ29yc
 XWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RkDt/izp2j6Oiv3m+c6ng2LauFU8ekC/1Rot470iJKQ=;
 b=fKFBQpVzQh2MzWGwpThv69gXKe19W19dcpXDdL44km1UGi4e3jdBMPNs+KBvVCHWxC
 nSlZUbfpOnQJsZXxA8g2tZuWf4C0juEtFaA/tJWbAX8vesW/AUIehvNdEZnSKxyo5Gxs
 HNvKGy+4ftcCEoxYNZZEyXX085H75cKCzNKusG19QmNtXyYcu73BgH4YTtH0mW9PAP/r
 OsGptce/gEakmktwacMJ6A9zpH2JPk2JfYub89mLQzbhkU5mdQTzp61Fhem3hM5cGaHo
 FC4v2MgxNsTORLe/jA/5ZS/Ig0rZIqS1sMgue7IOaSinauVs0/anmXNR8yKzFAKR1Nem
 ozew==
X-Gm-Message-State: AOAM532qEzuoBuSjx8aKg/EVQ5LBIAueFmMpXw2s8q75p/0fbXXwhIFQ
 FDuwf/qlIEDh2iQ8DjZkdvq+UpUiPvk=
X-Google-Smtp-Source: ABdhPJyhwtsmeYgkRK4AJpsliQ917Q3y2ebTaLXPWR/Ed2lE5jCnrhCmuzPyak2LVO7MnlrrCNXNWQ==
X-Received: by 2002:a5d:6c61:0:b0:203:70ec:e77c with SMTP id
 r1-20020a5d6c61000000b0020370ece77cmr3403180wrz.692.1646916263176; 
 Thu, 10 Mar 2022 04:44:23 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:22 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/35] coroutine: small code cleanup in qemu_co_rwlock_wrlock
Date: Thu, 10 Mar 2022 13:43:43 +0100
Message-Id: <20220310124413.1102441-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_co_rwlock_wrlock stores the current coroutine in a local variable,
use it instead of calling qemu_coroutine_self() again.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-coroutine-lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/qemu-coroutine-lock.c b/util/qemu-coroutine-lock.c
index c29cb69f5e..3f12b53a31 100644
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




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67F3B11AE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 04:28:11 +0200 (CEST)
Received: from localhost ([::1]:41902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvscc-00011E-Aw
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 22:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvsbN-0000GX-KS
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 22:26:53 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1lvsbL-00034p-SY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 22:26:53 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 w23-20020a9d5a970000b02903d0ef989477so454149oth.9
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 19:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kAujTiSkR3/APoMSLA8fwhGXs5Hn1dp6hoGe9FX334Q=;
 b=eha6TFgkFNxwF6v8ioCxgDVvUdkGWlkH32XYZ0xYFXWfnQKtZ+W7ZvkQ/TSBG7qfcN
 MjcxmE5Jzt0+JZwG/+2pj8F8rxQtF5f+gUttSpFQ9RB5wpkBy00bmXlzDYYtRrq2FXrq
 AI06ArZ39OAN820m1jT5O28Ku665K7pJ9/HsvWMYR81M3TmVZvRBuyTDAXCkMohrdydx
 uEXd39dCwHWntUuY5KpcBvCitr+ppAG0kFwZe+C2GyjUuPT3sl5ya7QYW7tZH1popodU
 nXXDS0ci4/Lk/iXngcEHbfpLxfQB3zJVXvlvBJX48u/fjAC6rl92hAjnXFHfqmDBAfDa
 8EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kAujTiSkR3/APoMSLA8fwhGXs5Hn1dp6hoGe9FX334Q=;
 b=Bih2ZdQWqIVqTgAzhFMd9Y5lDOURUMmzbSF0smUtz4silI1zRS4I0GtXQWIgL3oQkx
 tXiOPABBoX0mVQyTceLwm9kAlZtd4GPFqQZJwTdH0aEz1STVy3TjKIUhtyNdlPmEUAf0
 1rnzgeFBrYgP4WZjpN0jldx+evYDocCf8tmF/RLE4f2Ar6A4UYgeWsIzY2P5U+OdNied
 MtQI+nxNtnUs8PYAEDZU77+yMXlECWEuaOMCVelvmb12QNQHb6vma4RRbDFAa7Zft+cL
 6wcjo40+YqfJv+TR/1e/ZHKqpo9PvdwJEWKb7TCN/2BP6jJJEhTwP59IsItr7wG+lmSP
 ecbw==
X-Gm-Message-State: AOAM531irNClaSqhL4tfQqNfHWtKCsODyXp06JswIDqoM9sIimlaJxVP
 bQv+6/4EaMCIhDQgT1/fUgf9498LuVEpWdrkfmE=
X-Google-Smtp-Source: ABdhPJziOJPilzDe7t+uKTDftR2bfLSPcB7Jb75NIGI9wJrATtSvzqrAnVdRJzCP0PA7vdVVpX6KL1zhVemyZZgaubI=
X-Received: by 2002:a05:6830:1daa:: with SMTP id
 z10mr5935486oti.5.1624415210573; 
 Tue, 22 Jun 2021 19:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <162441284292.15618.4627728437912000813-0@git.sr.ht>
In-Reply-To: <162441284292.15618.4627728437912000813-0@git.sr.ht>
From: Qiang Liu <cyruscyliu@gmail.com>
Date: Wed, 23 Jun 2021 10:26:39 +0800
Message-ID: <CAAKa2jm_4noz=rVc-vW6-4q-HsJtLoZXUZJfoHprjpLmYgb1EA@mail.gmail.com>
Subject: [PATCH qemu] hw/net/vmxnet3: Remove g_assert_not_reached() when
 VMXNET3_REG_ICR is written
To: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: cyruscyliu <cyruscyliu@gmail.com>

A malicious guest user can write VMXNET3_REG_ICR to crash QEMU. This
patch remove the g_aasert_not_reached() there and make the access pass.

Fixes: 786fd2b0f87 ("VMXNET3 device implementation")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/309
Buglink: https://bugs.launchpad.net/qemu/+bug/1913923

Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/net/vmxnet3.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eff299f629..a388918479 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1786,13 +1786,6 @@ vmxnet3_io_bar1_write(void *opaque,
         vmxnet3_set_variable_mac(s, val, s->temp_mac);
         break;

-    /* Interrupt Cause Register */
-    case VMXNET3_REG_ICR:
-        VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] = %" PRIx64 ", size %d",
-                  val, size);
-        g_assert_not_reached();
-        break;
-
     /* Event Cause Register */
     case VMXNET3_REG_ECR:
         VMW_CBPRN("Write BAR1 [VMXNET3_REG_ECR] = %" PRIx64 ", size %d",
--
2.30.2


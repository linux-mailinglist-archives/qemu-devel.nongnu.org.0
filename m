Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E822440378B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:08:24 +0200 (CEST)
Received: from localhost ([::1]:54636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNuVD-0003Rs-Tz
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRd-0006IR-1V
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNuRa-0002nf-Ps
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:04:40 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso661678wme.4
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/7nrEReoQoR7zRCQbazGzZCmxeeaU0xNt1erxfpNR44=;
 b=Jl2WDNkDxjNlYSn0T7v7Xi/YacypRI7oLRjL4LtdUKG6KlP0PVKYVRYbUg4f9ghwPi
 erB0LQPNP0q1W/IcLPjXs+BSe5PHPFcmBKeGiWWCwYpvxrn4AYifUmbfXlehddbATfkc
 H02+ywr6jBzi8NbM1th84OlITbB7HUT5/WEOOxN1XqdZ6AObh0LvZ+heznFMmjeIJxe5
 Nor5jyVJYCGpQvWII3vGswRCFy5CQ4+nEk82nnA9Iq0zZLg7ehCc+8in/HJke8fM7S77
 C57/m74Zsz3GasPkmborBkmw25A9PgAl5fWIgSUO6cweIPvU7ORqo1/N0Bu4HqrnlaZ0
 cPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/7nrEReoQoR7zRCQbazGzZCmxeeaU0xNt1erxfpNR44=;
 b=k3Dce2cKNTUIDV1KitRcjHuisbaHW6ko4TI3MX7fczxfjFT9pZy2oKWtuOsS6vZDDq
 rgsmeuMxqlVmMrK4rKEsJyRwi+MJK85LJAEdMdUlw9pL09f3GBoo93NQgACqT9XYF2Mk
 KthzY4s0U7DJMz2rWqtXYxb2Ial1TWPjci6QSaOpjtDvtmaTJZVtV4gIFWEEZX9hJN+3
 5WM72CUkO83fNBJ0XXPK6TUdpQKOBNoUDEfTdYT+QYA2m3k+H4hAO+ZfEtH3f9IlWnQe
 hpENO21reg/qGbCoAkiDvuTXz3j32JiwPu/9FDedOp+qHvfZsutjsIhwupyinDSe2Rda
 l2hw==
X-Gm-Message-State: AOAM530Nuo1VPlJXmlt183K34/wXk4H51gVCEjcuxEYNvuGMld2YREhC
 x7MsdYOJExmkYxOCegzpuampzlldEYk=
X-Google-Smtp-Source: ABdhPJxKgj34GnuDvlSOj9PIseR0L+8FDE2Ky2N1sNDHStJfdNyJBmIHA7IeZyVm1QVtD6sPe4iz7g==
X-Received: by 2002:a1c:238a:: with SMTP id j132mr2666200wmj.185.1631095476774; 
 Wed, 08 Sep 2021 03:04:36 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u8sm1683715wmq.45.2021.09.08.03.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:04:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 01/43] target/i386: add missing bits to CR4_RESERVED_MASK
Date: Wed,  8 Sep 2021 12:03:44 +0200
Message-Id: <20210908100426.264356-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908100426.264356-1-pbonzini@redhat.com>
References: <20210908100426.264356-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Booting Fedora kernels with -cpu max hangs very early in boot. Disabling
the la57 CPUID bit fixes the problem. git bisect traced the regression to

  commit 213ff024a2f92020290296cb9dc29c2af3d4a221 (HEAD, refs/bisect/bad)
  Author: Lara Lazier <laramglazier@gmail.com>
  Date:   Wed Jul 21 17:26:50 2021 +0200

    target/i386: Added consistency checks for CR4

    All MBZ bits in CR4 must be zero. (APM2 15.5)
    Added reserved bitmask and added checks in both
    helper_vmrun and helper_write_crN.

    Signed-off-by: Lara Lazier <laramglazier@gmail.com>
    Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

In this commit CR4_RESERVED_MASK is missing CR4_LA57_MASK and
two others. Adding this lets Fedora kernels boot once again.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
Message-Id: <20210831175033.175584-1-berrange@redhat.com>
[Removed VMXE/SMXE, matching the commit message. - Paolo]
Fixes: 213ff024a2 ("target/i386: Added consistency checks for CR4", 2021-07-22)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f..21b33fbe2e 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -257,6 +257,7 @@ typedef enum X86Seg {
                 | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
                 | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
                 | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_LA57_MASK \
                 | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
                 | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
 
-- 
2.31.1




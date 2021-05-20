Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2373338A02A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:50:36 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeO3-0008Vk-19
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxj-0005RJ-8Z
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:55938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxb-0001Xp-6t
 for qemu-devel@nongnu.org; Thu, 20 May 2021 04:23:21 -0400
Received: by mail-wm1-x32e.google.com with SMTP id b7so8019699wmh.5
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 01:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XwYPwSfA8Cvd3/TBJlc2cW5Z9lV4MqaeOY7vnJJhpgo=;
 b=G6zvob/m6LJmHrC0nskxHWy8x8uh0GpRkil5O2u3WmQUk43mXbzEA8hS22V3v3U0MP
 jb+wnf5HFLPPPe511VXEhtlKzdi2VkSKEyPwF7/QEuGGRP0xITYENWkdp2vyIfNiN0ZT
 MEHFUirUUS7QTDGK/Y3pbdJfNtML8PrInYBhsnQCFdVbdesqXuPaLrk2yKAKyziP7iMz
 mMI8DYRntADQ62Jbt4p9ZgVXY/OZyfP2zyyG4VeCnTF8YL7yKyRQB1RsSfFJdPnoa2Xn
 PWk7ryy8ALRdEigkxR55fSq6WJKEWbX6zzLq+zyGlnBq3+qh+WAh1Yy78mXAEXr3yacG
 Ny/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XwYPwSfA8Cvd3/TBJlc2cW5Z9lV4MqaeOY7vnJJhpgo=;
 b=cqT2rXw/sJbE0djmNhbjUmW+9v2c//eK0qvncmZcRJme3ZljdF0rC0IAMsxC5fPdgR
 +aurWSILgdK7zQg3yVVxaZlZoXMnzy43ZmRAVteLgCtLqQV1bLBQtkW4otSZL9GV+fNj
 7BHvxp4Wqma3kYUljteAvMt56ludT5Y5ynTmuIST47Yepg+46VYbzjI65B0DG+xrheYg
 BqzURmK+TPN1zOxfNBTNhjzm81kqlIpvvlA/aZGp8FEQ8susaYWyOyv8F5FvjZiIRTbh
 EaXZZ2F1nuBQbtTvbAHx/C8mp2iFyL+SYz2SV8vo6xGl9yUUUYS7zeo+Joo/k61lRh41
 AzFQ==
X-Gm-Message-State: AOAM532KAPD4qgp/Jgq8ScDsOip2g6hNHGG5fuKlEctWp6EymM613y3Z
 9b4aeSnIN7VwPBvAJioS02x+aYVywLQKvQ==
X-Google-Smtp-Source: ABdhPJxo/dPsmkboBoZOT21QNkAwFqODd89/bbzLzoWBIWahsTWMi+MvsH3/Q7N3S/MfTrgqd2t+KQ==
X-Received: by 2002:a7b:c258:: with SMTP id b24mr2404165wmj.52.1621498989102; 
 Thu, 20 May 2021 01:23:09 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/26] KVM: Cache kvm slot dirty bitmap size
Date: Thu, 20 May 2021 10:22:47 +0200
Message-Id: <20210520082257.187061-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Cache it too because we'll reference it more frequently in the future.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210506160549.130416-8-peterx@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c      | 1 +
 include/sysemu/kvm_int.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0ba6d48120..df9fbf59a6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -610,6 +610,7 @@ static void kvm_slot_init_dirty_bitmap(KVMSlot *mem)
     hwaddr bitmap_size = ALIGN(mem->memory_size / qemu_real_host_page_size,
                                         /*HOST_LONG_BITS*/ 64) / 8;
     mem->dirty_bmap = g_malloc0(bitmap_size);
+    mem->dirty_bmap_size = bitmap_size;
 }
 
 /*
diff --git a/include/sysemu/kvm_int.h b/include/sysemu/kvm_int.h
index ab09a150e1..c788452cd9 100644
--- a/include/sysemu/kvm_int.h
+++ b/include/sysemu/kvm_int.h
@@ -23,6 +23,7 @@ typedef struct KVMSlot
     int old_flags;
     /* Dirty bitmap cache for the slot */
     unsigned long *dirty_bmap;
+    unsigned long dirty_bmap_size;
     /* Cache of the address space ID */
     int as_id;
     /* Cache of the offset in ram address space */
-- 
2.31.1




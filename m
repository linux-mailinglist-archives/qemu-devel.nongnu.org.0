Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF9C32F992
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:05:29 +0100 (CET)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUkS-0004XR-Cl
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:05:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZt-0005vl-7R
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:33 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:36563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZr-00089R-QN
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:32 -0500
Received: by mail-wr1-x42d.google.com with SMTP id u14so5231190wri.3
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5QsmkLXasBVRCflFMmu4M4Y+2snZ0CFWy08GKmf9z8k=;
 b=GLb+XNC2HZNyzYgYxUEu9A5SQQKdUAHL3yMA5/DhMfJgE3FthfPT0D5EEfd0Ax+gmC
 sJZ3qIXteVspCa1kaiUQNZuhLF+0quxrtojw7dYqCvgHqtGWh5Dc3vwvYxCxHIMjNKsA
 a6lLrsuN7FboMWl8UT4swxStbSh2YnFcVd1OQoAs9fpwP1IeJzRTLXY+BuibhlUrs0oT
 53Qe/0kh5PKF9ntLjoUdu1UPgowOWWia5D+g6kzNmYtatTGxs7QtRbjyNn803Gm8M+3C
 fqdXPGd5b7MXhLQX8Fg7XLi7gluwhYSbQ4/JHK3C5Q4b/CM8bg5p/W+dYm24E5QLTpj1
 CBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5QsmkLXasBVRCflFMmu4M4Y+2snZ0CFWy08GKmf9z8k=;
 b=Ge/JFm/ChgjHzjpvxQWKXclBghUeIy0zYguZTOhbBW7X+CrQ53NKk3AJCNTMkRDiJ/
 UyLHdraKaHSsZM1UGK0eN7sZUWdH6OLaWyWAQETANK3sbnFbJZXN6rFeaoy7xdgzCtfg
 bGtqOZDmKqK5sZlLWj1IuEa1iz/PSm1JRSRWytgckTZ3/v21YJL/8MHMTtvYQ5XXhDa7
 BohFGUb+tnvNhUbvr+EthcFJRkkdLighZYTaGqdtGze8u1Say9KLynS7J061NcDGSMyA
 +yTlqMTn1y0wvG0AV1wf6nDiSBe+eNg8lSxRVIsgCCsrc4Ix5FLiqDXhIykiGZFh4k8o
 ywyQ==
X-Gm-Message-State: AOAM530TjpQy7eWxCKdpzAO015G7OxiXsaCW0wvCJb49k+JhfKlJsJ8R
 YLMWiA10yPI05Fzq9j3KMM56kz1EMcA=
X-Google-Smtp-Source: ABdhPJwO6u75JuwcAxio9hTgcToQLAymRCcN/C6mjUTOrQJuzNfOq3ffuQd4wGwytxAr5SbSbymdXA==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr14061935wrm.413.1615028070623; 
 Sat, 06 Mar 2021 02:54:30 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:30 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/23] x86/pvh: extract only 4 bytes of start address for 32
 bit kernels
Date: Sat,  6 Mar 2021 11:54:07 +0100
Message-Id: <20210306105419.110503-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: David Edmondson <david.edmondson@oracle.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

When loading the PVH start address from a 32 bit ELF note, extract
only the appropriate number of bytes.

Fixes: ab969087da65 ("pvh: Boot uncompressed kernel using direct boot ABI")
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20210302090315.3031492-3-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/x86.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 6329f90ef9..7865660e2c 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -690,6 +690,8 @@ static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
         elf_note_data_addr =
             ((void *)nhdr64) + nhdr_size64 +
             QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
+
+        pvh_start_addr = *elf_note_data_addr;
     } else {
         struct elf32_note *nhdr32 = (struct elf32_note *)arg1;
         uint32_t nhdr_size32 = sizeof(struct elf32_note);
@@ -699,9 +701,9 @@ static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
         elf_note_data_addr =
             ((void *)nhdr32) + nhdr_size32 +
             QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
-    }
 
-    pvh_start_addr = *elf_note_data_addr;
+        pvh_start_addr = *(uint32_t *)elf_note_data_addr;
+    }
 
     return pvh_start_addr;
 }
-- 
2.29.2




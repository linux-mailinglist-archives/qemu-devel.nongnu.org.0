Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF43AB0A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:58:37 +0200 (CEST)
Received: from localhost ([::1]:34266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltonE-00014J-EX
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNK-0002l6-58
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:50 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNI-00069Z-Lq
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:49 -0400
Received: by mail-ej1-x635.google.com with SMTP id og14so8737600ejc.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3h69v9GOdvNM0T/T0af/wQPPZJrIt2ocjfiNDFl060=;
 b=vFU9nKaebZGli3ris1n12ltnavzH/Rsq74xQmb9eHfiNc5wWv/eWU3Pt0Dj69XkRA3
 PkNALsuT9bs8yISAMxOPcXunY2A3lW5ZHhVWl8NMKyofyTSoxqzinZwyP6PM1itoIdGe
 lwugy+2zS8lA015T6R6h7MUCGQZjJCD7ipz2VwYbB9o1Y71x55PAu0+RUaAeYTXhG5sb
 /P8kxAKNGpHtD3++76Efp/ljgIHjmIGZSQFRtINGgpUqo+1QIZ/0Q6jPSGZ38TS0+opI
 cyOicTHCYcFY7sA3SsYSexjRjU3XPi0ORgEN6eJCRrXAwHNF14lmbxkcIBZuKmYgV/eE
 ZjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o3h69v9GOdvNM0T/T0af/wQPPZJrIt2ocjfiNDFl060=;
 b=aKVcN9//p4Y139ondSYx/bthDqEZUmVp+vUwVMc6Kr1NPxpUibUAmrJfsPSbDXFNQC
 ZZ9N54EVWyK8t7CdqYBsWvVwLegQ40VUv8YW7p+g7qgJ4IRrtw4bg1zKg4MlKMZ7hVZB
 PsgWnf+0oAqAjrK953+FmCp9KmNaPzyos51FJu9FQSi5YjRpnOoGKeea0y2O85CqdBB9
 JDgq6BJ0zijNZeEC0apwGyR270vCbU/ftjhR+WwKniNGD97mHBHw8AYuNf5joXuIRGt/
 sSKmteUBSCYAFoh/8f2JCM4XiCb5jULvMSbzj0Du+LPE32NalZtiCoe65Z4rBkbp4jBs
 2+hA==
X-Gm-Message-State: AOAM533by8nFrBUhwIgmoTxnyHvXHhrOIkcGE4MI1bkO4zGA6yXOfDOv
 7X3E5wo5f+1+tC6Vt52S6Tp7gRGG5sU=
X-Google-Smtp-Source: ABdhPJzpRnb2OTaS1bNGFlbicDL2J1qM4KcbHsQxbaBky6V7LbqUj86pk5RqdtqJ8NAxUh/eZmrI2w==
X-Received: by 2002:a17:907:9fd:: with SMTP id
 ce29mr4145823ejc.62.1623922307340; 
 Thu, 17 Jun 2021 02:31:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/45] softmmu/physmem: Fix qemu_ram_remap() to handle shared
 anonymous memory
Date: Thu, 17 Jun 2021 11:31:06 +0200
Message-Id: <20210617093134.900014-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

RAM_SHARED now also properly indicates shared anonymous memory. Let's check
that flag for anonymous memory as well, to restore the proper mapping.

Fixes: 06329ccecfa0 ("mem: add share parameter to memory-backend-ram")
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210406080126.24010-4-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/physmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index c0a3c47167..b75d205e8a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2243,13 +2243,13 @@ void qemu_ram_remap(ram_addr_t addr, ram_addr_t length)
                 abort();
             } else {
                 flags = MAP_FIXED;
+                flags |= block->flags & RAM_SHARED ?
+                         MAP_SHARED : MAP_PRIVATE;
                 if (block->fd >= 0) {
-                    flags |= (block->flags & RAM_SHARED ?
-                              MAP_SHARED : MAP_PRIVATE);
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, block->fd, offset);
                 } else {
-                    flags |= MAP_PRIVATE | MAP_ANONYMOUS;
+                    flags |= MAP_ANONYMOUS;
                     area = mmap(vaddr, length, PROT_READ | PROT_WRITE,
                                 flags, -1, 0);
                 }
-- 
2.31.1




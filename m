Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7142BBD8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:43:26 +0200 (CEST)
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maanF-0005V4-L6
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEu-0002Wo-O7
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:57 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEp-0005tb-MQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:56 -0400
Received: by mail-ed1-x52f.google.com with SMTP id r18so7151514edv.12
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnuICvUChwckoi0bOEdRybFsN3xmu9Vkq/jJXFkB2Uk=;
 b=JmIk7WFdtZ6d8HqJxpXJwoBWXExoFes2w8Fqz6/qkC9StS+CZwjEHnauVl24ozn7MC
 mUGqrbr7ghpvix0zR4sRAN41ZsqSVwAb5Y/yan71t52oEkI9YhT9BoI/EtdLuYumueKQ
 +X4oXda4477FmtcQvAMADpL2bQl8nd1pg4piPUPAM61bk3Ofjr+aFMIbKEj5nx6GujKF
 FEiHvRp4T/RjmhkBojGREQl+pSGmid/sYc2hrWaC5n5WOyEuZpJEoXJJg9Ip19dvhYG7
 kA8m/wlcYWk5uZU2XW17CMxw1DE0AT6f/jZEZNLAg/G+wdBKNd8UEeAtpL0QGrly8L2+
 Vzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jnuICvUChwckoi0bOEdRybFsN3xmu9Vkq/jJXFkB2Uk=;
 b=x5CJT+ifUl+PCk1vIKgs4PJL2m4CjfV8i9HXwb+jXhvRqSWDw8zT9Toe7UFBTTdcDG
 V+NUENBQzSswyF8plojjMxzrBcojI6mtFiPuW7X/ebvuEtJy0XFNIJX9JfR1yN1zJReH
 W7M7td6YZ2Mgj+y+TK+t0WRLIQLkHDi+hARClmf9MfKoARcD/PA4A8vmBSyXkICi254w
 q1fquBbXUAuSUpkIf3cPbYnsqKKu1IXKgQWWH28hlalff/c6txl+2YcJId+0nkKqCZz8
 LrUlcDxFnBAZiTaTxgK+S7nOWOkP8OQMu8V/QGAHDZNLehdap+9j5SEQE9kQJdvmSoyq
 rl9g==
X-Gm-Message-State: AOAM5330s136QX+ls+Yrg7rYhJ0wnI5sbcXO/yNNn9lo3PZcRw365/tG
 X0xqy6dN7ATcQa2Wb8OdeulOMG2Cuko=
X-Google-Smtp-Source: ABdhPJxtLW0eh9e0IhcbF48eAvKUx3eS4KHrAGPnx8LFSKQzniUlj/6VQyP3gM/h7snRFHJKUcq+wQ==
X-Received: by 2002:a17:907:7790:: with SMTP id
 ky16mr40592988ejc.490.1634116070421; 
 Wed, 13 Oct 2021 02:07:50 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:50 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/40] tests: tcg: Fix PVH test with binutils 2.36+
Date: Wed, 13 Oct 2021 11:07:18 +0200
Message-Id: <20211013090728.309365-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cole Robinson <crobinso@redhat.com>

binutils started adding a .note.gnu.property ELF section which
makes the PVH test fail:

  TEST    hello on x86_64
qemu-system-x86_64: Error loading uncompressed kernel without PVH ELF Note

Discard .note.gnu* while keeping the PVH .note bits intact.

This also strips the build-id note, so drop the related comment.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Message-Id: <5ab2a54c262c61f64c22dbb49ade3e2db8a740bb.1633708346.git.crobinso@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/tcg/x86_64/system/kernel.ld | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/x86_64/system/kernel.ld b/tests/tcg/x86_64/system/kernel.ld
index 49c12b04ae..ca5d6bd850 100644
--- a/tests/tcg/x86_64/system/kernel.ld
+++ b/tests/tcg/x86_64/system/kernel.ld
@@ -16,7 +16,10 @@ SECTIONS {
 		*(.rodata)
 	} :text
 
-        /* Keep build ID and PVH notes in same section */
+        /DISCARD/ : {
+                *(.note.gnu*)
+        }
+
         .notes :  {
                *(.note.*)
         } :note
-- 
2.31.1




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0033F7DA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 19:09:58 +0100 (CET)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMacH-0006u0-MV
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 14:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT3-0000lC-Cm; Wed, 17 Mar 2021 14:00:25 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMaT1-0004wY-Mz; Wed, 17 Mar 2021 14:00:25 -0400
Received: by mail-ed1-x536.google.com with SMTP id o19so3407900edc.3;
 Wed, 17 Mar 2021 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uioFA7kSJG6dSbTCJnInaEvZmY5RBbbDHDyMmMYCNBw=;
 b=hocPyPL1xkkXkBS8N4dCOHss+UlN13f7SqudaGne3iLWJvtP/MaN5C6y/rIQcIaOop
 4ZAAtUisxsFAEM7BKQHJQo2sYDryWz4G3bM4upejpq4fF4toWtFy/RjBmInw4x1jzLTN
 8iOXB2z/Qk+AJQf4HjolVtDTqY2q9z5fylIdM8hkEG7hnFgXtQPqV4A8oHKO61pVZacl
 rUU5L1FihTknbRq8POH6mu1Mtum2/KF2teoTcvAO4dyGhVSDJfufE/gPpJDYPKtcRFsh
 kzCIe5H3KDV20b0vM63TvYCWXuZKUF5/Bf0fBURYvJVIsyE5EwZLh8KD+MBZoOATwlYe
 gATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uioFA7kSJG6dSbTCJnInaEvZmY5RBbbDHDyMmMYCNBw=;
 b=U4ExzF9sBYxxrv8GS9PB75OUr+fLV7iKPlmXeysIwIEMUegK2UzKu/tB1JZ2DS0nys
 dSbfuJluK1xws7GCs4bQhL58KsmyIGOV3u30ZQ70aH8jNS9td84zj4GYW8YgERN3FOKl
 rtJox7V/L5yXKOgfauX1XNs50TPpM86bXwwfpf4gRJJTx1BkI+SGd6A0JMFpYll+5/gI
 ImvdJnDW0+Ix4WK61Siu8B/kpcNt4q2vMYaS1dABax9XZQ24jVsVn7X3zG25G1v7qBwH
 F1Ko/JS4uCUEDxznL7aOVSdxzW29vkwDMfedcvnKqBJ4gcRHHA3WoVwZWXyrcVMV4GeB
 NACw==
X-Gm-Message-State: AOAM531Ev28dUetuDCwtTsxw7suMu35an25mtt+2S68SC9Q45bvgkHbZ
 SWDw/atwAykA5MopRCMLCmtEvNg7U8E=
X-Google-Smtp-Source: ABdhPJxk9KhSVxE2bwFRuY54toyoFPcMdAojo2+p7B7nzXqnq2f8PiF7Typj0369QR4V9k69EYR9dA==
X-Received: by 2002:a05:6402:2215:: with SMTP id
 cq21mr44600686edb.281.1616004016223; 
 Wed, 17 Mar 2021 11:00:16 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id b22sm13159303edv.96.2021.03.17.11.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 11:00:15 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Wed, 17 Mar 2021 19:00:08 +0100
Message-Id: <20210317180013.235231-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317180013.235231-1-pbonzini@redhat.com>
References: <20210317180013.235231-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
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
Cc: david.edmondson@oracle.com, kwolf@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

If a new bitmap entry is allocated, requiring the entire block to be
written, avoiding leaking the buffer allocated for the block should
the write fail.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210309144015.557477-2-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/vdi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/vdi.c b/block/vdi.c
index 5627e7d764..2a6dc26124 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -690,6 +690,7 @@ nonallocating_write:
 
     logout("finished data write\n");
     if (ret < 0) {
+        g_free(block);
         return ret;
     }
 
-- 
2.29.2




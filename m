Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01033F01E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 13:20:12 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMV9n-0005H6-72
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 08:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6Y-0002Dm-JI; Wed, 17 Mar 2021 08:16:50 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:43670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lMV6X-0007i9-4f; Wed, 17 Mar 2021 08:16:50 -0400
Received: by mail-ed1-x52f.google.com with SMTP id e7so1949315edu.10;
 Wed, 17 Mar 2021 05:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uioFA7kSJG6dSbTCJnInaEvZmY5RBbbDHDyMmMYCNBw=;
 b=gzheDU8k9NmiDG5YgtzWM2S501Ue3ugVRA2DEITq4Jps0hJFsXaWujVQcbRQBpR4MC
 UJrg4hpBLKO6aowt67Qiy50aq2zl1saCZbjJ5TMRqtR5Yk4bY9OCw5WXg0isJeHsio0N
 RqvN2hsCjLKrmLjI3GwyCIjn/UzqQVE+scxo6jPa2Xt9V/rAo2l6vTf6a5nIBJzJZgwH
 uZxjRv6xDSQli83CFbKjqw2Vcuq4mLqrhhYiEb7Oh9dC3iMrP+U/Vz3qMHg2lxfUHkyy
 aKRC9AlDlN++rFG3XDRjG85mTT1mNUVRL2/ljfQL2WEhhu++U909gETKeJJzD7QoWwj3
 5WzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uioFA7kSJG6dSbTCJnInaEvZmY5RBbbDHDyMmMYCNBw=;
 b=sCX4Os3WOmhp7mjUi6E46q/L0DwbB9YjrNgM85lveoVTUXjiyZYEnMstm5lJHhz5Yn
 YFswvi9U8il9sRRrANkwV6UIlaOQTz1ZdWb7CjM3aq51cXvRBRGMg9ag6Q0WM9mo9Ag8
 TrXOm9iQqQ5+fUrEXQ8U+MtG3GJsveT2e4tubEREJpyG00O5RyS0knfxvU+BKROBNqCm
 H4LOOluqi6JdlEEuPlqQArwzHMYf+qJMWdU0FULD87naLzMesP00GjQNbsMD2b0RbQnW
 NPucivHhrj7YIe/KkOuR0n9fwyoGfs//fZ158D7DZ7I3UBsc1wqkbc2g20e5c4Wnf2dY
 uirQ==
X-Gm-Message-State: AOAM532kTMXvfLmGJuXxXE/9/Qns74uvAHbpScyFQjfCxWpSf5M/Ddde
 epJU/zUzx3R9GLxf3ziztgcYEZF9zPw=
X-Google-Smtp-Source: ABdhPJxxEt/D3g0duWrjXpKGsTxGMkk2so1ZxnebEoXMuMryrpsx6gnz8d43YlebTztPuIfjc1FBmw==
X-Received: by 2002:aa7:df14:: with SMTP id c20mr41604268edy.197.1615983403683; 
 Wed, 17 Mar 2021 05:16:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id gq25sm11520996ejb.85.2021.03.17.05.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:16:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] block/vdi: When writing new bmap entry fails,
 don't leak the buffer
Date: Wed, 17 Mar 2021 13:16:36 +0100
Message-Id: <20210317121641.215714-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317121641.215714-1-pbonzini@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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




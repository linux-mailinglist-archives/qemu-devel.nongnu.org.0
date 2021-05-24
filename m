Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449BD38F235
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:24:59 +0200 (CEST)
Received: from localhost ([::1]:43922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llEK2-0007Zh-Ae
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeT-00052A-TB; Mon, 24 May 2021 12:42:01 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1llDeJ-0004OR-6F; Mon, 24 May 2021 12:42:01 -0400
Received: by mail-ed1-x536.google.com with SMTP id h16so32705511edr.6;
 Mon, 24 May 2021 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NURTTjYEkN5qlT+hGLhGVfDulriBn9GBwNW8du6ptW0=;
 b=XnINKs9IcOc75ykCIk7kgwbCtIGrpyWeMO5tOlPR72u9Kec7WI5eeL21MKuq+VfdUb
 6OWAPryoUGptXb7mMBTJiV5tc5t0l9X6x9D0p5+2fcqYFtzqgqlwtOZoPX2ZCL/lcGB/
 H8n+eYWItJRqt4QNHcvnmJ6WpkNhumAk1wFh2QpT6u8lZpNJs0QMVnmDfTilUWR0PR9r
 mkI6uFn11ErjLFwGVvwxV5kOP/rKj33xh037pnJlEjqlsTPoAinEdtx1egTUTxc+MFTZ
 oAOBFioHCzuTpT/ouqhvDLZa+DzIuKUA1xL1+BI4yekt3fdSXxKrCTbsKTqtSrF3xNtm
 tAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NURTTjYEkN5qlT+hGLhGVfDulriBn9GBwNW8du6ptW0=;
 b=JbWFTFY1vMTwC7pqOpIY9hAvwWHMtJxD3RxssU5V9PvCNG3DEgX8C+CawAgR8Ib/Un
 0xwxlQ0WcQUo7arsxB2DYG13fZhQFFLW7owNo91s/eLomHMLYoTmL8Ix/ypcE14Mu0o7
 ce9ZZYtFfP3gtYBvYHfaQKsqHOkA8DbBln0Gfu03ZyQ/90DT6xVureA5yd2FG9J6FGH9
 8VmFJ6cj/TbZtsrXgRxicMZiZwKvZtbXc76+C4MMnsxacPYD3GBUpSMSHXCW7iRj4+3n
 OiVzFgfaYWRdh3jkW5bj18TTaXf071w8CWgPoKnnXdlhGxweLGCaDM3M7+HGFlnTwC0v
 HhVw==
X-Gm-Message-State: AOAM5314TWWvKyu/cAvm7vB/M370kRU7ycJVLicnAXpVqmdBvp64/cJ3
 bhaxxaXPeFpbVnUupbZhhHj4G0lX2MmdfA==
X-Google-Smtp-Source: ABdhPJyWMUndKzt9/+xQ0GekJcWXISBcaU9zi0qS2nVPMZGdBt3nG25FEt3SOVD0zAck24bQ8BqTwg==
X-Received: by 2002:a05:6402:1d8e:: with SMTP id
 dk14mr27059783edb.385.1621874508407; 
 Mon, 24 May 2021 09:41:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 g4sm9581922edm.83.2021.05.24.09.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:41:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/28] vl: allow not specifying size in -m when using -M
 memory-backend
Date: Mon, 24 May 2021 18:41:26 +0200
Message-Id: <20210524164131.383778-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164131.383778-1-pbonzini@redhat.com>
References: <20210524164131.383778-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Starting in QEMU 6.0's commit f5c9fcb82d ("vl: separate
qemu_create_machine", 2020-12-10), a function have_custom_ram_size()
replaced the return value of set_memory_options().

The purpose of the return value was to record the presence of
"-m size", and if it was not there, change the default RAM
size to the size of the memory backend passed with "-M
memory-backend".

With that commit, however, have_custom_ram_size() is now queried only
after set_memory_options has stored the fixed-up RAM size in QemuOpts for
"future use".  This was actually the only future use of the fixed-up RAM
size, so remove that code and fix the bug.

Cc: qemu-stable@nongnu.org
Fixes: f5c9fcb82d ("vl: separate qemu_create_machine", 2020-12-10)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index ac0ff6e160..21e55718a6 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2039,8 +2039,6 @@ static void set_memory_options(MachineClass *mc)
         exit(EXIT_FAILURE);
     }
 
-    /* store value for the future use */
-    qemu_opt_set_number(opts, "size", ram_size, &error_abort);
     maxram_size = ram_size;
 
     if (qemu_opt_get(opts, "maxmem")) {
-- 
2.31.1




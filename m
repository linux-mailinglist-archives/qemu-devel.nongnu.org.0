Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C29FE38A030
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 10:50:53 +0200 (CEST)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljeOJ-00007J-BH
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 04:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxm-0005RS-OK; Thu, 20 May 2021 04:23:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ljdxg-0001Zw-95; Thu, 20 May 2021 04:23:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id z130so8617902wmg.2;
 Thu, 20 May 2021 01:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NURTTjYEkN5qlT+hGLhGVfDulriBn9GBwNW8du6ptW0=;
 b=URwszSumYIrvfAs60g4B2RtmFdJ2cBYbIGRs3Oe54uk9a2SaAr4nzRhj2aex4CJw32
 gPlY190Htn42Apx+VA8/d6nP63OS4xsigXsSI7MHCgI2NkwIUfB31/kNtULO9SB/yUkZ
 54kCj0FMQtY5AY6In6jNJ2R1JQdohM7NHKpQbbBsMQmzX0WY8n8YhNljN7cn5jp3xsqa
 PxRynBZKchM6tod2gRiwmn1TB9dJwRadPbMOffOUdwuT1SkA3KJ27fjWTT3QA+15ONng
 l1EvNu6ed52PCnKyQ8T2krHMLYKtnt4FHZG3ywZkbNInF0y3DdAJ6x+J5VontOPZSogg
 bwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NURTTjYEkN5qlT+hGLhGVfDulriBn9GBwNW8du6ptW0=;
 b=H5SYiLI0LvBovGpzL2whWscUzBCs6pcpOhIznZXN/IakJETNZ+n44BjgCv1yBGcKUc
 eFm9Q8p9I/cXVFSlSnq6WU0caQou4WsDqFvOprtKzNxNpEoQgGtA6MI00LPOPgCkDqnn
 9Kg0wf0ux82AwdE2qWKLjHirCqItvLw0rdqjDfpZvIbVlLzatsfXKht8CZq5iAW91c1A
 st9MsxI1VY25xVcadMSsX8I66jiTthioHpSV5JDz1R/LFplx4W9gG1J7nRmNqnTbMBmg
 yUBB0tOtRMPBzKw0MTGF1oLdUSr2f12TMlM+mcGN/lmz40rcyQtodJq7VhevvJPZDxav
 EzYA==
X-Gm-Message-State: AOAM532s7oRUtZmh/gFGaGkgGDtDpsQ01lNKPEaSlqiMkPAOAzurPjLC
 tpKsTXhjF2mgKZ01vcLteraTsvQRSPBKWA==
X-Google-Smtp-Source: ABdhPJxh+pH/8DNw5pcxS5s9K+bdA8646jjq1HXX4ZGBrIEc+bxhTMi55tr1dgIGOU4m0PggYYsUfw==
X-Received: by 2002:a1c:b4c6:: with SMTP id d189mr2350993wmf.39.1621498994280; 
 Thu, 20 May 2021 01:23:14 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v10sm2603506wrq.0.2021.05.20.01.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:23:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/26] vl: allow not specifying size in -m when using -M
 memory-backend
Date: Thu, 20 May 2021 10:22:55 +0200
Message-Id: <20210520082257.187061-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520082257.187061-1-pbonzini@redhat.com>
References: <20210520082257.187061-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
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




Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68355408AAD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:05:06 +0200 (CEST)
Received: from localhost ([::1]:38486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPkht-0003Ms-En
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbH-0002z3-21
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:16 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbF-00067v-JG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:14 -0400
Received: by mail-wm1-x329.google.com with SMTP id s24so6441080wmh.4
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dx21SJFtGQHR502uhGJAgjLcaXSroCju6rio9v9gGTE=;
 b=fYcEjWYR7zD8gM6ve4p53GMeHUKICkOsH7FlqoZ0rwgXp/4n20sEGMf0BIEtFlZVwC
 z7Ri2c20YP+BY7VMaelrSOd12UewaeNvd6FNMxs1pWsANlHVC0/GDfMjaazt+X7gjmiS
 WUyBU0fJCF+5HOkl0NE+tJAruFx0eD4KWGoUs1ZtHvBJVywWxQ22ySPzU+c+9eKVn55D
 19StPHmSWxvapuE5b2IpyImX8J8l3llFsauJ+nzU6XhCqA1QzTJKW8YSp66Fd0wojUOL
 jLLclbkDprWDBMHPDhGp9WgR0syjtreMvO5b57BU/SUGMtqEnsQ2YSnnjIUwvpJyEhQI
 XRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dx21SJFtGQHR502uhGJAgjLcaXSroCju6rio9v9gGTE=;
 b=11EiN7akiq0hH/ZKf+5mIjEcx6036e+Oe+r+QXm8UINBHmVHYyDFBZi/v8mayQzoyz
 rsjdfIZ6Kvf131oA/WlwGNNK0iiMGHNasn4YDUfPZXj+WAAC1J0Q6nkbx4N+jpJDw6HI
 /Bmy6+yDiFgLZFYElhKchwpebmV1FtbMicyiK2yL4jLk/y5Cy8EOEEZGNw2JlmmWgqOc
 LkTxYFE2Olg9UpDfDXuwUCZCPZA7gSAYp+VRNWpSIIFEcSGLQBiaYOCh5lyYIyDhTCAE
 pN9OW+qas3QONT3sSN7jd2fIvdeH4/wPG1ywpyzEAN5CVg9JZ1xRoORN6Vmyt7dGydFr
 CE7Q==
X-Gm-Message-State: AOAM532rIeuccke+BaTMaaXIRQuK6r53u5CQDhN+Cwahh+BmiUuxoBbK
 O5pC4IOTKIMGMHkpaGOKyis/djOz8+s=
X-Google-Smtp-Source: ABdhPJzewCyV9DiHXkOVUZzlSn8RVZ6xTjANLQDs/XV98IUosAv4SuxluUHCa3uv/RkQamXyMCtD1Q==
X-Received: by 2002:a7b:c048:: with SMTP id u8mr10735309wmc.113.1631534292383; 
 Mon, 13 Sep 2021 04:58:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/21] Fix nvmm_ram_block_added() function arguments
Date: Mon, 13 Sep 2021 13:57:41 +0200
Message-Id: <20210913115742.533197-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x329.google.com
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
Cc: Reinoud Zandijk <Reinoud@NetBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Reinoud Zandijk <reinoud@NetBSD.org>

A parameter max_size was added to the RAMBlockNotifier
ram_block_added function. Use the max_size for pre allocation
of hva space.

Signed-off-by: Reinoud Zandijk <Reinoud@NetBSD.org>
Message-Id: <20210718134650.1191-3-reinoud@NetBSD.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/nvmm/nvmm-all.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 28dee4c5ee..a488b00e90 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -1132,13 +1132,14 @@ static MemoryListener nvmm_memory_listener = {
 };
 
 static void
-nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size)
+nvmm_ram_block_added(RAMBlockNotifier *n, void *host, size_t size,
+                     size_t max_size)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
     uintptr_t hva = (uintptr_t)host;
     int ret;
 
-    ret = nvmm_hva_map(mach, hva, size);
+    ret = nvmm_hva_map(mach, hva, max_size);
 
     if (ret == -1) {
         error_report("NVMM: Failed to map HVA, HostVA:%p "
-- 
2.31.1




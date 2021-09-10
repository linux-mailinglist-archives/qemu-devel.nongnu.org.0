Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE9D407044
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:08:52 +0200 (CEST)
Received: from localhost ([::1]:41874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOk1D-0002o2-H6
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOjzd-0000j5-Pr
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:07:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mOjzc-0004fC-5M
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631293631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqCkNbuM43KqzBbq91YsLm9a1aNQ2XjTVYVG98V6beo=;
 b=LUfZ86S9ojQi6nBd4mSikbDCM8uDI1wsHTi+xLVhvWjRl+c593nkbPgnQs5p+M3b8I7acP
 snc4Pa+jdGQzly0wQZR4Vf1sMsW3KpstG+lOnFDCoAcz6o7JUADHhrFoHnfTisY4WgOu5Z
 0Pau84zHM6BbJ0E0y8R366r5Ol/Z1bY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-rXG9je3ONXaXp55gpWdGAw-1; Fri, 10 Sep 2021 13:07:10 -0400
X-MC-Unique: rXG9je3ONXaXp55gpWdGAw-1
Received: by mail-wm1-f71.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so827325wmj.6
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZqCkNbuM43KqzBbq91YsLm9a1aNQ2XjTVYVG98V6beo=;
 b=VIpVKqcUay147/sVJAJ0iYybgDFDH/++YoWEnqIKbyURu9P+8JDczaI4Yw2Zzaqtwv
 0IJuhiT5DgEmPRjuWpEbw+E/VP86k4K4jGHu8kGYijlbGIVb+Kfi3p/SMmET98TLkaF/
 68vh1cMxDUFnhDbogV1mnBAu4Th9e2hiVsWV43K5XQXm8kPXu+KOCU7qnz6Y2m5cgaKM
 gybABiVhvWAvzN0+Uy2Yu9+XapLXQ4WIydKd29waxOgJqpTjKpc6d7B7880pwiy0gS4G
 cosm5ZcX9+cnHNFU+ZksaWKz33KHSiKV+HePB5duOLRNpL9QQeT+1bHmOL/rWcJZ4XEL
 3Q9Q==
X-Gm-Message-State: AOAM532AXDqFBynxGdJZ5za24idW5hQv4N0NfaICxKq4559QUg4VDlW0
 hvUAC3pEkf2F1bEPGMjpQrUx84i+FzGaZ6kX/Kfqbs8tkV0HMgpKkJeHm6CSMuaqug9LPe/Ahfq
 4Paygo+MmmR+QWke+raRB5UlpZoQtBMBJlvAMneEdkzo9Io1HWncMSY8d+lUiVj9L
X-Received: by 2002:a1c:f315:: with SMTP id q21mr9762007wmq.76.1631293627597; 
 Fri, 10 Sep 2021 10:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp5/JfK+/TzVHdCEfyaUtpwZx22vL4CKuHlqAkJL5PWlNiszGXnrUCo9+WuTknLmHLX2nZyw==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr9761974wmq.76.1631293627311; 
 Fri, 10 Sep 2021 10:07:07 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z1sm4789570wmi.34.2021.09.10.10.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:07:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] elf2dmp: Fail cleanly if PDB file specifies zero
 block_size
Date: Fri, 10 Sep 2021 19:06:56 +0200
Message-Id: <20210910170656.366592-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910170656.366592-1-philmd@redhat.com>
References: <20210910170656.366592-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that if the PDB file we're trying to read
has a header specifying a block_size of zero then we will
end up trying to divide by zero in pdb_ds_read_file().
Check for this and fail cleanly instead.

Fixes: Coverity CID 1458869
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Message-Id: <20210901143910.17112-3-peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Informal T-b tag on
https://lore.kernel.org/qemu-devel/20210909004313.1dadb24e@192.168.1.7/
Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
---
 contrib/elf2dmp/pdb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
index b3a65470680..adcfa7e154c 100644
--- a/contrib/elf2dmp/pdb.c
+++ b/contrib/elf2dmp/pdb.c
@@ -215,6 +215,10 @@ out_symbols:
 
 static int pdb_reader_ds_init(struct pdb_reader *r, PDB_DS_HEADER *hdr)
 {
+    if (hdr->block_size == 0) {
+        return 1;
+    }
+
     memset(r->file_used, 0, sizeof(r->file_used));
     r->ds.header = hdr;
     r->ds.toc = pdb_ds_read(hdr, (uint32_t *)((uint8_t *)hdr +
-- 
2.31.1



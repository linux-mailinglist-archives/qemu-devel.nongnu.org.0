Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0872F3EA71C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 17:07:47 +0200 (CEST)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mECJ7-0006My-Kj
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 11:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mECHu-0005dP-Dl
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:06:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mECHt-0007Nc-01
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 11:06:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id q11so8773220wrr.9
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukkIodpVfjL+bQ4NpJ9XSgB+FTectYc2iWI6ql3woCQ=;
 b=LjEVyd9+QF0xtl3/Umc0tXc9a6mZJ06kTpGxGnGBX8strUH8xYD+2WPJuCp/HFIoIj
 dvme/wLjalF6kg8PagHYNDQtTpX7SVopL7SusUyrROV2gBJ0zEIYHR90ghMoZ6O6CdFl
 AwxLjj6Okr8geJXk377WTc+FQ2YCK2I/pn6w1GzBnDfS0VCt8nwI5ebzumXJxZfQqimx
 Oqc2ZQ/ENK33nKFG8Yb3ta54qMpd2jEb+MQpmT1yICB5ni4DWPCHDstBpeW1reo73hHX
 fR1qAPg0YFg222IHt1eqnpLnm83XIpFHMj2PHCevKOGtb0e884mJPUHnJ+1m9u2AkAMK
 C1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ukkIodpVfjL+bQ4NpJ9XSgB+FTectYc2iWI6ql3woCQ=;
 b=nqpfToy96mn8jJSxJMjkjjZ0Q5+iaqVQQ02x4wzLVczHKonlCRMikInMshd9BMF167
 RK4NR8GjReSOjE+4d6JIbVHJyPXRAn5eSPeJe3ChTPe0MvHxb2NvXLrMMjR1l+2HPuVi
 y/27XMCDrEt3w4wTR4HYo1HpJJ52FrDzRMUT22obKejbVSFOaiawsXs4vEk28Y0+SyZe
 DTBS7x6qyWsP6WwDyeWjSVfgWSzhWl2YAGCkjHCnhtH7PtS2qx3Vab5UCsSsRFnulQmV
 jkpWrPFe+ob2GliZ/MhYAi4g4xlXL/0Mj7vITE7miNdHccX5s/1zFIf6qMnsQXYWY9Ok
 vung==
X-Gm-Message-State: AOAM532s9PtoJResawEFweXXJcT0bNHxYvue+PM3nz+Sind4PCC8UsDf
 5/yLhFY3R2UwZAIT+Kf6WIGbreRD9sdtMQ==
X-Google-Smtp-Source: ABdhPJxRmdUE/tKn8JI49NotuedFadoavFl9UBIV3irg1j7LVVOf+wtpspdESh4l4kQ8lPSj/XRCFw==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr4629549wrw.364.1628780787229; 
 Thu, 12 Aug 2021 08:06:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k17sm3282664wrw.53.2021.08.12.08.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 08:06:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] softmmu/physmem.c: Remove unneeded NULL check in
 qemu_ram_alloc_from_fd()
Date: Thu, 12 Aug 2021 16:06:24 +0100
Message-Id: <20210812150624.29139-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jingqi Liu <jingqi.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the alignment check added to qemu_ram_alloc_from_fd() in commit
ce317be98db0dfdfa, the condition includes a check that 'mr' is not
NULL.  This check is unnecessary because we can assume that the
caller always passes us a valid MemoryRegion, and indeed later in the
function we assume mr is not NULL when we pass it to file_ram_alloc()
as new_block->mr.  Remove it.

Fixes: Coverity 1459867
Fixes: ce317be98d ("exec: fetch the alignment of Linux devdax pmem character device nodes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 softmmu/physmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3c1912a1a07..c47cb6da2e4 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2075,7 +2075,7 @@ RAMBlock *qemu_ram_alloc_from_fd(ram_addr_t size, MemoryRegion *mr,
     }
 
     file_align = get_file_align(fd);
-    if (file_align > 0 && mr && file_align > mr->align) {
+    if (file_align > 0 && file_align > mr->align) {
         error_setg(errp, "backing store align 0x%" PRIx64
                    " is larger than 'align' option 0x%" PRIx64,
                    file_align, mr->align);
-- 
2.20.1



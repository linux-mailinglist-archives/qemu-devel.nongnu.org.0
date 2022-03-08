Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1584D1B5B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:09:47 +0100 (CET)
Received: from localhost ([::1]:44890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRbT8-0008Nq-B5
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:09:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbLq-0005lI-Be
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:14 -0500
Received: from [2a00:1450:4864:20::433] (port=36649
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRbLo-0001HQ-C7
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:02:13 -0500
Received: by mail-wr1-x433.google.com with SMTP id r10so29030837wrp.3
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3gwbfm8uT0ChSE9qRqJxKGiz36cYc4nzsOiJnyJ7Qeo=;
 b=nXPH901Cv9DsSIKzb88n0/8eo2yj9dsyoRbbzDP8fiDhpiLVsPVKFy2HncY5Vpu/VI
 DqNB1sHhR8GjlLJDZwOl3pC7KHWZfyzTyzSY/+3tXTx9MsWpr2FHxQ/Ca1lZJtD70IWE
 Ry5lydNr3xHb3LOYk4NJ97NNiktpNlOPDJmvR3N9OJt68Z6vxYbv0z3kP1UroJvq0TE0
 B+r5j6xyC6I6xMVD6rHto0QiTCms2JZf1NALy8F6Z+boN2WaIkvg2dw2YdbIWcSk8kTC
 5AJB1fsI4PWuoxL0lqzywWY+xKUtzTK/ihjWtGihOEJYY7vFxkOJQiVIHx04//0JrIxc
 f+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3gwbfm8uT0ChSE9qRqJxKGiz36cYc4nzsOiJnyJ7Qeo=;
 b=cLAknP6BzL6G6ZCl/g+Fu1LJ82Py+Nmo35Y6w3oXoqgBhOWFXYThgyI0CkLdbbIW03
 p/WRvBo1fFRP9915CeTy8myV93/AbwSH32hIVKBRyfjERHJgt5CPqVV+7UufV4hIGOm/
 D5dQJqGqa9zK5IwZziItvDEqBJBnYP58tvbjRhXRC2bOytrOOPqCcOYSUEEb4QOFDGdJ
 mxZ5uh4O5EWuWVQWUuIAgHu1Og1b5GaxEiF/s8gGhGSRn396e5wf+vaDKa/9dvQo88tu
 fKsjCVGz4k6gQ9SftPka34rsYffEjoLzhwJXuJ5a6ijZZQxGwyI+V4tUjS8E7tFRLIQh
 ZU4g==
X-Gm-Message-State: AOAM531ipyMCbqND7/7Z3pqq6GZ3HrNYksd223mRzNPYnD+SZ7RTBako
 Cy9WcALTjkLOMziaD9iiOrOjCw==
X-Google-Smtp-Source: ABdhPJxZH9u8nX6Zq9UqOTrkdNHoubt7DBaYAMrZPHV/lRj5LEtVteuu0j1SGnrR8PGRNO17O8oJvQ==
X-Received: by 2002:a05:6000:1868:b0:203:732e:6a96 with SMTP id
 d8-20020a056000186800b00203732e6a96mr1136566wri.39.1646751730373; 
 Tue, 08 Mar 2022 07:02:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a5d6652000000b001e669ebd528sm14366777wrw.91.2022.03.08.07.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 07:02:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/dma/xlnx_csu_dma: Set TYPE_XLNX_CSU_DMA class_size
Date: Tue,  8 Mar 2022 15:02:07 +0000
Message-Id: <20220308150207.2546272-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 00f05c02f9e7342f we gave the TYPE_XLNX_CSU_DMA object its
own class struct, but forgot to update the TypeInfo::class_size
accordingly.  This meant that not enough memory was allocated for the
class struct, and the initialization of xcdc->read in the class init
function wrote off the end of the memory. Add the missing line.

Found by running 'check-qtest-aarch64' with a clang
address-sanitizer build, which complains:

==2542634==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x61000000ab00 at pc 0x559a20aebc29 bp 0x7fff97df74d0 sp 0x7fff97df74c8
WRITE of size 8 at 0x61000000ab00 thread T0
    #0 0x559a20aebc28 in xlnx_csu_dma_class_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../hw/dma/xlnx_csu_dma.c:722:16
    #1 0x559a21bf297c in type_initialize /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:365:9
    #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5
    #3 0x7f09bcb641b7 in g_hash_table_foreach (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x401b7)
    #4 0x559a21bf3c27 in object_class_foreach /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1092:5
    #5 0x559a21bf3c27 in object_class_get_list /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1149:5
    #6 0x559a2081a2fd in select_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:1661:24
    #7 0x559a2081a2fd in qemu_create_machine /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:2146:35
    #8 0x559a2081a2fd in qemu_init /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/vl.c:3706:5
    #9 0x559a20720ed5 in main /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../softmmu/main.c:49:5
    #10 0x7f09baec00b2 in __libc_start_main /build/glibc-sMfBJT/glibc-2.31/csu/../csu/libc-start.c:308:16
    #11 0x559a2067673d in _start (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xf4b73d)

0x61000000ab00 is located 0 bytes to the right of 192-byte region [0x61000000aa40,0x61000000ab00)
allocated by thread T0 here:
    #0 0x559a206eeff2 in calloc (/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/qemu-system-aarch64+0xfc3ff2)
    #1 0x7f09bcb7bef0 in g_malloc0 (/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x57ef0)
    #2 0x559a21bf3442 in object_class_foreach_tramp /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/san/../../qom/object.c:1070:5

Fixes: 00f05c02f9e7342f ("hw/dma/xlnx_csu_dma: Support starting a read transfer through a class method")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/xlnx_csu_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 84f782fcdc0..60ada3286b4 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -744,6 +744,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(XlnxCSUDMA),
     .class_init    = xlnx_csu_dma_class_init,
+    .class_size    = sizeof(XlnxCSUDMAClass),
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
-- 
2.25.1



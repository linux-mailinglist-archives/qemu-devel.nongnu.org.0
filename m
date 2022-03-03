Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C41974CB5E5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 05:29:24 +0100 (CET)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPd5f-0008BB-Eb
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 23:29:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenlei0x@gmail.com>)
 id 1nPd4d-0007Tg-H1
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 23:28:19 -0500
Received: from [2607:f8b0:4864:20::42e] (port=39533
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenlei0x@gmail.com>)
 id 1nPd4b-000655-PV
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 23:28:19 -0500
Received: by mail-pf1-x42e.google.com with SMTP id y11so3757471pfa.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 20:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZjzYt+f+rlMbtLVNSn4wwqzvX/z0xDqFEGQhOzTCKQ=;
 b=ekr8xpIKvVlfDIFrEsFMR0ZK4t3lVdBShcO0IKO2JQ9if27VrEuquZoIOmAa8DF/bd
 a5XjM1blNZk+Qio8cpmet1kLekv3W9lHMXkuMrsqRJ8Wihxq6OhGpbZJ4JocgnrUuOVa
 zG60zHP65TyWMYC0e3crFZEcuda/eQFgfoq9+TCXfp1dln6M7+XYgwt+CAUF+w5UjSdW
 ka4MFyUHRen4c85l6Zeff8yFP9txt+FBO5hKDHnscceCmx32j52XBQfxkrmc62AjKYhN
 J1m1lCpAFSRigP4Tcgrd6pc6vqfjBtPPhf4joPICiqPEQvEd7AIXTLslJxXeU2HvpjuZ
 nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vZjzYt+f+rlMbtLVNSn4wwqzvX/z0xDqFEGQhOzTCKQ=;
 b=L029ei7bUgjXji1RSSS57HEkkzkwg0zZhBkimRQ0VqixZqTr8+45RsXPtq3Nii0lXq
 RqPzI/YjWQnXxIdi2caDOBj/NebSRTDCUfsfNx4L7wVAwsxiPQQJDkejvrg4nOZt0h3s
 8d7tWPH8mvODV6ly0k/QCZbq8ggkq7kjIjhVlNjqOD6t7c7vKI0MBDmeFNH5M80P8twU
 QrVo5S3l69ww91Rx1N5XTxNmCEp5zCREj9XtAfGcpvfgvMTLJgkG6vGOMHk0wwuJ2a5X
 niQ1wVTYW6npHFR5gNhJQXuYHNomSLsVe7VLqseVmVm13Y7NmErLUV/aSTt+BPnHYIzE
 tsGg==
X-Gm-Message-State: AOAM533bNjYI0+tbRTygZ5CE3HWZvKZCBipcbCUtGhk8g8U/8nIOP/cQ
 WIK/TzJfAQrTeXMP0GXYDiw=
X-Google-Smtp-Source: ABdhPJz4OxK8x1GT5wjBUgDYZRFcewTNcaPy35DEHzzO94Z8FT9rlQ1M5jkO3Br5bwF2aR5YFv2tRA==
X-Received: by 2002:a63:d1e:0:b0:372:c1cd:9e16 with SMTP id
 c30-20020a630d1e000000b00372c1cd9e16mr28625352pgl.421.1646281696025; 
 Wed, 02 Mar 2022 20:28:16 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.9])
 by smtp.gmail.com with ESMTPSA id
 na5-20020a17090b4c0500b001bc9301f316sm600863pjb.42.2022.03.02.20.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 20:28:15 -0800 (PST)
From: Lei Chen <chenlei0x@gmail.com>
X-Google-Original-From: Lei Chen <lennychen@tencent.com>
To: chenlei0x@gmail.com,
	pbonzini@redhat.com
Subject: [PATCH] vl: remove dead code from set_memory_options
Date: Thu,  3 Mar 2022 12:28:09 +0800
Message-Id: <20220303042809.3437373-1-lennychen@tencent.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=chenlei0x@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, Lei Chen <lennychen@tencent.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ram_size has already been set @sz before if statement, so we can remove
the dead code.

Signed-off-by: Lei Chen <lennychen@tencent.com>
---
 softmmu/vl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1fe028800f..adacbd7016 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2105,10 +2105,6 @@ static void set_memory_options(MachineClass *mc)
         sz = mc->fixup_ram_size(sz);
     }
     ram_size = sz;
-    if (ram_size != sz) {
-        error_report("ram size too large");
-        exit(EXIT_FAILURE);
-    }
 
     maxram_size = ram_size;
 
-- 
2.27.0



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA463AA07
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 14:49:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozeVC-0004vg-9D; Mon, 28 Nov 2022 08:48:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeV5-0004u1-D9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:47 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozeV3-0000Ih-Tv
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 08:48:47 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so9488092wmi.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 05:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0LmLK78PoGRSMUT27s353jmU2diODdc3ZkNcicNIYI=;
 b=Oby9ef7PoHRY6bMl/8OjOSyn41pKYJCZMMbvmgG1Tt3Epu4yFqSKOKTQJzT5P1jHoW
 p7J8PJy9MbAT++jQ3XUEwL6fWgd3bMytwUUxGQQLzxGvqHsCQ8P6CDXKjlNDdBPfpis0
 CwU8XQOlvz0C/XpZkvNMG3T/sxOkq6XY7GGGX13PDHhLs+z9qiJoP9zzlurlp8cLKzGD
 0I3KnJSMpWqbe/vIaWpMyKKYk40L0TS5evntWecPeRau/D5MIewzD3IxQ6YnzRAhKYg1
 MAt/mzbY2Wn7P3hIGPipt85/A3rstEj5nmDmxWXAvURhVk6slODpLon5QiFFqU6wEotI
 bXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0LmLK78PoGRSMUT27s353jmU2diODdc3ZkNcicNIYI=;
 b=RvwB5TaySx/M6s+g6Br//1qgVxMlDsAkf7WYcboXiU1lwaLiUWqyz3vokJYaAE7H5X
 NQDY+9akq/nBIYKhgzjtZ+JXWaB7Qexo3wVMGafyHEtCc4RtBFh5Bk9b4EdWT26GksmM
 a26iouB2SI3M/dcGHqUUEu4Rk93l3enxYex5hJ6KCXXBXgq7emJcMgkZun3VvNyvvPgj
 C2JkVW2mHMYPeE3zv1EFXKwKx75q58aLtY9rQfyQkcyO26lGQNRNo5VpzlFaq98ConNg
 pId/wUYbEIt/Fk43MiYm+Ye3OA6Ghd740ufpB1D6rkpTvM3SDL4uQ1r8k2kmYXsCgM+7
 d27Q==
X-Gm-Message-State: ANoB5pme4Xbc8AlIOzFkiohxL/NbSeqZRmzv+hEF/QjlfmgXJCkcDglg
 D83DqJVUKOCUGN3Vo/Ug/3uOUNcBnwjJuz6m
X-Google-Smtp-Source: AA0mqf6KFrzWvTKmyO4x9YlmsAGTxb68w+/KUZuGlVnvhdNVi9FtFMFMR0lUjWN+rWFO72MNNdVPzQ==
X-Received: by 2002:a05:600c:1f0f:b0:3d0:2a82:1cb2 with SMTP id
 bd15-20020a05600c1f0f00b003d02a821cb2mr23452111wmb.206.1669643324692; 
 Mon, 28 Nov 2022 05:48:44 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u22-20020a7bc056000000b003c6c1686b10sm18591855wmc.7.2022.11.28.05.48.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 05:48:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-7.2 2/5] hw/display/qxl: Document qxl_phys2virt()
Date: Mon, 28 Nov 2022 14:48:29 +0100
Message-Id: <20221128134832.84867-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128134832.84867-1-philmd@linaro.org>
References: <20221128134832.84867-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/qxl.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/display/qxl.h b/hw/display/qxl.h
index e74de9579d..78b3a6c9ba 100644
--- a/hw/display/qxl.h
+++ b/hw/display/qxl.h
@@ -147,6 +147,25 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
 #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
 
 /* qxl.c */
+/**
+ * qxl_phys2virt: Get a pointer within a PCI VRAM memory region.
+ *
+ * @qxl: QXL device
+ * @phys: physical offset of buffer within the VRAM
+ * @group_id: memory slot group
+ *
+ * Returns a host pointer to a buffer placed at offset @phys within the
+ * active slot @group_id of the PCI VGA RAM memory region associated with
+ * the @qxl device. If the slot is inactive, or the offset is out
+ * of the memory region, returns NULL.
+ *
+ * Use with care; by the time this function returns, the returned pointer is
+ * not protected by RCU anymore.  If the caller is not within an RCU critical
+ * section and does not hold the iothread lock, it must have other means of
+ * protecting the pointer, such as a reference to the region that includes
+ * the incoming ram_addr_t.
+ *
+ */
 void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
 void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
     G_GNUC_PRINTF(2, 3);
-- 
2.38.1



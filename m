Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A264363B327
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 21:29:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozkjP-0002ls-H2; Mon, 28 Nov 2022 15:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjN-0002ld-Gb
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:27:57 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ozkjL-00028R-Pq
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 15:27:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 t25-20020a1c7719000000b003cfa34ea516so10056019wmi.1
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 12:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0LmLK78PoGRSMUT27s353jmU2diODdc3ZkNcicNIYI=;
 b=IFDjtw4QrB0BYj/U8gY6TlHEEwrOLy/rxYfGnBPs3Dm3porurtLXYCCx0e1qm9Oend
 E5AwmaM69tirtRFcH2fRwKQbt57Om3EFtfMsNBdMcbL5+LUy/b3VmnLT78auSOh3EEto
 oxOPLV8wQB7z5PpVLndqjBLI5gv92K7RvA+47My5M+0AkFX9/tyBG/V2xcU7CCXjX899
 Nx8M6nBUetk0JZsvAbToYitLFSkG1O3xCAGyrPrVAoqDOyJkZh98sMr1or2VjWxmZLEB
 saMbsxU1h9LChyFlx2IFhdoDAXog/6EgHREGky9vmDp6GStcSHw+C/ZeZozrtLmdt/AY
 zcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0LmLK78PoGRSMUT27s353jmU2diODdc3ZkNcicNIYI=;
 b=BruExTXcTq6TPwoW2Oi7wVfK5Ta0+DSIYnJTxosfDwGnUV78yci0L+bmo7fqt2P815
 lz6eBpdZXP8L3sU35L/KSeGRqMweUhMBAx1P4G68EO66DJJU17lKBeAI8rmtJtClVsd/
 DvoAzTQUnXqU+yqc0cW4xKhe+/yQV6iOn5wqSRFk8P9yRkg1WBmV01qPVFuB++eGnrGT
 Rn3HpYovS9TOwxc3GP/OS/fjPPWZkXOfiVdftN/JSGs3AqyIXKMLwaRmkdVBvuqjd9cI
 Nli4neT2OvGcax7qwpJUNOHq2PkqOz0/X1eaGkkymTwH5enntA4FUDxc1MkhfnnBNFZp
 kvvw==
X-Gm-Message-State: ANoB5plepZBgCnDGpW4+dNKUPecumkFYJ0vDMYHUNBSydrv8zSgwtLDc
 2laNWBQqfG8NW0vAifo0q8fnDgxNt21smw==
X-Google-Smtp-Source: AA0mqf6VjOipWbnGM75VctZArWvwIwA7QjR23VcQVOVejSBqXPi+ft1d7J7WRyZ7q5Prbz5yFLBKiQ==
X-Received: by 2002:a7b:c3d2:0:b0:3d0:475f:d390 with SMTP id
 t18-20020a7bc3d2000000b003d0475fd390mr12983139wmj.149.1669667274050; 
 Mon, 28 Nov 2022 12:27:54 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i18-20020adfb652000000b0022e36c1113fsm5093133wre.13.2022.11.28.12.27.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Nov 2022 12:27:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-7.2 v3 2/5] hw/display/qxl: Document qxl_phys2virt()
Date: Mon, 28 Nov 2022 21:27:38 +0100
Message-Id: <20221128202741.4945-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128202741.4945-1-philmd@linaro.org>
References: <20221128202741.4945-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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



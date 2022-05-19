Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D6952DC21
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 19:58:55 +0200 (CEST)
Received: from localhost ([::1]:51486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrkQI-0003YC-4W
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 13:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5J-0006Qn-C5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:13 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrk5F-0000sK-HE
 for qemu-devel@nongnu.org; Thu, 19 May 2022 13:37:13 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so5464353wmj.1
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=YgUeRfpkdJ4o62k2nkr046juo0Vkg6GLb14jjVJCaXM=;
 b=mZUGU8aegX3KsthTfgy/l6VL5lycrG124JPXFDDa34+LDpnZeqRhVlRXObZ39lsHqr
 wH36vW67JP43iyiOfDMI3hTkuK+vdNr1zP4DZSiQIePU363G+E5xQ9vEfrv4+iDQuKKR
 do+xIXtn0KVT5rN1+jx+r47wvJfvEmP/mu4/Vj69amf1mmh+9gIN5ENGJPkrFeRqq2DY
 mSxfNScngju53tXLMnjRsnbbrLXRyn+mEfTqWKaBPJ/z/DNKDw5Rhbzm8MieaC2aDxKm
 MgXnlPrxMLru8bMwVx9VFT+Weau4A+uuXsxRlP62GVkhZd9AMSEyDtk0duap5Qs1dHli
 U3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YgUeRfpkdJ4o62k2nkr046juo0Vkg6GLb14jjVJCaXM=;
 b=KV9lkkY74s4VXNlobisjplzCWm4O6TRNqzmBi5w5tAXa8fEmha5px9N1siRZmSZbPP
 JEUGW16+7egMD+B4IVDV7kd53jk0d64I6HgZyXoFiKYUy4rix9vwLufxThJf6oWfxBtQ
 e9uvLIz7GYeZC3Eyw/fb8BW/GO+hiJgWqHfkWpBeqXzMVYafZ4eZaHFPeNiC5N3OFAE+
 I+ssK+kXBTai5sJStZWacVaQDN2vNe+csNw7WuLQ7GnoK2BRqtAKtMTXNMkDUBxOikiN
 jO6wnWxaDHrE6C70fjaISFPXhnpBjy3G6AUesGA+emK9IFS471NQ1ZQJpY8XSGqsqcJj
 dzIA==
X-Gm-Message-State: AOAM530S52Eq8jp7ZaHmmNc4akmKhE3yxIl9MtvvK77MxOErOMtELtI6
 +dbiLyXAjBscZuGbA9XT9H5Ks9K9nvg10A==
X-Google-Smtp-Source: ABdhPJzD61h7LUhZgeUELNF58VaNZYj5JsWdiA5HL7XN1o5Up9dV9SR2qKh3/J03iMrNKtqvGSXxIA==
X-Received: by 2002:a05:600c:19d1:b0:394:7661:6de9 with SMTP id
 u17-20020a05600c19d100b0039476616de9mr4893965wmq.76.1652981827762; 
 Thu, 19 May 2022 10:37:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e2-20020adfa742000000b0020c5253d8f2sm180183wrd.62.2022.05.19.10.37.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 10:37:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/22] hw/arm/virt: Fix incorrect non-secure flash dtb node name
Date: Thu, 19 May 2022 18:36:46 +0100
Message-Id: <20220519173651.399295-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519173651.399295-1-peter.maydell@linaro.org>
References: <20220519173651.399295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the virt board with secure=on we put two nodes in the dtb
for flash devices: one for the secure-only flash, and one
for the non-secure flash. We get the reg properties for these
correct, but in the DT node name, which by convention includes
the base address of devices, we used the wrong address. Fix it.

Spotted by dtc, which will complain
Warning (unique_unit_address): /flash@0: duplicate unit-address (also used in node /secflash@0)
if you dump the dtb from QEMU with -machine dumpdtb=file.dtb
and then decompile it with dtc.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220513131316.4081539-2-peter.maydell@linaro.org
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 1a45f44435e..587e885a98c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1195,7 +1195,7 @@ static void virt_flash_fdt(VirtMachineState *vms,
         qemu_fdt_setprop_string(ms->fdt, nodename, "secure-status", "okay");
         g_free(nodename);
 
-        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase);
+        nodename = g_strdup_printf("/flash@%" PRIx64, flashbase + flashsize);
         qemu_fdt_add_subnode(ms->fdt, nodename);
         qemu_fdt_setprop_string(ms->fdt, nodename, "compatible", "cfi-flash");
         qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg",
-- 
2.25.1



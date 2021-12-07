Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3441F46B811
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 10:52:38 +0100 (CET)
Received: from localhost ([::1]:51280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muX9J-0004of-B0
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 04:52:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muX5y-000113-0W; Tue, 07 Dec 2021 04:49:10 -0500
Received: from [2607:f8b0:4864:20::929] (port=43738
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1muX5w-0006W2-K4; Tue, 07 Dec 2021 04:49:09 -0500
Received: by mail-ua1-x929.google.com with SMTP id j14so25255462uan.10;
 Tue, 07 Dec 2021 01:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sPzw9hUCcse0FUovk2F8OMShSn2lJLwMH+EJCXE36Rw=;
 b=nBRj26y/ZigzEsjaLdFW/16ToRR6IM2dETlHpoArC9EvdrXFlT2TeigX0EgvlVs0Fo
 Yw1gL4hlrkICkIPs+LOHHa3mx7lxy6zRkjVSvkQc8UFgHSrwC7TGDvOpbzlV8b9VOX/+
 6aFfuLTnsZvIC0x1AVH8pVF54ja7s5jHOzW69EN6qomcDsfVgczKSxZFDEEb2mcHZRuO
 UL72yAJ4Yh4NR4LdHmgsKthrCxeWDGt3YKMmtVLELIMY68CrtE137djebYtlNiydL2+8
 orlJiQyfJhz0l9pZaAYC1vcfccukzxQc9oFl7483zZGyfKtY3qVRoKrQU32Ex8PV35ya
 MnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sPzw9hUCcse0FUovk2F8OMShSn2lJLwMH+EJCXE36Rw=;
 b=2bs5NQKOkRly8eVw/nqAah2l14CsGjRm1Fjgsya6UsyF87KEmSprFjJmbsaVVL1Fgz
 sS8rJW9MzHT6eu6UBFlQBA5j8UidiBdi32kr90DdmiGkKw2oFfCoQ/NRAtE1DfgqA5Xq
 Aup9vSmeKOieV78/Kib3NqIZqwFrtKiO+es9yGFHgT+2VkLgw3pM6O0JnvOSNTwSuW5U
 jnIGGTvD8Y6BQpAsb8rk2jwdZkCGbQ0RY5CiF1u8xTBwesFOrxsr2MkQquSuVZWafW2H
 fTUdxMnmKhFKNXMSN2JNyFsDv58Tis+ib2hoWNhkLagL70gWwQoXQGJcVTlQwK8174nq
 QPsw==
X-Gm-Message-State: AOAM532yaRghQ37SpaYC7IlLVJ6BYg7OUZia+0wHUvPoFxrme8hXVXh1
 dM4NC7L6qYdlQMP5eOEDrEZevLq3Nl0=
X-Google-Smtp-Source: ABdhPJxgWU+Mq4PlBwVipMcBlCcXbD44TEucc7I2PFlmwF9mKtobh1HVn7rb59P/m8jJaQeXiMh+bA==
X-Received: by 2002:ab0:4868:: with SMTP id c37mr49369011uad.33.1638870547221; 
 Tue, 07 Dec 2021 01:49:07 -0800 (PST)
Received: from rekt.ibmuc.com ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id v81sm5648146vsv.14.2021.12.07.01.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 01:49:07 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] ppc/pnv.c: fix "system-id" FDT when -uuid is set
Date: Tue,  7 Dec 2021 06:48:58 -0300
Message-Id: <20211207094858.744386-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting -uuid in the pnv machine does not work:

./qemu-system-ppc64 -machine powernv8,accel=tcg  -uuid 7ff61ca1-a4a0-4bc1-944c-abd114a35e80
qemu-system-ppc64: error creating device tree: (fdt_property_string(fdt, "system-id", buf)): FDT_ERR_BADSTATE

This happens because we're using fdt_property_string(), which is a
sequential write function that is supposed to be used when we're
building a new FDT, in a case where read/writing into an existing FDT.

Fix it by using fdt_setprop_string() instead.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---

changes from v2:
- fixed commit message after David explained what fdt_property_string()
does
- added David's r-b


 hw/ppc/pnv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 32ab8071a4..9e532caa9f 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -552,7 +552,7 @@ static void *pnv_dt_create(MachineState *machine)
     buf =  qemu_uuid_unparse_strdup(&qemu_uuid);
     _FDT((fdt_setprop_string(fdt, 0, "vm,uuid", buf)));
     if (qemu_uuid_set) {
-        _FDT((fdt_property_string(fdt, "system-id", buf)));
+        _FDT((fdt_setprop_string(fdt, 0, "system-id", buf)));
     }
     g_free(buf);
 
-- 
2.31.1



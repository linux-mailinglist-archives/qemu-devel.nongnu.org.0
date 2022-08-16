Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEC596164
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 19:46:05 +0200 (CEST)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO0dg-0001Pa-1T
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 13:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Sw-00056F-2S; Tue, 16 Aug 2022 13:34:58 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:36397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oO0Su-0002OY-Hu; Tue, 16 Aug 2022 13:34:57 -0400
Received: by mail-vs1-xe31.google.com with SMTP id o123so10852336vsc.3;
 Tue, 16 Aug 2022 10:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Fq0fN3wHA48GNTZRD1sHCkuC5wNorM3KMo/gVJyzLng=;
 b=UDV1TBvBLt9FAAPKPx581L4eQlxphxGZxwFBAO9foAOCV3rd61/UEXCE9yDqSxukIv
 BuXPWJAXxF7Ty9mfk4oQ7zOWQEBX3eYLcJK468kPE8e2/t+MWc43goCziC4nz5+Xu4HF
 0N5B9vS8vMI63RxSTesU7lL7WO821/lAPVs9vjo9fMfVAJO8nxfRSOFsKef5jaVeHvj5
 C0lIxDJ6GpiFm9XJ5b4VmyRZi0GnKgWJIIxvSJuFQmURwPXY9V0rnTBdKQT2RP7C/oE1
 W7bBjdzHxShevteHSNw7qniUV6/5qYYVfytypJwFtAezTQyeJZbZ5YC+2dffStE6HDpj
 3emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Fq0fN3wHA48GNTZRD1sHCkuC5wNorM3KMo/gVJyzLng=;
 b=7G3Zv/H7630S2Prv8nKz74+7TBqJOSLIyNE02lj2x8cfhmxKWzYHwD9A72HJPPO64w
 VpR9SbxgyRyC6iJbgkAvZeiFJ3aoLhppcg1CSnwFJIY59naF5gPJTsj5lVD43brN+6r2
 9ffsv/4sqlV0gE4h4pKu1jwq+Rw2obvOiHNuiwzgEmizno16UG4HiyjtE910jzCX0r0F
 5iOz4PmkKQFOSwF7mxq2kP+kZtColNWYyfDXalpG8SCmYt9iDWUZyVFY+S37zo2oIdtx
 OiJKu0MgOwpyeDpf1eGeAdXXLgs1Z5mdYP2RsGK2dYjsM1Kkk+6t1RtbtHSeZZwV+DyA
 TfXw==
X-Gm-Message-State: ACgBeo3Q1/F7IXP9iXrTmrxlsdr8p4ASA6T4YXIWxAFkNvaj+HDZC07B
 hbmQ6DMcNeXMOb9UU7mhTl3+KKApAgP5yg==
X-Google-Smtp-Source: AA6agR5rSDvVkWYAYaj9a7DzARxr9eNpXHhmPelN/EtQ1UzNwCe8uCAkpfKKiqT24uFUB49BvpPcOg==
X-Received: by 2002:a67:e243:0:b0:387:3666:4e67 with SMTP id
 w3-20020a67e243000000b0038736664e67mr8558048vse.47.1660671295215; 
 Tue, 16 Aug 2022 10:34:55 -0700 (PDT)
Received: from balboa.COMFAST (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 16-20020a1f0210000000b00376b105115bsm8817539vkc.48.2022.08.16.10.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 10:34:54 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, alistair.francis@wdc.com,
 david@gibson.dropbear.id.au,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH for-7.2 v3 08/20] hw/ppc: set machine->fdt in
 pegasos2_machine_reset()
Date: Tue, 16 Aug 2022 14:34:16 -0300
Message-Id: <20220816173428.157304-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816173428.157304-1-danielhb413@gmail.com>
References: <20220816173428.157304-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We'll introduce QMP/HMP commands that requires machine->fdt to be set
properly.

Cc: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/pegasos2.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..624036d88b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -331,6 +331,13 @@ static void pegasos2_machine_reset(MachineState *machine)
 
     vof_build_dt(fdt, pm->vof);
     vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
+
+    /*
+     * Set the common machine->fdt pointer to enable support
+     * for 'dumpdtb' and 'info fdt' QMP/HMP commands.
+     */
+    machine->fdt = fdt;
+
     pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
 }
 
-- 
2.37.2



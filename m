Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778F535622
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:45:29 +0200 (CEST)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuMER-00005j-8N
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:45:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nuMCv-0007Lx-6h
 for qemu-devel@nongnu.org; Thu, 26 May 2022 18:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nuMCs-0002Si-7L
 for qemu-devel@nongnu.org; Thu, 26 May 2022 18:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653605029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=DHI9Ww5YYmOhzi49jaGrBH7kwws0GhGaMNiclxcdSlQ=;
 b=PqT3y3OMq/lSj2MFdmtxqXJujvlN8q+1BdEYjRG61ZSwS3E+Nr/6t28YBDw8dabP+pFkHf
 PhJtvAqyDJAgjij1oZyH9s8AMknhAcL8p8el/NQkDztB5Z9ZxBApAgSpkzxWmaQntsNAc6
 /oNz6y2jqF2dmL6Yg9FuugQypwP5i0w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-XY6CggGdMdqj54hOtdBq_A-1; Thu, 26 May 2022 18:43:48 -0400
X-MC-Unique: XY6CggGdMdqj54hOtdBq_A-1
Received: by mail-ej1-f72.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so1486353eje.23
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 15:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=DHI9Ww5YYmOhzi49jaGrBH7kwws0GhGaMNiclxcdSlQ=;
 b=hzmc2otd7NOxn+NJtl+IDXhdAE8XD9lWIW+9tBdhpiYXK/inUFxWzT02Ocm6spp8Xv
 s3ihCu9yPrJAyWHqGhMlvJ301EBzXseLBTqTaVnEm2Z40bLetsWvM4i7AQ4mayUNZc68
 J4cB3A8i/tgz+aKC6aoOSGLxj3RYitF6tKOVzU8ui94vs/WIeuXuKSy8P/sRyGNPxU7S
 7HPOfLZ2jxtEDl2qsfkMr7TxXr37CNhwgQsiJeNdtZQERtPIAvYyIA5eOsg2v9i8Ldhf
 0dIF/rrVEx0DcS4de3zUrHu1Mdw5+LuTjT7C7J/GHGCN0rqpysoQCFPAyqW/HA6iPlgL
 b1ew==
X-Gm-Message-State: AOAM5312dh88xus/g3pwmIT+lSHEpFK7DF9oNpfx+5jkdbCC6r8zPPpv
 /E6feDCYy66VFVmaQpwlU6tq9On+tIwsFk0uZGKTruvParBrOFa/UlROd8G9ZQH+eLhEj2Wz4Rt
 TufDWPMS7osChMqOgLxUh5cK5X5EbWTow3EbbKbCUUyqlhoU5tyISkt5jQ81A
X-Received: by 2002:a05:6402:2994:b0:42b:7c29:dcb with SMTP id
 eq20-20020a056402299400b0042b7c290dcbmr18450234edb.182.1653605026702; 
 Thu, 26 May 2022 15:43:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+dglzmQuRkU9n5u+fWHRtGGr3WCVd3hTQOwocR2w4kaDJD0EjHnpnbPNqAhFGDVUSAvoShw==
X-Received: by 2002:a05:6402:2994:b0:42b:7c29:dcb with SMTP id
 eq20-20020a056402299400b0042b7c290dcbmr18450211edb.182.1653605026298; 
 Thu, 26 May 2022 15:43:46 -0700 (PDT)
Received: from redhat.com ([2.55.29.191]) by smtp.gmail.com with ESMTPSA id
 me2-20020a170906aec200b006f3ef214dd0sm897867ejb.54.2022.05.26.15.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 15:43:45 -0700 (PDT)
Date: Thu, 26 May 2022 18:43:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org
Subject: [PATCH] ppc: fix boot with sam460ex
Message-ID: <20220526224229.95183-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Recent changes to pcie_host corrected size of its internal region to
match what it expects - only the low 28 bits are ever decoded. Previous
code just ignored bit 29 (if size was 1 << 29) in the address which does
not make much sense.  We are now asserting on size > 1 << 28 instead,
but it so happened that ppc actually allows guest to configure as large
a size as it wants to, and current firmware set it to 1 << 29.

With just qemu-system-ppc -M sam460ex this triggers an assert which
seems to happen when the guest (board firmware?) writes a value to
CFGMSK reg:

(gdb) bt

This is done in the board firmware here:

https://git.qemu.org/?p=u-boot-sam460ex.git;a=blob;f=arch/powerpc/cpu/ppc4xx/4xx_pcie.c;h=13348be93dccc74c13ea043d6635a7f8ece4b5f0;hb=HEAD

when trying to map config space.

Note that what firmware does matches
https://www.hardware.com.br/comunidade/switch-cisco/1128380/

So it's not clear what the proper fix should be.

However, allowing guest to trigger an assert in qemu is not good practice anyway.

For now let's just force the mask to 256MB on guest write, this way
anything outside the expected address range is ignored.

Fixes: commit 1f1a7b2269 ("include/hw/pci/pcie_host: Correct PCIE_MMCFG_SIZE_MAX")
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Tested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Affected system is orphan so I guess I will merge the patch unless
someone objects.

 hw/ppc/ppc440_uc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
index 993e3ba955..a1ecf6dd1c 100644
--- a/hw/ppc/ppc440_uc.c
+++ b/hw/ppc/ppc440_uc.c
@@ -1180,6 +1180,14 @@ static void dcr_write_pcie(void *opaque, int dcrn, uint32_t val)
     case PEGPL_CFGMSK:
         s->cfg_mask = val;
         size = ~(val & 0xfffffffe) + 1;
+        /*
+         * Firmware sets this register to E0000001. Why we are not sure,
+         * but the current guess is anything above PCIE_MMCFG_SIZE_MAX is
+         * ignored.
+         */
+        if (size > PCIE_MMCFG_SIZE_MAX) {
+            size = PCIE_MMCFG_SIZE_MAX;
+        }
         pcie_host_mmcfg_update(PCIE_HOST_BRIDGE(s), val & 1, s->cfg_base, size);
         break;
     case PEGPL_MSGBAH:
-- 
MST



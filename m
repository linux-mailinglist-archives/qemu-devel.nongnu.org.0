Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E03CFE2D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:50:57 +0200 (CEST)
Received: from localhost ([::1]:39840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s1I-0007At-Tn
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtM-0000XH-LI
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtL-0005Jh-3x
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2q8B88WKdmDTY0Ntr/x46Vm417E92okf4Gv3DLjALU=;
 b=Yeh3CKMeg+SxRQKfdv0bxxlEpvmJo73cjH4peaY+6RxG24eATEjL5DrVmfg+HRHlgkB1FM
 6abLqlUNxquf+suSImCDF5benmf53Rj02f56zNyp/kKGH6o5ktQ8b2ASBtoDMm3b35ipTh
 22kCotVPRWxi2k2++Yv7NmRDJKi+5ss=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-36mK7zUZOC-L_mSKJietmA-1; Tue, 20 Jul 2021 11:42:41 -0400
X-MC-Unique: 36mK7zUZOC-L_mSKJietmA-1
Received: by mail-wr1-f70.google.com with SMTP id
 r18-20020adff1120000b029013e2b4ee624so10523828wro.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2q8B88WKdmDTY0Ntr/x46Vm417E92okf4Gv3DLjALU=;
 b=lzjZTCUaUw65oBlmzM8yXwbYjW8MbHIvZZ78oDRFtqjScBKkYahw+vlpLKhDQ4NQ2E
 py3p7kh+EFW//WQT3CQ5bQh1uya/S0GhQ7u+Oha8sZmL1hEKz74knHDMuXgCzbpwCU4w
 5xesIQDzn6hJcstQNUDLlsqYAmuHlIWv9dX4We7ni9q914zuVj6pg2AS1LXiZ/Sj0uoh
 qksuitUJzS/aGCIbFrfmI/HMafQgtNbmeZ942NhCL+BRPxg1n08okYI0EH3flBDonHNm
 AAhAqRAqjqEwAYcQO975Qm5PbORgaHO56+Arz4oMVY1Dj1RTqRLRarIVkQMzn6kyane2
 c3ag==
X-Gm-Message-State: AOAM530W7eybKG8PjWkVJjBd3ydYIJZYavMLjq8upwbP13aqtVjU7v+w
 VpymRnqnjxy/Yk7O1wirsUaCC7ZjVaSO735FSmHY/c0C2vQKLJH32O25pVBrVRH/ASMUl4KNhZB
 ayeFGasBZWE35Vyf2mpFqfmEsfUwQ0rYEH/t1Yi2WhDlapVltUaBjyyjaoDh6CwE2
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr36898430wrx.271.1626795759608; 
 Tue, 20 Jul 2021 08:42:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybMDFDLzKmiQKQvhCjuwl/2oCqC2YEn2TmcK4OGT+xZno02pNjz+rlm4JEZvWK2jHWFE+U5Q==
X-Received: by 2002:a05:6000:10c3:: with SMTP id
 b3mr36898412wrx.271.1626795759408; 
 Tue, 20 Jul 2021 08:42:39 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 d8sm25089772wra.41.2021.07.20.08.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/17] hw/pci-host/Kconfig: Add missing dependency MV64361 ->
 I8259
Date: Tue, 20 Jul 2021 17:41:37 +0200
Message-Id: <20210720154141.3919817-14-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Looking at the MV64340 model source, there is a dependency on the
8259 interrupt controller:

  523     case MV64340_PCI_1_INTERRUPT_ACKNOWLEDGE_VIRTUAL_REG:
  524         /* FIXME: Should this be sent via the PCI bus somehow? */
  525         if (s->gpp_int_level && (s->gpp_value & BIT(31))) {
  526             ret = pic_read_irq(isa_pic);
  527         }
  528         break;

Add it to Kconfig to avoid the following build failure:

  /usr/bin/ld: libcommon.fa.p/hw_pci-host_mv64361.c.o: in function `mv64361_read':
  hw/pci-host/mv64361.c:526: undefined reference to `isa_pic'
  /usr/bin/ld: hw/pci-host/mv64361.c:526: undefined reference to `pic_read_irq'

Fixes: dcdf98a9015 ("hw/pci-host: Add emulation of Marvell MV64361 PPC system controller")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210515173716.358295-10-philmd@redhat.com>
---
 hw/pci-host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 84494400b86..2b5f7d58cc5 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -76,3 +76,4 @@ config SH_PCI
 config MV64361
     bool
     select PCI
+    select I8259
-- 
2.31.1



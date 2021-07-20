Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61833CFE52
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:56:18 +0200 (CEST)
Received: from localhost ([::1]:55500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5s6U-0000v7-0a
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtY-0000uc-Vz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtX-0005Rk-FQ
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ayhsRddHReRSICrLmRl62O2leez/9W0/J5F8AflVyQk=;
 b=eV0DgMICf+25RyPDJy9k9t9Glji2CKmbpsniOAaWDMArHAypYHdoG875nT38fSd4lhIShA
 AOwdoGyYLylVCJLmVJnFOSfqBaIrR2upBQM7kCDmRN4bzFRqKQVTuIdkfqPPeegC7wAcWJ
 XfBgs4BK3sbQDaubhpnVa3AZW+0nzgM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-v23Tl9aONqawwtaooOgnRg-1; Tue, 20 Jul 2021 11:42:53 -0400
X-MC-Unique: v23Tl9aONqawwtaooOgnRg-1
Received: by mail-wr1-f72.google.com with SMTP id
 32-20020adf82a30000b029013b21c75294so10457701wrc.14
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ayhsRddHReRSICrLmRl62O2leez/9W0/J5F8AflVyQk=;
 b=QJtZe6/3MeEf4iwRInxZ3K1A1/KNgkXOm1s1GHijbqU2RhHLWkduOi/887rFjIiiTJ
 SwqyP+FKwkKumlAPau92tD78zLTmUz5C5dksBFuNagIEt9ALgMojRuXwIVVdl75nvnOR
 fvO9QcMvQFxLpnbAh56zhuboC/+KpyduUB5n6ie7KPtrBhQq2Up5mB5iSbLu6A8KOKhe
 uQS9/sgt71qVO7PgGrIoC5HYOI1hd8GPUvZIVenKVKhxBcT1mg4oiJj7WjgyMdrLQ+9W
 k0ekRkloUKHn5ZGYt0lIrDkTGmgvEBLTVmUIsFXDOzWiuy1riU3xa8umLUm/1ExqeF2+
 Fbug==
X-Gm-Message-State: AOAM530Npan/2opG3cyt9IW+XgvDOk5sXW2ii8rG0k0Gg+0IsGW8Jzu3
 wUbDzNzWW1BDfzjQOgcKxbVULMfugzp12MQ1ExEPUDnj0FTohzoCIqx0N5Ac1/N6G4QzVAjwF+N
 WcQAEfSrFR2VbJlbRtpqXdhnh5FHCQSdXwHn1FlGjy0jW/hEMS03IRwe0mAR434EL
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr37531287wry.288.1626795772543; 
 Tue, 20 Jul 2021 08:42:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn82OYkN17aG3BwG8a6zIvixzMAvkvK5QD7g/y7gQnrQYJ+xDdv/y7lxFoIoPQtCbK+JZKkw==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr37531261wry.288.1626795772335; 
 Tue, 20 Jul 2021 08:42:52 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 p18sm2672018wmg.46.2021.07.20.08.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/17] hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA
Date: Tue, 20 Jul 2021 17:41:40 +0200
Message-Id: <20210720154141.3919817-17-philmd@redhat.com>
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

The ATI VGA device isn't a requisite for the Pegasos2 machine
because Linux only uses the serial console; see commit ba7e5ac18e7
("hw/ppc: Add emulation of Genesi/bPlan Pegasos II") for rationale.

Using the default devices we don't have any problem:

  $ qemu-system-ppc -M pegasos2
  qemu-system-ppc: standard VGA not available

But when trying to explicitly use the ATI device we get an error:

  $ qemu-system-ppc -M pegasos2 -vga none -bios pegasos2.rom -device ati-vga,romfile=
  qemu-system-ppc: -device ati-vga,romfile=: 'ati-vga' is not a valid device model name

Add it as an implicit Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210515173716.358295-13-philmd@redhat.com>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 85b9c93f02e..400511c6b70 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -79,6 +79,7 @@ config PEGASOS2
     select VOF
 # This should come with VT82C686
     select ACPI_X86
+    imply ATI_VGA
 
 config PREP
     bool
-- 
2.31.1



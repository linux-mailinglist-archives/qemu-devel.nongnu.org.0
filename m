Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16C6AFBF4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:15:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMo-0000H3-7O; Tue, 07 Mar 2023 20:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMm-00008o-4d
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMk-0001mm-Lz
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nVFVvTqVMAy3jtA1iNwo3ZEuay2y2+K610EAHg197tI=;
 b=UEF+9gSExQBQhw/JbSllKLdwznFRecdFQgzAzJKyux7M7gxdna0X714MtS9gBnWJkfheOv
 6pPS7fntk9emLK7gc9xgRcLO0jU6mh6t8nG9smJFVTHf/t+oceLy8/NIeeDxrZ5z4QByCB
 nTvKS5p13dhr6d2+6vaMp09CgeL9h+Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-ldh4nVDhMbOq5tCZwToh1Q-1; Tue, 07 Mar 2023 20:13:12 -0500
X-MC-Unique: ldh4nVDhMbOq5tCZwToh1Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 g2-20020a056402320200b004e98d45ee7dso9599285eda.0
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nVFVvTqVMAy3jtA1iNwo3ZEuay2y2+K610EAHg197tI=;
 b=hBjsX1/UhiBD2cB4PDBT8kK8z78Wi1MBjxIaSvBZvyR2oShYgRXShsurCpVm+9BW6p
 bao+H4IyZ/GirwZm36s8zgkFXrDA354vvd3kCk3ZbYV2lnEF2sShp9B5c0zi61xtFVKK
 cS9wyjR/73NrnWg/mBG7QepjSzF0TmHnrJLLutIZx3vil63wSLU+vBdpc+qWXL2ZvzLV
 S5GLf7ZHzL7g86gyVWItCQ3sZX934vT/zOUcJn4U9z6xERluS3vL32ALhSP5JJxRLtCj
 oiL9hpGN6uoFkbpACOPJsGNMxhr6G0PU/TecQnECSU6jaemrYHzGyXNIrqGKZTgvH5EK
 c3Xw==
X-Gm-Message-State: AO0yUKXL7Hx8SeZtGp7U4NCVpCHjodeCPn5KguC8OqIu1smbhH6sr9tW
 PrTcVN3dzgXm9xDJidjE7Tv7Fqr+agiS4NBoAtgxHaB+laeKlvMpmvr/XiTTzyBeLJ/Pd7bksf8
 ufKYVOtKIBg7z7TEirtiwIokDNm8LIcTXt+qNShyl3riiEPU/EBDo104nGJfwYXUnPoHm
X-Received: by 2002:a17:906:63d2:b0:881:44e3:baae with SMTP id
 u18-20020a17090663d200b0088144e3baaemr14335012ejk.54.1678237991221; 
 Tue, 07 Mar 2023 17:13:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+CzLrOgvAgs/+XIKq3ojpTakam9cVpC2xlXVNFaHiNH58BRu5qUCzmwUvKLI+0J0Kn04kJrQ==
X-Received: by 2002:a17:906:63d2:b0:881:44e3:baae with SMTP id
 u18-20020a17090663d200b0088144e3baaemr14334995ejk.54.1678237990880; 
 Tue, 07 Mar 2023 17:13:10 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 e19-20020a170906315300b008f2b0c6052csm6764693eje.89.2023.03.07.17.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:13:10 -0800 (PST)
Date: Tue, 7 Mar 2023 20:13:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 46/73] tests: acpi: add device with acpi-index on
 non-hotpluggble bus
Message-ID: <22c8dd000fe4e7ce74531c22a427af58c4042d9a.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-21-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 295d80740e..d7c34ba504 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1054,6 +1054,7 @@ static void test_acpi_q35_multif_bridge(void)
         " -device pcie-root-port,id=rphptgt3,port=0x0,chassis=7,addr=2.3"
         " -device pci-testdev,bus=pcie.0,addr=2.4"
         " -device pci-testdev,bus=pcie.0,addr=5.0"
+        " -device pci-testdev,bus=pcie.0,addr=0xf.0,acpi-index=101"
         " -device pci-testdev,bus=rp0,addr=0.0"
         " -device pci-testdev,bus=br1"
         " -device pcie-root-port,id=rpnohp,chassis=8,addr=0xA.0,hotplug=off"
-- 
MST



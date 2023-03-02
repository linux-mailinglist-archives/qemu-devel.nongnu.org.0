Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DC16A7CDF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:36:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHb-0006Fn-Md; Thu, 02 Mar 2023 03:27:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHM-0005l3-UZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHL-0002dV-1f
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9IIGp7zrkNhTcOV4Tj+3SpaPucnF4OxZRR6wI/GqvX4=;
 b=YYnnGaXb/NmUC24SQHQO2hf9kf27eJGh+gFDXZGG8euZ39Nx3OzO0kDqUZITCtD2wMSdUD
 IjbGaw2BdXyjuTkFGd6Ax5LgvSSD1ecU9bSSxFDBOheBxhC6yvDfhPG5+gE4LE/uof8UrE
 cLvGtfW9yIeqOpzFn/60BcGBvmXvo3E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-370-1oaxTR1lO3KnNIUFJcISsw-1; Thu, 02 Mar 2023 03:27:05 -0500
X-MC-Unique: 1oaxTR1lO3KnNIUFJcISsw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso748846wmh.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745623;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9IIGp7zrkNhTcOV4Tj+3SpaPucnF4OxZRR6wI/GqvX4=;
 b=J3y7Ij9BdTiUemUeQVs7+hJQrLh9p+tZUAR1Fx/2S7rZtVLe+/LJlkXWd7mrg3b/3h
 2mlYCSVDR4d12WCl2sBIXAmk8GZm7dD0Q8o35OQ3KPESOzd/Y5beSJ9FzqoE8IF09T5G
 p25UueGL3SF0UUGXWuYffLnYMflVzx6EfOEEKdYAFOrBRGEA81ldbVLn857ogk+6piua
 h72VoGB9G7590HaBeZIiVAGizkdUKefG9AjLhzDAup1Oj+Zc8ysyPyK1HHIqcHGCxfJr
 tVtnO48YYxZHGsKMehMuRxx0G+XiAU/EEUgv5fVkYFPNiIVTbHd8ORf6NBOVOqpk4SW0
 vpyw==
X-Gm-Message-State: AO0yUKWAilQw9yTvxBeR5z/8L/J9huJl48QCqPU4ZzG970f9iXXfWJBC
 d3gnoC4e0H6nVLVKLCPtqxpB+2Y1CGUJGLNRSfpuOFad5S4NxQLufhZ7UGpUvpRj2ka2v6Aqpo2
 ELtDJ5qCVoJrJ6GL1tBpVeDTY3Y6I08GiSKQYcnNsY+n3CDWvz4sFOOV6K3D4kS7MkA==
X-Received: by 2002:a5d:658f:0:b0:2c5:5391:8ab1 with SMTP id
 q15-20020a5d658f000000b002c553918ab1mr6495093wru.53.1677745623757; 
 Thu, 02 Mar 2023 00:27:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8SInoFK67Z1s1Je6GnR/djCKhpTYqZmCEq2sVABANECYrzMnVLqZFZpY8mNGHnWwJkbEi4MA==
X-Received: by 2002:a5d:658f:0:b0:2c5:5391:8ab1 with SMTP id
 q15-20020a5d658f000000b002c553918ab1mr6495073wru.53.1677745623496; 
 Thu, 02 Mar 2023 00:27:03 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d5149000000b002c54c92e125sm14719027wrt.46.2023.03.02.00.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:27:03 -0800 (PST)
Date: Thu, 2 Mar 2023 03:27:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gregory.price@memverge.com>,
 Fan Ni <fan.ni@samsung.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 48/53] hw/i386/acpi: Drop duplicate _UID entry for CXL root
 bridge
Message-ID: <20230302082343.560446-49-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Noticed as this prevents iASL disasembling the DSDT table.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Gregory Price <gregory.price@memverge.com>
Tested-by: Gregory Price <gregory.price@memverge.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20230206172816.8201-7-Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d27921fd8f..b19fb4259e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1514,7 +1514,6 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                 aml_append(pkg, aml_eisaid("PNP0A03"));
                 aml_append(dev, aml_name_decl("_CID", pkg));
                 aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
-                aml_append(dev, aml_name_decl("_UID", aml_int(bus_num)));
                 build_cxl_osc_method(dev);
             } else if (pci_bus_is_express(bus)) {
                 aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
-- 
MST



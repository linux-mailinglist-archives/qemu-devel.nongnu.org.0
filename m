Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD855FA353
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:24:07 +0200 (CEST)
Received: from localhost ([::1]:36874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxRe-00042E-Fz
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc2-0002vd-1v
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbw-00073i-Lw
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fI6ZJ92NuB3HBfu3OEClBbAYK125pIR2pAh01+BJJqs=;
 b=K+Go81Dv0Ub/Jzv0+5BnxURJ1X3cMdAkh5TXaeNG39uqxg3nisgHD9gtFOJBCVP6guKuHI
 QdoVytDbMM5RrA87ccg3aPk/tKzlseKQ4H6qjT6u1/JWJHNckfG6NslyqDfZ1h20VSFD2T
 Y/UjDgANb/uwjKCAkLaklIPOHuoXl1w=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-62-R_fmoCAkPAejnxhxZUYr1A-1; Mon, 10 Oct 2022 13:30:38 -0400
X-MC-Unique: R_fmoCAkPAejnxhxZUYr1A-1
Received: by mail-wm1-f70.google.com with SMTP id
 r132-20020a1c448a000000b003c3a87d8abdso4385956wma.2
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fI6ZJ92NuB3HBfu3OEClBbAYK125pIR2pAh01+BJJqs=;
 b=CiNqW074/LSZidqynV5AJX0duLBcLMEKQdJ/1tknRbP+IeZQBhJEKY8FdTct2X3ySq
 nT/Bm/t24Wt80UmzeerKf6WF50YegGFeB/JNcSNILPQdz1u9zKpTTLrXhW76ixDTKckY
 mWjqjz3jjbQxxBsQ/uEnAu7LTtOT2w9EpJVTBLlsEvaacEpTen7UxuqMV4kPixlo9HjL
 Dw0jWps9SXg8ZMFjRUGcO08UqpDswzj/Vdj46craI+6Khe4lMAXFzKCV9nbqYXqc9Ind
 wk+xUYryz//0gKza2XSNvv/tza4/yXDxd3LTN5UM2jTB+y+ujYWNjQqLyhC3QfQ3JV+a
 uncQ==
X-Gm-Message-State: ACrzQf0Z28MJJTMHWdo4XcLfhi/E1UNma1qTqe/NBxnkuPdgWMQbnjPv
 HBTXzDXTo4fXT7hIEotTIUevMa7z+rr4qoF/Qqjsng5jJGMjOaJosa/YN7tKPpk6t73P2GPBR+A
 7BOw7p+lM2tOjUZSy1LfS2sEEJ5Pd0PYDZDuDEi+orgiXjwRVgJYOcFSLK3aR
X-Received: by 2002:a5d:4082:0:b0:22f:6ad7:53e with SMTP id
 o2-20020a5d4082000000b0022f6ad7053emr7735862wrp.389.1665423037426; 
 Mon, 10 Oct 2022 10:30:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zln1ES8hdSv7CyUz/uY7VQ58v/CQOelBvT+YZbYSteyog0aldQIRWzxVi6wk6t2nOCYC5tw==
X-Received: by 2002:a5d:4082:0:b0:22f:6ad7:53e with SMTP id
 o2-20020a5d4082000000b0022f6ad7053emr7735840wrp.389.1665423037181; 
 Mon, 10 Oct 2022 10:30:37 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 g14-20020a056000118e00b0022cc3e67fc5sm9536077wrx.65.2022.10.10.10.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:36 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 26/55] acpi: arm/virt: build_gtdt: fix invalid 64-bit physical
 addresses
Message-ID: <20221010172813.204597-27-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Miguel Luis <miguel.luis@oracle.com>

Per the ACPI 6.5 specification, on the GTDT Table Structure, the Counter Control
Block Address and Counter Read Block Address fields of the GTDT table should be
set to 0xFFFFFFFFFFFFFFFF if not provided, rather than 0x0.

Fixes: 41041e57085 ("acpi: arm/virt: build_gtdt: use acpi_table_begin()/acpi_table_end() instead of build_header()")

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20220920162137.75239-3-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/arm/virt-acpi-build.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9b3aee01bf..13c6e3e468 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -592,8 +592,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     acpi_table_begin(&table, table_data);
 
     /* CntControlBase Physical Address */
-    /* FIXME: invalid value, should be 0xFFFFFFFFFFFFFFFF if not impl. ? */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     build_append_int_noprefix(table_data, 0, 4); /* Reserved */
     /*
      * FIXME: clarify comment:
@@ -618,7 +617,7 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     /* Non-Secure EL2 timer Flags */
     build_append_int_noprefix(table_data, irqflags, 4);
     /* CntReadBase Physical address */
-    build_append_int_noprefix(table_data, 0, 8);
+    build_append_int_noprefix(table_data, 0xFFFFFFFFFFFFFFFF, 8);
     /* Platform Timer Count */
     build_append_int_noprefix(table_data, 0, 4);
     /* Platform Timer Offset */
-- 
MST



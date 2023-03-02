Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F250C6A7C81
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:25:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeEx-000264-O0; Thu, 02 Mar 2023 03:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeEv-00025e-G9
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeEt-0001wR-Tw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3rAU4eV4gEL1nE9JTrIdiAlrOHj3+NJ35GVTPTdgm+I=;
 b=FjRaDsIHv3GgsBsXuskNs2mOrt/WhiJO0mjIJw2SLRD9ISviZguxy6j5t3ZGDjSgbJYmVd
 qrFYaxntnQpnN88RuKooNGFoehZzXiPKEk7p0YNWGFsEpdrqF0bQ0/rvMryEhDEN5HmNRB
 DA1mYih4JMwYeKkDa9FIZ3dvInoZcW0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-JfTjt08SO_yV4tk2cA3gHg-1; Thu, 02 Mar 2023 03:24:33 -0500
X-MC-Unique: JfTjt08SO_yV4tk2cA3gHg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so2982138wrx.16
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3rAU4eV4gEL1nE9JTrIdiAlrOHj3+NJ35GVTPTdgm+I=;
 b=k0uKeo5X/4FfpFzhx1Kd+1BuiYokAFjtYpLJOziUVmSXdKy0TUNmlCdwnWcl6obu6w
 EKitEpiuphw976Tr2srNo3sYhJhv5xn7PnzYe7gANDCO1LthvJNkgBJtiogQ3gOyyeVO
 c5Y/p4WC9Eir7cCvjbo68AjBnv8B/pFO5LU6DJiCxkOXfgcZTGNMPs92hLpxlBWgc9mI
 SxE5d7aSioFi9SGDOmgmctwf3kw1a24LfMwJMspbjTWGO8A+wSh5EvPIqS6dZ0SRgzqC
 mIZjmpUIN39/AOe5sdhy+I1WAcXzklKu6el2YloxglR1Q/CQdJAR3RLqgRVa/fXF8QGo
 GFZA==
X-Gm-Message-State: AO0yUKXP4Aia0CXjveP8nHORLxtlwW7o/QGDxlP11QjVHxCKSocCCObb
 dDP4E9Nii7/xNmcduXzcZmEuZeIiCJ27qW0zJA6b0ZV/l6ob+wuY2WzJLDpIqI8JaogIZuxOy9y
 ab8ulsYRJ54U7x/ptEWqwHqHFqL7dSH4iOsR/xG+sDXb9TP6AGLWqA+8qzV1wyKTlVA==
X-Received: by 2002:a05:600c:5125:b0:3ea:d601:976f with SMTP id
 o37-20020a05600c512500b003ead601976fmr6338117wms.23.1677745471635; 
 Thu, 02 Mar 2023 00:24:31 -0800 (PST)
X-Google-Smtp-Source: AK7set9rHTOT/nfn2YT/ELSmTPYKImys2PQy9yXfecvZJq4rwH2HOYW8Hxu4NiNrMjcEVC0vykQS2w==
X-Received: by 2002:a05:600c:5125:b0:3ea:d601:976f with SMTP id
 o37-20020a05600c512500b003ead601976fmr6338097wms.23.1677745471268; 
 Thu, 02 Mar 2023 00:24:31 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003e208cec49bsm5792606wms.3.2023.03.02.00.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:24:30 -0800 (PST)
Date: Thu, 2 Mar 2023 03:24:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Julia Suvorova <jusual@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 01/53] hw/smbios: fix field corruption in type 4 table
Message-ID: <20230302082343.560446-2-mst@redhat.com>
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

From: Julia Suvorova <jusual@redhat.com>

Since table type 4 of SMBIOS version 2.6 is shorter than 3.0, the
strings which follow immediately after the struct fields have been
overwritten by unconditional filling of later fields such as core_count2.
Make these fields dependent on the SMBIOS version.

Fixes: 05e27d74c7 ("hw/smbios: add core_count2 to smbios table type 4")
Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=2169904

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Message-Id: <20230223125747.254914-1-jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/smbios/smbios.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 4869566cf5..d2007e70fb 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -750,14 +750,16 @@ static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
     t->core_count = (ms->smp.cores > 255) ? 0xFF : ms->smp.cores;
     t->core_enabled = t->core_count;
 
-    t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
-
     t->thread_count = (ms->smp.threads > 255) ? 0xFF : ms->smp.threads;
-    t->thread_count2 = cpu_to_le16(ms->smp.threads);
 
     t->processor_characteristics = cpu_to_le16(0x02); /* Unknown */
     t->processor_family2 = cpu_to_le16(0x01); /* Other */
 
+    if (tbl_len == SMBIOS_TYPE_4_LEN_V30) {
+        t->core_count2 = t->core_enabled2 = cpu_to_le16(ms->smp.cores);
+        t->thread_count2 = cpu_to_le16(ms->smp.threads);
+    }
+
     SMBIOS_BUILD_TABLE_POST;
     smbios_type4_count++;
 }
-- 
MST



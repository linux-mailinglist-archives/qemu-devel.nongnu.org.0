Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693566EDD33
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMm-00071d-5c; Tue, 25 Apr 2023 03:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMb-0006V3-IZ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMa-0006hB-4c
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+liPnMG5SKdT9lUk2pKybI2+VnoLumIcCnDsEBtoKw=;
 b=iPRESaKKbU6FpOvbkAtvHdJ3u1XvxztElhO+eNXcMHJ5hCBjXL6LNzKaMT4moCg8Qk+ieT
 nNpyEykCDnCYVgAaGHeh4FfIxIyz/i0SR1slhL5KnOtydGA7E0yJ6J1kHCGqxhjNWMGlS9
 fVHXYgSczRK+lPejcyQMpKKZZUVI0rI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-8O74Dfv1NVa47JrR336R0A-1; Tue, 25 Apr 2023 03:45:22 -0400
X-MC-Unique: 8O74Dfv1NVa47JrR336R0A-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f08900cad7so20473385e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408720; x=1685000720;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E+liPnMG5SKdT9lUk2pKybI2+VnoLumIcCnDsEBtoKw=;
 b=kYcXHy8y0r3PUWRAiJoiMQbUSfUacxkM0a5IR88M2ofYgGW6NVnb/nw4125a+HeNCI
 yKTSkYCEV/A6m8U1/qE9En8C7NttgFDCeEXb8GtkmOBSDB5Y2MShPwFk22q7EHH1aicN
 DX0RMSU7flhMepM+eTKCSGS8bGUhWftmYy16AlXw4Jklf49xIg5HOqnGbMVQEJDxG1lb
 YmQIK1iNsCtlFSHGvuyx9LO1N8M7csO1yF5VDoTUzYT7ybKq2e38rvwDgNNtMBsWVPAb
 6gUHsf6g+XBDmvS40cT8ekJKdtsuyQVts/lxTkRw4t3jupdUSBmqrLZNECZSIYd+Av8D
 Gn+w==
X-Gm-Message-State: AAQBX9foP7sLm1qYh8fiXhDVIXoVnzJziAwuLThzXpCb8h1ZjLwyPVhd
 s0jAXNJC5Hl2jr84T9jh5GMADcVa/vgmQ0vhNeRLjiZ3ezdtdD23Q0f9QRJeWN5P0Gq9V9Dx4CS
 JlJQmzju5u9wJMnI6cEsAcE1BAkpVpT4O2BwCmOvYjSZBS5xL3x6Fz6manbB3u+6/dXDx
X-Received: by 2002:a05:600c:2119:b0:3f1:98df:bc03 with SMTP id
 u25-20020a05600c211900b003f198dfbc03mr6398945wml.25.1682408720553; 
 Tue, 25 Apr 2023 00:45:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZA+lHPo17vZ9PEYS9xgFUxxiA9kuF5FoHqLJDGNx7GglUZOiK49Ui8/iNZcF0Q8St61KHz4w==
X-Received: by 2002:a05:600c:2119:b0:3f1:98df:bc03 with SMTP id
 u25-20020a05600c211900b003f198dfbc03mr6398926wml.25.1682408720349; 
 Tue, 25 Apr 2023 00:45:20 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c468500b003f18141a016sm17011388wmo.18.2023.04.25.00.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:19 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Kapl <rka@sysgo.com>, Wei Huang <wei.huang2@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 David Kiarie <davidkiarie4@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 09/31] MAINTAINERS: Mark AMD-Vi emulation as orphan
Message-ID: <2f5a2b35f5883fb8e049d877263eecb4c3883fb2.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

hw/i386/amd_iommu.c seems unmaintained:
After commit 1c7955c450 ("x86-iommu: introduce parent class",
2016-07-14), almost no feature added, 2 bug fixes, other changes
are generic tree-wide API cleanups.

Cc: Roman Kapl <rka@sysgo.com>
Cc: Wei Huang <wei.huang2@amd.com>
Cc: Brijesh Singh <brijesh.singh@amd.com>
Cc: David Kiarie <davidkiarie4@gmail.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230313153031.86107-2-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0bd3d1830e..83c0373872 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3367,6 +3367,10 @@ F: hw/i386/intel_iommu.c
 F: hw/i386/intel_iommu_internal.h
 F: include/hw/i386/intel_iommu.h
 
+AMD-Vi Emulation
+S: Orphan
+F: hw/i386/amd_iommu.?
+
 OpenSBI Firmware
 M: Bin Meng <bmeng.cn@gmail.com>
 S: Supported
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CEA2A05DF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 13:53:30 +0100 (CET)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYTuL-0000eE-Le
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYTmW-0000TD-Jk
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 08:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kYTmU-0000Y0-4R
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 08:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604061920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LjrL669fVKay5a5661uPNZ920ikHdDz6ECFPczH1Ej8=;
 b=GWfLjESrWyeaIiNwsO2yp0NfNgsz9e6PKCAX4CCoMxeuLEiFXebxEGTXWs0UYWFX2AECv4
 iRTcF8tCX74XSp94QbdWKQHFX0uPKRiFPqn+qG6vs75l1YVoqdfci73cSVVCWwv9Yuao4O
 FlyPzLMPzf3U42moI9e+HO2/N4JWMwA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-HW_7GY4TM-64BDBrW7oDSg-1; Fri, 30 Oct 2020 08:45:18 -0400
X-MC-Unique: HW_7GY4TM-64BDBrW7oDSg-1
Received: by mail-wr1-f70.google.com with SMTP id w1so2613722wrr.5
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 05:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LjrL669fVKay5a5661uPNZ920ikHdDz6ECFPczH1Ej8=;
 b=p1UC/yKirxZWkwwBPeFVswOg4+7rzG7aKAUcmOAFJGpwmyHlwNB5LF2E14aK4p3Gyh
 Tq2WsBYWzpOWjLRw5ND3uwD/TEc8N3AtT4UveqTvYxnD14CLUEifVIcBdgzeeh2EmZS7
 o5pkX2DJ3y2Gyrtz4JYx+DTXJhvcaF686UL/xzShttn/f70W+f6Jv4lyVijgYYMu2MqH
 LZxfutPfQpwtyjLUD96LobW/TKxFpxMobmUD/f0Okf02gZZYuNtkT78Rvk4mRGjwOvER
 jpr/A929kP87rKstSDkbKNx0lyZMBVKEYXHZLExABP26L/V6ycUDCzp2kRjDIo6Zuvs3
 y9zg==
X-Gm-Message-State: AOAM5339lRBzDokwtEwC2KnQGzphW61orTqMWr4+Qw5GhvdjinMatke4
 YkRzTp3SDJYUoqAm1JAVD3NyEfK+1clRnxYO0f1Mp8zZIMLas+1K8F0bkVtCUgAM6J44QXbkoX9
 gCtdyt4OiD+4pRMM=
X-Received: by 2002:a1c:5545:: with SMTP id j66mr2578812wmb.31.1604061915888; 
 Fri, 30 Oct 2020 05:45:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9qlYBhg8YsvJxKm3VZiyiGOpIGpwHAaxWGhiM2LOLgxqWRSuMS0m/iR3yujXtYMPInGgRPQ==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr2578783wmb.31.1604061915671; 
 Fri, 30 Oct 2020 05:45:15 -0700 (PDT)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id i33sm10833100wri.79.2020.10.30.05.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 05:45:15 -0700 (PDT)
Date: Fri, 30 Oct 2020 08:45:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] acpi/crs: Support ranges > 32b for hosts
Message-ID: <20201030124454.854286-5-mst@redhat.com>
References: <20201030124454.854286-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201030124454.854286-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 01:22:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ben Widawsky <ben.widawsky@intel.com>

According to PCIe spec 5.0 Type 1 header space Base Address Registers
are defined by 7.5.1.2.1 Base Address Registers (same as Type 0). The
_CRS region should allow for the same range (up to 64b). Prior to this
change, any host bridge utilizing more than 32b for the BAR would have
the address truncated and likely lead to conflicts when the operating
systems reads the _CRS object.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Message-Id: <20201026193924.985014-2-ben.widawsky@intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 98ff9f5cef..4f66642d88 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -786,8 +786,14 @@ static Aml *build_crs(PCIHostState *host, CrsRangeSet *range_set)
                 crs_range_insert(temp_range_set.io_ranges,
                                  range_base, range_limit);
             } else { /* "memory" */
-                crs_range_insert(temp_range_set.mem_ranges,
-                                 range_base, range_limit);
+                uint64_t length = range_limit - range_base + 1;
+                if (range_limit <= UINT32_MAX && length <= UINT32_MAX) {
+                    crs_range_insert(temp_range_set.mem_ranges, range_base,
+                                     range_limit);
+                } else {
+                    crs_range_insert(temp_range_set.mem_64bit_ranges,
+                                     range_base, range_limit);
+                }
             }
         }
 
-- 
MST



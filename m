Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEBF6137A8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:17:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJI-0005V4-Vr; Mon, 31 Oct 2022 08:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIx-0004UM-Vv
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIt-0003QU-7y
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=emHZwik853RegiemB6gYqIC1Zx0E5L8WREFs0VWzshRFNWfkQXSAoY119/a1+NPBpcMLJ3
 oiac8wgWzBnV8Bw5ZtRrAJfF6C5Q8Xw7KUUur7focoVzN5ygDSi8VmYSvcO6HjxQ4cGxed
 boUBS0IumioYGhQm8FPgzuLGXRe355g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-Fw9DVZ2VPoShz1u6nW3jUA-1; Mon, 31 Oct 2022 08:54:09 -0400
X-MC-Unique: Fw9DVZ2VPoShz1u6nW3jUA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so3048168wrg.21
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=x0OFII6/L/HyHkzefhwOwYbGgPKjcseXpotU0RuLuA8NTjEJ4d2eFUO8dSbOJYmWUg
 NyCRNGwRkoMxTEclciQPDBdhSV1qD3pvq5ytO25rW+JzGUq/Eg1uMTU1i26lARZiGnqz
 tmf8CNjxIWbyVFYpRTtQgY4eQ+z7kXVCGweV36032Tpj53TSqE9B7xqjBygE4+uOFH6c
 zvA9X8sai3VuzgItnJisQZ9BrxUy1HEBBG7KmPU4dtUf00ozunWPX927tbZvkgyPEbJq
 VJmJI6HPV17QpPWt8B5o4QpUpEmjRlFtI7nzwpDZkf+TSvQJ3t8/CbbM4UTtRWFUCXLu
 W3lQ==
X-Gm-Message-State: ACrzQf2AjU9aTNLOB/fZWuSF/+wNHoUzCKESsLjobWPWrynxvCNvGpF3
 PW7sMAG3eeaMNgB5rz+jgqxX7JFSilPkTAfoqZyjpDglC7FsTV3wka3WgYrPEb9T5PIjU8Oqn4y
 jc2B1643GhcGUyk22pmJ990uQo8cWrwImtDdX2DWQ6ZuNuMT4f/XjouYNptNb
X-Received: by 2002:a5d:58ca:0:b0:236:2324:3f0f with SMTP id
 o10-20020a5d58ca000000b0023623243f0fmr8068903wrf.325.1667220848007; 
 Mon, 31 Oct 2022 05:54:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6e8p6yMsWH53KwG112VwzlP8ezLQ13PLz0yU1BwwE8F6cBjDd1KqMqbgGuiB9/ihd7i0gjyw==
X-Received: by 2002:a5d:58ca:0:b0:236:2324:3f0f with SMTP id
 o10-20020a5d58ca000000b0023623243f0fmr8068879wrf.325.1667220847760; 
 Mon, 31 Oct 2022 05:54:07 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003a8434530bbsm7322993wms.13.2022.10.31.05.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:07 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 71/86] hw/i386/acpi-build: Remove unused struct
Message-ID: <20221031124928.128475-72-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Bernhard Beschow <shentey@gmail.com>

Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
simplify PCI bus tree generation'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221026133110.91828-2-shentey@gmail.com>
Message-Id: <20221028103419.93398-2-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 960305462c..1ebf14b899 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -121,13 +121,6 @@ typedef struct AcpiMiscInfo {
     unsigned dsdt_size;
 } AcpiMiscInfo;
 
-typedef struct AcpiBuildPciBusHotplugState {
-    GArray *device_table;
-    GArray *notify_table;
-    struct AcpiBuildPciBusHotplugState *parent;
-    bool pcihp_bridge_en;
-} AcpiBuildPciBusHotplugState;
-
 typedef struct FwCfgTPMConfig {
     uint32_t tpmppi_address;
     uint8_t tpm_version;
-- 
MST



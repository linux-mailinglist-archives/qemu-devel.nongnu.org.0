Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAF63AA5C0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:57:29 +0200 (CEST)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcbI-0002s9-Rh
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPS-0003UQ-7F
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPQ-0001LF-9J
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B1OGMC38jawyGu8IsSixsuh7u6q/pZHdAwAhcewq1IY=;
 b=eDdrXE7mInebAuyExlXaepXU1dMaifwWLbYod+wHWENr+BvsLq56W4Tu8wBpyUmty6LMMT
 JmL8VPccXvpCzJoGX+NrxRIU3sOD4wWPARGA915WMvpggLM0Ikh3Qr2qjYImS9JdK1toWa
 rnpDfpjqbmBjGEzejc3lnfg+QE6oYBc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-9VkF-CgfN5W_owjuu5J3aQ-1; Wed, 16 Jun 2021 16:45:10 -0400
X-MC-Unique: 9VkF-CgfN5W_owjuu5J3aQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j2-20020a5d61820000b029011a6a8149b5so1423373wru.14
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B1OGMC38jawyGu8IsSixsuh7u6q/pZHdAwAhcewq1IY=;
 b=IOs1RE2aujqg4r8TsFHX3eU+wcKU69GwbH4fNkPJOA6GV2XVepSNrVOJhGs/5CgE/J
 MhfVLnSu+HvumudhuNPSzD5j29H0FtmnJvFKneQ54enn+779m+p88uTX/Iu//HUOTmeT
 +tSarx/5GcRTHpYQyqN+LADVPTHgCe2SV7yA00HNQFRPhCQOIpyqW+7GtZtrFTvXSygN
 g4iTkF0LrFk7T4IX2yBpBC4dQHucADFI690f1lhGodytXE6oFXcXZZqY8TZWd/7TAfIz
 4BistAONtuNpkc/gf+CBuOIh3r+qKALdopUVEYUdZUJam1puyA4cG9Qhpdt1pT6xG/j4
 aN3Q==
X-Gm-Message-State: AOAM5332IfcrD1KvW1eqIscP2KUsCGTG2MDyE1lRtkiDH/OfdlG5kNb+
 k+ZtqhjmkWvPkFEEx5WrZki69tEnjZmknNPNCQe1yUsNkvEZzE4VP3hw7QvqfeOxAPF/XbSMpm9
 x7x2zqpmMeSVTWqV4Z4fWvllhYgr0wibCA4m4zvgNe4T5YlZr0+s5q7hnM99AFrQI
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr1125145wrn.127.1623876309360; 
 Wed, 16 Jun 2021 13:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznoXgpV3ZF9r/NrrherIdtT7FfLJzQ7uzNWIHVNB4jd8A6ysHUcSR2jeIZq88fHG/p0YjIwQ==
X-Received: by 2002:adf:e8cb:: with SMTP id k11mr1125112wrn.127.1623876309208; 
 Wed, 16 Jun 2021 13:45:09 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id o26sm2696766wms.27.2021.06.16.13.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/23] hw/i386/acpi-common: Remove unused includes
Date: Wed, 16 Jun 2021 22:43:22 +0200
Message-Id: <20210616204328.2611406-18-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/acpi-common.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
index 1f5947fcf96..77afebd9e1f 100644
--- a/hw/i386/acpi-common.c
+++ b/hw/i386/acpi-common.c
@@ -21,15 +21,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/error.h"
-
-#include "exec/memory.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
-#include "hw/acpi/utils.h"
 #include "hw/i386/pc.h"
 #include "target/i386/cpu.h"
-
 #include "acpi-build.h"
 #include "acpi-common.h"
 
-- 
2.31.1



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F13061685B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:20:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGLY-0003Jb-1a; Wed, 02 Nov 2022 12:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL7-00032E-57
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL5-0003Wp-DU
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405498;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=FeDKbeFXqei3qFV0S0ygPpD3qiq2TPtivBzXEwFFAz/EkOeXFPhnuiKfrpEflwxgxLHZes
 BTDjjodDtnSvOX7UW4TJJHHI1Oja4KqO0H8JGZNG2nrwKbg+cp9Sq/l0BnuZUKThe0tFLC
 VuVZDz31PUzuojU7m26oQCKndrSUjyM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-j7pERoK5PJapek1muQgOyg-1; Wed, 02 Nov 2022 12:11:37 -0400
X-MC-Unique: j7pERoK5PJapek1muQgOyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f1-20020a1cc901000000b003cf703a4f08so648356wmb.2
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTCaBLlQvbytTSkLNf8ZYQ/GTlBD1EUv9OQIGVa+ewE=;
 b=VmWHbg8m9TDVENRlNH4Io+oiddEOf9gFB7ED1N1WzHjdA2RIZBVp+47/qUPHlKH0oj
 weUg5ghjpBjUpDPIwjl/OC5dRRNKmxp8cecujCzqR3AYIGPDJ36cScHXUTGHQNxghlEH
 Y/hTxmzv385gOio3cL9OKSdKscfavJqK+jfHQY8o+BTo57bibGK+ynLC8xX5QE3rBZW6
 5UhSqAXXpWWAMsntWl5+OlQeNVE2DF2QabqvFbHe7X8ulHLlmRmQ+AIIaMxcyDHA0jVw
 ocNEecCWOtiggwRzSNM0sVpCZ3NzRzRguPLXkxC9sy19g6E2cgdGJ8JvnpJZpvCThTL3
 xpMg==
X-Gm-Message-State: ACrzQf1I+Hco73Occ5mUbZfQPstMzElPUrySB+pyE+OfOt5fpF8fQ5AE
 hfE3UUIxjbxrQpdnbTwICPBBVPN3U1pW/WyNf6oQRcRGm6ZcOJEpqMZQVPdEKFF07XUmfrn3M0T
 fDhZAlq6sygF5TEQ0HHajjaRn0/ZloZrQAAnO8+5ZYzkzCXZWgE8w9LNs4wcW
X-Received: by 2002:a05:6000:118c:b0:236:bc26:7e0d with SMTP id
 g12-20020a056000118c00b00236bc267e0dmr13347344wrx.662.1667405495948; 
 Wed, 02 Nov 2022 09:11:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5T4W6KfurJ++o+YHPiZIrwEiTM2UhnROky8sDuxgZxJ7E/77V6OCLIcGmifG5flfjROTOMgg==
X-Received: by 2002:a05:6000:118c:b0:236:bc26:7e0d with SMTP id
 g12-20020a056000118c00b00236bc267e0dmr13347308wrx.662.1667405495665; 
 Wed, 02 Nov 2022 09:11:35 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bi22-20020a05600c3d9600b003c6c3fb3cf6sm2784933wmb.18.2022.11.02.09.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:35 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 67/82] hw/i386/acpi-build: Remove unused struct
Message-ID: <20221102160336.616599-68-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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



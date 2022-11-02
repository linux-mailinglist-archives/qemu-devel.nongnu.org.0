Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408BA61672B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:09:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGHw-0002XN-Sl; Wed, 02 Nov 2022 12:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGHu-0002X2-Ew
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGHt-00020G-2A
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=DbWbOPfAoR/MG++Y8OXsY70HX47+ZUNMCNlWi82CprIYPEU2uwvutPmLZzegaZ0WRthNww
 ERI9syitdWZ5W2XtGslz9wdma+lGJMtpUedw9sp8Wt1WWMw6HjI+PfBqsGmJ8cIanda2qI
 zM1VvLt4NJoZIrfOgC5GESsYlJ8wJC0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-ixFJ3lSpPpa_w_r-sNrYSw-1; Wed, 02 Nov 2022 12:08:18 -0400
X-MC-Unique: ixFJ3lSpPpa_w_r-sNrYSw-1
Received: by mail-wm1-f71.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso1257443wmk.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qB+QR/y0D4MCSKP9awdun72O5OoRrhEdXbqEi5lEsaQ=;
 b=katkWbrm+XGdynNF9nLnpFAFXzREabTcEzldj9Ju26bAKrIHv9u/m/2WB78pC5Op/G
 xiBjKxYLmFTRcMzd7vQWiHn0A4np7qkrb+JaXkmMCmaumY9b6kQoKVLfvB0rofnxu1fy
 tmo5KUvQ2KSQq6PayQUna3dQYPN47E5vjEJI32rRFhOQaAlAS3Klqxo8R4ivf0C29rxz
 5W2IRTBSCTRVVMXOxtn5d7ypxwqyt6gYPJgvu+KPTrZ4+BI2gDZw/msFwxdY6DOLBevI
 QX9HOQg6pGx12HesIRdPLUZ7HYzY86acR6PUOipszRfnOvdCT+GHlb13q66YMVJOqyvS
 1cPA==
X-Gm-Message-State: ACrzQf1QbusgE5qfAgQb0+HwV4H17acK6cZuGi8R12/KYfgP3iJOLTO7
 7apj9Am19dO1qWXIf0pPhnm/VoIq5d2V1XSpKNqUx07uiH9KzFKjySrl1VUZ1+EbAhYUVLy6v05
 n+YejNPbyGbJ1OCVmazl3kv4N8qSYG5PVqqyxAyV6lxrmZPLXwWnm3i7roH4y
X-Received: by 2002:a5d:522f:0:b0:235:c877:5cdc with SMTP id
 i15-20020a5d522f000000b00235c8775cdcmr16044444wra.352.1667405297078; 
 Wed, 02 Nov 2022 09:08:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tmpzkLf1EJWciYBuB6zyVPgJvBjO+EaB6D9sX3Cp9+5zDQfq2UUckW9LXF7MgAv2FL/gSqA==
X-Received: by 2002:a5d:522f:0:b0:235:c877:5cdc with SMTP id
 i15-20020a5d522f000000b00235c8775cdcmr16044409wra.352.1667405296768; 
 Wed, 02 Nov 2022 09:08:16 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bk17-20020a0560001d9100b0022cdb687bf9sm16169476wrb.0.2022.11.02.09.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:16 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Robert Hoo <robert.hu@linux.intel.com>, Jingqi Liu <jingqi.liu@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 02/82] tests/acpi: allow SSDT changes
Message-ID: <20221102160336.616599-3-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Robert Hoo <robert.hu@linux.intel.com>

Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>
Message-Id: <20220922122155.1326543-2-robert.hu@linux.intel.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..eb8bae1407 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/SSDT.dimmpxm",
+"tests/data/acpi/q35/SSDT.dimmpxm",
-- 
MST



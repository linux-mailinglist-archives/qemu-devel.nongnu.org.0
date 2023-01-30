Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AC681B6A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadW-0003Wx-Vv; Mon, 30 Jan 2023 15:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad5-0002it-1l
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad3-0006to-MO
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BH5qRItfw3u2qE2O9ry4MjENhkBipRofcV3nZ6Eu30w=;
 b=c//3VxSeTmyv/S3Q767u0BPDXiabi511sdy2fysRPiwslksP19wyHMUPpfBPM/AcMcSPXJ
 24lwQk35IoQ8g58CjBXBs2tt5xMzXytp81h8iYE7o+yqSFD+ECOdi8i8NOWtt6prxEZ+ii
 V8Nl2CLQGWbrSFnB+0gUAQkSRpvuOX4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-EZGKIb33PUOViP2m6ke8zg-1; Mon, 30 Jan 2023 15:19:46 -0500
X-MC-Unique: EZGKIb33PUOViP2m6ke8zg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq7-20020a1709073f0700b0086fe36ed3d0so8055414ejc.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BH5qRItfw3u2qE2O9ry4MjENhkBipRofcV3nZ6Eu30w=;
 b=gHjStH/dqwClq8EGzA9i9CV3wTojwK+WEC6Nf0vjH+r/08EUH8ywZAN7Cn0cd9hqyg
 HsAbnCOTwUAbNGW71igyzXlg2omoDtfsMWUD0EG8MAtkL8wkGfozFe/0saD72qwQTGN6
 D4jL5cRRp4Qx8LVHxzDcG5Zzrq1krdbyDEVcB/G1WnJL9hKnWYVz0QdZSyGBpsJh7FgX
 zM1eEeC+cyOHakt+aXwrXEtIGof3hZZQpXl5znWCbPi+xk22X9vcMnqf7sSpwfQJfWD2
 a3vx7kwc2R8PTFmDV5qw/YkmhwR4hOSJdrXl1bEgfM80UGplhxi83po3IZDW3b+vhFT/
 ZKjQ==
X-Gm-Message-State: AO0yUKXv89V6TemUSon8KRks3VwfKkwlHh4la1hez/tL9x846Ts34HmA
 1yjwEi6OFmm0qPmEj1STINuwrcaUEno+5U5o2J3N0iFC/yHzY226hvpSshPZBBI90v7IO1p6L0t
 Bf0S+WDvS0UxYayzR2ESGAjxCbTDxv//dUtgM06NXngb3syquLXvH9M6jiX3h
X-Received: by 2002:a17:907:c26:b0:878:53a5:70a1 with SMTP id
 ga38-20020a1709070c2600b0087853a570a1mr25440717ejc.50.1675109984911; 
 Mon, 30 Jan 2023 12:19:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8wLSlnuYb0jjK2QGvrOzXa8jDZYvSm4MmUh+U7e5uOIQ8PM6G+zi5WO6PMm+ZxTnh8a69ukA==
X-Received: by 2002:a17:907:c26:b0:878:53a5:70a1 with SMTP id
 ga38-20020a1709070c2600b0087853a570a1mr25440684ejc.50.1675109984641; 
 Mon, 30 Jan 2023 12:19:44 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 n2-20020a170906164200b0086a4bb74cf7sm7404127ejd.212.2023.01.30.12.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:44 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 18/56] x86: acpi: pcihp: clean up duplicate bridge_in_acpi
 assignment
Message-ID: <20230130201810.11518-19-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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
Message-Id: <20230112140312.3096331-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 8c333973f9..8ba34d8fde 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -464,7 +464,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 
         call_dev_aml_func(DEVICE(pdev), dev);
 
-        bridge_in_acpi =  cold_plugged_bridge && pcihp_bridge_en;
         if (bridge_in_acpi) {
             /*
              * device is coldplugged bridge,
-- 
MST



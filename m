Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD924880C4
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:58:32 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6103-000194-6o
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:58:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Az-0005HS-6o
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Ax-0002jL-NG
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+s/eLBlC/CuoqRVZrYGYrsH9EkPsepN+hS3IAf50OQ=;
 b=SoMkBvYP1vZrcTikgLqs7iZaN6YuAhKpx1BojxPNAlnruvPDpBGQoQ7lLnWnW0T7WK6XlM
 gNmIJERIMZf0sgOIDmCZXnuZmTk+3fGYRN6Tu9bS7Zv4mrmyVq92oiqJfBejdz21ezLc5M
 3sXcAYeTT8Cp0hdTL/B+Y9940OgZQS4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-ntVPrahoPCu0n7Afb8isyA-1; Fri, 07 Jan 2022 20:05:42 -0500
X-MC-Unique: ntVPrahoPCu0n7Afb8isyA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n3-20020a05600c3b8300b00345c3fc40b0so5618189wms.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U+s/eLBlC/CuoqRVZrYGYrsH9EkPsepN+hS3IAf50OQ=;
 b=sI5vyOB6lOHAZ0c81/jrXUd7gTMf6DzQv76dFIv5l0bpQXA5WFWvxbOQamckFRz1Tv
 aM4NLjH7nd+H12e0y2hzVS+Ewlnbwm85IbUo+2G9rEJtJLGQTWkHi+cufFT2PFQSinff
 35bRFIr7lS7Jv1u8KGX8mCUUvtgvY8CRJQHXZh9ArWE/yh2M3DHDRlW/TkqKQHxUxNb3
 +s6CuyNjVb38T6pdgycnOBCvP7OA/7lkN28HOrBf5bdlyZ60MX89qeTrN1UGxL2Jo0ce
 THdQX7CyHDn2pF+Ii5/K+uSmFcZzP6zvzNKkyJC7lHABZex55WMmaptr7w2t5Txdh1AM
 5z6A==
X-Gm-Message-State: AOAM530Ktv1trToHckci0DaKR7ykmq/smDjzTeOXwccFLCuOKhj/WOgp
 3Q8qm2ZfF1xzS+2OHQzQDLG1zMF0SspbyYd7Yn/os8gw5l909hWuLICe+5ZmVdEDrbdjW6teNv0
 aUI4gBuBgmv+b+Kxp7cmeRFcJJsfi9LwChv2bq4HlZR6wIRyKLUtY473ECmaf
X-Received: by 2002:a5d:588f:: with SMTP id n15mr54566608wrf.240.1641603940332; 
 Fri, 07 Jan 2022 17:05:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwixThhbP5RaKK2SLlswYZMMmesLzXlRD64TzPgqQ8psvLOd2ZsBnirEAQdD9THraNiJLT5GA==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr54566591wrf.240.1641603940025; 
 Fri, 07 Jan 2022 17:05:40 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id w18sm224176wrs.26.2022.01.07.17.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:05:39 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 38/55] MAINTAINERS: Add a separate entry for acpi/VIOT tables
Message-ID: <20220108003423.15830-39-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

All work related to VIOT tables are being done by Jean. Adding him as the
maintainer for acpi VIOT table code in qemu.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211213045924.344214-1-ani@anisinha.ca>
Acked-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f871d759fd..6aa0335560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1777,6 +1777,13 @@ F: docs/specs/acpi_mem_hotplug.rst
 F: docs/specs/acpi_pci_hotplug.rst
 F: docs/specs/acpi_hw_reduced_hotplug.rst
 
+ACPI/VIOT
+M: Jean-Philippe Brucker <jean-philippe@linaro.org>
+R: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: hw/acpi/viot.c
+F: hw/acpi/viot.h
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7476339FF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 11:25:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQRP-0008JQ-Eb; Tue, 22 Nov 2022 05:23:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRM-0008Iv-IU
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxQRK-0004mi-P5
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 05:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669112622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cU19UTpvTyW2lbnyRWSWVel8guq2aRTUFRueobwEObE=;
 b=VxmOZN93/rwTHshEfxlGqzZIsfDsCSBWQueA4lrLcYQ7MAV+XvVYXrDTu1Kin8eWUxfmeL
 ki7qcGb+QeRfQZLhKjmQ5t7CtvUng5ZbMctqkhMYJGfT1h5AX7Lxce3CB7ZecJlGGLRClV
 /OFtWxorwEFOJ/DAifgVuRJsNPIUkWg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-1v3zCLu4MKy8sPP6TxaWxQ-1; Tue, 22 Nov 2022 05:23:40 -0500
X-MC-Unique: 1v3zCLu4MKy8sPP6TxaWxQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso4047162wrd.3
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 02:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cU19UTpvTyW2lbnyRWSWVel8guq2aRTUFRueobwEObE=;
 b=7IyDOZf4tOnQF+Z5RSF2UXHpOuKE3wn8rHXoAlucKABpTfYIWmf5u8XRilEj2d4Dho
 2nDXJzTMR8xBvjygzRK1hp3lkPdyQZKEhF2FwHirju3cLAh3bTCpvEfFdvmqDZRSXoeQ
 wmWWfgP8Zm88kRcdwM0LcdenxznCqOIF2MJrF6tol5m3HUx/0T8zyRNo/HgGWa35H8Ry
 Mzty6S/pcqFbZE2EtZEQaLjZ3H7n6q/haWMM4NqyhnFxb4Z2Yd0L4CPFNo/X5oQZd7lO
 jlpbpdj/st2BN4wa6k1TRS+4vbFM30RDtoLd7u1/Rv/2XZdmVQhrnaS/yEB3YpUJCmGv
 Nrrg==
X-Gm-Message-State: ANoB5pldiPDQ77GBvfri9E1qsYQKn+fjmn+X2D61q70Obt9TF9Riigbm
 mo4deX2O2YFh1r0WVgZv0aoH2hSUdkz8r6WxBM+ZYWjqcOFPYMQr8+5KMjiJVi2zLfb53fCvjXg
 wDd1Di7b3XFwVbb71lC/9lIvthYixESK9hHnVvGkvIbpmyIXL6Koj92kyIuWe
X-Received: by 2002:a05:600c:3ba1:b0:3d0:47c:9ff5 with SMTP id
 n33-20020a05600c3ba100b003d0047c9ff5mr8989177wms.121.1669112619013; 
 Tue, 22 Nov 2022 02:23:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf42Cjh4hb6cy+1bQf9ghLIWb8XCAblhNpVP16NDDE3AMHDbvZ2cDRe4P+2TuRudbPNMBq7H+g==
X-Received: by 2002:a05:600c:3ba1:b0:3d0:47c:9ff5 with SMTP id
 n33-20020a05600c3ba100b003d0047c9ff5mr8989152wms.121.1669112618764; 
 Tue, 22 Nov 2022 02:23:38 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 b5-20020adff905000000b002366fb99cdasm13762795wrr.50.2022.11.22.02.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 02:23:38 -0800 (PST)
Date: Tue, 22 Nov 2022 05:23:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 5/8] MAINTAINERS: add mst to list of biosbits maintainers
Message-ID: <20221122102227.6603-6-mst@redhat.com>
References: <20221122102227.6603-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221122102227.6603-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Ani Sinha <ani@anisinha.ca>

Adding Michael's name to the list of bios bits maintainers so that all changes
and fixes into biosbits framework can go through his tree and he is notified.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221111151138.36988-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index be151f0024..f3e0a4fc2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1865,6 +1865,7 @@ F: hw/acpi/viot.h
 
 ACPI/AVOCADO/BIOSBITS
 M: Ani Sinha <ani@anisinha.ca>
+M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: tests/avocado/acpi-bits/*
 F: tests/avocado/acpi-bits.py
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF9B48657F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:48:32 +0100 (CET)
Received: from localhost ([::1]:46618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T83-0003qA-RH
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:48:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Seo-0005Tj-3B
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sel-00011S-Mu
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+s/eLBlC/CuoqRVZrYGYrsH9EkPsepN+hS3IAf50OQ=;
 b=gX/Lz7dYpjLN3J3posaDK3jybhCeNx2nS3p8sqjKvdMgA9NOABnL+YDcxyjp6iPDqXYKjP
 axG5vhzTli5b9gB8i6MPYFGMzK71NsOcOv48XWRAkk9LW18k8BAJWSyH2AOLM2ubv5IlaJ
 bcFujJrOwr6SeYdlpJkqiNl/56svZgU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-aWw69w76MAyrx208Wk3YMw-1; Thu, 06 Jan 2022 08:18:09 -0500
X-MC-Unique: aWw69w76MAyrx208Wk3YMw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so1939837edc.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U+s/eLBlC/CuoqRVZrYGYrsH9EkPsepN+hS3IAf50OQ=;
 b=Ny6soGs0lZgJHIRvvpsTfzbmcg4fdMataiA70Gbn1IiFs8nu5H1yzKz4nL5Wli/jiJ
 UzqqRet1yklBq3s3FGICNvLVV+ZUj0drpFv+divltYk7Ws+eO/gsv7L5CgEXuX8RSBnN
 v5U5BbSgBbL4uJANlFtERgbYjo2a3YmXDk1mkmbXxEX/i9tIYfUs7vB47Ajco/9duKU6
 6V7qrqcfSqQOnnjS02FrkpSyLPwLgjmSh7CSaGdaJ/56ujQdfCMz26cEmOtmXHhpZDFA
 +BFd/OVn5Yo/h0FJ0l4QoOt3a9rHy/v+IDu3Iov5hxKcK4rNrKVHloyMGyChXrumyFPL
 JOtw==
X-Gm-Message-State: AOAM531unJxCgAMIFWOZZaVsbyOqjusCr0B6yLd3U2jA401Z87qj2lVc
 +kni1/OXnqOl6tB1RsWKDfRn1JqXWIolUppUGUYAB/U74ibvo4Zv/+aOa7PnpqAzDwt3WMx1lhr
 O2OAEC5a80qg8zpuJHMizW7BdHorbzeTWOk6UpXG3e2nMPzyq9Dg8UT5WwQC0
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr31853322edt.60.1641475087969; 
 Thu, 06 Jan 2022 05:18:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHvUk+02uInteZne1RrGvuEwi1tewCxNY5TrNmbMMAenROgDb4odAJLu5nwZqEyjWpA/Mbdw==
X-Received: by 2002:aa7:cc10:: with SMTP id q16mr31853301edt.60.1641475087815; 
 Thu, 06 Jan 2022 05:18:07 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id hd43sm490979ejc.62.2022.01.06.05.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:07 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 38/52] MAINTAINERS: Add a separate entry for acpi/VIOT tables
Message-ID: <20220106131534.423671-39-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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



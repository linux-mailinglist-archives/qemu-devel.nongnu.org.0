Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849C681B5C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:25:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadu-0004Pl-0z; Mon, 30 Jan 2023 15:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMada-0003r5-0z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMadY-0007Av-DF
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qHK7YhyLFZo3ZJSLcPiq2m8TN1x87B4UCcwjnH53u8g=;
 b=VamUckHRNIScDaAifq1iSSXb45d1KzS8Gw4l+v3TNUeM0DDx+PmGU6lvkdgnDhon4rJXjN
 xwZZSF1fJharVtk18EoQtpGies3qNXO1zGinwzQdDPjKwS9ITAvcUsARpZ4EgYTq6REjB2
 iz2JGDC6s1XAN13dLFN5nvUqBI7YynM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-DuIKGhJJMYCqVieSLmXb8Q-1; Mon, 30 Jan 2023 15:20:16 -0500
X-MC-Unique: DuIKGhJJMYCqVieSLmXb8Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 d10-20020a170906640a00b008787d18c373so7035336ejm.17
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qHK7YhyLFZo3ZJSLcPiq2m8TN1x87B4UCcwjnH53u8g=;
 b=XDrvQd9hj7INmqBq9/jbe4Iqhl3T86c6BoNj0YnZ88/uGo0b+sy/KFS1rf66eN+KOA
 OuiFeGRPKWUD5UIoyqegSQUBaChhq1Fyl7++lp6i8WJ4OWthQ5fn4Mkae5RaebMwXu5A
 7OiOGMz4JvuY39SrK9h0+KUgr7GArRN2KUCESX+bXyNtjKq9TMwqbkHt5LhjAVEfo6nO
 I5Tm5+v3rZq9q33NC5+eGQTh2KBXm2cx6PZJupythZ1wZU0ZNVEirPL0l64Z5qF3tfeY
 VHdwxaNDqqEPdfj1E0PO/M5PS5pf7WobHOuwA9EIBu/WJcxNRmtFnLOtsTI3i0vkIEgC
 sYPg==
X-Gm-Message-State: AO0yUKVd3bYn3D6u3mQDPLnFgE2HIf5gj/B3CH3RA/lQK8B90FhL05eW
 +o6Med0L+dosOD/PUM3U/+cjT+lYI+z45jgbKaMdpRtJqh+q7c051jinxnjkq0D2AR9W3YZe1ab
 KLL3w9tpwvL2loT3gkcEiMgVwKt22yznsheyT06BfPNj9MfOIJ1mfINO993mQ
X-Received: by 2002:a17:906:1793:b0:888:a32d:b50 with SMTP id
 t19-20020a170906179300b00888a32d0b50mr5286048eje.40.1675110014912; 
 Mon, 30 Jan 2023 12:20:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+XKwy82YLaukmycMtKAJVhmmto8lnHTm5LGIIxTycF9UmdvOERSUvLZeyygk9ioIiaOssD4w==
X-Received: by 2002:a17:906:1793:b0:888:a32d:b50 with SMTP id
 t19-20020a170906179300b00888a32d0b50mr5286027eje.40.1675110014675; 
 Mon, 30 Jan 2023 12:20:14 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 i4-20020a170906264400b0084d35ffbc20sm7351989ejc.68.2023.01.30.12.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:20:14 -0800 (PST)
Date: Mon, 30 Jan 2023 15:20:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 27/56] tests: acpi: whitelist DSDT before refactoring acpi
 based PCI hotplug machinery
Message-ID: <20230130201810.11518-28-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-18-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..dea61d94f1 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.hpbrroot",
-- 
MST



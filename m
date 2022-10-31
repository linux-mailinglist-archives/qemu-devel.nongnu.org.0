Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5346136E6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:51:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFo-0000GV-Pq; Mon, 31 Oct 2022 08:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFh-0000Cs-8W
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFe-0002Bu-RY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSp/4lHAXuOsrwqOC5Motkbb8RzEYnMS/koDLG8XNFw=;
 b=LJE2T5h9DwyJvbhEEPu+BjhIla+cEKgTjpkvSwypdqgWaKRvmEcwuofafSGuXam1Cc+jq+
 yO6Q+7CT3UKmmn/QgLhVtO0yDUYDN+018pV54DlQl933k1mXBugnO2W8Ew0jSA6Uqyppvj
 mGU8ZU8C+VwAG1h8lsyhwMsilB8dsKg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-XcqDq8EVNaqvTBkd0okFCw-1; Mon, 31 Oct 2022 08:50:47 -0400
X-MC-Unique: XcqDq8EVNaqvTBkd0okFCw-1
Received: by mail-wr1-f69.google.com with SMTP id
 w23-20020adf8bd7000000b002358f733307so3026564wra.17
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KSp/4lHAXuOsrwqOC5Motkbb8RzEYnMS/koDLG8XNFw=;
 b=HRLUfyxZ38eEskL5X6q/puBvmpO9+4+wQ+wdXsmgIOU51JGaY347CVB/kaSrFtZs6x
 /kOaEea5ZYa1R9KkUV8CRNAfSfbdLK2OyuaMIoEas8p9cVPzyu8rbH61EkMWNOcu5jT1
 TGvFIFyUh5ovRNNDD9lxa9firkbDROtF/8v2P4MZSYnQaVtJUOV6crzpEtDj4QOwdcD4
 1xX2+H0256xxjGKDNlswM5+R6XHwOH6MoyE+lrRT78H55xf9pYkGqRAvD30x6gqV/ej0
 VZlUJdqECQYF0MLxO7VJY1ehvzGH0ALQ9udgStz8QGrKS2B/L80J9bmhEARvGNsfmn7K
 VXzg==
X-Gm-Message-State: ACrzQf3Ks/5MzRZ1sllJJo+jKUG63gApEF6iwT+w8qzlbD7s2rd9Lc3s
 IRtoLC8m3c7V9Dq/PjDQ5zADm0weByAN6hakG4x+srfcvz6myK3sbevYh5usjuvJF5pDvVZgU76
 Yc7azTit5Ro4BFQA6Jmx6mgTFHk5nU/fKki1au0WMCkM0FsGTsYEwt7lmOQgx
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id
 n19-20020a05600c4f9300b003cc9bc5c454mr8010639wmq.84.1667220646569; 
 Mon, 31 Oct 2022 05:50:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6GZX6Zmpmm/8XxCqmJ+Bhk4zbo+B3QB7MQbj0KZUzTU3+wLuREVb2rqmCoxj4dNM01+zzGHA==
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id
 n19-20020a05600c4f9300b003cc9bc5c454mr8010621wmq.84.1667220646255; 
 Mon, 31 Oct 2022 05:50:46 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t2-20020a05600c41c200b003c21ba7d7d6sm6974633wmh.44.2022.10.31.05.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:50:45 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:50:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 01/86] bios-tables-test: do not ignore allowed diff list
Message-ID: <20221031124928.128475-2-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

we had such a beautiful structure for updating
expected files, designed to keep bisect working.
It turns out that we ignored the result of
the allow list checks unless all tables matched
anyway.

Sigh.

Let's at least make it work going forward.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e6096e7f73..a72f6ca326 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -458,7 +458,7 @@ static void test_acpi_asl(test_data *data)
                 "for instructions on how to update expected files.\n",
                 exp_sdt->aml, sdt->aml_file, exp_sdt->aml_file);
 
-        all_tables_match = all_tables_match &&
+        all_tables_match = all_tables_match ||
             test_acpi_find_diff_allowed(exp_sdt);
 
         /*
-- 
MST



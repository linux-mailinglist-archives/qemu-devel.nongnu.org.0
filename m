Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCE4348D9
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:22:26 +0200 (CEST)
Received: from localhost ([::1]:43760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md8jp-0005GC-Tv
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gs-0002km-NU
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8gr-0002bB-5m
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWf29uc3qYZQ1YtyfEGbkZhDDSeIdnNB9/3KYMX/bN4=;
 b=FNEW8LUUkrc0w5ghErhQKJtmOFQYI+LRZydOXiGlHqTHXM4izVn9mclllrMkj/zR4fDB8P
 6Vflsva9EZKbbFZXBqDuLvwVrHD6ejBXKh7mdkw7p5vvaJ0L6x2pyvFxivVCRy3lWTc2+H
 fpr8pIIlDXeVWtx0kdYt51Q31P1Ud9w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-Cvk58VbNM52KFICd68ZEsA-1; Wed, 20 Oct 2021 06:19:18 -0400
X-MC-Unique: Cvk58VbNM52KFICd68ZEsA-1
Received: by mail-ed1-f72.google.com with SMTP id
 g28-20020a50d0dc000000b003dae69dfe3aso20514415edf.7
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:19:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CWf29uc3qYZQ1YtyfEGbkZhDDSeIdnNB9/3KYMX/bN4=;
 b=TPUoWXXjZEDdge9rqwGP7fp9OMlB+JtcQQiy6ouutD/H4cKgR3GbuY2zpG/PsVk8Ea
 h6ZqGXO1/n+nXzSh5ajKtouIipqCW/rjEBMSi5za6GV/8dxyhBdS5/YVXG8SMNUKhGCS
 NHClVTr41Kfba2CHdXOUkq296EZ/pXH/POl6vl3zTMzIXbjFqqHrYdEOy/DZrVPeTtgj
 PgrA759MkgVASNopEvJhkETFFO2gfi9FMHruNVHG5YKkAlGj3OqGXASPrpbCefnLle67
 57n1te5qOSTjfvZdrhowsCVjVWa1tyknol1F+GrNKVB09nFqST7RM/8oBMNlxf0a/K/3
 rDPg==
X-Gm-Message-State: AOAM532vOXpqfQ33EmOqpQVSXvgV3ssfQSrriaSPYdZwcdORFqDmp+IJ
 LUldzw8SLGbf4XaqBB6NabMcm9QbGE4WUnfHfX+v0Y6rR71/0i1DIaE4JrO+VgOXqg4JaJQDekM
 OarkawvtFBZMA6Pq7H2WY2A/RZsnCcmNg6ao8nq1hwOp8BVJfypdOUUOoT8fy
X-Received: by 2002:a17:907:d89:: with SMTP id
 go9mr34199560ejc.451.1634725157366; 
 Wed, 20 Oct 2021 03:19:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBFmjpfoyst+9j0hshERCjvixFLiP7WJ+ccd/60Nv0WQcZB1YjUbGj4RzjqxMFkYFVFuHi2Q==
X-Received: by 2002:a17:907:d89:: with SMTP id
 go9mr34199532ejc.451.1634725157136; 
 Wed, 20 Oct 2021 03:19:17 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id og39sm809279ejc.93.2021.10.20.03.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:19:16 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:19:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 01/44] tests: acpi: dump table with failed checksum
Message-ID: <20211020101844.988480-2-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/acpi-utils.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/acpi-utils.c b/tests/qtest/acpi-utils.c
index d2a202efca..766c48e3a6 100644
--- a/tests/qtest/acpi-utils.c
+++ b/tests/qtest/acpi-utils.c
@@ -98,6 +98,20 @@ void acpi_fetch_table(QTestState *qts, uint8_t **aml, uint32_t *aml_len,
         ACPI_ASSERT_CMP(**aml, sig);
     }
     if (verify_checksum) {
+        if (acpi_calc_checksum(*aml, *aml_len)) {
+            gint fd, ret;
+            char *fname = NULL;
+            GError *error = NULL;
+
+            fprintf(stderr, "Invalid '%.4s'(%d)\n", *aml, *aml_len);
+            fd = g_file_open_tmp("malformed-XXXXXX.dat", &fname, &error);
+            g_assert_no_error(error);
+            fprintf(stderr, "Dumping invalid table into '%s'\n", fname);
+            ret = qemu_write_full(fd, *aml, *aml_len);
+            g_assert(ret == *aml_len);
+            close(fd);
+            g_free(fname);
+        }
         g_assert(!acpi_calc_checksum(*aml, *aml_len));
     }
 }
-- 
MST



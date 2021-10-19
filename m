Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1537C433499
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:24:19 +0200 (CEST)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnEA-0004wB-5k
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9s-0008HB-MW
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcn9n-0001hk-NN
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWf29uc3qYZQ1YtyfEGbkZhDDSeIdnNB9/3KYMX/bN4=;
 b=ZOiRjzFaYYtff0x79tSQlRknyt30daiCTV/ByePjJnqsabc/FFB6TStanyf3Kf+5RYZ3pA
 LNho5W0FGNqrHTjf6C3ISXCuvT7Y1OpB5b1kBKSAWU2UyPMx47jgjq8YD2fZROxpWTkdqe
 1wj8KvduDqOdcZRu+u80LeYpYJseg+w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-bh0co6WzPU2HJI7rbmc5vQ-1; Tue, 19 Oct 2021 07:19:45 -0400
X-MC-Unique: bh0co6WzPU2HJI7rbmc5vQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c25-20020a056402143900b003dc19782ea8so13792517edx.3
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CWf29uc3qYZQ1YtyfEGbkZhDDSeIdnNB9/3KYMX/bN4=;
 b=breDO3Fz4/ZLIfW0rWvVVh+DdbTIwvbPbBrte9KXJd/r04EVLdqgUms8pYd2MwJXm5
 /CWS5cPUzojBv1v552fdzJelZGMhYbMUzRqoJgQS+v6Xol3Vxu6LbZ04SJe2lkPReFyP
 hi1xgrZSX34kRWtQZoxx3nIncpHEzOaK5JB3I1gf2hrMVfgASzFvXrIauys8ZzM/csuZ
 aVqsk+zdEYGEN9707YAQoO9sQwwlE2rLlOBYxO7RVOsvmC/UOonjyr0QVf7k6DA2IHV6
 Ehvypm0ImoPKFUAbORfS8G/VdJYHy/g3o/2BRHTRtKHteyKptg9euuehbNhKhCWhYI5a
 puIQ==
X-Gm-Message-State: AOAM530TUx2l+q5CfaCGlelqIzyHbz08z8e3Am1OqpNRGdqXeyW6se6n
 E49I2W1lg8FzK2AjVl9jwxAchs9ejNcnP21THdkFGch3JdP5RBWYxcnPCKNLG4x7ESVF4fN1QBM
 3vCqQX/oDGdje229zcikS8OwFwrM8/WXTZ7L8GPpUPkeHeyP+Kwrm46xOxf+a
X-Received: by 2002:a17:906:520b:: with SMTP id
 g11mr37112980ejm.502.1634642383674; 
 Tue, 19 Oct 2021 04:19:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlwNAPewEJ8EJGCcM3Pm22aXQOZ3mqXkuljyJihZe7p/yJJ6i5kKbjnYJAx8HV+fzE7gKwOg==
X-Received: by 2002:a17:906:520b:: with SMTP id
 g11mr37112954ejm.502.1634642383476; 
 Tue, 19 Oct 2021 04:19:43 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id bq4sm10170654ejb.43.2021.10.19.04.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:43 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/29] tests: acpi: dump table with failed checksum
Message-ID: <20211019111923.679826-2-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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



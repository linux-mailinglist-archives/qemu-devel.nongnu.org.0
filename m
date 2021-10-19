Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6E433498
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:23:37 +0200 (CEST)
Received: from localhost ([::1]:44812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnDU-0003Py-5u
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnA4-0008U0-Ro
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnA1-0001qw-J3
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ye8xamo/xFWVL8QWKzRp1k9WG6eLXO+rQQkUJvOw6N4=;
 b=NwekmdHq8is7OMDd9da8iqOLaOh4OVaXsDg8I9sgtDfuoUF8/BJUXsAzZcP5wnPRETPbmd
 mtcWT6D5bbMJT5bBD7uRY5fXH8SIjFhpJ5uhwvj56KkSJtC/hDFRlHGXqrtCMaK78R4wCg
 HQRGczRhhFNZx0AM+QyuVavDPb27+1M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-3sH8-4mdM6CeAZQE0I-T8Q-1; Tue, 19 Oct 2021 07:19:59 -0400
X-MC-Unique: 3sH8-4mdM6CeAZQE0I-T8Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 a3-20020a50da43000000b003dca31dcfc2so859240edk.14
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ye8xamo/xFWVL8QWKzRp1k9WG6eLXO+rQQkUJvOw6N4=;
 b=p/c/oRe503rDale/acRBaHRRS/IXg4sdO6lbKpikYYtsTwsJSpHEEd+pLz1+Ri8Cb5
 rsQ3+iPVYh93cI6ryOYhVm6KHjft3ID/ObXbRm60SPaIkgEHksF91JQUUKBkEzsvIXz+
 A38oyijIe6udcByzTM333KKpSNPF7iWIj+MbF/MgSv+p4UdlvbvpM/8oSkqsHTEMlakX
 b+TYm4jeb5Zbtc7yWExv2nue/huCIKMwf2k4Nzat5grzUlzS+F1MX5P1y/h5FMyWgpwj
 NQ4dgaqeiJNljjiZZWra00whloBT7URLzmA7SUqJkKFI5EWcTvBcKn60C9s8Fhqjm9qb
 MOiA==
X-Gm-Message-State: AOAM530oIL9nY/Nhvnuo6GsJLZni0IUPzkK4IyheG/7VymsN6Bmlh23r
 x/Y+sFpnQppK95J6mAVDDFj7TlVJATxJDBAQ2X/zun20/mSWzUVqwIOwwrwI3TpDdSVI3ZMTRki
 WlYZIrM6cz8e4LecPAU1PqO8vo/734erVaEV9LcZz2fdsnDfIlnmEObeenfXR
X-Received: by 2002:a05:6402:515a:: with SMTP id
 n26mr189702edd.68.1634642397977; 
 Tue, 19 Oct 2021 04:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW0iw3e5msZ5pMKj4TpL8PmWk5TnznmdI10XI/tb0Y9zXCwWC4SQp0m46ZnFAPiQZxb475/g==
X-Received: by 2002:a05:6402:515a:: with SMTP id
 n26mr189673edd.68.1634642397763; 
 Tue, 19 Oct 2021 04:19:57 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id y30sm10313713ejk.74.2021.10.19.04.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:19:57 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:19:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/29] tests: acpi: whitelist new expected table
 tests/data/acpi/q35/DMAR.dmar
Message-ID: <20211019111923.679826-7-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-7-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 tests/data/acpi/q35/DMAR.dmar               | 0
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/q35/DMAR.dmar

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..a2843335c8 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DMAR.dmar",
diff --git a/tests/data/acpi/q35/DMAR.dmar b/tests/data/acpi/q35/DMAR.dmar
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST



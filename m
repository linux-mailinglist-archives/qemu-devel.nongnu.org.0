Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57B6AFC02
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 02:16:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZiMD-0004df-1C; Tue, 07 Mar 2023 20:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiMB-0004Vl-Hq
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pZiM9-0001fd-RB
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 20:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678237957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gW+p6KyETzsPQsf4toG486wSUbl2JUTVEY4se5cpAEw=;
 b=EsH5N+NlEZ3aMKQecuG5UacMVabw/2b70sQKCMwqy63GrM4a/K0kd1QikaN8F+QDn3Ggiz
 yDp6P/7D7tHDCDFedfLkNGgU0v3X4Ft5e30N64/gCuAjAblC3D2h9kPsQzVZlJx6wP+sMn
 xxYZygVBeTKBsioJ6c0B8eXmH7mV3GI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-WvdJPXhBNE-rb-Pkye0KMw-1; Tue, 07 Mar 2023 20:12:36 -0500
X-MC-Unique: WvdJPXhBNE-rb-Pkye0KMw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h15-20020a056402280f00b004bf9e193c23so21674180ede.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 17:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678237954;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gW+p6KyETzsPQsf4toG486wSUbl2JUTVEY4se5cpAEw=;
 b=KqhZX1L18QI1SvcewCMze5SXXFxyGAZ4cl6hBe6pHr60froPlBg2bXuDJ3IQ9r3sm1
 pOcc9w0Rq1gH2YhtLagOOoRfU+1nubRnfNtgrvJORsmMA38hFsNBtj9RNc9ZLG/bHj3j
 yDFyb5qbMOtt9cIiPMwLz+t9bVuWWK+BfeLFUH+ZWnStsvQ8xyHPCyybI+V7PC35L9cx
 cI25HUjYDOuwwuVN2tzBO/1iguCJCm+pkSoAEOIDguO5QlltlFNjlB1UJabkGWXYOy8U
 /KUSb3kKtARG6mjrUT2pefIp/t8VbOO5OkUAv7vO53fBxvtP2nevc3gtkK4aaCuVBRC4
 zfrg==
X-Gm-Message-State: AO0yUKVk/Fc599Kh6OuwN/0ofuiEA6AUhziqgfmz9ZqSVdqewRlEHOph
 TKLtIk4bJ5Hrim+27TFNci3EV4ycr8AA7u3uwY6LLqIxKHO6clzmQnWMG8FjFhAonrUtE6XfPVp
 b1c6irYCFuBPF5LuENuTqDd9zjKPkR9ZyvpZ2eE+eqTvsPs1ez7xl0tULRvOWeC41IrSL
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id
 sd15-20020a1709076e0f00b00907672b736amr19718110ejc.31.1678237954421; 
 Tue, 07 Mar 2023 17:12:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8r0MR/Uha7cCQj/qzFfblZw7hKhVnbC+jCJ8ukTdBvx9iIY12JHu7wuO7r2OYHtAFQCswv/A==
X-Received: by 2002:a17:907:6e0f:b0:907:672b:736a with SMTP id
 sd15-20020a1709076e0f00b00907672b736amr19718090ejc.31.1678237954121; 
 Tue, 07 Mar 2023 17:12:34 -0800 (PST)
Received: from redhat.com ([2.52.138.216]) by smtp.gmail.com with ESMTPSA id
 gf7-20020a170906e20700b008cee005346csm6778369ejb.34.2023.03.07.17.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 17:12:33 -0800 (PST)
Date: Tue, 7 Mar 2023 20:12:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 34/73] tests: acpi: whitelist pc/DSDT.hpbrroot and
 pc/DSDT.hpbridge tests
Message-ID: <1c103f35d19601d6ded430d4303be8d3b9ff44bd.1678237635.git.mst@redhat.com>
References: <cover.1678237635.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1678237635.git.mst@redhat.com>
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

follow up fix for missing root-port AML will affect these tests
by adding non-hotpluggable Device descriptors of colplugged
bridges when bridge hotplug is disabled.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230302161543.286002-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dabc024f53..a0dbb28cde 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
 "tests/data/acpi/q35/DSDT.multi-bridge",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
+"tests/data/acpi/q35/DSDT.noacpihp",
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D71372266
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:22:34 +0200 (CEST)
Received: from localhost ([::1]:59976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldg1R-0001Os-RW
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqi-0005sZ-UP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqh-0007bn-27
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
 b=GCIzfmrAAB7NZyClscJDsPurW1/JxJdgWTai5LiHfxF6SMx/dKYp3Yz6ogVtjeMzeD4t6/
 Hn+Z36Acsje3mk4HxQQYdGkQrvtFkCyQ93cLCReBeFV9FEpX8iagVBZmNTZ59VrhbiCS2E
 Jq1HAkcebsB1UrhDAwO5UZslxWjAuFY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-3YleP1drO8WrSxSvqWIBuA-1; Mon, 03 May 2021 17:11:25 -0400
X-MC-Unique: 3YleP1drO8WrSxSvqWIBuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso4646272wrk.14
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
 b=eCykLPOIp79ij6Tgpn5P3YOsKcRcBjdN+HKf+adB8caxOPKtcXL/Qi9zyj007Tn76k
 1okDFVzwsVh6oib+WnB1npd1p1IDK1Ugkes75xvM3lKSYrYXF4vweSVpURwi+vye7x3W
 4c2qQYnLs4PCaF/g/u5eDyESJvogh0iHqpEoH+F9P9n15GaTvaqxz416w51ORxN3dvce
 6n4bU7Er3p7se96z40UyBTipyJaqh+6ar7+H+4NrEBHzDcOIt96UDJDrLkyXAuH8AmFQ
 OB8n8inglbUR5XN5+YS34oWIcuRVj5cgA6qP0jOaLPOBIA9TVrXFfTlgE5DQ7RJ/kOAW
 huBg==
X-Gm-Message-State: AOAM533sWYSI90PvGSNJta/yaSqz6Er0tFJ0g+ir1lej+GMqFksC7fZ0
 prvmyk3qdqvte06Ud+BtkPxV6/t08I8nMKIzBxNwuXnqzHYShwj1dPKXppq24bhrbPbeA+0bNGK
 VZ9M8WaeAPO6fdbLTZvo2mry8gCNBWbg7PrUmYqMo+5DSaib+vOcLnlCDees4g3QN
X-Received: by 2002:adf:f205:: with SMTP id p5mr18206960wro.170.1620076283704; 
 Mon, 03 May 2021 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynziO9W07375ur1IXn0hlkC4Sug+UJ2gkHku/DXA/E/UX7wzftbA88fG0vF0Wn1SY/2dWasA==
X-Received: by 2002:adf:f205:: with SMTP id p5mr18206939wro.170.1620076283523; 
 Mon, 03 May 2021 14:11:23 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id g13sm9225576wrd.41.2021.05.03.14.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:11:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/12] qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Mon,  3 May 2021 23:10:20 +0200
Message-Id: <20210503211020.894589-13-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c767389217..46de073d155 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -175,14 +175,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.3



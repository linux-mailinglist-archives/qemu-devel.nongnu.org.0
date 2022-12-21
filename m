Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46282653174
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:13:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynp-0006eM-S4; Wed, 21 Dec 2022 08:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynb-0006CI-FW
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynZ-0004Ud-80
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mpG/jeKoXLsRSOdYYmlj0uBig3MFnGjPLR17hAdlVik=;
 b=Zg2Fqzqyds9kHN+sslXL0H5Vcn5MVH7Sbf+zWeJzxZhcA6NkGXGsObr+/ZijhTeRAoLqSO
 eGnfxMZ6ltVIvWyg8VissNBfo5+cU/Sp4nSbGqxw4+ffAUfL/lspMLL0A4TjUPWD78Ekt9
 c5kuIGbfGdu6v3kC2+F8pzO/7o3WJc0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-187-nmgb7f8CNhG7kbYH6j1K0g-1; Wed, 21 Dec 2022 08:06:15 -0500
X-MC-Unique: nmgb7f8CNhG7kbYH6j1K0g-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso7930843wmh.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpG/jeKoXLsRSOdYYmlj0uBig3MFnGjPLR17hAdlVik=;
 b=sXKXiNXvD7RHP+gMwVm2gKZsE7Ns6qPTDNNLFXo08tAJz8oB9LegTgLHlwV3TbqCsu
 qodvZ30yHOeSYGh/sEpC3M5SyzJNJb4UMeRppdogCkuQ5ICYyij5c1jsFYIagt3Kq4R5
 xX9MHPhY7yODIBr/NHS2PG44+xNQuBCDXbxf+JdIfqec0PcT9fhh21ory15mldLOebZz
 2uIEm0sK+qrieha8fLBxF3KofOchhi490Jugf8KJWbVq+mrL4hu2tXrJgEETQIiBJU7j
 mDojcYIOIoZQjjJqVFJlGRpxnWcnjLbrqWIZL1M2KX7wDlaeepVEDDrRcNQQgkB9LjF9
 jNgQ==
X-Gm-Message-State: AFqh2krhO5sLV0YnF73ICFGzc8cQmweJGc6Pitzlt5YKAcI8OmzsCEi5
 7kBoakksHTEoqUVzhHvrvKoZGKXSRlBxmF8of+3LZtRlDZ9+uPEhDiPLkY1dLyhg+DYUKWAb/Jh
 IcaS4jIzd8yNYx6LKRIKNlAK7z/24MovnvMGCRFEIv9Qkkx4budaYvNYJUXdw
X-Received: by 2002:a05:600c:5024:b0:3d3:55ad:a114 with SMTP id
 n36-20020a05600c502400b003d355ada114mr1593064wmr.38.1671627973834; 
 Wed, 21 Dec 2022 05:06:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXseDmIcDJ4bdH0VxyoYlEVVu0EQv8Ynit9Lly+uHQN9u9ixQMZ357d5YTyL3yGKONyrdsl2BA==
X-Received: by 2002:a05:600c:5024:b0:3d3:55ad:a114 with SMTP id
 n36-20020a05600c502400b003d355ada114mr1593046wmr.38.1671627973603; 
 Wed, 21 Dec 2022 05:06:13 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b003c6b7f5567csm8660060wms.0.2022.12.21.05.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:13 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Cleber Rosa <crosa@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 31/41] acpi/tests/avocado/bits: add mformat as one of the
 dependencies
Message-ID: <20221221130339.1234592-32-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

mformat is needed by grub-mkrescue and hence, add this as one of the
dependencies to run bits tests. This avoids errors such as the following:

/var/tmp/acpi-bits-wju6tqoa.tmp/grub-inst-x86_64-efi/bin/grub-mkrescue: 360: mformat: not found

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221203132407.34539-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/avocado/acpi-bits.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 898c837f26..14038fa3c4 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -50,7 +50,7 @@
 from avocado import skipIf
 from avocado_qemu import QemuBaseTest
 
-deps = ["xorriso"] # dependent tools needed in the test setup/box.
+deps = ["xorriso", "mformat"] # dependent tools needed in the test setup/box.
 supported_platforms = ['x86_64'] # supported test platforms.
 
 
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288165316F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:12:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynm-0006YE-QI; Wed, 21 Dec 2022 08:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yna-00069t-AG
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynY-0004UQ-QU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2wt1xLPFdliQkR7s/8RJDYVOUgSrTEv1M6g0dTjSMQ=;
 b=Z94o4Zy7Q09y1+mYv8kM0NZhRZ6C3lr8GWkdDWI+84KprmwJJ/f7iekiFJteIx4FRbZQ+T
 sbnaMLc/eEhK9C/WkahJ/WF68jMXTrag5LcFuILhjFdRW38WaDerySa7u8loMKV2h69EM7
 jDBDblwYM4+CtpR/OC/Hcq9vbKneCnk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-yeAQ-GwgPXa7LMNtroYWAQ-1; Wed, 21 Dec 2022 08:06:12 -0500
X-MC-Unique: yeAQ-GwgPXa7LMNtroYWAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so2881917wra.17
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y2wt1xLPFdliQkR7s/8RJDYVOUgSrTEv1M6g0dTjSMQ=;
 b=KIFxdgJ+AESq8AwSaLHkiHNvg/yCC+KQ82h9JGe5LwzzzhD8Rp+0MEW9ZVZOl8JCLn
 cLb/ch8djsMpP5lJiaUc/6RYLGa60p+IE4mjBfqNCYttrAAiFQALmB0vNrD2GsavaKxZ
 dCXsEi+PMsBrFcPEWMczCOchwKWZafUj7r9HRt5R+dZ38qjXfk7c9uTeCi2eZ+NYpqGM
 GnTevGLZsTLcPxmMP7KYXzkbN/d+F8RkyskICJ7ic+zc3DQSBKTOEt76mt7YEH3a8Ceg
 4x+hmR16obl7FCH4Z4x7e6rb0OPQ66ptvKwPgq59CUfBarUQV9nHaf4RPoiuLoFMlhc9
 uqkQ==
X-Gm-Message-State: AFqh2kpcnwKkr4MF6opU/jJjf3/SD6nrvo8CUoRK0eLCh15IOgUxTwhM
 oTP6NWoOiykeVc+YogpM8U5v0evmyU4SmhSU6EYohwTI5y5MG65Y0zdxjd8hF/mxToZTV1TggZP
 M+lQp1e5LyTXs1jm+RffMlskhknaCrhnQTLIsNDeLPbWYnUNcoJalKHpSKVEt
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr1562165wms.36.1671627970796; 
 Wed, 21 Dec 2022 05:06:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsAx9XXA6PN28ZoGcBqWsXANcQJXMt24tdPb8O7yCvmkyQrCt+6Om5EWj2zlTAjih4B2ZQviA==
X-Received: by 2002:a05:600c:1d20:b0:3d2:2aaf:316 with SMTP id
 l32-20020a05600c1d2000b003d22aaf0316mr1562142wms.36.1671627970478; 
 Wed, 21 Dec 2022 05:06:10 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 v192-20020a1cacc9000000b003cfd4e6400csm2143247wme.19.2022.12.21.05.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:06:09 -0800 (PST)
Date: Wed, 21 Dec 2022 08:06:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 qemu-trivial@nongnu.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PULL 30/41] docs/acpi/bits: document BITS_DEBUG environment variable
Message-ID: <20221221130339.1234592-31-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Debug specific actions can be enabled in bios bits acpi tests by passing
BITS_DEBUG in the environment variable while running the test. Document that.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221203132346.34479-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
---
 docs/devel/acpi-bits.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 4a94c7d83d..9eb4b9e666 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -52,6 +52,9 @@ Under ``tests/avocado/`` as the root we have:
    for their tests. In order to enable debugging, you can set **V=1**
    environment variable. This enables verbose mode for the test and also dumps
    the entire log from bios bits and more information in case failure happens.
+   You can also set **BITS_DEBUG=1** to turn on debug mode. It will enable
+   verbose logs and also retain the temporary work directory the test used for
+   you to inspect and run the specific commands manually.
 
    In order to run this test, please perform the following steps from the QEMU
    build directory:
-- 
MST



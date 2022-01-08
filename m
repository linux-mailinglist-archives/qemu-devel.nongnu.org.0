Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E4B4880AC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:47:44 +0100 (CET)
Received: from localhost ([::1]:58768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60pb-0005M4-J3
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BL-0005rE-9u
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BJ-0002mf-VK
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x73NwhE1Jj1XHK61J5GDiGXpI7lT6xn6KSYOADx705c=;
 b=dRPCDRVYETCvCd8vwOybya5l1Xf0VwgxxEtYd+glFkR4GJPkbfnm8cHPSmvcbbvLliNHLN
 sOda9H7vdn4NjTf7ZmxmyW2kKHZXBvaEQM1FgZwEadKJopeDut1J7lkYWm/nKoAvjV2n38
 +QhiB+zzCXcses86wNnNiKdnBFWCwU8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-W56Gv3xrPeWYLzX8Dbe7Ww-1; Fri, 07 Jan 2022 20:06:04 -0500
X-MC-Unique: W56Gv3xrPeWYLzX8Dbe7Ww-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so3096301wmc.8
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x73NwhE1Jj1XHK61J5GDiGXpI7lT6xn6KSYOADx705c=;
 b=FgagYBu2y+X7+soYkhau9oL8k8kIVL+zOI1uxCuBf7fQa7qDrwdMBJ5TMgtSpKAz8/
 FCMDN+NM0GuBZH6eKnKK+D6VIGdnTLOsuxrvsonZI1nB2t9NjFBGgJN5TgKsrSIJwI94
 f/BGw1S1FruVAPKU2IriCZzARqsdjjXdTPr3BFBM5FGFbt8iP1xm56tz1UvwP9NS790e
 4qMQ5Q0a8olyh35Kp2h0IGunPs57INN++oOTKmIUl4U1eKUDJZf890coZQDGagW96U+w
 YPnxVedktuJkkXQXKp8y1LQ+jYZ7q1y5/+r+JuQ4k6RhFItvMN2l/R+HmZ4C5s8MIN0U
 Fb/A==
X-Gm-Message-State: AOAM530MVnDeXDWmwnt/cHEFbSLd8RXd+mklnAo7ODQ0RznI/WtvcYEW
 MQ75UjyMQrzm2PrK4U8tCtxgApE0thOXDclVKqZeqTra9mfsK89pPxh3MBdB0dB71RKA5TVM8wK
 BmE9eemQ44Oj/LxiDBqGZpJbAed92NmeNN5F6pdSgZxGXKnPDF26HBnCjI7Y1
X-Received: by 2002:adf:e90f:: with SMTP id f15mr8501262wrm.72.1641603962852; 
 Fri, 07 Jan 2022 17:06:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylqjIqMCb5GuGipElBs6o9kIOzmmD1W0RnEsi26OGO8bWe5MZFRxTVMarAblgA5aI7ZMnCXQ==
X-Received: by 2002:adf:e90f:: with SMTP id f15mr8501252wrm.72.1641603962617; 
 Fri, 07 Jan 2022 17:06:02 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id c9sm85938wml.12.2022.01.07.17.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:02 -0800 (PST)
Date: Fri, 7 Jan 2022 20:05:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 44/55] tests: acpi: whitelist expected blobs before
 changing them
Message-ID: <20220108003423.15830-45-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-3-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   2 ++
 tests/data/acpi/q35/FACP.slic               | Bin 0 -> 244 bytes
 tests/data/acpi/q35/SLIC.slic               |   0
 3 files changed, 2 insertions(+)
 create mode 100644 tests/data/acpi/q35/FACP.slic
 create mode 100644 tests/data/acpi/q35/SLIC.slic

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..49dbf8fa3e 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/FACP.slic",
+"tests/data/acpi/q35/SLIC.slic",
diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
new file mode 100644
index 0000000000000000000000000000000000000000..f6a864cc863c7763f6c09d3814ad184a658fa0a0
GIT binary patch
literal 244
zcmZ>BbPo8!z`($~)5+i2BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
z$X0-fGcm9T0LA|E|L2FOWMD7?GM2V5Ffej3F#P0!h{7ddihwku0+2v57svwxMxcSn
X_QAxFX+{NzJ3wNL4G8yu_%Hwf>-7!+

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/SLIC.slic b/tests/data/acpi/q35/SLIC.slic
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST



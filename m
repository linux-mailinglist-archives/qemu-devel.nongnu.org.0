Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59564865DC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:13:13 +0100 (CET)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TVw-0004HN-Td
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:13:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sih-0003e9-PR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:22:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SiV-0001r9-7y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:22:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x73NwhE1Jj1XHK61J5GDiGXpI7lT6xn6KSYOADx705c=;
 b=TpQgIXKn3VheZO/h2ZNmbAvWxiyXgLy8/33sYFE6AfcnAlnbVfA3qjGRB8qzAlt31W8msp
 p1WdKWLT4bOqzG5I2hy7x9vIkgpb9PfYkFwx7Zj6LvPzKgPnUjfl8AA/5tN48D4kF08g16
 /GeDO+M0KA85ZBafb2+j3mePfjAufTk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-pwHxoCrDNf-NSInD1Zgaig-1; Thu, 06 Jan 2022 08:22:03 -0500
X-MC-Unique: pwHxoCrDNf-NSInD1Zgaig-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so1934116edb.12
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:22:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x73NwhE1Jj1XHK61J5GDiGXpI7lT6xn6KSYOADx705c=;
 b=h8tx6ZkCnETl4UWhc9l5q0geLLDurh3hULpPjb8/VX687qsH+5Ok8/D2JEkILPlBBZ
 30WaK+jQheFZS4YG170m5q4mdGnOHrBN81jwhhk6YGP2cAEqXAxQhCaLycH0GEsduVCQ
 jLbeczL6gw1z9GbqIiKB+cJie9BZ6IbpWadR9xB5bIvRofX4KHVcIf8FNWN5xsv2pVNH
 XBzGRtfdl7Z2jKDoGRghP+uDHyRmiC1vqHnt8LHYMfOZJd7QA9tGynj1ZQr8hZersGp3
 OBjttjY7zmddyffjDJMpgSnQns54B+6xCrv+qS1kk4wbECE5w3gu6ibpw9ea0OQZjcyZ
 lTNA==
X-Gm-Message-State: AOAM532i1bqvcErIh2SonZTIxn6FzVism8dTseHxAl/NBCuhXtVl47Dz
 b3+f+lKQmZkuN49wEcz2GvjqAyr6KxbS2IhzOnseQELFXUsQNpo496XiaEsQDSnTWemCYqCKvkJ
 M48T6SscFTUPss3JhaRLc1so59mxrZwJ466WDoAj9sQWpfO1MHO0vhe7oyCCN
X-Received: by 2002:a17:907:97cf:: with SMTP id
 js15mr42375102ejc.16.1641475321799; 
 Thu, 06 Jan 2022 05:22:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+rwhF4v1lSassPLfnrbLxdjxPZfHOHbVW/KKrKeXI9CqVIeNxC19JYwiJSPHNC4vJDhpdVw==
X-Received: by 2002:a17:907:97cf:: with SMTP id
 js15mr42375070ejc.16.1641475321307; 
 Thu, 06 Jan 2022 05:22:01 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id h13sm705295edt.61.2022.01.06.05.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:22:00 -0800 (PST)
Date: Thu, 6 Jan 2022 08:21:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 44/52] tests: acpi: whitelist expected blobs before changing
 them
Message-ID: <20220106131534.423671-45-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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



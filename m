Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 734086EDD23
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMn-00079V-7N; Tue, 25 Apr 2023 03:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMR-0006Nt-T5
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDMA-0006PE-QC
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OMY9Rqubse38jh9eUiatf0essJZ5elEWamJ6/9NiODg=;
 b=eHBVW5BYmjvEiP9ejGOy/CsliCK6QsRRUNmJwFCncDU4FOiQYd9xq/2M+tzR4FYiWGycBR
 Nn2FzOTz5hqiThBc13P4GIf6LHTDynvFVsTSHStgvHVOKU1ZcbYF+Ph8D7MBwSF6k5z7cQ
 R5/Q2S1Epm5excn2ifQVmYe3aQiZ6vI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-fNL9twZYNTeK4zKBmLhvnA-1; Tue, 25 Apr 2023 03:44:56 -0400
X-MC-Unique: fNL9twZYNTeK4zKBmLhvnA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2ff4bc7a770so2897765f8f.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408693; x=1685000693;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMY9Rqubse38jh9eUiatf0essJZ5elEWamJ6/9NiODg=;
 b=K0c/yTGQx6zZyULtj2kshoUSMOfD1GsojqQJM2wETZh6Vd429Lu17dq6uot2cdR2TT
 dqRQSF+HwM7l9mCoineL6H3TBwiP3psLSg3tL28/GbOcoYpCMhPlYvXQdXQdDaiJCG4T
 lCkxsCzbHfxdmTpk1L8tEk9EjzKzz+gpmYwELNYyGZhs7pjLGD5R608W34Md4YgvMl7c
 kIwwnWgklHAQHqzkdMEqzOvMWXhUEhS7CCF/GScPIrK2zNxcBeNlss2hyOIC5fuU0V21
 ZaQMQ9j6gSR3wJZZ7KdjO0Yqw4RyRGHeKdkox5z0YN0CDg+nAZmKSGRn4PLvXVxO9Xc1
 8ZzA==
X-Gm-Message-State: AAQBX9f8fwi28Da3PmNxb6KmM/sx3E/fq9ugORcOln6HZCw1u8Jyl1wP
 05NA0RCd0RgJ1gRE7hWY4mxw++j3an2Wj7g2UPUQR+jWuXt28IgwR/9pJTXFv4fBnr5o7MLf3vI
 dcj/pNdYjQTU5WxxLpulbu+L7W7MrSN+6OxZJkoNJ1V7nkcLg+dsXr4tC46Enrw1JrnRp
X-Received: by 2002:a5d:6b46:0:b0:2db:11f3:f7ee with SMTP id
 x6-20020a5d6b46000000b002db11f3f7eemr10863465wrw.63.1682408692778; 
 Tue, 25 Apr 2023 00:44:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZpfmzYntfQkex2fp0LhjnuOn7ppngb57mMkb17QNhmRTmvExznJfVneIKY8RuW/whgVVHNWw==
X-Received: by 2002:a5d:6b46:0:b0:2db:11f3:f7ee with SMTP id
 x6-20020a5d6b46000000b002db11f3f7eemr10863446wrw.63.1682408692462; 
 Tue, 25 Apr 2023 00:44:52 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 m4-20020adffa04000000b002fe96f0b3acsm12405845wrr.63.2023.04.25.00.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:44:51 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:44:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Ani Sinha <anisinha@redhat.com>
Subject: [PULL 02/31] Add my old and new work email mapping and use work
 email to support biosbits
Message-ID: <607a079b29a896b3752ef8a14d746765473c07bf.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Update mailmap to indicate ani@anisinha.ca and anisinha@redhat.com are one and
the same person. Additionally update MAINTAINERS and bits documentation to use
my work (redhat) email.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20230320114233.90638-1-anisinha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 .mailmap                 | 1 +
 MAINTAINERS              | 2 +-
 docs/devel/acpi-bits.rst | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 7677047950..bbe6d3fd69 100644
--- a/.mailmap
+++ b/.mailmap
@@ -54,6 +54,7 @@ Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <arikalo@wavecomp.com>
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com> <aleksandar.rikalo@rt-rk.com>
 Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
+Ani Sinha <anisinha@redhat.com> <ani@anisinha.ca>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Damien Hedde <damien.hedde@dahe.fr> <damien.hedde@greensocs.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2068ea5c..0bd3d1830e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1931,7 +1931,7 @@ F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
 ACPI/AVOCADO/BIOSBITS
-M: Ani Sinha <ani@anisinha.ca>
+M: Ani Sinha <anisinha@redhat.com>
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: tests/avocado/acpi-bits/*
diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 9eb4b9e666..22e2580200 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -135,7 +135,7 @@ Under ``tests/avocado/`` as the root we have:
    (c) They need not be loaded by avocado framework when running tests.
 
 
-Author: Ani Sinha <ani@anisinha.ca>
+Author: Ani Sinha <anisinha@redhat.com>
 
 References:
 -----------
-- 
MST



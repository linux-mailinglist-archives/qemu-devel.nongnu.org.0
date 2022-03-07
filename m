Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1D4D0B5E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:47:18 +0100 (CET)
Received: from localhost ([::1]:51228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRM8K-0000L8-Pk
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:47:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6A-0005fG-Q7
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM69-0005Bc-5d
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5n/FHmC/Dor0xLSEuoyybbuicDeG0aqX5h3Rj+dixSE=;
 b=B6E65T3L5kqMb76mSsPyBZGHLWf6U3Ta+rI/FuuVeAJF6yI9xI7Cnki28KLI3yuIx6JVDF
 zDnzMoKGxjaK9xDBPiApBugNJoKCxx3QjEmbtTjjz7JCeaGkBjOUDAQqfg8f39OLuShuO8
 Hsiln2fDkjCaPCgBIkp+CPAEv6+Whf8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-qmCP-15GPTmIyKG2B5i2bw-1; Mon, 07 Mar 2022 17:44:59 -0500
X-MC-Unique: qmCP-15GPTmIyKG2B5i2bw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j42-20020a05600c1c2a00b00381febe402eso277650wms.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5n/FHmC/Dor0xLSEuoyybbuicDeG0aqX5h3Rj+dixSE=;
 b=E33WJy2oc77KuxFV4Jo1b4FOJm9wHzvCkiYlOTUDAv1QbX6HpSS4qN6pEvNn7AMDfo
 15j1m/fVXam0NRNq/ZK5qGab3AG6hc1IQm9d0kRQ713NuioDY9RlcvRS6WQ4LCrG1k+9
 JXKEGUcR2OyQ58T3q/EoCkX47Hjw5jJxf2ilKEn/iH5FjNsugMCMaQa1dYU7u5g4dBQn
 uGmxoMXgbq6kgTCGmHDNLcdpqvsoxTzn9/8Z4gcubs1VbGLizTjZ4zdInqZfDBLEfPs+
 BcgLhDQ5NL1mUgF0VXOV1nhyDu9e5EoMkx74/UEAWJ+u6olUNb9iR2/Y1gqftrWeAj5S
 b/Bw==
X-Gm-Message-State: AOAM530FOFuiEN1jJ3Oe5bmIItB41wkuN+2UYdb6bgNShjrNXfBmd8PR
 M0P2vJtEVzubDQRRu0Y4LZAq7ENTUGQPUDqkpEptetdrfK4cWQqXkqbprnacYxh8ELerRi31Mr5
 XJon3TLx9IgArJh+mFdgbsA9bRWHQJYWy6ls0+x9e33Lg9e83l7safyVgRlwG
X-Received: by 2002:a5d:6251:0:b0:1ea:9412:fc8b with SMTP id
 m17-20020a5d6251000000b001ea9412fc8bmr9696542wrv.657.1646693098157; 
 Mon, 07 Mar 2022 14:44:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9QpEJ2I5ppjKApkbgSZm2QTNENduLUwByX0eEsHTwCKsUU3IdzYOq6WKK51yisp8BZWv6/w==
X-Received: by 2002:a5d:6251:0:b0:1ea:9412:fc8b with SMTP id
 m17-20020a5d6251000000b001ea9412fc8bmr9696530wrv.657.1646693097877; 
 Mon, 07 Mar 2022 14:44:57 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 y4-20020adff144000000b001f022290737sm12192179wro.6.2022.03.07.14.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:44:57 -0800 (PST)
Date: Mon, 7 Mar 2022 17:44:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 08/47] hw/smbios: add assertion to ensure handles of tables
 19 and 32 do not collide
Message-ID: <20220307224357.682101-9-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Since change dcf359832eec02 ("hw/smbios: fix table memory corruption with large memory vms")
we reserve additional space between handle numbers of tables 17 and 19 for
large VMs. This may cause table 19 to collide with table 32 in their handle
numbers for those large VMs. This change adds an assertion to ensure numbers
do not collide. If they do, qemu crashes with useful debug information for
taking additional steps.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220223143322.927136-8-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/smbios/smbios.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 44c53797a4..1f8d5c252f 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1048,6 +1048,12 @@ void smbios_get_tables(MachineState *ms,
                                        mem_array[i].length);
         }
 
+        /*
+         * make sure 16 bit handle numbers in the headers of tables 19
+         * and 32 do not overlap.
+         */
+        assert((mem_array_size + offset) < (T32_BASE - T19_BASE));
+
         smbios_build_type_32_table();
         smbios_build_type_38_table();
         smbios_build_type_41_table(errp);
-- 
MST



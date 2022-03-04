Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B918F4CD599
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:55:46 +0100 (CET)
Received: from localhost ([::1]:33730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8PJ-00010Z-Qc
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:55:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ880-0007eJ-Cv
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ87y-0000Ku-4E
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:37:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ma9iWGjH8QtszJxbcW9JyMpOmAV16xFQyYJbaD6EIFc=;
 b=I1HPLLctESZlzYbxfCdmUGou3zDO+35WzQmmCdiBAgPgdEyBCqcHMK2w1tH8cpjTLHPu2s
 mWEjq7aLvENBkGg+q+bvNCIr7RWpiaInBYhVbouuyFQmwWEnKboabdMvEeixgqdRcypkPq
 YEAPeuhfmZ5xuWrCIcj7DGlz0zPFYjA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-rz5y6_nPPQ-Lo21-jsQjQw-1; Fri, 04 Mar 2022 08:37:47 -0500
X-MC-Unique: rz5y6_nPPQ-Lo21-jsQjQw-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020aa7c711000000b00415ecaefd07so2210553edq.21
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ma9iWGjH8QtszJxbcW9JyMpOmAV16xFQyYJbaD6EIFc=;
 b=gXUyi0K23IXkqPFBhnRVWifZxbn6vsW3A9O7C66GuL4Tnc09wV16l6IV/5YhUV6J1W
 2R7IGQfGAF8axnafTU1JbHUaHx/tRT4PM2DQ/GcUqIDkmI7MQQNjrKxZ0uI9ix/wk0d3
 6yM07UhVMw8KZAovNKtn1e4F2wTyOuANTju/OHyGB+b5gjesEq6K0LgPc+Kk7i84sUa2
 AKm6KEB78MF5P2m9Gx3O0Qg2DOYAhRn8sJ2OCT/xi+vyklmfzkvZDrNaLhQpwcN2+T8h
 llWM/kFbGANAEDOLX7fgdKpWebuDUeN7zHqV0zRf3nRjCmfOi+knsVXfB4pfRk6TgtHn
 HJWQ==
X-Gm-Message-State: AOAM530CUqclPhdxDvXsT6mPNxumCkUk+tBhbFsQhh3JvpcnWQAigdqt
 iFS+K0nXvNB9nsRxFMpR45dmcfe5kWmtFjdQOVsYcaH7KUsfmHsotn0c789ATi33ZZLhBPpusgW
 daKU7enzaVTSbyU65UjBNHycyrxy62nvvf+syqYeAzs5LLRxftemCwbEs+Wbn
X-Received: by 2002:a05:6402:2549:b0:415:c31c:f9c2 with SMTP id
 l9-20020a056402254900b00415c31cf9c2mr11739691edb.335.1646401066182; 
 Fri, 04 Mar 2022 05:37:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwelQyG4xTWiU/Qo9YrtCkByEvxzFAgGj2Zg6cfKP/S5XqJCV/4vVZmIWY/5CP/xBsmu5GmtQ==
X-Received: by 2002:a05:6402:2549:b0:415:c31c:f9c2 with SMTP id
 l9-20020a056402254900b00415c31cf9c2mr11739640edb.335.1646401065937; 
 Fri, 04 Mar 2022 05:37:45 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 a1-20020a1709063e8100b006ce06ed8aa7sm1775848ejj.142.2022.03.04.05.37.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:37:41 -0800 (PST)
Date: Fri, 4 Mar 2022 08:37:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/45] docs/acpi/erst: add device id for ACPI ERST device in
 pci-ids.txt
Message-ID: <20220304133556.233983-5-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eric DeVolder <eric.devolder@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Adding device ID for ERST device in pci-ids.txt. It was missed when ERST
related patches were reviewed.

CC: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220223143322.927136-4-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/specs/pci-ids.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index 5e407a6f32..dd6859d039 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -65,6 +65,7 @@ PCI devices (other than virtio):
 1b36:000f  mdpy (mdev sample device), linux/samples/vfio-mdev/mdpy.c
 1b36:0010  PCIe NVMe device (-device nvme)
 1b36:0011  PCI PVPanic device (-device pvpanic-pci)
+1b36:0012  PCI ACPI ERST device (-device acpi-erst)
 
 All these devices are documented in docs/specs.
 
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993BE4CFAF6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:24:54 +0100 (CET)
Received: from localhost ([::1]:53866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRAXt-0007zy-Ms
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:24:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD7-0002Q1-0v
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRAD5-0002uO-FU
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3tpCVjYIOk1B/dIJbNsw4y7BbXatFeQMGgCwwa4oeU=;
 b=eR3U4xIEWH/kofdHBFW8FSNfJsX/4y6AxsYv0VBpyCvVuufVe+ja9dGz49iZDqtMmogWsv
 UjfWQNmHaBdMzjiyLQSo6XC/xtboNG2s1X2qAvYvPIOKYTJ3HdlK91Ki84+xic4A0GK2m/
 fGglPmnbJsyTkMoszeqmmrhw4shc6QA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-9uuAo95COo-4N14iNnuh0g-1; Mon, 07 Mar 2022 05:03:20 -0500
X-MC-Unique: 9uuAo95COo-4N14iNnuh0g-1
Received: by mail-ej1-f72.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso6773560ejs.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s3tpCVjYIOk1B/dIJbNsw4y7BbXatFeQMGgCwwa4oeU=;
 b=l/VTl4cNoAwxAB5uwWjpTg/FkesvDxtq07RI0ptQ+QzAGh4gRNGGMtq2+dndt05q/r
 +VOq3IxAk4Jpd8lPS/ZjpXMn6nGyVOcdOlUT7TakqLqTixNasHE6gyWlddKVSnuNYn9I
 2Nkw7rfTeu7SuuhP2gE0VvKXtJMglGWPJmZzsg9je7x5w8R3IgzRn6otQ0cPmRbxsQNa
 w/K5fCsu3cRhTznC0o/VujgH1tLER4mkLHl4hmZkmscJbCgJ8SL5cwTMpoXstTXtYs/v
 h8cTMw8VYnMdH2mAQScoMPqgtHSrrRiRF/qa/942SKk5+fwBD8ERMda0ZhimsoPgJljZ
 RVXQ==
X-Gm-Message-State: AOAM532YVyPJqQKgrp1CEf/2dOF5i3onniaD82sRtQgsh6uu8Ntas/tS
 GgvBrfla+/1nMIM4m23n9rRy5tjbdDkM418YayNVc+xOI06EsHKexc8YF5sn/KAJdgxaYHoPvMj
 qpd/nIrdmOFzOIlMQEDcqwTz/Z7rZDVOATYcx7mPTPD7m7IRlms2Io2qrQfxX
X-Received: by 2002:aa7:de0e:0:b0:416:607c:6d45 with SMTP id
 h14-20020aa7de0e000000b00416607c6d45mr346622edv.127.1646647399424; 
 Mon, 07 Mar 2022 02:03:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzJAHcorC74goI+OM5/OJsjRIULHpmBLOLAd8Dh8Uu22SKfL4/S4s68onsQbTd6h/dIQMXnvw==
X-Received: by 2002:aa7:de0e:0:b0:416:607c:6d45 with SMTP id
 h14-20020aa7de0e000000b00416607c6d45mr346600edv.127.1646647399166; 
 Mon, 07 Mar 2022 02:03:19 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 gb11-20020a170907960b00b006d20acf7e36sm4810736ejc.144.2022.03.07.02.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:03:18 -0800 (PST)
Date: Mon, 7 Mar 2022 05:03:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 39/47] pci: drop COMPAT_PROP_PCP for 2.0 machine types
Message-ID: <20220307100058.449628-40-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

COMPAT_PROP_PCP is 'on' by default and it's used for turning
off PCP capability on PCIe slots for 2.0 machine types using
compat machinery.
Drop not needed compat glue as Q35 supports migration starting
from 2.4 machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220222102504.3080104-1-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 32bf12421e..fd55fc725c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -318,8 +318,6 @@ GlobalProperty pc_compat_2_0[] = {
     { "pci-serial-4x", "prog_if", "0" },
     { "virtio-net-pci", "guest_announce", "off" },
     { "ICH9-LPC", "memory-hotplug-support", "off" },
-    { "xio3130-downstream", COMPAT_PROP_PCP, "off" },
-    { "ioh3420", COMPAT_PROP_PCP, "off" },
 };
 const size_t pc_compat_2_0_len = G_N_ELEMENTS(pc_compat_2_0);
 
-- 
MST



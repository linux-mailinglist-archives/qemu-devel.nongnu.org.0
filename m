Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D265E824
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMMf-0003Tv-7A; Thu, 05 Jan 2023 04:16:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMR-0003Pg-9W
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMMP-0007cM-Lv
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JihRFo0ZYwPQcoOoSXD+qKoI9mP+I5ykh4xASrS6DhI=;
 b=ecvN1Qe8qUUFiTubPBQsa0eT33keWQfB1HxEgCtabN/jOzMz8XJ1RivFDK1D3Fji4oIufa
 TIW1HqkdcYPG4QWxW8WWexvDnsLGhQuSrJ/Qf0z7LPiiGOtufJPYVHz+LKKqCZPN6OcXlC
 YAvzMqB/BHnhXJB/XOa81cLjlf8JYaU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-159-HcuLR3S7OIubHsRkO9MegA-1; Thu, 05 Jan 2023 04:16:27 -0500
X-MC-Unique: HcuLR3S7OIubHsRkO9MegA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m8-20020a05600c3b0800b003d96bdce12fso17733309wms.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:16:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JihRFo0ZYwPQcoOoSXD+qKoI9mP+I5ykh4xASrS6DhI=;
 b=fztCdetqks5Wly0BjtT71WBJv4bLWpISg/op1fDSHUWEVvdudGwux0POoChKeSS1a1
 1xJAMGtDP5nDKABqtGMhIFJ1dnou3muv5ZV352tVNSzormuQ2ShY+Bn5ebJZKb25+A5D
 BGkD3fEbERCXxgmDR75SPFei2MCCdAU/49wp4JyqUv3IaAp6NffMChX6go/oDEg7/UfD
 QOWmrvgniW+gbfgbGcxiT7hTbnGdX3XXKy/ca9TCZPQKCUD95pG6IW9llsdfQUi5Z5aD
 6v34f9XC8c44nvtYSZXtNuNywQyFD5+kfYAm/kLZJwu04fOxU2nni5wPBMsf8h19ce5U
 ut4g==
X-Gm-Message-State: AFqh2kpHbX+R9nK4KvdBJz5+0WybFaezvxHpnhS72a0IqRE1hSYDzL2r
 vO6cJmgZ9HO2vNp9geRcSru81T3GS7nURLZp7v1bi8vtqxpz2wZkmEoTA58YmD0S/0QuqT9GdSb
 wajtvkxRtFyQOkN5pkGUEDMC/fp0vAUss0X82qzjROXqxUpMNA1u1I37/iYWt
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id
 u33-20020a05600c4d2100b003d22a722573mr35849364wmp.11.1672910186305; 
 Thu, 05 Jan 2023 01:16:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuddwOcWy5tlf3/3iD03l+QbUokem9vgjCq67fupts5RmqyIopo2RRLOWbGXXZn6a+opU1XNg==
X-Received: by 2002:a05:600c:4d21:b0:3d2:2a72:2573 with SMTP id
 u33-20020a05600c4d2100b003d22a722573mr35849346wmp.11.1672910186075; 
 Thu, 05 Jan 2023 01:16:26 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003d99a39b846sm2282748wmq.5.2023.01.05.01.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:16:25 -0800 (PST)
Date: Thu, 5 Jan 2023 04:16:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 37/51] docs/devel: Rules on #include in headers
Message-ID: <20230105091310.263867-38-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Markus Armbruster <armbru@redhat.com>

Rules for headers were proposed a long time ago, and generally liked:

    Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
    https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html

Wortk them into docs/devel/style.rst.

Suggested-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221222120813.727830-5-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/devel/style.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 7ddd42b6c2..68aa776930 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -293,6 +293,13 @@ that QEMU depends on.
 Do not include "qemu/osdep.h" from header files since the .c file will have
 already included it.
 
+Headers should normally include everything they need beyond osdep.h.
+If exceptions are needed for some reason, they must be documented in
+the header.  If all that's needed from a header is typedefs, consider
+putting those into qemu/typedefs.h instead of including the header.
+
+Cyclic inclusion is forbidden.
+
 C types
 =======
 
-- 
MST



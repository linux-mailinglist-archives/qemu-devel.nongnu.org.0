Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBED61DC85
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpz-00008v-Rh; Sat, 05 Nov 2022 13:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoV-0007W2-5I
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoQ-0007kP-0q
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhqK01gpDvzkT5GTeXlE5BJ7AbDBJOHBjeecaXlv+RM=;
 b=NNVHm98pIb4FHRvj/2JWXGM9Y0UpXyFP2vzpTC4bXJZqAkbXlTvz6IiDs9UsL60NDk4ehf
 Sz1kGOGfFvuPjZ33N6rcSRstTzY8StHJh4HetnW558A52QuNgB7Vm3x++R35D6n+2dATyk
 VxciYBVbmK2Yg3IKo/j0lHTC4zlsjq4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-15--9RhV7ywMImzuwh90zen4g-1; Sat, 05 Nov 2022 13:18:28 -0400
X-MC-Unique: -9RhV7ywMImzuwh90zen4g-1
Received: by mail-wm1-f69.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so1752011wms.9
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhqK01gpDvzkT5GTeXlE5BJ7AbDBJOHBjeecaXlv+RM=;
 b=n0vrOOKdWwxTGchhqLUWR8/83Rv94os9TQtrdjPsNRv7jog83JWB8Laz3u521IzrNs
 V7RHxNJ36j2GGxvNxiH4zoB+UByc0ht9I1shgt6I7if19zHx2EdSQq8PqISI0iXR9ooP
 YsslSg5/lB8IrVjGrREGS4Sl3dRXZCqyS8xpYuY3bycibg9tuqCLL8u9MZ8fWYu01zGK
 gybmp4FsTZ+IawytLQc20SLqaus3ihbimQ4r+73bCrxCvQKZgW1Xe1uJcbWqq2ZRzxJW
 KKrmd3Ch0xj9vQIfbCnJsDFWPeaWsbpOFK7yh6ta2Un/g/4O/S2mtsZ7oHqm1rSQT164
 rh+w==
X-Gm-Message-State: ACrzQf0hjjVPhkp1W6YHqWjFkaOvoqcs8d7V0fAjrqQTNbn/+Xgz4AJd
 jysZrAisgwjb5tPXfQ2/SaR44zp9ENFsGrdRRH7H6E9d+3cjY3D2h3VIp4WPkLIOz3krELM1PUq
 pPCbYsV/B1qq1/1naijEemHnAV66OBsnmmRvF10EA68nI5Gzr40rZ+nr3vTGk
X-Received: by 2002:a7b:c2aa:0:b0:3cf:9d25:9d76 with SMTP id
 c10-20020a7bc2aa000000b003cf9d259d76mr4144213wmk.192.1667668706679; 
 Sat, 05 Nov 2022 10:18:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PRIA1F4LdFBXMylX9X4+zk+xtwvIpCeeHkKj+IkSr9PDRn5ifVXFcoJ10sjF/5dGDy14fvQ==
X-Received: by 2002:a7b:c2aa:0:b0:3cf:9d25:9d76 with SMTP id
 c10-20020a7bc2aa000000b003cf9d259d76mr4144200wmk.192.1667668706448; 
 Sat, 05 Nov 2022 10:18:26 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 j13-20020adfea4d000000b0023bb7e4b8b1sm2663494wrn.82.2022.11.05.10.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:25 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v3 61/81] MAINTAINERS: Add qapi/virtio.json to section "virtio"
Message-ID: <20221105171116.432921-62-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Markus Armbruster <armbru@redhat.com>

Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20221020120458.80709-1-armbru@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8b7d49b089..28cc70c25f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2017,6 +2017,7 @@ S: Supported
 F: hw/*/virtio*
 F: hw/virtio/Makefile.objs
 F: hw/virtio/trace-events
+F: qapi/virtio.json
 F: net/vhost-user.c
 F: include/hw/virtio/
 
-- 
MST



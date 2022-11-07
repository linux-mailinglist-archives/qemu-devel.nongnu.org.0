Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719236202CB
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:56:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAyh-0004GH-1o; Mon, 07 Nov 2022 17:52:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyd-0004Am-5s
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAyS-0005zh-GD
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:52:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VhqK01gpDvzkT5GTeXlE5BJ7AbDBJOHBjeecaXlv+RM=;
 b=W/GEHEyh78nnufp4J7DmxOhv2LXzxodFSG5cCrixN8+ynh/dXBCvUEh4xsfubvqeTuDVTN
 mRcPZzLVutwK2s/OO4l8HlAL2SCmaFyfZCUNTigSpMM9zZmBdYWw1welO94Q+rxf/TmAmH
 uyjis7MtJjYxeECOgL7OdHHZmjkI448=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-EqPzfMDfOXuYLDeWwIoT8A-1; Mon, 07 Nov 2022 17:52:08 -0500
X-MC-Unique: EqPzfMDfOXuYLDeWwIoT8A-1
Received: by mail-qt1-f199.google.com with SMTP id
 c19-20020a05622a059300b003a51d69906eso9026676qtb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhqK01gpDvzkT5GTeXlE5BJ7AbDBJOHBjeecaXlv+RM=;
 b=usqbot7PAep4vYF+Dn3gRguPNdQ5NwhVCAyI481/dWlA2s2mCdgeH8CmKj22DHV5+l
 XjrDCIV7Mv5qB32fZuRjVx0kErp0Dk6jOE85IJikmal+E51rt/BXk5LUT94DESUmLuM7
 N9gyQXd1cmUOhjmLNx55gpqMEg5lcqr6jlP+krnOZjrtF6ZcpKmvnBgCUXfhUQWNotEB
 W60hmmdhh412uWWe1BXVywZ8gd6NzKeCCCSC/fMIu2nNq3oSOIpWspvSkPoIvDHcCruj
 pfMVvBj3jn/wn6KOEYAb70rJAOUB3lUsKPqoSCZ6lEgsYCe56SvgFeqGDvO3YK18CBvD
 uwrw==
X-Gm-Message-State: ACrzQf2CWdjha4VtNyHKomaX83r0eyleo9RFcu/YkaZrTt4Or/TSJH/C
 UmyGZRPcW7XKrJxBIIWhLGA168IQsBMzu1jNjmpLDjSk6QkMpEAgkqXXEI8FSjF3KFYvetQNhA3
 dL0Eo0jdn0ueslB2lcLyF/s+q+5kMco9q0QL028iIP8JtppfieengasMmdIaV
X-Received: by 2002:a05:622a:209:b0:3a5:5b6a:c768 with SMTP id
 b9-20020a05622a020900b003a55b6ac768mr17707583qtx.644.1667861528331; 
 Mon, 07 Nov 2022 14:52:08 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4i5yy8+s/sj/YUx2GrTrIZZAi5hT6OmREG+5tiwJbWiW3GFZ5UnWHuUblQhDl/Fn1h+dRA5A==
X-Received: by 2002:a05:622a:209:b0:3a5:5b6a:c768 with SMTP id
 b9-20020a05622a020900b003a55b6ac768mr17707566qtx.644.1667861528039; 
 Mon, 07 Nov 2022 14:52:08 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 a3-20020ac84d83000000b003a530a32f67sm6783493qtw.65.2022.11.07.14.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:52:07 -0800 (PST)
Date: Mon, 7 Nov 2022 17:52:03 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v4 56/83] MAINTAINERS: Add qapi/virtio.json to section "virtio"
Message-ID: <20221107224600.934080-57-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
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



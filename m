Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011E565E774
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:15:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDML8-0001mH-Iu; Thu, 05 Jan 2023 04:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDML6-0001iK-37
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDML4-00070y-DB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/vfyslWt4MlbRW5heOudUWcHHqot7dn827hRuGuvKI=;
 b=LktetUZdqmoTlYPVtuTBi6bXFIUwQqhltuqbvDfyN2v3DjiI+SccJQuNhf9D/cmTmp6lE9
 fUPbpSJSKDsmYprMKyqKcby1kAft+BQq6NiGpR11O+QBvec2ihGczDtcSSTD2Zt4f9kbC/
 vR8ZpkVgAdzCNkATl5duEV0NsIQlwoE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-473-dKrBA6tOPceXr9J3ypN1TA-1; Thu, 05 Jan 2023 04:15:04 -0500
X-MC-Unique: dKrBA6tOPceXr9J3ypN1TA-1
Received: by mail-wr1-f71.google.com with SMTP id
 e3-20020adfa443000000b00296b280432dso1939100wra.19
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V/vfyslWt4MlbRW5heOudUWcHHqot7dn827hRuGuvKI=;
 b=mMcrQJh1a9CJ65ho1zT1PNtodFcg45W4X+VN1wlhp60HhC95ehO9jdFZqn9uUWJq4b
 +8JCgrGO3V1qryaYG2tv1f9pP/IenY+BIzM4MeFnM2YQ7wTYzJT8mnjJS2VuMqk0q5Ok
 qVh1fU8uSpzLUnYDev2sdBXcKxeIYLYAu2P8dAJBa8TmcgL5E6s5oge5bSPKyeYqa8iD
 aWwHH4dKbjoXhjDeC8yiFXvOK8il+rniAJ3kUBLyHQjo8DezW+mWevXKNsfcp6pm4yb2
 UhK88QmCevr2xQT4kq7CEJXZ4o43gmumL3j+OSB+omsfZx0oc90nWjBCVoX5SljGlUxq
 TsXQ==
X-Gm-Message-State: AFqh2kpxe5smyfTuJ1BK4jcoUn82OEqh7JQ1NXcC5Kr3jPPSd8WtIDrd
 WhNul0mC5mUxxWi164426QnxvUTr7kxxRgfG01eelgl2iBEbtb8HcosQAl1crDDaCaxshiZ6zUw
 8o2KFnR0AIIfSEoQu+sgfhzpGzG3dlt/uu0C37lywYdsXjHZEAcprf6lJ7LV6
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr43499790wmq.6.1672910102480; 
 Thu, 05 Jan 2023 01:15:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsZ09rSyLQYn/uTencYd5z/k0QjOs+175IcfbgMcG+jESMuxRdpmYntV80xHL1vGf4TCCzpmg==
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr43499770wmq.6.1672910102181; 
 Thu, 05 Jan 2023 01:15:02 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d624a000000b002706244dc0dsm35652186wrv.31.2023.01.05.01.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:01 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:58 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hyman =?utf-8?B?SHVhbmco6buE5YuHKQ==?= <huangy81@chinatelecom.cn>,
 Guoyi Tu <tugy@chinatelecom.cn>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 13/51] vhost-user: Refactor the chr_closed_bh
Message-ID: <20230105091310.263867-14-mst@redhat.com>
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Use vhost_user_save_acked_features to implemente acked features
saving.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
Message-Id: <6699ee88687b62fb8152fe021e576cd2f468d7ca.1671627406.git.huangy81@chinatelecom.cn>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-user.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/vhost-user.c b/net/vhost-user.c
index f5cb095d5c..5993e4afca 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -260,11 +260,7 @@ static void chr_closed_bh(void *opaque)
     s = DO_UPCAST(NetVhostUserState, nc, ncs[0]);
 
     for (i = queues -1; i >= 0; i--) {
-        s = DO_UPCAST(NetVhostUserState, nc, ncs[i]);
-
-        if (s->vhost_net) {
-            s->acked_features = vhost_net_get_acked_features(s->vhost_net);
-        }
+        vhost_user_save_acked_features(ncs[i]);
     }
 
     qmp_set_link(name, false, &err);
-- 
MST



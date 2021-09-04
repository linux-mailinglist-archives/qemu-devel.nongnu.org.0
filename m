Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D89B400D38
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:51:30 +0200 (CEST)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdZR-0000S2-JL
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLx-0007By-3v
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLv-0001jC-JM
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wdEHFLO28MnHxnuu6NlFDZP5KdwfTCWh4jlJfZEIZpk=;
 b=Tv5DuVqrMoeY7vHxLaddvlnAKxBXi+wXdf+Mt5895kK0rea2W/Q0lqr0TMr1O0IzMQllmD
 N/UzO4OflH5C2ht8WUwV9SeZVa98PDtBBpS+lh7+GYCj14X2x0qaACi7R/NpyMeXRAUg57
 tZMfhOwTKyo0BWnoO8bgtfusl7YMpZs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-ZpcWh4BHO2u0nS3wnwnZ8Q-1; Sat, 04 Sep 2021 17:37:29 -0400
X-MC-Unique: ZpcWh4BHO2u0nS3wnwnZ8Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 s25-20020a50d499000000b003c1a8573042so1492056edi.11
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wdEHFLO28MnHxnuu6NlFDZP5KdwfTCWh4jlJfZEIZpk=;
 b=EXY84Lvff+betrEY3cff9oe+e7uijzjOc9usxn9KSPyz0Ky3EwyP6W/WtCtOt2/zeE
 IuSImNh+6mhCy5WzI3URdCDEVpo7jgORSVp8JVP/QvPMMhbcofCnsNWf9GnJwquHgPhY
 xZ11ORKE4pSlb2mTvzAvugiYQCGoOLgJlnf6yug+jA3x6pukPcKG98Vs0bJcFeuCH5AC
 aP3tGOEQ7J3OTI8XkMtythylsunTci9sTwQsuAXv3sRnsgSBsorhSpTakXRV5BLzY+Tw
 YJW76l7PwWNX2s4fB5cGWbGzD42sH/fAQ5PzaqAsZ441fx/J6c9ojJNsfcccGcQGhjm1
 fvMw==
X-Gm-Message-State: AOAM532MHXHyp9enAeLSdP3SoJp7r21V2IcCZH0R8a3orD79WnkVBNjQ
 RZQfPyP+WyUWtsZQH93UTVSvb6cmvYYohehKlVSCzZ2GdKjcDhvqcfsiIqoHt/vVv548P/+2YxZ
 wa1LqDUajiEAwSc65Xy1uvHCr0YeNcBSLKPyELxbHQAzKQx8Lf+RfgfZA9VAE
X-Received: by 2002:a05:6402:26d2:: with SMTP id
 x18mr5878514edd.195.1630791448397; 
 Sat, 04 Sep 2021 14:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ9wYBmp5/Wa1npVBRpfY3Tsr26a+wrnu9mSZHb71kpq8ob3OhyP7N/y4SkQnhkHCUuWiVOg==
X-Received: by 2002:a05:6402:26d2:: with SMTP id
 x18mr5878502edd.195.1630791448186; 
 Sat, 04 Sep 2021 14:37:28 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id cn16sm1898786edb.87.2021.09.04.14.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:27 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/35] vhost-vdpa: remove the unnecessary check in
 vhost_vdpa_add()
Message-ID: <20210904213506.486886-31-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

The VhostVDPAState is just allocated by qemu_new_net_client() via
g_malloc0() in net_vhost_vdpa_init(). So s->vhost_net is NULL for
sure, let's remove this unnecessary check in vhost_vdpa_add().

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-7-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 395117debd..5c09cacd5a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -111,10 +111,6 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
         error_report("failed to init vhost_net for queue");
         goto err;
     }
-    if (s->vhost_net) {
-        vhost_net_cleanup(s->vhost_net);
-        g_free(s->vhost_net);
-    }
     s->vhost_net = net;
     ret = vhost_vdpa_net_check_device_id(net);
     if (ret) {
-- 
MST



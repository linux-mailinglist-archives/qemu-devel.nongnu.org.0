Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CCC400D2F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:47:34 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdVd-0006UG-D9
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:47:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLo-0006fs-Fh
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLn-0001bb-3F
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I3Te7ctUBeSH2vWRq8Hp57/DJQXdTxejxP5IFFM93wQ=;
 b=NooNZzWT0OBJrgXZcPele5EWCMl3gataBRkn6gHbF1UFUhhcuIkZEM4xbkGxD7MUo3xt7p
 EVuK15xSZWw036FCoDz2smV86C6n8Cw09QXQHHbE5l13KP7XHwuWyzRA2JjYVb93apTUm6
 HmDmDLCElUhh+Ssm3occwusi87u2ZJg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-HQJT5GXHONyLGEd0jrim6Q-1; Sat, 04 Sep 2021 17:37:21 -0400
X-MC-Unique: HQJT5GXHONyLGEd0jrim6Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 s11-20020a170906060b00b005be824f15daso871857ejb.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I3Te7ctUBeSH2vWRq8Hp57/DJQXdTxejxP5IFFM93wQ=;
 b=XNZWbuoCd51H/vkoa1x9QUmqeptGMkUTKZgQXyMIDUTyerOmQbSGCDY1JQqrRPbuEr
 Pxa6L6kYRGerV87tAdi37sso4+irCL/MwzxEj41TJH5HgHG5Rx7Vy8XsAae5C0O5afxF
 kDEhiBtGqz7c5D3pgS5wZftQ7Iy5n99syB/EIl57nsfXr+v+SvTejueouh3eth+NfOmo
 15iQyHD09reFMhtbKpnhf+lGw+mgNwxmX0Ql6lLG0+BhNkJ5Vb9/qSrLIzsP9kECbbsq
 9QJ1h2C9SrAGLrPpkZhfuqixXTA3eP7UWRi2Pe85HnqypN5DUGTfDzBas+Cr7fqPmGs/
 6jCQ==
X-Gm-Message-State: AOAM532KIjxyRamRgWR0vaUU1Shwpw0pUB7CRtWJP2COZkYb/BdbUl5c
 cNFUlBuqKC3PgkaWqXGXU5Tywpp8HT+EDMDHe7xQsbg+VaNRqaimxRLA7hbGJinWz+w0leDfMy1
 Dc5AS142C3VLPa+2YNnN75FImeLLUjoEuB1MbtUhxHwpQ6/IhGWi/Ihprhxp5
X-Received: by 2002:a50:9e41:: with SMTP id z59mr5869854ede.376.1630791439770; 
 Sat, 04 Sep 2021 14:37:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+lEbDeI7WwXaQPUJPoIYv457hmGlbtFZrAJWnUsLQUErK91yXRkLS83mRXch5Zh90nfvPEA==
X-Received: by 2002:a50:9e41:: with SMTP id z59mr5869843ede.376.1630791439580; 
 Sat, 04 Sep 2021 14:37:19 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id q15sm1546123ejx.3.2021.09.04.14.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:19 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/35] vhost_net: remove the meaningless assignment in
 vhost_net_start_one()
Message-ID: <20210904213506.486886-28-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eli Cohen <elic@nvidia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

The nvqs and vqs have been initialized during vhost_net_init() and are
not expected to change during the life cycle of vhost_net
structure. So this patch removes the meaningless assignment.

Reviewed-by: Eli Cohen <elic@nvidia.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-4-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/net/vhost_net.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 10a7780a13..6ed0c39836 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -242,9 +242,6 @@ static int vhost_net_start_one(struct vhost_net *net,
     struct vhost_vring_file file = { };
     int r;
 
-    net->dev.nvqs = 2;
-    net->dev.vqs = net->vqs;
-
     r = vhost_dev_enable_notifiers(&net->dev, dev);
     if (r < 0) {
         goto fail_notifiers;
-- 
MST



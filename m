Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD9653179
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:14:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynj-0006Rk-3e; Wed, 21 Dec 2022 08:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynI-0005xE-Ub
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynH-0004Ls-Dp
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hPpWqNtmrHVi5C08UzosSwpboDQEgfrtNpwi9rIqMqI=;
 b=SOQpru37lpzatbyI++O8m0BwjYx/Lk4D03S+HeCQHWRzZuBSws7gZS3Pz44bGUyWk2pzsp
 8ABBkYmHTm3Cv7GkyTxSFdU456MhsUNVxJPuizjJCeFwWX/Gd6ZF72FTOjDeRD7isrTOPl
 WqZK1fXmHASrVSefO8uQAvrKGbbA7S4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-31-_gJZMOfXM-udbdJKdWdhAw-1; Wed, 21 Dec 2022 08:05:51 -0500
X-MC-Unique: _gJZMOfXM-udbdJKdWdhAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so919965wmq.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hPpWqNtmrHVi5C08UzosSwpboDQEgfrtNpwi9rIqMqI=;
 b=iJ6MmKtiIGz6hHW1UsiZPfgmQVGyPer/TKj5PcVpB5cm2PiaorltTzKNompCbzub0i
 rOT0rd9euDFVxfDVbg3gtfc+WWGJ0WIfiagWSKyQLdBCK8lFt6G/bZ8Sgtm2Idg8YBj2
 pN44wsJMO9FlYP3ISVipbr9NuJcKNpH13NM/+kF3OMfr/ZVPsmdLvND271/2/PR6XxIX
 v8UFAPxCbG/lkLXoW4DaBBJNmXS1achTsuEuU9hdhVol5/bme5BjOBbICnnK9tM97Yum
 8y5je3Q9SnPSqi2RPd1E5gcpBPUE62q3LP2J45fYzFTC3AHcbulKgFvadYcQ+h3xiiBg
 9Prg==
X-Gm-Message-State: AFqh2koCxVwUGx3iAL6DQIYc8uot4Eh990NnMPCJ4YGH2Oido4clPR29
 3TmI2kLCyRaSXLMXo6Kx8X0kMDtpvdcN5uGIHsWvBf31Gv+JnG8v6AZ5hGF/QykZ2WFZwngtV/T
 6Oo8NNABZLx0SCw44K+u2Rcow6xQejo0JFzcDxk7hochli8TUBqBNSRKz05h2
X-Received: by 2002:a05:600c:1e10:b0:3d3:404a:8a1a with SMTP id
 ay16-20020a05600c1e1000b003d3404a8a1amr4476690wmb.11.1671627950058; 
 Wed, 21 Dec 2022 05:05:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtsPzsPfAHikmlC0sAbEQ77I2DrW+oWjmOyuteIx0/bgncUp7hjSQ9jjTHisw1ZBdBhjwXwfA==
X-Received: by 2002:a05:600c:1e10:b0:3d3:404a:8a1a with SMTP id
 ay16-20020a05600c1e1000b003d3404a8a1amr4476677wmb.11.1671627949853; 
 Wed, 21 Dec 2022 05:05:49 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 v64-20020a1cac43000000b003cf483ee8e0sm2225596wme.24.2022.12.21.05.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:49 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>
Subject: [PULL 24/41] vhost-user: send set log base message only once
Message-ID: <20221221130339.1234592-25-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
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

From: Yajun Wu <yajunw@nvidia.com>

Vhost message VHOST_USER_SET_LOG_BASE is device wide. So only
send it once with the first queue pair.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
Message-Id: <20221122051447.248462-1-yajunw@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index b8aaa99ab5..d9ce0501b2 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -527,6 +527,11 @@ static int vhost_user_set_log_base(struct vhost_dev *dev, uint64_t base,
         .hdr.size = sizeof(msg.payload.log),
     };
 
+    /* Send only once with first queue pair */
+    if (dev->vq_index != 0) {
+        return 0;
+    }
+
     if (shmfd && log->fd != -1) {
         fds[fd_num++] = log->fd;
     }
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8979661DC57
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:20:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpc-0008Cu-PH; Sat, 05 Nov 2022 13:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnx-0007Bu-LF
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnt-0007ap-F1
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CfH2mXgywnYC2kputq4S7gjRrDkltol0CBs+dWJ0/XM=;
 b=Hal6WK6/6ABSKTMbsijMIdCYvm6HWVEvde4D+ldz9k8p3LqjLVcLsIoWwuA8MJmLohEUNY
 a0UGyHZgO76mwXWk9LFUILh3y+U9SiA5/NCmxU+H3BgYSx7vIgibVafAtTNjaPvSaFV04H
 Sa3WFGw1uACDoMkkskOvz67hmamuLZQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-enCpY4VUPFut8lpxSlul6w-1; Sat, 05 Nov 2022 13:17:51 -0400
X-MC-Unique: enCpY4VUPFut8lpxSlul6w-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso3840131wmb.4
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CfH2mXgywnYC2kputq4S7gjRrDkltol0CBs+dWJ0/XM=;
 b=oT0gQd+Ow708+glzANY1BT6yyHCOwzWadRhOb6h+oD2yyl73xIL/TyopcyWgPSiVqh
 NxVr6Au30Kh3gzr4xHc5LYYWDGRjm8W1TS2om2NH7GhE9hrsuH/OxXk2Ccn/tDnCFbgP
 zz4F68w/FUrnRBMia2yAgVNVLMzC9V4x7NWerlELG5nKRC9k/pI3LFBRKegsS8eDiz8w
 tH+HbLNTfEnPctg94An5U2igziQhyZAyUxxGZpyJ68n4Mj3qOAtha/lPRfD9coo9eWpP
 4l5uqLbY2ORIPMjX6wmVTWLDmZHLt07fbZsNKVpTY6Q4FRUuRWZEdrEzl+Gk/282Qi3t
 7dYA==
X-Gm-Message-State: ACrzQf0KiWBsDpLDuhomaeIIMPyyMb3zP1vDiSHzDvOt4sXCqaW6I055
 DHzU99jVx92pkKoAGsN91NeLd/ptoaD8pv9+ASN+FgCal1dp42jRRcbpS66FLc0snc0cgvb7yAB
 Mn+OL20/UA/lkx9HQFmDo5AKdSuhSBrTGvPTXMJxpXvaD1AT1btMYE/7bPz7e
X-Received: by 2002:a05:6000:1887:b0:236:7b1a:b14c with SMTP id
 a7-20020a056000188700b002367b1ab14cmr26444420wri.173.1667668669649; 
 Sat, 05 Nov 2022 10:17:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5PeN5awOtDiOgIsPsA5/oLB24E4Fdr0KCOZme8G7oKS5wlPdBt48izPbnt/cWY9nd9LcZkoQ==
X-Received: by 2002:a05:6000:1887:b0:236:7b1a:b14c with SMTP id
 a7-20020a056000188700b002367b1ab14cmr26444403wri.173.1667668669320; 
 Sat, 05 Nov 2022 10:17:49 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d4a0b000000b0022ca921dc67sm2549053wrq.88.2022.11.05.10.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:48 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v3 48/81] vhost-user: Fix out of order vring host notification
 handling
Message-ID: <20221105171116.432921-49-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Yajun Wu <yajunw@nvidia.com>

vhost backend sends host notification for every VQ. If backend creates
VQs in parallel, the VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG may
arrive to QEMU in different order than incremental queue index order.

For example VQ 1's message arrive earlier than VQ 0's:
After alloc VhostUserHostNotifier for VQ 1. GPtrArray becomes

    [ nil, VQ1 pointer ]

After alloc VhostUserHostNotifier for VQ 0. GPtrArray becomes

    [ VQ0 pointer, nil, VQ1 pointer ]

This is wrong. fetch_notifier will return NULL for VQ 1 in
vhost_user_get_vring_base, causes host notifier miss removal(leak).

The fix is to remove current element from GPtrArray, make the right
position for element to insert.

Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNotifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

Message-Id: <20221018023651.1359420-1-yajunw@nvidia.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 03415b6c95..d256ce589b 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1543,6 +1543,11 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 
     n = g_ptr_array_index(u->notifiers, idx);
     if (!n) {
+        /*
+         * In case notification arrive out-of-order,
+         * make room for current index.
+         */
+        g_ptr_array_remove_index(u->notifiers, idx);
         n = g_new0(VhostUserHostNotifier, 1);
         n->idx = idx;
         g_ptr_array_insert(u->notifiers, idx, n);
-- 
MST



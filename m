Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A23400D37
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:51:21 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdZI-0008Oe-Gi
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLk-0006NP-2N
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLh-0001Y6-6k
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NMkbP9DzPB2hGGRGylQ8qjTg4WnGCyNnq9CqzV3GViA=;
 b=hfQ3LCs17dbAod6Ll4HdkmyzhmwgQnUbfVyaCAJcyLUTCSAE1SENzbsRAa/uFs1JDCkFE9
 3El2t9SVRApRWGmqw4ctT/yoONU3Z1OhGaMuzcJgYAEZS94f8rwcMyzpm0PARdop0422k3
 U+fQFTUlLoTfTiu/9f5fgW+N2Dzt2g4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-Ott6sLdVO2-VIoiDixDhhA-1; Sat, 04 Sep 2021 17:37:15 -0400
X-MC-Unique: Ott6sLdVO2-VIoiDixDhhA-1
Received: by mail-ed1-f70.google.com with SMTP id
 g4-20020a056402180400b003c2e8da869bso1497950edy.13
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NMkbP9DzPB2hGGRGylQ8qjTg4WnGCyNnq9CqzV3GViA=;
 b=kJqTLW4I8IqRcM9qq26IV7KagXqnnUZO040MJQyDDMDXXUYiuQBLgrshY7LMxITUyT
 Z0priGHlDYQEky+Z04np5+csZValuiQWnjIHStuZpskd3hAJnRmV4dpLGEt9tF3mdx/0
 lJSly1aYMuksE3bf90H+6wzswjpIaFUfbC+TF4N/7I290lpbc0vBiY4EBw13Ygi4woIb
 FDflGK0mTcSFQLtpkB1XKbJ32crX06pxZawHXVpIu/eusmprPIjhP5tgFTzPyKox2HIB
 FmcpKzCCf7ExzLcK51KGbVVturFadkMjvl0Sd2P2b+qtCKkUDCVDFSi03go2PAlzDXst
 6ppA==
X-Gm-Message-State: AOAM530EBBmnq4wnq/nj+RxKoX7T+K6jF/02Mozr40xke4SUxRBwXdJo
 wQeQRXodVnYu3ad8fkwXQux/WnrRmoXs0O7htplz6bLFRJA+jO63sSxDUACapmMdpkoPInilevR
 7fadRkBl0ZJ9cQb0HRJCuCCE/044HPc6zIDQysm3LhXKg0PgL4HbNU/C9ZslZ
X-Received: by 2002:a17:906:1806:: with SMTP id
 v6mr6161266eje.420.1630791434012; 
 Sat, 04 Sep 2021 14:37:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpynYWYI4HoSkXA7MGkF4YnXtpEl8K0/ykNZgl5Q4ulPJKPVdI4q6tto0h7Cw8iC08mhVSbQ==
X-Received: by 2002:a17:906:1806:: with SMTP id
 v6mr6161250eje.420.1630791433839; 
 Sat, 04 Sep 2021 14:37:13 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id b8sm1872766edv.96.2021.09.04.14.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:13 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/35] vhost-vdpa: remove unused variable "acked_features"
Message-ID: <20210904213506.486886-26-mst@redhat.com>
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

"acked_features" is unused, let's remove that.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-2-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 19187dce8c..72829884d7 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -29,7 +29,6 @@ typedef struct VhostVDPAState {
     NetClientState nc;
     struct vhost_vdpa vhost_vdpa;
     VHostNetState *vhost_net;
-    uint64_t acked_features;
     bool started;
 } VhostVDPAState;
 
-- 
MST



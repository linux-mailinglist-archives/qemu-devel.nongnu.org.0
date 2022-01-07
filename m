Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01634876A3
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:39:41 +0100 (CET)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nau-0007gf-VA
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:39:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2e-0000Cq-Ce
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2c-0001sg-UM
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHSJcWtTIMlbxRfYVXtkQUvuw3rw0rHE0YLD56kL/PM=;
 b=cVw7N3KNylkTgu4eeIvsaGRac8GajnNW8nK6RLWU8sFp3pkdH/oTgk67jPseFmm/d9ovBt
 ZHvF1y/7XM+uKEAz67imAMDPIYowdXThhAp1+4Mo5Zq/tas9igZzgexzLKBTPvtyfsF+Ts
 eoQC+pC5Sc9PZpXCyc+vE0ODNIsO84E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-KDgftBRbPESjd02YesIKNg-1; Fri, 07 Jan 2022 06:04:13 -0500
X-MC-Unique: KDgftBRbPESjd02YesIKNg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c3b8300b00345c3fc40b0so4489618wms.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHSJcWtTIMlbxRfYVXtkQUvuw3rw0rHE0YLD56kL/PM=;
 b=i3pHWqFPtDxI3BOZLLt9NCIILSOvtrHO+qzxHBVbC1VPpVfys4CKe4BhhRkY10HsF+
 pXdSGFSLes7B5eXd2tDKiLt/2xK5DI2wKoNVZKRe3EJeRj/xe1dfgOqnZ6da2t1/rn75
 eysUR8kkYi3qT8kj4+UX+U3KyAyX4fZR4Qq2qUwJWCkhxGaPq34ISzbfG+64MVAeRRwc
 w7tzQc0Z5sXEJkvX+Q6UQDIeN77AZLyLf8FYrJc4XsMV/sP32Oh53K75109zW6gdeqkl
 39vlZtfiO9HNoDbbfQMwJOjz3Obh1GWuxTkkUqkF6SY47nee3L5ElV10YGlZuOCM6mg0
 FpKA==
X-Gm-Message-State: AOAM530LK6WS+1DMV0S00STp/vEIC4R5kJkWbqwIrw76RdRe7vdiJsn+
 KqrShlH4tH0sTYpkn9VEXZRqQAspK6yXSKxSUHO/uLqCrrKvZGEF/RNkmj9lZCn6vphc2Wajpzo
 N7+Vjuibw5BbRq1tvSTtHwjzV2IkKcYLNkYti8p833ZPt0XPpX98kkHntPuF/
X-Received: by 2002:a1c:7316:: with SMTP id d22mr10571748wmb.5.1641553452145; 
 Fri, 07 Jan 2022 03:04:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2jf/dhdlzrmOt2TZ9xGQM1buhbPYlHP7dBDgO/HPodzmT4czjRMhjwnk9H7scCt/ghilOOg==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr10571729wmb.5.1641553451960; 
 Fri, 07 Jan 2022 03:04:11 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id h2sm3109547wrr.96.2022.01.07.03.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:11 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/55] vhost-user-blk: propagate error return from generic
 vhost
Message-ID: <20220107102526.39238-23-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Roman Kagan <rvkagan@yandex-team.ru>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Fix the only callsite that doesn't propagate the error code from the
generic vhost code.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-11-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f9b17f6813..ab11ce8252 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -100,7 +100,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
                                &local_err);
     if (ret < 0) {
         error_report_err(local_err);
-        return -1;
+        return ret;
     }
 
     /* valid for resize only */
-- 
MST



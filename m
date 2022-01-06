Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F515486561
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:40:51 +0100 (CET)
Received: from localhost ([::1]:59076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5T0c-0000Pv-BV
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:40:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdi-0004W9-Jv
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdb-0000qU-FR
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igipHoFkqG9ZkUxoX09dBUcpAVne7E9NONhvrwx9lW4=;
 b=Jl1fS7TXVJ3CLATWqfYkcjSj7vM7a7AYUX39N27SQ+IoOCufYLaiC2MRj6Z8StqRXy/OCi
 Z6poCIdWnqynJMDpMN0jaWJIAOObNwZ2XCUu0bupk9tLLNqiMWjoV/dguSeio5r8cg4Ylm
 AJ80OIxFXs4l3tobud/QUFy4XaXdlCE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-DECdt5NHNk2GUeyhDc7qKg-1; Thu, 06 Jan 2022 08:16:57 -0500
X-MC-Unique: DECdt5NHNk2GUeyhDc7qKg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v14-20020adfa1ce000000b001a49d6587ceso1181506wrv.21
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=igipHoFkqG9ZkUxoX09dBUcpAVne7E9NONhvrwx9lW4=;
 b=U+HkDLsYoEg2LNMzECuGUMIij18ZXfXydKi83xUXPNJS4q9Ed+oZU6oCsp8227qavM
 cnsDu21eXCk8DrntYZqV6tua83Ni6A5DYIkXFjDI8os0pJL92P+7syl6EBwDUzwwh9V8
 SWpzGjQFn+Ska4b4X8R2+khZOxY6vzHas+N2/xbB3biMIKbnOw7O42VjOKafDMKpziG0
 jrSOcfaYNcvVWG+DEB+eUEXVjWCaViBpyNHBJ0uNctGdVOd3psmhzfzyVpQfy2KpJ996
 dSWBd1Q3hToLJmQXEBK5OJnHYRMXxLgXREY84SHhu20YXoRyrpiFnaIVfLXuBk6NC8ht
 ZORw==
X-Gm-Message-State: AOAM5328BimlqC5uLUF8lu7U0qe5pgjqLx4UkHHssLlhG6RD1ONHjt3t
 2lRlQuxrl2qfQuI5DNQhEa15lI9W9MhgHpBmfPEgau9AxRLwXCgxWSAtCTcbPHPQxHBgOhngLz6
 ek8ipPl1RogMj3AZXAzCE3ktt/GvJOCMxY5K6qBsUuVypYkdwpQ8EP/Pn0x7S
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr7239661wmi.188.1641475016090; 
 Thu, 06 Jan 2022 05:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmVSChZUbyq6RP9z9zDyrXAHrHYkUZS1v+eNy0ZI6vpzvEfw/2A8OgikUNmJ8IRH22dH2Ihg==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr7239645wmi.188.1641475015916; 
 Thu, 06 Jan 2022 05:16:55 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id o3sm1731769wmr.15.2022.01.06.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:55 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/52] vhost-user-blk: reconnect on any error during realize
Message-ID: <20220106131534.423671-15-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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

vhost-user-blk realize only attempts to reconnect if the previous
connection attempt failed on "a problem with the connection and not an
error related to the content (which would fail again the same way in the
next attempt)".

However this distinction is very subtle, and may be inadvertently broken
if the code changes somewhere deep down the stack and a new error gets
propagated up to here.

OTOH now that the number of reconnection attempts is limited it seems
harmless to try reconnecting on any error.

So relax the condition of whether to retry connecting to check for any
error.

This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
during realize".

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-2-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index ba13cb87e5..f9b17f6813 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -511,7 +511,7 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
             *errp = NULL;
         }
         ret = vhost_user_blk_realize_connect(s, errp);
-    } while (ret == -EPROTO && retries--);
+    } while (ret < 0 && retries--);
 
     if (ret < 0) {
         goto virtio_err;
-- 
MST



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0C488088
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:28:35 +0100 (CET)
Received: from localhost ([::1]:52618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60X4-0005Mh-88
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:28:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60AB-0004SP-Lg
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60A2-0002NR-Hp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHSJcWtTIMlbxRfYVXtkQUvuw3rw0rHE0YLD56kL/PM=;
 b=Mz/nCB9WPkEQUG4bNQSvFfNnXH72YnHS3FsCpTh40BWVQXzAE5A9gkbuVaIvlErb28hBHS
 dgJ/PWulXnr+48ohVWlrFlPuEapfREOWOeBUf+P6goQRgyXsenbTZo3JvQPieioFpq7Y8E
 vkz0Rf+VVbdwrQEumYOlmkEY9AYFBBw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-O63EmdgCN-6HWjXkK2wbhQ-1; Fri, 07 Jan 2022 20:04:44 -0500
X-MC-Unique: O63EmdgCN-6HWjXkK2wbhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so2503608wmq.7
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHSJcWtTIMlbxRfYVXtkQUvuw3rw0rHE0YLD56kL/PM=;
 b=sZjslILOBN2gja6K8PbiBD2L/ddEEc+aS2W/v77gFUOD2BMWK3rfoePGcLIPg+ulXr
 xG2Q+Zbl4j6IqkpZDQaacEt9MQ9OrLS/civuI7mwt1XUWnAE0FdgSzZCnGWJ/AJll+Nw
 jMtijsKkubc4hVI+ChW8wYSiG9M7mufA+HzsynquVA249TkwzfDc9edcg4p1mI3WBpeK
 zCFAUTpxHkurp+1I91dAaaCkBAJ5pVHXLgSXL7irKbKZRjoDsuczc7UCSNixRQkVgNEO
 moIWZlnHAvwMzQUWLHvsVFD/HvdcdA1GZsP9Rvwf+MupaH7a2w4Da5+UFnd3YxORErvD
 Qd4g==
X-Gm-Message-State: AOAM533+Dj7p2MbDjT2YeBoeLPAt4443HXcvvq4mu5EOt4G7U10APgkB
 42CRnIkvkl/AnhJdAugl+iz0tjEUI4C+xVhimOeiobSCaJKdL+K+90yVG3u9Y0qnwYWqa85KnY7
 o73YiFUTIdZMvAk3paY9l2XRPtjlSO3yDYcxwku5sEa9TWqhOCXRcuMYfKhXW
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr13006205wme.55.1641603882915; 
 Fri, 07 Jan 2022 17:04:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxecDUDziP6t/TK5WPJK7TC9ysDFszpo4kJO89WngizRcYwv1I7zCr3sJ2EPs0MERBjRHcyDw==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr13006193wme.55.1641603882734; 
 Fri, 07 Jan 2022 17:04:42 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id m17sm226693wmq.31.2022.01.07.17.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:42 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 22/55] vhost-user-blk: propagate error return from generic
 vhost
Message-ID: <20220108003423.15830-23-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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



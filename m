Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE63B1D2B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:07:38 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4TZ-0005MH-7h
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4PQ-0007cT-Ds
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:03:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4PO-0005Wn-LD
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Ys5gsaldEAzXWeCFC7VS1rwzAni3ldsSNXIx6ad0x0=;
 b=MAae4Y+Fxn7zAF4IAeQY7MWz1jfvaSXP1VsEjw7YPLG5RQlwCoK1DLWI0Yohmfc/rDPO8b
 Q9SQbdxRgDo8aCTMOEHbZvqY2IAhJiCM5+4y+P1oYIZ59uahu1Nr/6ur5omqad7CywFaaO
 PXCAHxgAOdcyxe/2J0C2mp114q2yxDg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-tgxTe8LzN4at4sdtjCvUtw-1; Wed, 23 Jun 2021 11:03:16 -0400
X-MC-Unique: tgxTe8LzN4at4sdtjCvUtw-1
Received: by mail-ed1-f72.google.com with SMTP id
 v8-20020a0564023488b0290393873961f6so1463498edc.17
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+Ys5gsaldEAzXWeCFC7VS1rwzAni3ldsSNXIx6ad0x0=;
 b=p00d+oTWimjxl1CQEAo5pViKebknak/OhnC/H/+AkMnp1bOkZNmY4K/kPiqiq8Toxb
 DT+Uvyp5Wsr+ZziU1HH4VVUJdoK4S9WpedOyaPfuQXi2qxTqDWuPRy59HcvEklPONrRo
 y7A+Ahw0nyHpgBy0VEauocGRvOSQLq1ZragnXBEq/JcoZH2GMHnGjO+bx6oPmgIg9Gxs
 H7zL3S0gVS4nBz/UdbSvNG0FCy+SFyja9hJ5ANy1aJwiJD5Hw+2EyqKTCzWeoESnIRjr
 dU6037ENedT0VFX9TJsXxiIAx8K1kH3vVfd75qpwyAsN5fsRD2PsZ/8OOgGt6TSI/P8e
 URyw==
X-Gm-Message-State: AOAM530MuT7zViNQLS8FwEzqvHmFVOjN28rj0SIIvNNl9YSa+JDrEdjl
 pCzkUAxp+HZ3yS6/xkhTeN7dNXhQ445D4Ut6EeubZPpd3ZjgY7rOAbL8NbUGTeCqXYTNk03N2Js
 pesLSZq88erfdj9E=
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr121018edr.245.1624460595622; 
 Wed, 23 Jun 2021 08:03:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUk/DEJwBHPGH6961UxUPlXtUhnFMnta+YBb0Kk55tcnksVG9iCVtmc0Tb+HUFkAs3OG2Qkg==
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr120992edr.245.1624460595380; 
 Wed, 23 Jun 2021 08:03:15 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id v28sm26224ejk.84.2021.06.23.08.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:03:15 -0700 (PDT)
Date: Wed, 23 Jun 2021 17:03:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 07/18] vhost-vdpa: tweak the error label in
 vhost_vdpa_add()
Message-ID: <20210623150312.7g43l5qjwacxhw43@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-8-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-8-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:16:39PM +0800, Jason Wang wrote:
>Introduce new error label to avoid the unnecessary checking of net
>pointer.
>
>Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 13 ++++++-------
> 1 file changed, 6 insertions(+), 7 deletions(-)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 21f09c546f..0da7bc347a 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -100,19 +100,18 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>     net = vhost_net_init(&options);
>     if (!net) {
>         error_report("failed to init vhost_net for queue");
>-        goto err;
>+        goto err_init;
>     }
>     s->vhost_net = net;
>     ret = vhost_vdpa_net_check_device_id(net);
>     if (ret) {
>-        goto err;
>+        goto err_check;
>     }
>     return 0;
>-err:
>-    if (net) {
>-        vhost_net_cleanup(net);
>-        g_free(net);
>-    }
>+err_check:
>+    vhost_net_cleanup(net);
>+    g_free(net);

Should we set s->vhost_net to NULL to avoid use after free?

Then we should also remove the `assert(s->vhost_net)` in 
net_vhost_vdpa_init() since we can fail.

>+err_init:
>     return -1;
> }
>
>-- 
>2.25.1
>
>



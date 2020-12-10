Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1114B2D55FF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:03:22 +0100 (CET)
Received: from localhost ([::1]:37844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knHr7-0002tV-3Y
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1knHoL-0001E0-4q
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1knHoF-0000Jf-NO
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607590822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TNP/S7RrYO7SRHdoAnPXmh7RCUcSMXyzlri/NHKJ2nU=;
 b=OYMK4p5YYTl4Z4uN2lH4Kc2E7Qyk3JXWarrVAUnX3ug+kHNTtpoTbfmYeRJk3VFsw9viSR
 IaWeJV77yI26cObSe7QtxZ6OoJwXcLDIDOS+6TFpRpb7FXZvVjTcasSfAS0WE2sJVjotC3
 7oowsjIFP7oMbkdW9GjbD/vYCn9mZrE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-P4IvFhFCOGKb2DawqBU9UQ-1; Thu, 10 Dec 2020 04:00:21 -0500
X-MC-Unique: P4IvFhFCOGKb2DawqBU9UQ-1
Received: by mail-wr1-f71.google.com with SMTP id j5so1672469wro.12
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 01:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TNP/S7RrYO7SRHdoAnPXmh7RCUcSMXyzlri/NHKJ2nU=;
 b=O2/TtQvFR40jcslqbt4ZC70KsBMTUN2FJz89sAgdgNIxwz6VKORioEY5xlwjO16Coc
 jOZGMRkFwmOibvVOR+ouNvOEz7nZK2YR2UkQkY6FaBivv+jN0dxHA7F9h+1qDdnu1caO
 ddStCQ085xobIGvhTMHTk+p8Bov67EUqOqUgDYOgFp4kerlcSHUiRlubQnyRSf4frzoE
 5cBQdPcAtflTLhfKZwpg3jPHac/s5EMq8oHWBrN/DGFx7qGImoEJKS8aKQ7Ywgx5O9X3
 j/ELe3BxejkE/Y84tzxTVa+qXnSOYG1Y8G8rVjgShgwbzNX2RvDF667np5CQ01HJ6FW9
 eKFQ==
X-Gm-Message-State: AOAM530aaUzWSsjKDFNDaIOdWI5/bsKl6df8X1+IhAysO/5dc67pLubd
 zB3zmzdIT7KhVAWrMMV/pDkFPwEonQWVxhdJ30Vaagx98Zwslg1+Ech9661I7NEmPCFRYJAwZ+s
 k1Wlgk9XGoIZouNo=
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr7029877wmi.36.1607590819869; 
 Thu, 10 Dec 2020 01:00:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyd/xz9H6PmPv2VIeAppgNqK0gUR7RI/DADbvCa7r7pQj8DgctBIgLOzSNzjAINQ02OmS+abw==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr7029856wmi.36.1607590819698; 
 Thu, 10 Dec 2020 01:00:19 -0800 (PST)
Received: from steredhat (host-79-24-227-66.retail.telecomitalia.it.
 [79.24.227.66])
 by smtp.gmail.com with ESMTPSA id o74sm10490203wme.36.2020.12.10.01.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 01:00:18 -0800 (PST)
Date: Thu, 10 Dec 2020 10:00:16 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH] block/nfs: fix int overflow in nfs_client_open_qdict
Message-ID: <20201210090016.c5fa57c6q266xvbv@steredhat>
References: <20201209121735.16437-1-pl@kamp.de>
MIME-Version: 1.0
In-Reply-To: <20201209121735.16437-1-pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mreitz@redhat.com, qemu-stable@nongnu.org,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 01:17:35PM +0100, Peter Lieven wrote:
>nfs_client_open returns the file size in sectors. This effectively
>makes it impossible to open files larger than 1TB.
>
>Fixes: a1a42af422d46812f1f0cebe6b230c20409a3731
>Cc: qemu-stable@nongnu.org
>Signed-off-by: Peter Lieven <pl@kamp.de>
>---
> block/nfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

The issue seems to be pre-existing to the commit 
a1a42af422d46812f1f0cebe6b230c20409a3731, but of course that commit 
touched this code and this patch would not apply before, so it seems 
okay to me:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

>
>diff --git a/block/nfs.c b/block/nfs.c
>index 77905f516d..8c1968bb41 100644
>--- a/block/nfs.c
>+++ b/block/nfs.c
>@@ -592,7 +592,7 @@ static int64_t nfs_client_open_qdict(NFSClient *client, QDict *options,
>                                      int flags, int open_flags, Error **errp)
> {
>     BlockdevOptionsNfs *opts;
>-    int ret;
>+    int64_t ret;
>
>     opts = nfs_options_qdict_to_qapi(options, errp);
>     if (opts == NULL) {
>-- 
>2.17.1
>
>
>



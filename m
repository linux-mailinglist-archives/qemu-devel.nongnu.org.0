Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C554F2B2E88
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 17:47:47 +0100 (CET)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdyiI-0005qr-De
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 11:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kdyhK-0005Fi-2b
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:46:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kdyhG-0006wy-VO
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605372397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jzzrVIYZ9qSAmLjzThxsjnZkdulhKx5PNWD+STA3qGQ=;
 b=Z0iCFwk3V0AUd8V8NvADODZvpefzpSzYDFJE76/TRiW2CcDxfnCulN8Sj/zvW3J21ONOOz
 nWSFcLauMdLAAvDsrHb5utIAxhYsn3JcmPHmZYd6JESmY0XZu2GXkv4t97K9skt2sTkFSl
 c+TC2qAxU+FlLJVUCnF7SzOMrSJFveA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-bbu_p2lsOhaX6eCKQqN3mQ-1; Sat, 14 Nov 2020 11:46:35 -0500
X-MC-Unique: bbu_p2lsOhaX6eCKQqN3mQ-1
Received: by mail-wr1-f70.google.com with SMTP id d8so7537325wrr.10
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 08:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jzzrVIYZ9qSAmLjzThxsjnZkdulhKx5PNWD+STA3qGQ=;
 b=lYkn8M9M8q2mQO9eSdti9A7tTCZ2TsJ+/ypU4E0GzGZtVTlE6Cs21PYZCzrqFDKXWi
 z6v8+/j48GbyxxPfe9+MxrfWYLsaL++7jcw1z2cCR4kC0EYqAwDgzI37VXFFJ05gtvxT
 6O3HgX1gHVWl80DvwpCQeI/AaLYdy6Bq0Fxjllzbruv7XicB2islUU2pvzm/Un9iaJlz
 X4aAuHS4H4aMGbHeXKx+5WZq0tI895wnm4LYwwuCk2pVG3dJ3b1n8Ks3QFkU4CRQazbf
 86vMonuuHl54WZjgx9NNdc5zSOar9kwYM6xQMo572aRatBMblVWyQ23shuiN/Ov/5+a+
 /5/g==
X-Gm-Message-State: AOAM531EmPaI7VB9lax8Bcw9rDf2QPJ64A0HIQxGxGe2du0NhQ/ITHH1
 hnjKeT7DHzCjK9nt64nH6++XYptoibfpPWfI2SfzAnoYN4EmyhypVhaXiTSqvgkR3gj3eiIRkC+
 y2XsWA2kbEM9dNNQ=
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr10386848wrx.412.1605372394721; 
 Sat, 14 Nov 2020 08:46:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGWMah9WxbOplswmYkmaGzwSE/Y5Cusq7efp9LsY1eLmqP/k7TGF26vDCrU0A+FOiiKZBSMg==
X-Received: by 2002:a05:6000:89:: with SMTP id
 m9mr10386837wrx.412.1605372394463; 
 Sat, 14 Nov 2020 08:46:34 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id x2sm9912441wru.44.2020.11.14.08.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 08:46:33 -0800 (PST)
Date: Sat, 14 Nov 2020 11:46:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: AlexChen <alex.chen@huawei.com>
Subject: Re: [PATCH V2] vhost-user-blk/scsi: Fix broken error handling for
 socket call
Message-ID: <20201114114622-mutt-send-email-mst@kernel.org>
References: <5F997B84.9040900@huawei.com>
 <5F9A5B48.9030509@huawei.com>
MIME-Version: 1.0
In-Reply-To: <5F9A5B48.9030509@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/14 11:46:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, Raphael Norwitz <raphael.s.norwitz@gmail.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 29, 2020 at 02:03:52PM +0800, AlexChen wrote:
> When socket() fails, it returns -1, 0 is the normal return value and should not return error.
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: AlexChen <alex.chen@huawei.com>

Tagged, thanks!

> ---
>  contrib/vhost-user-blk/vhost-user-blk.c   | 2 +-
>  contrib/vhost-user-scsi/vhost-user-scsi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 25eccd02b5..40a2dfc544 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -474,7 +474,7 @@ static int unix_sock_new(char *unix_fn)
>      assert(unix_fn);
> 
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
> -    if (sock <= 0) {
> +    if (sock < 0) {
>          perror("socket");
>          return -1;
>      }
> diff --git a/contrib/vhost-user-scsi/vhost-user-scsi.c b/contrib/vhost-user-scsi/vhost-user-scsi.c
> index 3c912384e9..0f9ba4b2a2 100644
> --- a/contrib/vhost-user-scsi/vhost-user-scsi.c
> +++ b/contrib/vhost-user-scsi/vhost-user-scsi.c
> @@ -320,7 +320,7 @@ static int unix_sock_new(char *unix_fn)
>      assert(unix_fn);
> 
>      sock = socket(AF_UNIX, SOCK_STREAM, 0);
> -    if (sock <= 0) {
> +    if (sock < 0) {
>          perror("socket");
>          return -1;
>      }
> -- 
> 2.19.1
> 



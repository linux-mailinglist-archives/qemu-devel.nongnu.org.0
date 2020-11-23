Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01E92C043B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:21:48 +0100 (CET)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh9ul-0006x6-Sx
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kh9td-0006Kb-4B
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kh9tY-0002c3-KA
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606130431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A330sNHBqnzc+kMlzOLd7aUaWOc96j+5ZiDlmusXlF0=;
 b=NDdZ2S6T4/ul0JN1gfsJqmA12kwQtQ7LoIYQJNJkxVe82T3rccirnRmCnKB960jyiHkVQA
 HFUcZ/YOENDM9GRW5rolZpaZMs9/D+aY7ushf7Qb7ZGeEDgiWkAbUa+5kYVxzW69FUFoQJ
 kfWDX09CerGZJwKnAKdDMrcJDXZHyL0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-eSRfWaE3PO2WDY2O6Bq24w-1; Mon, 23 Nov 2020 06:20:29 -0500
X-MC-Unique: eSRfWaE3PO2WDY2O6Bq24w-1
Received: by mail-wm1-f72.google.com with SMTP id g125so1416224wme.9
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A330sNHBqnzc+kMlzOLd7aUaWOc96j+5ZiDlmusXlF0=;
 b=OrAGKvugueJA6k6vCCZF+J/bonUJ2WJXF14OMVjEVWOgx7mbnBVw/JSuP1nD8lKV34
 2lRraYK4e6BgIkyoOBC1A6+rmDrtSlkiG4i4spdKeckyRSlyCRMtQpPALYG2m15LpIA7
 sX5lUAQ7ruRDBHehM1nmMxxkbnQ1ABkoT1bql64GL6u/DPvel1Aals+XxyrE0w+w+4Ik
 pvuhpd9LzEcGNIZ100EQBEnAxIzMTOASKtSDoSjzSmjoQEruop1kQIrl+Xf/vFYr229M
 yqsLz7o7bjIdklP2Ne5Rk9RaP/OaGec0ZSELR92qSWb5s9A5hoBmtGczMEvDdME889hm
 mh2g==
X-Gm-Message-State: AOAM5312j7TtzlNxCchgFvYc6wWey6UOHVIW5TfI6D8yYdcztxkubj8T
 muBo974F0gvFWXyADhqWovns4uxeXoGtrQ91V7iBQGrzbbdUBuG3xNDxqTTn1L3iOKkz7VZ7XqW
 Ipbx412U7hi6FY9g=
X-Received: by 2002:a5d:5222:: with SMTP id i2mr32102534wra.247.1606130427748; 
 Mon, 23 Nov 2020 03:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJIIuJE3AwsBc7lf+kMEGP9InAGnT4XZh++2XUQ8HJpxLZAISKbneAKzKavfWJ10nPJuk2Rw==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr32102483wra.247.1606130427197; 
 Mon, 23 Nov 2020 03:20:27 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id t7sm19200949wrp.26.2020.11.23.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:20:26 -0800 (PST)
Date: Mon, 23 Nov 2020 12:20:23 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/4] vhost-user: avoid g_return_val_if() in
 get/set_config()
Message-ID: <20201123112023.osj4j7kwmngjimfw@steredhat>
References: <20201118091644.199527-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201118091644.199527-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Coiby Xu <Coiby.Xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 09:16:40AM +0000, Stefan Hajnoczi wrote:
>Markus Armbruster pointed out that g_return_val_if() is meant for programming
>errors. It must not be used for input validation since it can be compiled out.
>Use explicit if statements instead.
>
>This patch series converts vhost-user device backends that use
>g_return_val_if() in get/set_config().
>
>Stefan Hajnoczi (4):
>  contrib/vhost-user-blk: avoid g_return_val_if() input validation
>  contrib/vhost-user-gpu: avoid g_return_val_if() input validation
>  contrib/vhost-user-input: avoid g_return_val_if() input validation
>  block/export: avoid g_return_val_if() input validation
>
> block/export/vhost-user-blk-server.c    | 4 +++-
> contrib/vhost-user-blk/vhost-user-blk.c | 4 +++-
> contrib/vhost-user-gpu/vhost-user-gpu.c | 4 +++-
> contrib/vhost-user-input/main.c         | 4 +++-
> 4 files changed, 12 insertions(+), 4 deletions(-)
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



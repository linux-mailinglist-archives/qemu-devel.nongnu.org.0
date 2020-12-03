Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF462CD7C2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:42:55 +0100 (CET)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkosm-0007XE-Iz
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kkorP-0006xN-9c
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:41:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1kkorN-0008Br-9y
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 08:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607002884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jprnTLH/+CB2lFk4WQqVggXQmNXoJCYcKVDhmIqXO9w=;
 b=Jn7EPWTUxBaqmJqJvVw+rYFDhqDXDapTblc5iYhS7mh8zmX2GzTe3VpIuDUYK5avj0ZVDy
 3ZS+FTKGqiZXAFXTt0gZyCSSwXOQn7+LMzwDZcSad4YPcMsrd8q2CObZ1/cmzdmu62NMAR
 q985HQiptqnPAEwvjzJKnVqG85+aA/c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-i8_aftWGPKuG9e7-OEfFiA-1; Thu, 03 Dec 2020 08:41:23 -0500
X-MC-Unique: i8_aftWGPKuG9e7-OEfFiA-1
Received: by mail-wr1-f70.google.com with SMTP id 91so1210179wrk.17
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 05:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uStGy8XQjn/UAlfLd7Z4SOzAeaFsdlmalAOJBw94N74=;
 b=COKfV9Z3lyG29HTee9MvnTAEpcBALeZh+fTK0FU8PKNWJ457EUVSEsRuNAd9MyyPPr
 YcZM/+AK91exhpoaudwYHjt8VpbDxvd3eccgnPf9y/0fGwPm4FOOfRCE+1Y98RHCbVd/
 WstTVcMBGtUbNI2z5Sobj3c1btlsEjRFoJAIRx0D6TnMJDXz/5Em3ey6X+cyE8D4nYUO
 swRVpgGJakgEyMx//WhWxtW9Z2SPe4dwEJvNcmIYH81US+M9sOwwI+eqN51jDZa1+PxD
 ww6ySZ7R4ZhnoPC/0FkqT0tnCZPNkyFmyMp9NhfQQ+99OlEl77L6fRxliSS4TE8i0qum
 TgMg==
X-Gm-Message-State: AOAM531BtWF2rQrsq2b7Oc2wNuz66i+GuBOa73RA6ayGN7t8QQNlIfkY
 rcpiF5MCSzoim2HzGPb3L6qxLxisPUAveNL8Eosih9ZvluljkqtjlqfRQIhVYKfRjzucqWV8IAL
 Ssbsblye4qAjG5ik=
X-Received: by 2002:adf:f181:: with SMTP id h1mr3743971wro.267.1607002881103; 
 Thu, 03 Dec 2020 05:41:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyj5ZUFk7ROFfzTxWETZHXOJl3Jw0zGIBdkx0iMRXz3G6G9xk9Bj8+xgpM2ic6Pg9DkkNULbg==
X-Received: by 2002:adf:f181:: with SMTP id h1mr3743938wro.267.1607002880842; 
 Thu, 03 Dec 2020 05:41:20 -0800 (PST)
Received: from steredhat (host-79-17-248-175.retail.telecomitalia.it.
 [79.17.248.175])
 by smtp.gmail.com with ESMTPSA id l3sm1892529wrr.89.2020.12.03.05.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 05:41:20 -0800 (PST)
Date: Thu, 3 Dec 2020 14:41:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/4] vhost-user: avoid g_return_val_if() in
 get/set_config()
Message-ID: <20201203134117.2fdqiiapcjnlwj66@steredhat>
References: <20201202152611.677753-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201202152611.677753-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 03:26:07PM +0000, Stefan Hajnoczi wrote:
>v2:
> * Print errors [Marc-André]
>
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
> block/export/vhost-user-blk-server.c    | 6 +++++-
> contrib/vhost-user-blk/vhost-user-blk.c | 6 +++++-
> contrib/vhost-user-gpu/vhost-user-gpu.c | 6 +++++-
> contrib/vhost-user-input/main.c         | 6 +++++-
> 4 files changed, 20 insertions(+), 4 deletions(-)
>
>-- 
>2.28.0
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



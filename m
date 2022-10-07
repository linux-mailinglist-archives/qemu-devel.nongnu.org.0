Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB95F7723
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 12:59:43 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogl4w-0004XU-Ch
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 06:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogkoy-0001b6-Uo
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ogkou-0002Qy-K4
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:43:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EQSc1cmTXgPuQ6W+8TYDBNzK98CiGyggzpjXRfDHK1c=;
 b=FXvr/8klYxrAszyTN/7tIdKYZ1mxp/1g/r5JEjs7xfLuWRf/U1lp0/+aAIDu3cWwy53ajv
 xj2GttcIxwM/u/sv/Tx2+ylrHf2hsFvdIzVLpcsuPmKo2Uu6cTKcU2kruVIxGYiJO98j2K
 lSuaLoGisl2XykYf3UWPaw6CF9cEkd8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-135-OLGqtEpOOe6bd9NTpx_MzA-1; Fri, 07 Oct 2022 06:43:04 -0400
X-MC-Unique: OLGqtEpOOe6bd9NTpx_MzA-1
Received: by mail-qk1-f197.google.com with SMTP id
 u20-20020a05620a455400b006ce5151968dso3437316qkp.11
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EQSc1cmTXgPuQ6W+8TYDBNzK98CiGyggzpjXRfDHK1c=;
 b=vkWNSCc61CEvn+W0mjaQtwyZm2UhR0uEhrWi+XC3UzBlCNnzP6VEM+3Qn8nxGtEGeR
 lQ7zpwDe28tp3x25mx+5jSeVhdVlPOUfGatud3ydRPkZswsQMFu2KrevVB2/pkpBbzGp
 7UFLybHQecgh2xVjF0Z/Mz1SCD1xC8wEUmSwEDDRoBtxHMLhrXA7NcazD4pw2C5xzWQq
 3c0Vjk2QV9+5OBYdpznw8AxtYQBH+mhsOEswbIGP7INbiGu4XThNZrYKnvEL5IAdtDyJ
 6pf+cm77tS9aWd6npEX5rT1pHY2pRBlR6TpQINvvtUnDHJGdVEiw1CM9H/qgYD4Ae3fU
 mX9w==
X-Gm-Message-State: ACrzQf1MoI2PwuBX1/zAYxE9ppalNm8+No2BTCax5BTycy6dKvxXrEHS
 THY5gmznTGVX6ZpubOLMMgbV7MCRIcEgRWU+QPqIa54W5rmRd+97byItomSlK7o2dVVkKG07Akl
 ANQYswrm8SE7n9Ts=
X-Received: by 2002:a05:620a:2891:b0:6bc:5c73:9728 with SMTP id
 j17-20020a05620a289100b006bc5c739728mr3139551qkp.178.1665139383489; 
 Fri, 07 Oct 2022 03:43:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5h/Bf4sQQaclRdzaAq6WVyGqxSOhdC/E04BaeNhwoJPECNTTanYv0KZ25Vie9I9WUtGtVm4g==
X-Received: by 2002:a05:620a:2891:b0:6bc:5c73:9728 with SMTP id
 j17-20020a05620a289100b006bc5c739728mr3139513qkp.178.1665139383261; 
 Fri, 07 Oct 2022 03:43:03 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-222.retail.telecomitalia.it.
 [79.46.200.222]) by smtp.gmail.com with ESMTPSA id
 t24-20020a37ea18000000b006e42a8e9f9bsm1659072qkj.121.2022.10.07.03.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 03:43:02 -0700 (PDT)
Date: Fri, 7 Oct 2022 12:42:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, Hanna Reitz <hreitz@redhat.com>,
 David Hildenbrand <david@redhat.com>, integration@gluster.org,
 qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 afaria@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Jeff Cody <codyprime@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Xu <peterx@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wen Congyang <wencongyang2@huawei.com>
Subject: Re: [PATCH v6 05/13] block: use BdrvRequestFlags type for supported
 flag fields
Message-ID: <20221007104252.vtbm4qr47o7jgpds@sgarzare-redhat>
References: <20221006213507.645402-1-stefanha@redhat.com>
 <20221006213507.645402-6-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221006213507.645402-6-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 05:34:59PM -0400, Stefan Hajnoczi wrote:
>Use the enum type so GDB displays the enum members instead of printing a
>numeric constant.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> include/block/block_int-common.h | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



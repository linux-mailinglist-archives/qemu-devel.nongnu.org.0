Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7696040AF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 12:10:36 +0200 (CEST)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol61z-0007E0-0o
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 06:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5jJ-0002cC-Co
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1ol5jG-0005OX-57
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 05:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666173073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GHrsoMZtZTe9dN4DMIWX4NJWpTuzHXpgaXMkTe006CA=;
 b=YT4l/BS67fqA44fjlRYEErLs7vvx+PF39Ybd7yqS7zyH6jf9j7lykjQ3H5xevjrtZk4ENi
 ZNorA6yGzVxsZ1v2c3L8s2lO+eLS1UeYDr+FGcjztGffGKRIMSBL8Hlz796GLdHrMSGdnO
 jOS+4y04VEqfFe2XTnSn1KkQdIWm+7E=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-1t5c2Nz8Nn67fnjIZSi6Pg-1; Wed, 19 Oct 2022 05:51:11 -0400
X-MC-Unique: 1t5c2Nz8Nn67fnjIZSi6Pg-1
Received: by mail-qv1-f71.google.com with SMTP id
 mz8-20020a0562142d0800b004b18a95b180so10192072qvb.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 02:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHrsoMZtZTe9dN4DMIWX4NJWpTuzHXpgaXMkTe006CA=;
 b=QQ04XDJQZ29g4WnWppIIbNojTF09qUjRy/tAhBRdQZBEU6IuLylN1AoQDEqO+x/+Zs
 7MPU6EGji7CBgDFhJNJd4vrfpRpc5kLVkM0P5GbtK102VqDRPL6kYbUjEXk9PQAWA9+l
 Rs5tKqZjfQaDJpUqT7WAOrGgM9I5UYBILtMUNhXBSuNPLaJgW0TTh+o1fkU9xEdcux/O
 9a2xOJLTvb5vjZl375sd/GLaILa5iVzO1UYrQXgdS2T+9cRYdCRKbHTH3NqmXECfOzcM
 UQvuhIiwg+hT1YCDIUBEIgWL8gLz2DN8c8wIfFbBDosrSuNwqaoD+hhq2lsuyo7ymd9o
 O07A==
X-Gm-Message-State: ACrzQf2Vgt2+71YzINM18x3NPjaXoyuKbFL4epE2wA9VTT9zAnh9iLoC
 yW6ZAGm8I/M0CobuzLqin0V5heqLg1aRI51caeDaiZzVGXAil7Uj20uJBavvA/vxDo2gicpuTrD
 Olb9JVZzoCDlhGfQ=
X-Received: by 2002:a05:620a:298a:b0:6ee:e31f:6247 with SMTP id
 r10-20020a05620a298a00b006eee31f6247mr4700964qkp.744.1666173071082; 
 Wed, 19 Oct 2022 02:51:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SXT5BR4evuRHtWJQdUP52OYdGn0q9wmF3xCgKtAsIMa3hmDj3IIU2nyPpOEIxhJfTLocnDQ==
X-Received: by 2002:a05:620a:298a:b0:6ee:e31f:6247 with SMTP id
 r10-20020a05620a298a00b006eee31f6247mr4700928qkp.744.1666173070856; 
 Wed, 19 Oct 2022 02:51:10 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.190.19])
 by smtp.gmail.com with ESMTPSA id
 br32-20020a05620a462000b006e9b3096482sm4430074qkb.64.2022.10.19.02.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 02:51:10 -0700 (PDT)
Date: Wed, 19 Oct 2022 11:51:02 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 afaria@redhat.com, Jeff Cody <codyprime@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 integration@gluster.org, Peter Xu <peterx@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@openvz.org>
Subject: Re: [PATCH v7 12/13] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
Message-ID: <20221019095102.wivcqzxbzgh3bfyi@sgarzare-redhat>
References: <20221013185908.1297568-1-stefanha@redhat.com>
 <20221013185908.1297568-13-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221013185908.1297568-13-stefanha@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Oct 13, 2022 at 02:59:07PM -0400, Stefan Hajnoczi wrote:
>Avoid bounce buffers when QEMUIOVector elements are within previously
>registered bdrv_register_buf() buffers.
>
>The idea is that emulated storage controllers will register guest RAM
>using bdrv_register_buf() and set the BDRV_REQ_REGISTERED_BUF on I/O
>requests. Therefore no blkio_map_mem_region() calls are necessary in the
>performance-critical I/O code path.
>
>This optimization doesn't apply if the I/O buffer is internally
>allocated by QEMU (e.g. qcow2 metadata). There we still take the slow
>path because BDRV_REQ_REGISTERED_BUF is not set.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>---
> block/blkio.c | 183 +++++++++++++++++++++++++++++++++++++++++++++++++-
> 1 file changed, 180 insertions(+), 3 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>



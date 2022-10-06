Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD95F6E0D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:18:44 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWOK-0006AJ-0g
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:18:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ogW1g-0001ap-Gp
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:55:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ogW1e-0007B7-NS
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665082517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IWMZgsQrCmR6JpYaxE9bs22P3TDmlcFhSLZFk4YPQVM=;
 b=KMDJs949t6FfGmOFk5V80I4ogS1xhTdJ+bN2FLVhiRrrkpsoAq6swWAOwTmYr4/aNHFXGK
 /Dw9Zqn/aHlq2bSyv4VAtrKsYUpAEp+8vb1fIrfX9tSvEWt8I/JDVOxejHM3sr/Z83HpYL
 f4E+9a/sjimp+29eDdwUAyRCYsAWedM=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-x0Y510ZDO86ZhGUMDCWmtg-1; Thu, 06 Oct 2022 14:55:16 -0400
X-MC-Unique: x0Y510ZDO86ZhGUMDCWmtg-1
Received: by mail-io1-f71.google.com with SMTP id
 f25-20020a5d8799000000b006a44e33ddb6so1733318ion.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 11:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IWMZgsQrCmR6JpYaxE9bs22P3TDmlcFhSLZFk4YPQVM=;
 b=QhbEDwge8kLzpjw7A1dEQJ0dg0tgyjUnZM5TlRpArh5KAKZczEEvnxIJY3vF47UIQa
 q3uVls0U9HJYohyE5h0Saa4m3gIBtl47UCLG8GuGUA+KpuYEOonkmMkxwKa9/2WjZBJv
 z8n5Eaklb59jRL1FWjc8o4/q3Yk5VCeWq1EX6B0sVaZHWYGl8kPjYKjNOCe0Spn4Ruhr
 8i9klo1mTpxXaiZaam5CysuBTlhaa5NWGQn7gb2R3eDTuaSz/Vj2FAP/Axd05QRr53NR
 x6yju5U0tFuCjnel0R+hpOrwS7fB2LpfNLymoap4EA9QovvXTijsqepZWk9cb1dj6QYQ
 LO9A==
X-Gm-Message-State: ACrzQf3N4GJt/IFcKepu8VFj2d4DNGZcMST/bcEAV5Pr7CfKUn1CEp3a
 lq83E3pfJkDIh0WM65vAjC3xipv3COmnJ30VJBY+wj5LMPnbE2NtXFZEB2gl7IG2Zj1EUq8cuF2
 JN85XT7Fcgub9hqOyNBLnRoI8CKBYdx4=
X-Received: by 2002:a02:b80d:0:b0:35a:f049:b8b with SMTP id
 o13-20020a02b80d000000b0035af0490b8bmr612525jam.141.1665082515480; 
 Thu, 06 Oct 2022 11:55:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Wr381F5U+vSW10poCt0Kp7Vkne8tq4cHOZaTpOiAjLsV8kXoevnwEiASXcRZrhZzpz7+OPvBJpgHR5M7rTSc=
X-Received: by 2002:a02:b80d:0:b0:35a:f049:b8b with SMTP id
 o13-20020a02b80d000000b0035af0490b8bmr612492jam.141.1665082515334; Thu, 06
 Oct 2022 11:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220927193431.22302-1-stefanha@redhat.com>
 <20220927193431.22302-12-stefanha@redhat.com>
 <YzSex5t0UIAT+LPU@fedora>
 <CAELaAXyURC9YJvtjY3O5iXsA5Q0WCTxM21++iqJ__pna9CSNOQ@mail.gmail.com>
 <Yz8Xr81Dw8M9rj3c@fedora>
 <CAELaAXw+sLHOX9drshJbZmpryRkQFd4ozuX-ZoCq+uTRwXsaWg@mail.gmail.com>
 <Yz8imZI9Bb0WGzKZ@fedora>
In-Reply-To: <Yz8imZI9Bb0WGzKZ@fedora>
From: Alberto Faria <afaria@redhat.com>
Date: Thu, 6 Oct 2022 19:54:39 +0100
Message-ID: <CAELaAXxLqaQE-NvPi1yVXWNZLnLtBQEbfDiaUS2Sf3J8U8-tEg@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] blkio: implement BDRV_REQ_REGISTERED_BUF
 optimization
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>, 
 Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 "Denis V. Lunev" <den@openvz.org>, Xie Changlong <xiechanglong.d@gmail.com>, 
 Eric Blake <eblake@redhat.com>, integration@gluster.org, 
 David Hildenbrand <david@redhat.com>, Wen Congyang <wencongyang2@huawei.com>, 
 Laurent Vivier <lvivier@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 Fam Zheng <fam@euphon.net>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, sgarzare@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, Oct 6, 2022 at 7:46 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Regardless, I'd say we want to map memory regions even if we don't
> > strictly need to (in cases where we can do so at no additional cost),
> > since that may improve performance for some drivers.
>
> The downside is that when s->mem_regions_pinned is true, virtio-mem and
> anything else that calls ram discard cannot be used.

Hmm right, losing that functionality would probably be worse than
potentially losing some performance for some drivers. Maybe a good
middle point would be to call blkio_map_mem_region() in
blkio_register_buf() iff s->needs_mem_regions ||
!s->mem_regions_pinned.

Alberto



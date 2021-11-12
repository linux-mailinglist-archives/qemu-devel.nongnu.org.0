Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACBB44E63C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:19:01 +0100 (CET)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVWG-0002v6-6u
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:19:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlVUb-0001P2-1e
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:17:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlVUX-0007jV-J8
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636719431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FZ8/fWHejHA/B7tsx0BZVClJsSkbt5ZoYDa9x7Swns0=;
 b=P2g7KipJDAJ1P2EnY6d0OZtM834Aq6DIRZFNKDhgJLGCM2i8hdQn9iV8DJQtGobuOSC+Sk
 a+hgPapDNkgbOKmkpRR1rgf7ity1IX0dn+fIfQlQcFp54V9Ycg+wutT/EPXP4Nq3uXEksy
 1XdwI3vW48yjGnGX5OX0Z721Kob7fyQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-II9qpt8fOBS1tIsxrnkbxA-1; Fri, 12 Nov 2021 07:17:10 -0500
X-MC-Unique: II9qpt8fOBS1tIsxrnkbxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so6217963wmd.1
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 04:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FZ8/fWHejHA/B7tsx0BZVClJsSkbt5ZoYDa9x7Swns0=;
 b=ABqR82QRV+qE6TNm+lP3GrNwEfAKnJrY1IG8X8jDY4NEje2IIRskVErJEvT7ILsTDq
 hJH7jXqs7g49OrGtdpQjfZuGSYHQvFFAX67flPuMB22Dlxrs37ZzryB02V7c3g1amgYb
 7bprnGORJPT77BsHrItZzfK1kGoYHDem1g6XzkSw0xLhTqoxC6Vw9KHnn3sffAtCtYr3
 a4o68aP/xUAE+hf6zEmmD0aCtl/Uy0JEHpoY5czeBlCIAPTIxhMJLQyMeXt6U0tc+Ytf
 01R6JCEPMuzv7zvYi/XDIawRrUStp6/iisngWctwoy5nHE425cGxR930+rxWC9DJSwJn
 NAvQ==
X-Gm-Message-State: AOAM530uASOw74d80IZoJ7BdqDBaKy7rN+3j9VoZGFB6SeY6sMW6dUdN
 iB11B3zUhKRT6iu6KjkuPeky+fsydPL9AfkX9+9+aYFEAr9828SoyGQnTH59ejOOmJbhC/GSqRm
 dPybdXuKO5ktbVT8=
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr17102426wml.119.1636719429061; 
 Fri, 12 Nov 2021 04:17:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6//6x5D+95S6l3HryNCT1ZcM+Q6F/BRjY4jhKEM31O1+YYHbFwgH7JkhO0+N7tzPJpuxfRw==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr17102383wml.119.1636719428813; 
 Fri, 12 Nov 2021 04:17:08 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o4sm14227204wmq.31.2021.11.12.04.17.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 04:17:08 -0800 (PST)
Message-ID: <3f91c9e4-fac9-f03c-a8a3-5940ac49434b@redhat.com>
Date: Fri, 12 Nov 2021 13:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 06/25] include/block/block_int: split header into I/O
 and global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-7-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-7-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patch, split block_int.h
> in block_int-io.h and block_int-global-state.h
>
> block_int-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
>
> Assertions are added in the next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   blockdev.c                             |    5 +
>   include/block/block_int-common.h       | 1164 +++++++++++++++++++
>   include/block/block_int-global-state.h |  319 +++++
>   include/block/block_int-io.h           |  163 +++
>   include/block/block_int.h              | 1478 +-----------------------
>   5 files changed, 1654 insertions(+), 1475 deletions(-)
>   create mode 100644 include/block/block_int-common.h
>   create mode 100644 include/block/block_int-global-state.h
>   create mode 100644 include/block/block_int-io.h

[...]

> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> new file mode 100644
> index 0000000000..79a3d801d2
> --- /dev/null
> +++ b/include/block/block_int-common.h

[...]

> +struct BlockDriver {

[...]

> +    /**
> +     * Try to get @bs's logical and physical block size.
> +     * On success, store them in @bsz and return zero.
> +     * On failure, return negative errno.
> +     */
> +    /* I/O API, even though if it's a filter jumps on parent */

I don’t understand this...

> +    int (*bdrv_probe_blocksizes)(BlockDriverState *bs, BlockSizes *bsz);
> +    /**
> +     * Try to get @bs's geometry (cyls, heads, sectors)
> +     * On success, store them in @geo and return 0.
> +     * On failure return -errno.
> +     * Only drivers that want to override guest geometry implement this
> +     * callback; see hd_geometry_guess().
> +     */
> +    /* I/O API, even though if it's a filter jumps on parent */

...or this comment.  bdrv_probe_blocksizes() and bdrv_probe_geometry() 
are in block-global-state.h, so why are these methods part of the I/O 
API?  (And I’m afraid I can’t parse “even though if it’s a filter jumps 
on parent”.)

Hanna

> +    int (*bdrv_probe_geometry)(BlockDriverState *bs, HDGeometry *geo);



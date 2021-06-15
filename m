Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5203A8669
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:26:08 +0200 (CEST)
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBt8-0006zW-TE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBnq-0007jf-Lr
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:20:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBnp-0001R8-0f
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623774036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D6K3IslK89EScYEyqboYPe62DLjwzr2sE1PoiY5H1Yg=;
 b=BOxiqkS+PB0zaR8dR/jbNAdTqPD9UVhxT+m6sQH8EEs1jNDzLEXcYPOjfIO00gzahTmPQH
 HicpJ8lVeoyqBR6Ba3dcIDiBLauVa5qOkv5nguIcKzL+D2Cl/7HA3F8YLkzydJYJNnfS1q
 GfEGoWo2J0pULW6GX7fPIkikkWMMLUI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-5NIU2YV-NNGEp5poufLDnQ-1; Tue, 15 Jun 2021 12:20:34 -0400
X-MC-Unique: 5NIU2YV-NNGEp5poufLDnQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 z6-20020a17090665c6b02903700252d1ccso4760997ejn.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D6K3IslK89EScYEyqboYPe62DLjwzr2sE1PoiY5H1Yg=;
 b=qJLd4dsetU5RD9/5RqyzamV1wVdDuGXNXHukXQm72zhWP8lcY3pNdU9uG8YcV4GIS8
 eYXYyttupV3OcjhR8y6aTU1tZKuutWPC3SrnrQxN92K4+tyDVp5QqZrVnQoJaqG2achk
 0Jv0p37XHsH8oIZr+7bTA2eXXTn4yzqSWY0Ga4t44YyRSYwAotkz7KNabjAB6bYMT1CC
 2fBCOZmNuifayUldkmcx7m1ZvPR83BUo83BlhOptAr/mZWLeuiXRyaCvZZ2LTiQjg4ge
 6wgNwpqAV9OHT5Ytvdo5LVxg9yuTIPOx98+7cmz95sfDzoAyayL/07iB5yT1pdbdYzcy
 /oEA==
X-Gm-Message-State: AOAM5334ocd9WJ2O43VdH4lM8X/bsqnsVPno+slt6JP/o/ohNwlMww2y
 fVb+IxCG2IN1doPWvPa6Dy/zTG4DoCA8UYRcwTVSCaoLVmmHavLkSX++JALZGvTWbtQqILDFFpG
 OhDIqZBRhZFVaZmo=
X-Received: by 2002:a17:906:8688:: with SMTP id
 g8mr346948ejx.470.1623774033385; 
 Tue, 15 Jun 2021 09:20:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLP8te89rvdlAQamdrdxzGGMOsC3lH/tualIXDnVoGWjs/NW6xMmh+tFDWgWak6A4k7DnsqQ==
X-Received: by 2002:a17:906:8688:: with SMTP id
 g8mr346936ejx.470.1623774033229; 
 Tue, 15 Jun 2021 09:20:33 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 a19sm10247758ejk.46.2021.06.15.09.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:20:32 -0700 (PDT)
Subject: Re: [PATCH v3 2/7] scsi-generic: pass max_segments via max_iov field
 in BlockLimits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-3-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <77e6386a-8070-dede-1598-bd397464ef78@redhat.com>
Date: Tue, 15 Jun 2021 18:20:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-3-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 15:37, Paolo Bonzini wrote:
> I/O to a disk via read/write is not limited by the number of segments allowed
> by the host adapter; the kernel can split requests if needed, and the limit
> imposed by the host adapter can be very low (256k or so) to avoid that SG_IO
> returns EINVAL if memory is heavily fragmented.
>
> Since this value is only interesting for SG_IO-based I/O, do not include
> it in the max_transfer and only take it into account when patching the
> block limits VPD page in the scsi-generic device.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c     | 3 +--
>   hw/scsi/scsi-generic.c | 6 ++++--
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 58db526cc2..e3241a0dd3 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1239,8 +1239,7 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
>   
>           ret = sg_get_max_segments(s->fd);
>           if (ret > 0) {
> -            bs->bl.max_transfer = MIN(bs->bl.max_transfer,
> -                                      ret * qemu_real_host_page_size);
> +            bs->bl.max_iov = ret;
>           }
>       }
>   
> diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> index 98c30c5d5c..82e1e2ee79 100644
> --- a/hw/scsi/scsi-generic.c
> +++ b/hw/scsi/scsi-generic.c
> @@ -179,10 +179,12 @@ static void scsi_handle_inquiry_reply(SCSIGenericReq *r, SCSIDevice *s)
>           (r->req.cmd.buf[1] & 0x01)) {
>           page = r->req.cmd.buf[2];
>           if (page == 0xb0) {
> -            uint32_t max_transfer =
> -                blk_get_max_transfer(s->conf.blk) / s->blocksize;
> +            uint32_t max_transfer = blk_get_max_transfer(s->conf.blk);
> +            uint32_t max_iov = blk_get_max_iov(s->conf.blk);
>   
>               assert(max_transfer);
> +            max_transfer = MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)
> +                / s->blocksize;

Now that I ran checkpatch for patch 3, I saw that it complains about 
this line being longer than 80 characters. I think it could be split so 
it doesn’t exceed that limit. It looks a bit like you intentionally 
exceeded the warning limit, but didn’t exceed the error limit (of 90). 
Is that so?

Max



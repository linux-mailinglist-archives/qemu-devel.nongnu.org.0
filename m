Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7572B42BB
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:24:28 +0100 (CET)
Received: from localhost ([::1]:54298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keccV-0006A4-BL
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:24:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecbd-0005W2-NL
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecbb-0006gH-KI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605525810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRKTTWsWHGZGO/jv9zo6HJH4VdJ1mbhniezBmF0H5lY=;
 b=QxPLWU7MZo3oAxZ3sYfGrVjrhu78OhC1xAFOq/Z0V5cQMoTlrj1euRRHqAM/GVi8fdPMQG
 6i+bgY/Fzcg/2GT6XyBtLWLoagx4iZ8G8lLVMM7n8JxWUyh/DAkBeZo3m6NQOZZI/HSXrQ
 ieAHCT34WYcUSlXo0XPfpwj9uMWtjgw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-VvqnlgRfOSS1Tcq3LGA_ig-1; Mon, 16 Nov 2020 06:23:28 -0500
X-MC-Unique: VvqnlgRfOSS1Tcq3LGA_ig-1
Received: by mail-wm1-f71.google.com with SMTP id u123so8592032wmu.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DRKTTWsWHGZGO/jv9zo6HJH4VdJ1mbhniezBmF0H5lY=;
 b=BgGwaOJoSogRILP8lsPhUWLAgVHIkKNK/96YfAVCu6pMhfDjB9qLiAUS1rbTB4DsaZ
 cX+DmsDDbQ3AATRIDgJwr62B/3Y+qLUflL3iIYLW365rfyn7jnDSTIJpKMoJOSKxrful
 IqgHaOUbvgR26QwMT1Ks+FkwmGLBTFknScR97zpHM5PjSeMQEXpr4d1/oihEg8lukODF
 Bar82/Vs9Lg/z0suR3MfUbCzjaS7E8C6x0g8c5Jbn3peo3i6co0dj/NGu90gXl/XeHPA
 D0ss0+EfcHypF6JXIHaW0oBB01jOYRViPKaXWKVv3jwYr0zFkoUEbe+Ah+IcKd41JJsj
 m8+w==
X-Gm-Message-State: AOAM532QCB1mHX2lk1Zdoge2Q0Z0IumWBjYy84QsJBCZ3broKJha7BbE
 DC/bdcIsEcKk+cCSAnP1AJSznwKjVshVzcpsmG2DZlWeFoo/XJKb/Ch095fzR7mVVzpr1aIYB0n
 VTWHtJ326omnHf1Y=
X-Received: by 2002:a5d:4448:: with SMTP id x8mr18564693wrr.364.1605525806969; 
 Mon, 16 Nov 2020 03:23:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq8ahWW6DJmJpLjMvjxslRtPXy4xkatqnOM/Hgddkk+NilHlaQKYWe6b5gLcqGM9ipnna32w==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr18564669wrr.364.1605525806704; 
 Mon, 16 Nov 2020 03:23:26 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g11sm22591845wrq.7.2020.11.16.03.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:23:25 -0800 (PST)
Subject: Re: [RFC PATCH 1/5] hw/block: blk_check_size_and_read_all should
 report backend name
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201116104216.439650-1-david.edmondson@oracle.com>
 <20201116104216.439650-2-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0a06d4fd-215b-4bfb-cef7-5d1a03e1a41d@redhat.com>
Date: Mon, 16 Nov 2020 12:23:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116104216.439650-2-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 11:42 AM, David Edmondson wrote:
> If there are problems examining or reading data from the block
> backend, the error messages should include an appropriate identifier
> to assist in diagnoses.
> 
> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
> ---
>  hw/block/block.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index 1e34573da7..8b284e1f14 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -20,9 +20,6 @@
>   * BDRV_REQUEST_MAX_BYTES.
>   * On success, return true.
>   * On failure, store an error through @errp and return false.
> - * Note that the error messages do not identify the block backend.
> - * TODO Since callers don't either, this can result in confusing
> - * errors.
>   * This function not intended for actual block devices, which read on
>   * demand.  It's for things like memory devices that (ab)use a block
>   * backend to provide persistence.
> @@ -32,17 +29,19 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>  {
>      int64_t blk_len;
>      int ret;
> +    const char *name = blk_name(blk);
>  
>      blk_len = blk_getlength(blk);
>      if (blk_len < 0) {
>          error_setg_errno(errp, -blk_len,
> -                         "can't get size of block backend");
> +                         "can't get size of block backend %s",

Maybe '%s' to notice empty name?

> +                         name);
>          return false;
>      }
>      if (blk_len != size) {
>          error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
> -                   "block backend provides %" PRIu64 " bytes",
> -                   size, blk_len);
> +                   "block backend %s provides %" PRIu64 " bytes",
> +                   size, name, blk_len);
>          return false;
>      }
>  
> @@ -55,7 +54,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
>      assert(size <= BDRV_REQUEST_MAX_BYTES);
>      ret = blk_pread(blk, 0, buf, size);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret, "can't read block backend");
> +        error_setg_errno(errp, -ret, "can't read block backend %s",
> +                         name);
>          return false;
>      }
>      return true;
> 



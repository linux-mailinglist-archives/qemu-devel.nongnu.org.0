Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C8618585
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 18:01:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdaD-0006Yi-5G; Thu, 03 Nov 2022 13:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqda9-0006VS-PA
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oqda4-0007EF-Pt
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 13:00:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667494839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BIvHDMBRZi28YlCDw840OhZX39OjgtGNBuVYg/d0rA=;
 b=aOG1ZKyAO+nO1yFBaXesAtm8QX1k2m6IrnFp/rP+VhyNidhcySe3K4fB3RHCiTUzuJ0j0a
 ITEtX+JQh//mfntebsAmOZ4eJtBtJHN/GWywxTN0CrXvSylGPlpKIVFQbXCdsmIArwnvSv
 ecmDTM4US15lYl+rvV7iUVZZmuDBdTA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-Fa-OSyvhM5KLbXfdx35SrQ-1; Thu, 03 Nov 2022 13:00:38 -0400
X-MC-Unique: Fa-OSyvhM5KLbXfdx35SrQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 v18-20020a056402349200b004622e273bbbso1784338edc.14
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 10:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0BIvHDMBRZi28YlCDw840OhZX39OjgtGNBuVYg/d0rA=;
 b=whmIcDMBLJH56Ni+OAu9vJJcjlb7qsL/lcBpflo17iAh4s2q8VyCUe7/C/97dv2qvd
 zG3WiTBMDhkiCDRfmPouAAmQwIeOJO+z1WnS/IGSPey6Uz87sphE8e+eQcLFLNAim6d+
 N3xVOyHh0Co1PFqUe+5On0ja34iXRQSHdQtJ8osN/1d3lxAFJx41hXEOtZXgH3aV9EYV
 TIj89Dl7CFm8KXmsqok5TXXiKJJ18fbMgyfU08Yh6/kJ9g7LrGzItCyKjDhI3vj9jUMj
 eYekEFkjkfuewkrTeVSZgXuiymx+uPfg7bBZ50vgt+P0t2uTVkvRfN+ckrCGETBhBE++
 Jaow==
X-Gm-Message-State: ACrzQf03o3TuOFGml1ELinKCBVbEsxkR/sj6rbhw+Nl6v46DspPi1jz+
 laZQcgM1SgPiYfGGNdEkEIPJ9c6acMbYmumtkSzQoEqOipWz10o0S83t4CX1shFlRTBN5PXtbmY
 BxB+JYsfOeLx/aqY=
X-Received: by 2002:a17:907:2c72:b0:7a4:a4b4:9fcb with SMTP id
 ib18-20020a1709072c7200b007a4a4b49fcbmr30082955ejc.403.1667494836580; 
 Thu, 03 Nov 2022 10:00:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78xWsGxEVeWlu9mvqt1tjANGaPXQDahpNAkrE7sJV761wkurAqHIr+XGv3RctIaEnCtmdHzw==
X-Received: by 2002:a17:907:2c72:b0:7a4:a4b4:9fcb with SMTP id
 ib18-20020a1709072c7200b007a4a4b49fcbmr30082926ejc.403.1667494836258; 
 Thu, 03 Nov 2022 10:00:36 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 23-20020a508757000000b004614fd33789sm743451edv.18.2022.11.03.10.00.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 10:00:35 -0700 (PDT)
Message-ID: <7cb1bf37-a0f4-229b-0b7a-653fce1f7fca@redhat.com>
Date: Thu, 3 Nov 2022 18:00:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 6/9] block/vmdk: add missing coroutine_fn annotations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221103134206.4041928-1-eesposit@redhat.com>
 <20221103134206.4041928-7-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221103134206.4041928-7-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/22 14:42, Emanuele Giuseppe Esposito wrote:
> vmdk_co_create_opts() is a coroutine_fn, and calls vmdk_co_do_create()
> which in turn can call two callbacks: vmdk_co_create_opts_cb and
> vmdk_co_create_cb.
> 
> Mark all these functions as coroutine_fn, since vmdk_co_create_opts()
> is the only caller.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/vmdk.c | 36 +++++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/block/vmdk.c b/block/vmdk.c
> index 26376352b9..0c32bf2e83 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -2285,10 +2285,11 @@ exit:
>       return ret;
>   }
>   
> -static int vmdk_create_extent(const char *filename, int64_t filesize,
> -                              bool flat, bool compress, bool zeroed_grain,
> -                              BlockBackend **pbb,
> -                              QemuOpts *opts, Error **errp)
> +static int coroutine_fn vmdk_create_extent(const char *filename,
> +                                           int64_t filesize, bool flat,
> +                                           bool compress, bool zeroed_grain,
> +                                           BlockBackend **pbb,
> +                                           QemuOpts *opts, Error **errp)
>   {
>       int ret;
>       BlockBackend *blk = NULL;
> @@ -2366,14 +2367,14 @@ static int filename_decompose(const char *filename, char *path, char *prefix,
>    *           non-split format.
>    * idx >= 1: get the n-th extent if in a split subformat
>    */
> -typedef BlockBackend *(*vmdk_create_extent_fn)(int64_t size,
> -                                               int idx,
> -                                               bool flat,
> -                                               bool split,
> -                                               bool compress,
> -                                               bool zeroed_grain,
> -                                               void *opaque,
> -                                               Error **errp);
> +typedef BlockBackend * coroutine_fn (*vmdk_create_extent_fn)(int64_t size,
> +                                                             int idx,
> +                                                             bool flat,
> +                                                             bool split,
> +                                                             bool compress,
> +                                                             bool zeroed_grain,
> +                                                             void *opaque,
> +                                                             Error **errp);
>   
>   static void vmdk_desc_add_extent(GString *desc,
>                                    const char *extent_line_fmt,
> @@ -2616,7 +2617,7 @@ typedef struct {
>       QemuOpts *opts;
>   } VMDKCreateOptsData;
>   
> -static BlockBackend *vmdk_co_create_opts_cb(int64_t size, int idx,
> +static BlockBackend * coroutine_fn vmdk_co_create_opts_cb(int64_t size, int idx,
>                                               bool flat, bool split, bool compress,
>                                               bool zeroed_grain, void *opaque,
>                                               Error **errp)
> @@ -2768,10 +2769,11 @@ exit:
>       return ret;
>   }
>   
> -static BlockBackend *vmdk_co_create_cb(int64_t size, int idx,
> -                                       bool flat, bool split, bool compress,
> -                                       bool zeroed_grain, void *opaque,
> -                                       Error **errp)
> +static BlockBackend * coroutine_fn vmdk_co_create_cb(int64_t size, int idx,
> +                                                     bool flat, bool split,
> +                                                     bool compress,
> +                                                     bool zeroed_grain,
> +                                                     void *opaque, Error **errp)
>   {
>       int ret;
>       BlockDriverState *bs;

Should not be needed either.

Paolo



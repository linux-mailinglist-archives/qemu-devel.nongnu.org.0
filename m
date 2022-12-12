Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1901B649CD4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 11:44:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gHI-0004ce-Ff; Mon, 12 Dec 2022 05:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gH6-0004Yq-IF
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:43:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1p4gH3-0005er-Tq
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 05:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670841785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxn5ddT+/YMagoITrYaMeDBeIKgLtA4HarPAPF23RAI=;
 b=KibND9xcWYJSJHmRgkOlVxTy11n3yR+yKaO1kDFBbZpTHi/u6MkZToRW2Zf3zV+twZZsc9
 lijNBWdwKpAP9iatq7zZja/nnKFok0LqElrVdKkXhk8f/7tBUJj6ALrQu2vJ6GkZ5ivvV6
 KGDP2o/t+xVQ8qOkdT04h7/d3je1AdY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557--8XttQSdNLqtk8BRTOZBmg-1; Mon, 12 Dec 2022 05:43:03 -0500
X-MC-Unique: -8XttQSdNLqtk8BRTOZBmg-1
Received: by mail-ej1-f69.google.com with SMTP id
 gn28-20020a1709070d1c00b007c177fee5faso961834ejc.23
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 02:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pxn5ddT+/YMagoITrYaMeDBeIKgLtA4HarPAPF23RAI=;
 b=sk+g+vw78PtSN8BoUzaXMFuIktOYbrqnBG2VYFYHczNvXWwB67Z/lAZhtAkNZM73jN
 xsR6itV3u0OB9J4xF7HnvHrE2Oy2caQGoQLJAOoJ45gqcuar2rSyqsc+kph8mAYc20iP
 s6i/rd7Xfvqiib8RCzRVLFlTaa01qBqdjM9ecYONX0DwH55ltYbX/Wwh99Q61bGhlHTX
 Fyeb6qGagVf4l74IH9/8LZotrRprbJdx0c5IzUk9HHFc4s2UmroJfESyqWn8sQFzlc7w
 2mVu6TDsns3tMUxoCDkOxndFWuCNbxslob51mh6lYhQmBy4FAHOWZKUpReEFNs+o9dgF
 Uz8w==
X-Gm-Message-State: ANoB5pkw309aakX5QhHndQ8QME9lTgioOfMKua39zUFT3aLC8GUjmvHT
 XRbr4VWOjubC4b9PCCxCY0g9lt1Gsydvs5ZbUmC2TZWIETqaEidjvYInwMCLcRwP/AqlY05AOXa
 jTWX5QBFissr3CwE=
X-Received: by 2002:a17:906:3c17:b0:7c0:dfb7:4476 with SMTP id
 h23-20020a1709063c1700b007c0dfb74476mr13428426ejg.57.1670841781319; 
 Mon, 12 Dec 2022 02:43:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5cH6Hhgn0RC/c/TSC4TevhZpHbUgJCNNRX3nWRQWN0Pn/1SrCersmlDsZUDBAk2hi4HKXDFQ==
X-Received: by 2002:a17:906:3c17:b0:7c0:dfb7:4476 with SMTP id
 h23-20020a1709063c1700b007c0dfb74476mr13428406ejg.57.1670841781089; 
 Mon, 12 Dec 2022 02:43:01 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 kv9-20020a17090778c900b0078246b1360fsm3143934ejc.131.2022.12.12.02.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:43:00 -0800 (PST)
Message-ID: <9af46103-c7b5-c73e-642f-3f9fa2337ef1@redhat.com>
Date: Mon, 12 Dec 2022 11:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/5] qemu-img: Add checksum command
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
 <20221128141514.388724-4-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221128141514.388724-4-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28.11.22 15:15, Nir Soffer wrote:
> The checksum command compute a checksum for disk image content using the
> blkhash library[1]. The blkhash library is not packaged yet, but it is
> available via copr[2].
>
> Example run:
>
>      $ ./qemu-img checksum -p fedora-35.qcow2
>      6e5c00c995056319d52395f8d91c7f84725ae3da69ffcba4de4c7d22cff713a5  fedora-35.qcow2
>
> The block checksum is constructed by splitting the image to fixed sized
> blocks and computing a digest of every block. The image checksum is the
> digest of the all block digests.
>
> The checksum uses internally the "sha256" algorithm but it cannot be
> compared with checksums created by other tools such as `sha256sum`.
>
> The blkhash library supports sparse images, zero detection, and
> optimizes zero block hashing (they are practically free). The library
> uses multiple threads to speed up the computation.
>
> Comparing to `sha256sum`, `qemu-img checksum` is 3.5-4800[3] times
> faster, depending on the amount of data in the image:
>
>      $ ./qemu-img info /scratch/50p.raw
>      file format: raw
>      virtual size: 6 GiB (6442450944 bytes)
>      disk size: 2.91 GiB
>
>      $ hyperfine -w2 -r5 -p "sleep 1" "./qemu-img checksum /scratch/50p.raw" \
>                                       "sha256sum /scratch/50p.raw"
>      Benchmark 1: ./qemu-img checksum /scratch/50p.raw
>        Time (mean ± σ):      1.849 s ±  0.037 s    [User: 7.764 s, System: 0.962 s]
>        Range (min … max):    1.813 s …  1.908 s    5 runs
>
>      Benchmark 2: sha256sum /scratch/50p.raw
>        Time (mean ± σ):     14.585 s ±  0.072 s    [User: 13.537 s, System: 1.003 s]
>        Range (min … max):   14.501 s … 14.697 s    5 runs
>
>      Summary
>        './qemu-img checksum /scratch/50p.raw' ran
>          7.89 ± 0.16 times faster than 'sha256sum /scratch/50p.raw'
>
> The new command is available only when `blkhash` is available during
> build. To test the new command please install the `blkhash-devel`
> package:
>
>      $ dnf copr enable nsoffer/blkhash
>      $ sudo dnf install blkhash-devel
>
> [1] https://gitlab.com/nirs/blkhash
> [2] https://copr.fedorainfracloud.org/coprs/nsoffer/blkhash/
> [3] Computing checksum for 8T empty image: qemu-img checksum: 3.7s,
>      sha256sum (estimate): 17,749s
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   docs/tools/qemu-img.rst |  24 ++++++
>   meson.build             |  10 ++-
>   meson_options.txt       |   2 +
>   qemu-img-cmds.hx        |   8 ++
>   qemu-img.c              | 183 ++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 226 insertions(+), 1 deletion(-)

[...]

> diff --git a/qemu-img.c b/qemu-img.c
> index c03d6b4b31..4b4ca7add3 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c

[...]

> @@ -1613,20 +1617,199 @@ out:
>       qemu_vfree(buf1);
>       qemu_vfree(buf2);
>       blk_unref(blk2);
>   out2:
>       blk_unref(blk1);
>   out3:
>       qemu_progress_end();
>       return ret;
>   }
>   
> +#ifdef CONFIG_BLKHASH
> +/*
> + * Compute image checksum.
> + */
> +static int img_checksum(int argc, char **argv)
> +{
> +    const char *digest_name = "sha256";
> +    const size_t block_size = 64 * KiB;
> +
> +    _Static_assert(QEMU_IS_ALIGNED(IO_BUF_SIZE, block_size),
> +                   "IO_BUF_SIZE should be alligned to block_size");

(s/alligned/aligned/)

A suggestion: We have a `QEMU_BUILD_BUG_MSG()` macro in 
include/qemu/compiler.h.  Nowadays it just unconditionally resolves to 
_Static_assert, I think before C11 was adopted it used a custom 
implementation.  Still, it is what seems to be used throughout the 
actual qemu code (disregarding roms/ and pc-bios/), so I think it would 
be more fitting to use.

But that’s just a suggestion.  It always resolves to _Static_assert 
anyway, so using _Static_assert seems by no means wrong.

So with the spelling fixed:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



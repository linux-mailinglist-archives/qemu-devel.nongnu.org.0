Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE23CB6DA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:42:55 +0200 (CEST)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4MF3-000228-Qk
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4MBl-0008H3-5C
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4MBb-0007h7-0I
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626435557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMH5jJf3PFaptG0S2ERje+FA38gTuEvzdAJCsfBD94g=;
 b=KEfESeDdAokJKNRgEJcvW+u+vlRaJUdDFwDbEMAHMcp4IFhfsVLTV1EIx9koUZPQEG9++2
 KPXTQsk9e3xfEky2OmljFg16cAulaHAOed/F1DNQ3UzvMFdqudqSY0IOgb8VJIrSuGqTbD
 F6H864TpdyyXt9YFqfOOSeMwbexxCOk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174--pQWUwmyOV-ip5f0I4JnwA-1; Fri, 16 Jul 2021 07:39:15 -0400
X-MC-Unique: -pQWUwmyOV-ip5f0I4JnwA-1
Received: by mail-wr1-f72.google.com with SMTP id
 a4-20020adffb840000b02901304c660e75so4659384wrr.19
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 04:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xMH5jJf3PFaptG0S2ERje+FA38gTuEvzdAJCsfBD94g=;
 b=l5kuiLRWslMQII3/Kms/7lEfvYcDKwbpb3iDwEJ4AAVOCIJDH0SvuKpNZfN4tJgnUx
 CY0WDkeAcFRKLwND0UAzrfWSfVc0A7KpolT4LHymK5YiBH+b1LeaEpH56CwRPuZtxv4P
 nRgn1dtC6sIE8zZnvUGe7rqWUN2b1OdWtdSZQAPVyJJikbGzQOnpBGFypsMS4y7egF0K
 8nd0KhzSof8B5PtuD97Jv2lwz33LVLSf8nwl6T415X0sBx1ZHplkKY0S/r45CTESSB7f
 1dt6SB8guMexwhg7qbo6+cESSt+bjCAEY2s4Cg5SCpatOPv4EddSztVh1oJGEPx4SMiq
 S2Xw==
X-Gm-Message-State: AOAM533YfGz7cQa0Pdy0uWzcGxQTNfAT9YEfIm29gFRmshMjgMeRVQVW
 17iJa8XZ2tuCmd92ecsmOIYKEigGVu/EwQHowhVwfYlWRDWiBDTWKr9zHl3SZl9t9b42nKyViXt
 QhdpfYUC1KGSnjpA=
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr15332711wmh.89.1626435554793; 
 Fri, 16 Jul 2021 04:39:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVw8HGOVrjJ77DqcTCvAGNCa/3+4wHmu+NyKIo7oxlQv/C6Y1ssAioe2uFxX9yS7ys0zV4Wg==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr15332681wmh.89.1626435554527; 
 Fri, 16 Jul 2021 04:39:14 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 q81sm10301088wme.18.2021.07.16.04.39.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 04:39:14 -0700 (PDT)
Subject: Re: [PATCH 06/14] iotest 302: use img_info_log() helper
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-7-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <76a17051-b5c4-e262-98c3-046273fa4440@redhat.com>
Date: Fri, 16 Jul 2021 13:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> Instead of qemu_img_log("info", ..) use generic helper img_info_log().
>
> img_info_log() has smarter logic. For example it use filter_img_info()
> to filter output, which in turns filter a compression type. So it will
> help us in future when we implement a possibility to use zstd
> compression by default (with help of some runtime config file or maybe
> build option). For now to test you should recompile qemu with a small
> patch:
>
>      --- a/block/qcow2.c
>      +++ b/block/qcow2.c
>      @@ -3540,6 +3540,11 @@ qcow2_co_create(BlockdevCreateOptions *create_options, Error **errp)
>               }
>           }
>
>      +    if (!qcow2_opts->has_compression_type && version >= 3) {
>      +        qcow2_opts->has_compression_type = true;
>      +        qcow2_opts->compression_type = QCOW2_COMPRESSION_TYPE_ZSTD;
>      +    }
>      +
>           if (qcow2_opts->has_compression_type &&
>               qcow2_opts->compression_type != QCOW2_COMPRESSION_TYPE_ZLIB) {
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/302     | 3 ++-
>   tests/qemu-iotests/302.out | 7 +++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/qemu-iotests/302 b/tests/qemu-iotests/302
> index 5695af4914..2180dbc896 100755
> --- a/tests/qemu-iotests/302
> +++ b/tests/qemu-iotests/302
> @@ -34,6 +34,7 @@ from iotests import (
>       qemu_img_measure,
>       qemu_io,
>       qemu_nbd_popen,
> +    img_info_log,
>   )
>   
>   iotests.script_initialize(supported_fmts=["qcow2"])
> @@ -99,7 +100,7 @@ with tarfile.open(tar_file, "w") as tar:
>               nbd_uri)
>   
>           iotests.log("=== Converted image info ===")
> -        qemu_img_log("info", nbd_uri)
> +        img_info_log(nbd_uri)

There’s another `qemu_img_log("info", nbd_uri)` call above this place.  
We can’t use `img_info_log()` there, because in that case, the image is 
not in qcow2 format (which is the test’s image format), but 
`img_info_log()` enforces “-f {imgfmt}”.  It would have been nice to 
have a comment on that somewhere, though.

But, well.

Reviewed-by: Max Reitz <mreitz@redhat.com>

(And speaking in principle, I don’t think I like the broad 
img_info_log() very much anyway, because I feel like tests should rather 
only have the actually relevant bits in their reference outputs…)

>   
>           iotests.log("=== Converted image check ===")
>           qemu_img_log("check", nbd_uri)
> diff --git a/tests/qemu-iotests/302.out b/tests/qemu-iotests/302.out
> index e2f6077e83..3e7c281b91 100644
> --- a/tests/qemu-iotests/302.out
> +++ b/tests/qemu-iotests/302.out
> @@ -6,14 +6,13 @@ virtual size: 448 KiB (458752 bytes)
>   disk size: unavailable
>   
>   === Converted image info ===
> -image: nbd+unix:///exp?socket=SOCK_DIR/PID-nbd-sock
> -file format: qcow2
> +image: TEST_IMG
> +file format: IMGFMT
>   virtual size: 1 GiB (1073741824 bytes)
> -disk size: unavailable
>   cluster_size: 65536
>   Format specific information:
>       compat: 1.1
> -    compression type: zlib
> +    compression type: COMPRESSION_TYPE
>       lazy refcounts: false
>       refcount bits: 16
>       corrupt: false



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8033253FB40
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:30:36 +0200 (CEST)
Received: from localhost ([::1]:36244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWTr-0003XT-J1
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:30:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyVxi-0001Th-5O
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyVxc-0004L4-BT
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654595831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SFhOw4sXMrFeNxmXYbVkXTOGc+UhN3ElsHE0hV6jJ0=;
 b=LH7c7sLSMuyAHVPbiqoQ4QGPfi6FpkkEN9BCzC/BKd4VUegG3MFUzplMeU6avO74G/YhPK
 Lc3089QEaFjiF2bdSaC57VPaa5iAgjBnmij7g/Lyk3KX/WpM8A6B9ThGmBrnZTArY+Hvm5
 fThzDa4TEsJ9EV8PZBzxbJ4+QGMxTOA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-WJrB0qMrMpqmJeXCRXtvtw-1; Tue, 07 Jun 2022 05:57:09 -0400
X-MC-Unique: WJrB0qMrMpqmJeXCRXtvtw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n18-20020a05600c3b9200b00397335edc7dso12546422wms.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4SFhOw4sXMrFeNxmXYbVkXTOGc+UhN3ElsHE0hV6jJ0=;
 b=5G0AvwcF1VJUnBuyBQvSYXMI40WfYtlBNijbK3xFyhNcI5Q7sdkRFwQAhrbz10AK1t
 3W9hVNIbQpiWP3XIEGnuG9PObL+kdAeITzvbLOzi1aqX9P7lBbXeGKIzlU0YZ2SmlNtZ
 l37I/Wh0s2vMOvQouZ2phXHllczGYpsE+AzUMzMCPH0bLH4QVBeE2tk3b0qvLS0WhJt5
 imcbo5GRpUk67kWaKzwSTDyiZIU0/7YLmcLHYfSlRGHAECG9qZbBMK6/dzRzLyy24wqT
 1b2TZCeL7+KeV1yekqrUteO0Hr2iKykvStNbfEeAxxGFro6nWaM+kaYlWzfIaKyn9GL8
 Q8hA==
X-Gm-Message-State: AOAM5309NIl5YU0AGY6f/d+JJH8tqkPsl3nUYgZbt847cw2jpwzRiAG4
 N3t4KRVvU5j6bo4GOC/y5W3ir4ASHVI9xcerXFLTlU1zun/I9RDK//gad6T6bFbER4oETKzAFrv
 GbQGpeSfoQzBX+xI=
X-Received: by 2002:a5d:64a5:0:b0:210:1328:b5e2 with SMTP id
 m5-20020a5d64a5000000b002101328b5e2mr26509797wrp.191.1654595828498; 
 Tue, 07 Jun 2022 02:57:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/fjDnwVQoEDlqD4eodVbTXSESvRrQLXzWG6iyqqimaNRK/ujLD9TXpGN+yqyruEcVhzyQjw==
X-Received: by 2002:a5d:64a5:0:b0:210:1328:b5e2 with SMTP id
 m5-20020a5d64a5000000b002101328b5e2mr26509772wrp.191.1654595828296; 
 Tue, 07 Jun 2022 02:57:08 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c4fd200b0039744bd664esm24143607wmq.13.2022.06.07.02.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 02:57:07 -0700 (PDT)
Message-ID: <c09ec47f-c11b-d634-0a18-fc54750d1f3d@redhat.com>
Date: Tue, 7 Jun 2022 11:57:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 02/45] block: introduce bdrv_open_file_child() helper
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-3-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-3-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Almost all drivers call bdrv_open_child() similarly. Let's create a
> helper for this.
>
> The only not updated driver that call bdrv_open_child() to set
> bs->file is raw-format, as it sometimes want to have filtered child but
> don't set drv->is_filter to true.

Also snapshot-access, which uses DATA | PRIMARY.

> Possibly we should implement drv->is_filter_func() handler, to consider
> raw-format as filter when it works as filter.. But it's another story.
>
> Note also, that we decrease assignments to bs->file in code: it helps
> us restrict modifying this field in further commit.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---

[...]

> diff --git a/block/filter-compress.c b/block/filter-compress.c
> index d5be538619..b2cfa9a9a5 100644
> --- a/block/filter-compress.c
> +++ b/block/filter-compress.c
> @@ -30,10 +30,8 @@
>   static int compress_open(BlockDriverState *bs, QDict *options, int flags,
>                            Error **errp)
>   {
> -    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
> -                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
> -                               false, errp);
> -    if (!bs->file) {
> +    int ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
> +    if (ret < 0) {
>           return -EINVAL;

Should probably be `return ret;` like elsewhere.

With that done:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



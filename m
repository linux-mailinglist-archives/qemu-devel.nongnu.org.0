Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CBA3A8603
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:04:04 +0200 (CEST)
Received: from localhost ([::1]:39694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBXn-0001D3-EP
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBSo-00028E-MX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1ltBSl-000834-SX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:58:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623772731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iWfl2RvCx2T05BM8cbjC+t9dhoAErTXrO9g/jEQhoJg=;
 b=T4J7el/iT9j7ayy/5OhcCvn3j2cMjtKiZ/cNwqBgvA6VfwqiIn3TTSfeciWZ0ogbu7KeQS
 EAo7NU8yNqyQg3PnkbJDo1pH93SLOs8IiYhzXH4kM1nI/nlYrQxpsNeWLhYfukC8Uy5Qes
 010ywXBrkJET2E1cdljMqeMU/lizROs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-6Bbi1yRmNnuO0XRoeF4XIA-1; Tue, 15 Jun 2021 11:58:49 -0400
X-MC-Unique: 6Bbi1yRmNnuO0XRoeF4XIA-1
Received: by mail-ej1-f70.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso4743088ejc.14
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iWfl2RvCx2T05BM8cbjC+t9dhoAErTXrO9g/jEQhoJg=;
 b=aveOggIytCB1yNYUrQTrM1tLyJKg/jsvKTvphJ+PiZ9iJFADWHZw8P+u4MiFGD3QFl
 SZ8YnRvMGQE/jIvhHQmLwoKmjZA+HRRIz2chhA+fvuH2iHK74qaglSkix5r3V5d8xprF
 qp6fFaySTdRZbQdb5uDKjpIMa5ost0AsSCipVby8CTpW8vtUW0twvs/+hwZdWbOaDHnS
 3Mv5oM0nvXqOK3Ssg6cFfdF6I31ZBHhlgdM/kB/i9hVXQ385ejTk8euSOCZqYi97y2Cg
 CUQgvlr16m30wC5i6QM31Yi0FRJVbTU2khP4ItJ0Dg7vGamF5CxWAYBDo5hPdakNid8O
 2vTg==
X-Gm-Message-State: AOAM530150vsVNGKe4qVDIixzww88Kdpu4aQfAI9BgbFwflflRMnpfw0
 NbRzbIUbuAN6FPhci4U1Pj6gRCR8KLbQIZKwPzmf5YGUMGWaOAHCtEwbKi4XJbZFc5kWiOLiSQo
 hiZLUwKIN3jWkcIQ=
X-Received: by 2002:a17:906:8688:: with SMTP id
 g8mr227200ejx.470.1623772728593; 
 Tue, 15 Jun 2021 08:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjNvKqDbo947HvY83+Sem6ZSM167vqAUzGmwLUBqBNUjqNUfChbqKliYvWbYL22mlFW8lNGw==
X-Received: by 2002:a17:906:8688:: with SMTP id
 g8mr227185ejx.470.1623772728395; 
 Tue, 15 Jun 2021 08:58:48 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 w2sm10307835ejn.118.2021.06.15.08.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 08:58:47 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] file-posix: fix max_iov for /dev/sg devices
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210603133722.218465-1-pbonzini@redhat.com>
 <20210603133722.218465-2-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <151ecf7a-21d2-d7a0-8d7c-be10675504c3@redhat.com>
Date: Tue, 15 Jun 2021 17:58:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603133722.218465-2-pbonzini@redhat.com>
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
> Even though it was only called for devices that have bs->sg set (which
> must be character devices),
> sg_get_max_segments looked at /sys/dev/block which only works for
> block devices.
>
> On Linux the sg driver has its own way to provide the maximum number of
> iovecs in a scatter/gather list.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index f37dfc10b3..58db526cc2 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>           goto out;
>       }
>   
> +    if (S_ISCHR(st->st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
> +            return ret;
> +        }
> +        return -EIO;
> +    }
> +
> +    if (!S_ISBLK(st->st_mode)) {
> +        return -ENOTSUP;
> +    }
> +

With %s/->/./:

Reviewed-by: Max Reitz <mreitz@redhat.com>

(To answer Vladimir’s question, I don’t believe the condition should be 
bs->sg, because bs->sg == true is a given for this function anyway. 
Therefore, there’s no need to check whether the char device is an SG 
device.)



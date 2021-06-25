Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE483B3F5D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:33:48 +0200 (CEST)
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhHX-0005ai-HG
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwhEc-0002xc-Qe
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwhEZ-0002NI-46
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624609841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncb26abxLqELt78olGzBYnINi2Uv19MtYRrJjnFOyTw=;
 b=ag+17u07D5QrhZ2d5Dlb0gN2LxbZdW3DqPy+eHPdBm53gr/qQ0t/9JtIfduSf0IVXiPAUS
 0s+9xGi6OPSxiqoSvGdmiX8xIVLomsS2OUhdPDHW06RWWeyQHPdyyYen4kD64C0lIxLv3m
 Jh3c0JyEGThpwqL9z+Yu/yPYGPVPxGs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-uFHYQ9w_OV-LuHh57X_bTg-1; Fri, 25 Jun 2021 04:30:40 -0400
X-MC-Unique: uFHYQ9w_OV-LuHh57X_bTg-1
Received: by mail-wr1-f70.google.com with SMTP id
 t10-20020a5d49ca0000b029011a61d5c96bso3218093wrs.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ncb26abxLqELt78olGzBYnINi2Uv19MtYRrJjnFOyTw=;
 b=gWBtT6VfYGAhSH2yD9fosTfo/GSbaxJV0LiI01hy2uHkXxcoYZ0lR0BEo7bLANy+FK
 8lUOc85wqEO4o7C3pgFg+07YC2Kq/iunIZ/9ehkgBS8+2Rpo04WWjbj3Id91SZ5ELm63
 UFO/L4rRjhMy9PMr9QMpGFdVv3vQiCeHpcjtw3+3zE3z8apa/o5vJJeJNcd8xwAvlZj0
 Qfvf38nG5WiBbcaLb3r0HgotlZ96AV8RxIJe6vz+92XF2V/VXlC/uI1Ryw3Hm8WNdZi3
 8ynUhHapH8D25MDDvHuHCw350iXMgR6bp0HJZ0ChCzsvebO5siMUnCM5FZMY86nEGOdJ
 FyYg==
X-Gm-Message-State: AOAM533O5WRPciXxf1Wk+xg98GQLQeRsQNXEA4ScR5rTB7K5pV0w7R6E
 nVa15G6p3FB4es2S00hg6agRDPJDgg2xtAPdH2dYnYxQoics0K24d+Xm/oTX+tEnDLtoftEZPCW
 wDO2K16P9QcNMNLE=
X-Received: by 2002:a1c:a707:: with SMTP id q7mr9210515wme.144.1624609839134; 
 Fri, 25 Jun 2021 01:30:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzE487JUXFfsPaAryZZ3uPtpZJYcxG51zp1LKncxW1MXlJrLfEoSG02kBJ7QSj1T//ADumDdQ==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr9210496wme.144.1624609838963; 
 Fri, 25 Jun 2021 01:30:38 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z3sm10448360wmi.29.2021.06.25.01.30.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:30:38 -0700 (PDT)
Subject: Re: [PATCH 11/11] file-posix: handle EINTR during ioctl
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-12-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <beabf6e8-09c7-f54f-7bb5-03d99960b643@redhat.com>
Date: Fri, 25 Jun 2021 10:30:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-12-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: mlevitsk@redhat.com, qemu-block@nongnu.org,
 Gordon Watson <gwatson@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 8:04 PM, Paolo Bonzini wrote:
> Similar to other handle_aiocb_* functions, handle_aiocb_ioctl needs to cater
> for the possibility that ioctl is interrupted by a signal.  Otherwise, the
> I/O is incorrectly reported as a failure to the guest.
> 
> Reported-by: Gordon Watson <gwatson@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 74b8216077..a26eab0ac3 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1347,7 +1347,9 @@ static int handle_aiocb_ioctl(void *opaque)
>      RawPosixAIOData *aiocb = opaque;
>      int ret;
>  
> -    ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
> +    do {
> +        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
> +    } while (ret == -1 && errno == EINTR);

Shouldn't this use the TFR macro instead?

>      if (ret == -1) {
>          return -errno;
>      }
> 



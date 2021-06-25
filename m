Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE493B3F67
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:36:24 +0200 (CEST)
Received: from localhost ([::1]:47328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhK4-0000Y1-1K
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhIs-00087l-Ju
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhIq-0005Yc-6g
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:35:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624610107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RYnGtiH7xuDwZOne8q8JCHZPuZ+vqmDJfNF6QVBHvQ8=;
 b=fW6A+F5mBGon+VdGyOUiN2w1RRgQ5WyQIRAstnJqkxf295507QNeGqG4QNKxc7YjN1VHJN
 WJn2RygtSNi8bedHp+RaFNU9MSx+wH99ZcuWoEVnceQjfdQdsb7fFh/EvhZ7HEbCyYMrOB
 GnBhrrXFNk6jYLc9F2Xd1rlMW41PnGA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-VvPKslavMcKq8-wk4siRkw-1; Fri, 25 Jun 2021 04:35:06 -0400
X-MC-Unique: VvPKslavMcKq8-wk4siRkw-1
Received: by mail-ed1-f72.google.com with SMTP id
 da21-20020a0564021775b0290395165c6cefso1514514edb.1
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RYnGtiH7xuDwZOne8q8JCHZPuZ+vqmDJfNF6QVBHvQ8=;
 b=ggY9oiywRwfAPv5embYSXTnttl2GsuycPJB8U53OQkFFrMCw2eeGH3i7fkTV/2Z9Wr
 KPS8x2XliVjtXg+qAoED5O6YhoF8aUL375+NqJR/b5WcD3ZuLwconHNQ9I/Ig6Qwk7hx
 1nIkojbIHJpMoY6GCHHccyGLfaGZLLyuaYryLio3ki2386q3kjmy8AO7/UaEzGJ2//OU
 0QDLA2Ydh5B+aB1nopY92FaNXyb1Ur8MOIQG++xA9bdI517PbNuDsOCmKaMBTxsurvRI
 XEWa10I334yYIxpIwd+atd6/hOxCzEHpdqAnbWhq3FoWCgIan22e+9sycJb1kLC3kWA+
 7otg==
X-Gm-Message-State: AOAM531OJImakkPIVkg1e348Ae/JGOXC415gpXNVdSFgVUCbgKNlYqkh
 zahEyq7ny9zS6plLKLwtaPZ8B5Twd9cv+PHDIcvg8NFSYmJM3WKeI7WZw8b4FZzHy4gh2t3hIyX
 7bwLOX0lW6TzBK/k=
X-Received: by 2002:aa7:c301:: with SMTP id l1mr12858714edq.215.1624610104988; 
 Fri, 25 Jun 2021 01:35:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvjW6y2NpyUy3KIig4dWy6c9Na9C/0Pte+qFFF6gEolIwUSo2DM0vC86d7TsA8n9f2WhQkhw==
X-Received: by 2002:aa7:c301:: with SMTP id l1mr12858687edq.215.1624610104791; 
 Fri, 25 Jun 2021 01:35:04 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 c23sm3478608eds.57.2021.06.25.01.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:35:04 -0700 (PDT)
Subject: Re: [PATCH 11/11] file-posix: handle EINTR during ioctl
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-12-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <b11dfc85-1642-b43b-2733-c2931d0ab263@redhat.com>
Date: Fri, 25 Jun 2021 10:35:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-12-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Gordon Watson <gwatson@redhat.com>, qemu-block@nongnu.org,
 mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> Similar to other handle_aiocb_* functions, handle_aiocb_ioctl needs to cater
> for the possibility that ioctl is interrupted by a signal.  Otherwise, the
> I/O is incorrectly reported as a failure to the guest.
>
> Reported-by: Gordon Watson <gwatson@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/file-posix.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 74b8216077..a26eab0ac3 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1347,7 +1347,9 @@ static int handle_aiocb_ioctl(void *opaque)
>       RawPosixAIOData *aiocb = opaque;
>       int ret;
>   
> -    ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
> +    do {
> +        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
> +    } while (ret == -1 && errno == EINTR);
>       if (ret == -1) {
>           return -errno;
>       }

I think the macro TFR() from qemu-common.h could be applied here, 
probably like `TFR(ret = ioctl(...));`.

No matter:

Reviewed-by: Max Reitz <mreitz@redhat.com>



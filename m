Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCCE3B3E17
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:58:59 +0200 (CEST)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgjq-0008Ko-UH
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwgj6-0007Xh-It
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:58:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwgj3-0001Ef-RR
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 03:58:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624607889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bOHTVCnjjUeniHXM8Ge6f37it82ajNjnefagezPtqo=;
 b=KR4hTFPgYt7U2lmxwY9E/YPqedYIKe5auB+MrctY28KzrJEk0LJhxGsWK5t3DSBaMsCFpT
 9a2f5eZXPColr4XTpDcgMRkldrGOx1+0qx1vbg6AIGZD0oEDT6jK7yxewt39xta/XYUWVf
 ED7Ot5WRsf1snALorva2lYKCbRMbJqg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-dL-fgL-PMVWaBc3t7X4Bsw-1; Fri, 25 Jun 2021 03:58:07 -0400
X-MC-Unique: dL-fgL-PMVWaBc3t7X4Bsw-1
Received: by mail-ed1-f72.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso4754343edc.2
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 00:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9bOHTVCnjjUeniHXM8Ge6f37it82ajNjnefagezPtqo=;
 b=JZKncgxAybhQ+1fsMp7KLri3g1cNQefwZ85iBgbyUJyK7s4wJ5GcTILkDmgzdvBj+j
 GrIvwhJwDJrM6hF48RQTvaqhHvQ2N2JnqQtb8yjkeWh6WVEZUN+CL9pWu2DPJiJKofZ/
 3Tdm0fyIhtIOjKyJyae8Iv4WYw6Dw3mAfHh8xjooQ+XYbZTpQjKiKRIZdwevuwPEjhqG
 o7sgA/zR/UVMtqd7g7jRMNPbOuA+CMzksogAOJZQtZRTM4CZrrHrG1LakWYN3FbpN0gc
 LyxduXzARKgBlRKLEICoF7ku0i8/bpc19hxRH9Vj33X9KPxrfz5wFsede7hMUqDoodH1
 kLqQ==
X-Gm-Message-State: AOAM530F4cliPiAjcCG0S4BHgiBNIUomHXonXkVJdGc3t87nNHERyMJ2
 ilMF15pDAB0aFaLTgAdyYIiEFjMnTulsM4Uf2iOdko7e6SMMe/kCxNwmUB+817x4dWuCPsPEaKS
 5TQ2Y+J/A77FAv1o=
X-Received: by 2002:a17:907:10c3:: with SMTP id
 rv3mr9300407ejb.420.1624607885948; 
 Fri, 25 Jun 2021 00:58:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/XugMS0Tc8rjnv9fk22ZP5mqCIYjPTrkKOWcIinLc6Aqp30xNg6EAfalEtYCgbIiB7YIeUQ==
X-Received: by 2002:a17:907:10c3:: with SMTP id
 rv3mr9300388ejb.420.1624607885648; 
 Fri, 25 Jun 2021 00:58:05 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 cb14sm3430859edb.68.2021.06.25.00.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 00:58:05 -0700 (PDT)
Subject: Re: [PATCH 05/11] block: add max_hw_transfer to BlockLimits
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210624180423.1322165-1-pbonzini@redhat.com>
 <20210624180423.1322165-6-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <3cc81f9e-d96c-ba38-a9fd-720c645f42c9@redhat.com>
Date: Fri, 25 Jun 2021 09:58:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-6-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> For block host devices, I/O can happen through either the kernel file
> descriptor I/O system calls (preadv/pwritev, io_submit, io_uring)
> or the SCSI passthrough ioctl SG_IO.
>
> In the latter case, the size of each transfer can be limited by the
> HBA, while for file descriptor I/O the kernel is able to split and
> merge I/O in smaller pieces as needed.  Applying the HBA limits to
> file descriptor I/O results in more system calls and suboptimal
> performance, so this patch splits the max_transfer limit in two:
> max_transfer remains valid and is used in general, while max_hw_transfer
> is limited to the maximum hardware size.  max_hw_transfer can then be
> included by the scsi-generic driver in the block limits page, to ensure
> that the stricter hardware limit is used.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   block/block-backend.c          | 13 +++++++++++++
>   block/file-posix.c             |  2 +-
>   block/io.c                     |  2 ++
>   hw/scsi/scsi-generic.c         |  2 +-
>   include/block/block_int.h      |  7 +++++++
>   include/sysemu/block-backend.h |  1 +
>   6 files changed, 25 insertions(+), 2 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>



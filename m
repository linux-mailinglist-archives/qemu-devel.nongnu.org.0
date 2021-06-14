Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC083A5E50
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:21:42 +0200 (CEST)
Received: from localhost ([::1]:59408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshqo-0002I6-0X
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshoE-0007A3-19
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshoB-0005qo-Ey
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yp9G2wMnFi/ALHDEextjIGaz22uJBoAp349pCUg25AE=;
 b=cTNcuDZ9/8ok4x+LgJu35qZppk/FE9/bOwVSNZLMFn188QkxJqN8vPsShZ2L4G51uKRzOA
 oCxCY1i+eog9ia2+PvpxyOplOXPi9+s787wKUCfIMvn6522v8eA89Tr5EiydhurnZjJ3Jn
 xgDAQJhaeWhk3hAHfrieaZvq8WMx6vY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-j9rMWGUeMKmumhWqnjEDJw-1; Mon, 14 Jun 2021 04:18:56 -0400
X-MC-Unique: j9rMWGUeMKmumhWqnjEDJw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h23-20020aa7c5d70000b029038fed7b27d5so19694577eds.21
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yp9G2wMnFi/ALHDEextjIGaz22uJBoAp349pCUg25AE=;
 b=ggSnCcn4O6QpRz4aeET1l+obvtOXCtkwJ8T4tko23Ay4hYWbmbTc1/zkIyvFyEJBWd
 7+i3/DkOvfVaNHA9H0nP/LpdbV89Ffe0Ka8UtPfju6jaB62LSHp1ewjl8B3hgPP9L7rC
 j4rarV8g7fKhPDmiKPYtgDS82w4yyR3urWNt/iNDAqXT26d0/wtpv0SPOMokzAzEwTaa
 uLMCle2ySLswkEs4W1h0v+kFABCz/0skc0bBcMhE9wQNbxUZYSfXV9I4CYDmLiGsn7M+
 qzJBfOFCrOJIN6u9YWVHVdVJZTqj+QC/C/RMdcEFohoF8ns1bt2sv1IyZdKJl/d6ES2U
 t8pw==
X-Gm-Message-State: AOAM533tulliBqefC1r88fZ7JiIuHO6Gg6rib1y6YHbWNIzEm9sHPtNL
 taeHmnhAGPnreKS93ZKjNQ7Hy5Qb2oEdkjHqAiUhsGmqvhiB5rEsOJ/iPvhYbup4yjfEyJH36k5
 3lOefwaMLG3CIgQfZCDrNv847tR148ZP2sgKKLJqCvdChMfkqS1fvPfFFuJTBeiqQq5M=
X-Received: by 2002:a17:906:b855:: with SMTP id
 ga21mr14194724ejb.550.1623658735418; 
 Mon, 14 Jun 2021 01:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOttsQIkhX0zeVtUX0S8eevXaod+DgpgaH1QUTAn9k58Pp2led7HH7lRSM+ZH020NH8BfeRQ==
X-Received: by 2002:a17:906:b855:: with SMTP id
 ga21mr14194708ejb.550.1623658735281; 
 Mon, 14 Jun 2021 01:18:55 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 v6sm6586077ejx.60.2021.06.14.01.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 01:18:54 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] block-copy: make helper APIs thread safe
To: qemu-block@nongnu.org
References: <20210614080844.21817-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <40e83e38-cd09-1eff-55e5-19cf356875c9@redhat.com>
Date: Mon, 14 Jun 2021 10:18:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614080844.21817-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please discard this thread, I had an issue with git send-email and patch 
3-5 are missing.

Thank you,
Emanuele

On 14/06/2021 10:08, Emanuele Giuseppe Esposito wrote:
> This serie of patches bring thread safety to the smaller APIs used by
> block-copy, namely ratelimit, progressmeter, co-shared-resource
> and aiotask.
> The end goal is to reduce the usage of AioContexlock in block-copy,
> by introducing smaller granularity locks thus on making the block layer
> thread safe.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it and will post the patches once his new
> CoSleep API is accepted.
> 
> Patches 1-3 work on ratelimit, 4 covers progressmeter and
> 5 co-shared-resources.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v3:
> * Rebase on current master (had conflicts in block-copy), remove based-on in
>    cover letter
> 
> Emanuele Giuseppe Esposito (2):
>    progressmeter: protect with a mutex
>    co-shared-resource: protect with a mutex
> 
> Paolo Bonzini (3):
>    ratelimit: treat zero speed as unlimited
>    block-copy: let ratelimit handle a speed of 0
>    blockjob: let ratelimit handle a speed of 0
> 
>   block/block-copy.c                | 28 ++++++--------
>   block/meson.build                 |  1 +
>   block/progress_meter.c            | 64 +++++++++++++++++++++++++++++++
>   blockjob.c                        | 46 +++++++++++++---------
>   include/qemu/co-shared-resource.h |  4 +-
>   include/qemu/progress_meter.h     | 34 ++++++++--------
>   include/qemu/ratelimit.h          | 12 +++++-
>   job-qmp.c                         |  8 +++-
>   job.c                             |  3 ++
>   qemu-img.c                        |  9 +++--
>   util/qemu-co-shared-resource.c    | 24 +++++++++---
>   11 files changed, 168 insertions(+), 65 deletions(-)
>   create mode 100644 block/progress_meter.c
> 



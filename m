Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC473E7BF6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:19:02 +0200 (CEST)
Received: from localhost ([::1]:54046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTWu-0000rG-Qk
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTVh-0008G3-Uf
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDTVe-0000qn-SE
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628608660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qC4Otjo66SCGJg0s9zOOWXV25Gd4D+1NGnU9e/gWhA=;
 b=aR13TqNzWD96C9j++el+LyvFjY1xhlWF3xepxrGbImbQYqAtIC413SpqYVZ0RNB4/LhdrR
 8nhZJm8TOYzkmP8BihYVfkKIyiAxLSjamwwAwy8zvNUPYkgues6ptrRMei+N392U2/YUr7
 pEJg75nTe5M8X1fLT50rkXcONoYH6Zc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-JiTXyGRxPXqWxMvFjdJGGQ-1; Tue, 10 Aug 2021 11:17:39 -0400
X-MC-Unique: JiTXyGRxPXqWxMvFjdJGGQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u15-20020a05600c210fb02902e6a5231792so346144wml.0
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3qC4Otjo66SCGJg0s9zOOWXV25Gd4D+1NGnU9e/gWhA=;
 b=Xh71ybmkjuAfljX+tr6sPsxJQRli2vbT3TzahkJ07mFI2q5xWwYt4gZSQ+zf8bF9ix
 zjQI5aGmPto1q4VgCNvE6qr05xMI3YYQ9d48kRghBMMr+WD2b/yrrBuR336Aue4dGoP/
 GONzhw9Doulgzz5bjrkeAubnwEqVSO38tlV1YVamLkgggEqa4dYxbYUtMlsOwoLZCIXT
 liIEOcQ36qG2b9qlOkySDGMfGivwWmB7fUli+8AClIpuRe8rHyjHqsaDAl5QSdP1QZRF
 v3XlpXU6qsIq4g7USp95IsEoYBuH2DiyljlkAuUJ3AOi+QXJsznYpwSw4H3cObg1/zNl
 cXFA==
X-Gm-Message-State: AOAM530U5zinqYL/uS7MoIPzM+eEe3P3tK+LjvkClbq7HZslyw98PEyu
 TmerZjn5C6+61TwlkgrppbbhgqyILlYX+/01lwa+5DdxjNPZzXv/boSsG1RcSN3ECwpp6VSWD8N
 tUOiXhJkBEi0VswU=
X-Received: by 2002:adf:eccc:: with SMTP id s12mr18551226wro.82.1628608658582; 
 Tue, 10 Aug 2021 08:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJys5fWiirccdHR3COkhI5moC/AihR7BCiKGHz83h2MR2o/J36X4XCi1TQnh/gHtWz2YTh7ktA==
X-Received: by 2002:adf:eccc:: with SMTP id s12mr18551169wro.82.1628608658238; 
 Tue, 10 Aug 2021 08:17:38 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 w13sm28562175wru.72.2021.08.10.08.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:17:37 -0700 (PDT)
Subject: Re: [PATCH v7 17/33] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-18-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1e854286-82df-8eb9-4b3f-85cb2aacab60@redhat.com>
Date: Tue, 10 Aug 2021 17:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804093813.20688-18-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, mreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04.08.21 11:37, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.h | 1 -
>   block/backup.c            | 2 +-
>   block/copy-before-write.c | 7 +++----
>   3 files changed, 4 insertions(+), 6 deletions(-)

Well, I mean, it isn’t exactly syntactically unused before this patch; 
it’s only unused because this patch drops it from cbw_init(), too.

It definitely is functionally unused, though, so:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

I wonder whether we should drop @use_copy_range and @compress from 
block_copy_state_new(), too, though.

Hanna



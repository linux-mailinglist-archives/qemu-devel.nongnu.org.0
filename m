Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813A3F5F40
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:34:32 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWZN-0001XS-7D
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIWXw-0007Pu-Go
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:32:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mIWXu-000379-1d
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:32:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629811972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YKWa+Ej+6Eh+NqsAiGsz6Vf6hJG0OlsPInBDuKzTMgk=;
 b=BRJiHsNk4YmLPZ+VD+I1LFMu8FrkHg6F/1VfhdIi/KN7KYcG4XZGWUpP/wAHHhGCcb75Qe
 wrw4GNMh3gTcQeikOcSdESZ2GBNEK8PLLmTI7v+csiPA4iov6C/Ql/C9CgGz2M5FlnhPT9
 HFL3P7qL6BZIyO0UshJuSkwDryeSWI4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-l_xsC3IxPaKDtJLboOsYyw-1; Tue, 24 Aug 2021 09:32:51 -0400
X-MC-Unique: l_xsC3IxPaKDtJLboOsYyw-1
Received: by mail-wr1-f72.google.com with SMTP id
 b8-20020a5d5508000000b001574e8e9237so1814717wrv.16
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 06:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YKWa+Ej+6Eh+NqsAiGsz6Vf6hJG0OlsPInBDuKzTMgk=;
 b=pZvm7cHvcarWNsd5d7LbSmEZ7zRhxCzSra1giCb5TA9dwur11tGyGKkELqdAoPhxiN
 wTNpOkm5FIBpHcSqXrpP/14DB8w4U0ZGT8LcEwlV6NMDTzOU4+ZTLnOkpMLZmVRBf4ke
 c3r7PPLzbJgT8Y3h5ugYdEf2XHDqiJz8XIg9Va0XzEwMLn03dvu0z+0k4PaUHQfig0yT
 90coIa3LV52Kb7uHeEbnt6DHgybtnCjgJPjJMTTxYGcyOUqFQ0BTWUywsuORJyAEpavy
 MKwCrqMb7J9Z94n9Zvs5ZH+ZZJRipaq2eyLJXDEhuVtrGmFgKUHPhROEH9ZcuwicM52g
 kvBQ==
X-Gm-Message-State: AOAM531OOppj7C6T+UMjy1r/+PGhs3O2PoH6RSWTSvOtpzTH7pANBHOp
 46stdhLgiZsWlULGxFWfQbr0PWP8UR8/ht3WjZ8ubpYeOWSAhsFtN8TMGIFnwHz4v1xAFQyjJRe
 fvt7nfK8RC3cD0k0=
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr4206283wmc.3.1629811970171;
 Tue, 24 Aug 2021 06:32:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytOH5B6CYk383CuXe2yAQ2R9NS4Einp6yqznNwKs7K6Bl0hG2rjfp+y6tjQYJuVUQCyHOXAg==
X-Received: by 2002:a1c:f60c:: with SMTP id w12mr4206247wmc.3.1629811969861;
 Tue, 24 Aug 2021 06:32:49 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 d8sm17785703wrx.12.2021.08.24.06.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 06:32:49 -0700 (PDT)
Subject: Re: [PATCH v8 07/34] block/block-copy: introduce
 block_copy_set_copy_opts()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
 <20210824083856.17408-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <eab0596b-ed0b-5570-2b08-8b6882ab5cc5@redhat.com>
Date: Tue, 24 Aug 2021 15:32:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824083856.17408-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 10:38, Vladimir Sementsov-Ogievskiy wrote:
> We'll need a possibility to set compress and use_copy_range options
> after initialization of the state. So make corresponding part of
> block_copy_state_new() separate and public.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block-copy.h |  3 +++
>   block/block-copy.c         | 49 ++++++++++++++++++++++----------------
>   2 files changed, 32 insertions(+), 20 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



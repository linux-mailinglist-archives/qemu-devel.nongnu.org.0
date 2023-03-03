Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2166A9AB1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7MR-0002ta-9k; Fri, 03 Mar 2023 10:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pY7MP-0002qx-3t
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:30:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pY7MN-0001ZV-K5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677857415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWp0iUQ+oM4fmiwFr5HyKoRWIGPufTC0HL36fOt+ErE=;
 b=F/l/fACleC81dsktHOUX3DmSxeI3F9nc4cHzlk5l0hSVD+fpQ8i1+THe0A8LWJk2SxdpN/
 qh6jxSw8scVhZ4uxr9fgjjjht2EzfmIgCYhOjc+eFKjPl8lnvUaQLPIqEzQ+BDuy4TYdCC
 5EfO4kFaIRrktVIBKNrZohjvzQqIeEo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-Htksa3i9MamEBMdEnbwuGw-1; Fri, 03 Mar 2023 10:30:11 -0500
X-MC-Unique: Htksa3i9MamEBMdEnbwuGw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g33-20020a056402322100b004b0e54e03acso4476723eda.8
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677857410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wWp0iUQ+oM4fmiwFr5HyKoRWIGPufTC0HL36fOt+ErE=;
 b=JiKr43J8o9Bup/xXVdSJ7AvQWoaIbmui6tJO9odh6DZuPD9ChQc/i73qTzoq2iA8r2
 KwOOe+ou+5yTaaAASrfNvUOX+K+mYaHql6aZFh6d3IOyiWvfwiv2GkxtkyMu2MYIWwkA
 JuNqFhtqZB+8iFdeK9p8o0JrTK6/H9QCKtTg3Yv+nLj8WvGQsVPaPycoRm5820IgnMTr
 NpLXP2iJ759jGnnJMbn3oVDs15nKfFJThqM33jzpai0rW4ZVLJxoKP/gAceLGWfK5UJh
 hXjUxEpMD6E6kdyGNAvIxs8F3fei7m5fAEfJb2ciUYLxHrVc5Qxhl7SPNXHubqrc32zH
 p/uQ==
X-Gm-Message-State: AO0yUKXsn45NgNXUO6rRCkK/N59PBJ7xW5CD3DZ20lPI8ju821nmnIq1
 GYEiJ2A9OZ1XdjrjsOGP+otpM28rd61WIH6bXeXjU4t7kKNVQ2hyOr2Ag/AvtDBIVNNldrmC/mV
 uWYIHu6b8Mx+tsh0=
X-Received: by 2002:a05:6402:798:b0:4be:8040:4f71 with SMTP id
 d24-20020a056402079800b004be80404f71mr1767411edy.33.1677857410579; 
 Fri, 03 Mar 2023 07:30:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8qdju5PRQgZXGcAUa24OmlTMTJOdjsCqUR5Fx2A2u05wrPTpuwinLd5LFRb4B2brSVU6CQcw==
X-Received: by 2002:a05:6402:798:b0:4be:8040:4f71 with SMTP id
 d24-20020a056402079800b004be80404f71mr1767396edy.33.1677857410411; 
 Fri, 03 Mar 2023 07:30:10 -0800 (PST)
Received: from ?IPV6:2003:cf:d737:1307:9c:fde6:ce26:76d4?
 (p200300cfd7371307009cfde6ce2676d4.dip0.t-ipconnect.de.
 [2003:cf:d737:1307:9c:fde6:ce26:76d4])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a50d085000000b004af5968cb3bsm1283888edd.17.2023.03.03.07.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:30:10 -0800 (PST)
Message-ID: <3fb9f0ef-a856-7e41-8cae-739e099ba5d3@redhat.com>
Date: Fri, 3 Mar 2023 16:30:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] block: make BlockBackend->disable_request_queuing
 atomic
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230227205704.1910562-1-stefanha@redhat.com>
 <20230227205704.1910562-3-stefanha@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230227205704.1910562-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27.02.23 21:57, Stefan Hajnoczi wrote:
> This field is accessed by multiple threads without a lock. Use explicit
> qatomic_read()/qatomic_set() calls. There is no need for acquire/release
> because blk_set_disable_request_queuing() doesn't provide any
> guarantees (it helps that it's used at BlockBackend creation time and
> not when there is I/O in flight).
>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41573396530
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 18:24:48 +0200 (CEST)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnkid-0005ZX-AH
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 12:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkgN-0003Ay-34
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:22:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnkgK-0001u0-Hs
 for qemu-devel@nongnu.org; Mon, 31 May 2021 12:22:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622478144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8pqGAx3GC/OrTZqwwYtYulnFYUG2LJL34fjidnGhcQ=;
 b=fXAsfENUUMBDdTIHEX5CQxJjHfkww3AKa9v2e/yRgOMZAHk7GMm7X2ZKBWhpmv6T2Oha5R
 OV/OsGtiKCDCj/McbokN+tpccVgHYY0FTnwplRm8MQmHeQDQ9fo9+JHOAIRa+6VltAHIjt
 tITH/JQj59V9h7bnZsV8ev78WddSgI0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-S8Ai5teKMhKS4ZRWHrZXlA-1; Mon, 31 May 2021 12:22:22 -0400
X-MC-Unique: S8Ai5teKMhKS4ZRWHrZXlA-1
Received: by mail-ed1-f69.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso6392203edd.19
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 09:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f8pqGAx3GC/OrTZqwwYtYulnFYUG2LJL34fjidnGhcQ=;
 b=rzbEnUZZdpMWkyIq67YZW/23ypoeN2cmy5jHpuO+dy+rtKxS+vHVYmUoI0/f3fzBQ9
 Wl3CAWOs2TvttKM9ul78QWyxIfMO+urJvE2XOwj1FPG6ExmWmM0eyp/+OUVwRSTV21aj
 wL49fKFx/ZiL3gBQ632oU+BkhmTeT/a2L2/4vWwoYXLfMslfKE/5kdcHr1UVYqGCaSos
 oCBUk43HF1dauUz7otVpoabxt4NnzHeMAI4yRte6ppvuX6Cyv8swm/bt1cJNrzDZRyc/
 vEuQcLBWFIEhJc2dtDKwX9ASWWkFIrjONGHHRxxh9CFGMNYWQAqcXDNKzpZOQGjNnog7
 QUgA==
X-Gm-Message-State: AOAM531jQloZRxvw5kTecjuyKW9vZ2mX4o6mns1+DOoKKzPubtogt7tQ
 FJgZpXI/m9ykp3YuaT6aJzeEd9hH6A8EtEGzWK9BP/6yEZCll4eBFIqQuRIDzNE9Vv5l6dHP+Wt
 jHQGSPhscxj97V1U=
X-Received: by 2002:a17:907:1ca1:: with SMTP id
 nb33mr23209053ejc.75.1622478141281; 
 Mon, 31 May 2021 09:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0gJOQadLFXUdEKvThK4kYRzgWQFZ9YWZihc1WAymm06IKUgUzNnsKlT2ogxXF8DGtW31eTA==
X-Received: by 2002:a17:907:1ca1:: with SMTP id
 nb33mr23209027ejc.75.1622478141095; 
 Mon, 31 May 2021 09:22:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 c20sm4816479ejx.18.2021.05.31.09.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 09:22:20 -0700 (PDT)
Subject: Re: [PATCH v2 13/33] block/copy-before-write: use file child instead
 of backing
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-14-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <cb664f1c-4eef-d9fb-e318-c3a2f5adc934@redhat.com>
Date: Mon, 31 May 2021 18:22:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-14-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> We are going to publish copy-before-write filter, and there no public
> backing-child-based filter in Qemu. No reason to create a precedent, so
> let's refactor copy-before-write filter instead.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.c | 39 ++++++++++++++++++++++-----------------
>   1 file changed, 22 insertions(+), 17 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>



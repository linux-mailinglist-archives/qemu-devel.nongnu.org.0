Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DC7628D88
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:38:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouijF-00032V-A8; Mon, 14 Nov 2022 18:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieK-0001eb-Ms
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oufzz-0006k5-Eu
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 15:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668457446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jNWKdoDEMrm5CD8YEfW+p+isPytewz7DRBU48QEJ8/Y=;
 b=Qj5P1TheMTMx2GeCWV9lakjkC5fdhOTtb+BM9pGOFZeEQfnkn8eS4zbybqm9oVJmg0vFwa
 48mYO6DGxrpG+7aMXzwTAtl3Tvqb81uQy9nAXlPE+W7m2cZCHGKnB0R/U4ft6DmOA09pVV
 fcF//KY8xlqf8++wUodHrklEHaYzYjY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-AFO9mEwcMruY5O828QvybQ-1; Mon, 14 Nov 2022 15:24:05 -0500
X-MC-Unique: AFO9mEwcMruY5O828QvybQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 sg37-20020a170907a42500b007adaedb5ba2so6017989ejc.18
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 12:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jNWKdoDEMrm5CD8YEfW+p+isPytewz7DRBU48QEJ8/Y=;
 b=npIyf8S/v5tOW+0FmrnYVmx86l8HGQdj645s8efdmUfbpumvyia/V/dc5q5eU9yLFn
 FZjvZDPLAUtJE3jHkTlBVS7Lv9vYHEk7dteh/U8JyxB1+EMHasMD43da3YOmR4sjUGk0
 sd2STRYFbC/0UOIiRVlBZFFAAzXc/B9Wop5kfK2yI4CZ21MIsywfScpOXmL+7YFr435I
 Tro2KKmcRY83C73TMOKFMtcXCr+PqZA2RB7oZzx2Eh28Z4dqderHPPYVJnsIrCBoKLq6
 fezJasTXC/bq30vk1G7FXDIPfAcLlaL/knirx/XwAg6JgZQI+MRd60hKispaJhS5rLgf
 TwzQ==
X-Gm-Message-State: ANoB5plAd1m2f8zKcCUzw4jSP2r26yRlaFHVZXi+9lV8X1LyIdzWycjP
 CNntV8Sbm5hRLxNAMHK1N/IhQ+IheKBy4zjY6myMRG2L2Guui1FEJs2uIx15aDOp+Nz2kROOQNy
 ULdUVzQF8l7rZ1Kc=
X-Received: by 2002:a17:906:1f14:b0:7ad:79c0:5482 with SMTP id
 w20-20020a1709061f1400b007ad79c05482mr11010675ejj.730.1668457443915; 
 Mon, 14 Nov 2022 12:24:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4HfxUW4w4BIXychy4pBLh/rMpzu0YV8ri4GPrN5jnsp2RS8sp753P/5CrmKh9c356M7vD+4g==
X-Received: by 2002:a17:906:1f14:b0:7ad:79c0:5482 with SMTP id
 w20-20020a1709061f1400b007ad79c05482mr11010662ejj.730.1668457443642; 
 Mon, 14 Nov 2022 12:24:03 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a1709063f4700b0078d0981516esm4659205ejj.38.2022.11.14.12.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 12:24:03 -0800 (PST)
Message-ID: <f454668b-e150-bc19-7878-4c1285796f1b@redhat.com>
Date: Mon, 14 Nov 2022 21:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 13/13] block: Remove poll parameter from
 bdrv_parent_drained_begin_single()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-14-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-14-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08.11.22 13:37, Kevin Wolf wrote:
> All callers of bdrv_parent_drained_begin_single() pass poll=false now,
> so we don't need the parameter any more.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-io.h | 5 ++---
>   block.c                  | 4 ++--
>   block/io.c               | 7 ++-----
>   3 files changed, 6 insertions(+), 10 deletions(-)

Well, “drained_begin” does not mean “drain”, so...

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



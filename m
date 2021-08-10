Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75993E5E4D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:47:23 +0200 (CEST)
Received: from localhost ([::1]:34116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDT2I-0000B6-8A
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSzw-0007XB-Qx
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:44:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mDSzu-0001zl-8e
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628606692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CzCHs8Xln/BYj5mi7NgIoG7rpE6Ta5xVv5MRq1fn4Q4=;
 b=Kwa7W5lzkdInutPCJFk2FDGjpUTYEvpsXMPovdufdv/j+HBZ6QFGPjJNqBMn4HO6XCS81a
 DaWwGasiacL/20pHwrva+4M9WXgkuaB59LlB06syiAH1bJrPHB6Ms9wzFfGjB12Clu8cqz
 M2SnjA8fV0wV/HVGWSS7o6UlbLQFLGA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-KjQt783zMTWmmX7vbo4JVw-1; Tue, 10 Aug 2021 10:44:51 -0400
X-MC-Unique: KjQt783zMTWmmX7vbo4JVw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso1133294wmm.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 07:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CzCHs8Xln/BYj5mi7NgIoG7rpE6Ta5xVv5MRq1fn4Q4=;
 b=Xk/mlGMycp3iyea1jcIMgJUu6deC9lltuwxdt3ccaQm0ikAhGUNJRxjQMctMETHKzf
 gJT9mm7ySo+vG1vMIp9894Ck5fSln5xLdbgk6CzX/CJadydu1Cmb7XyGxOR37P2f4ce6
 m0ode38QxfvTandWBWl/oi62fVjDGgJHwSXtpnyGuXBd1WfR7buqZyuuc5sL/vmJ46Rz
 XIcMY3XEgrw4idjPkeTHgn4fhIt4FJVPI4FjgIHkXwFshUGluPSLhT0/SIEo4Jg8PNcU
 rNqmrGJ34FQXLfh74UfYnRUuNVykBt8Amb4BEcgvWfOYAToPqjyaqLl0NSFBcpAu38PV
 8YeQ==
X-Gm-Message-State: AOAM5304bAEYNrgI7i2sMtqr1zmN/DtWMo79dpmAmATM0tS10B77On+e
 PSA42hUceFVbDvEYjiZhr0X5gQYZUbM9vG9J1+63yM3PcCmZLoieIu/Y+ShVhJ4RKrUqoWlCFmL
 QNM6dtyCh6Jpi1y8=
X-Received: by 2002:adf:f64a:: with SMTP id x10mr2434414wrp.287.1628606690053; 
 Tue, 10 Aug 2021 07:44:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwivfBZ7yk5/0BDOZr7w2uYxLlwPPKyEkpv2Ed/jUKQLJ8sgEG/YBPeYqemxyXV/oagDTusqg==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr2434402wrp.287.1628606689927; 
 Tue, 10 Aug 2021 07:44:49 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 s14sm21068312wmc.25.2021.08.10.07.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 07:44:48 -0700 (PDT)
Subject: Re: [PATCH v7 06/33] block-copy: move detecting fleecing scheme to
 block-copy
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
 <20210804093813.20688-7-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <1a30dd07-ffba-6e71-540a-c5dd1f856afd@redhat.com>
Date: Tue, 10 Aug 2021 16:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804093813.20688-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> We want to simplify initialization interface of copy-before-write
> filter as we are going to make it public. So, let's detect fleecing
> scheme exactly in block-copy code, to not pass this information through
> extra levels.
>
> Why not just set BDRV_REQ_SERIALISING unconditionally: because we are
> going to implement new more efficient fleecing scheme which will not
> rely on backing feature.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/copy-before-write.h  |  2 +-
>   include/block/block-copy.h |  3 +--
>   block/backup.c             | 21 +--------------------
>   block/block-copy.c         | 24 +++++++++++++++++++++---
>   block/copy-before-write.c  |  4 ++--
>   5 files changed, 26 insertions(+), 28 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



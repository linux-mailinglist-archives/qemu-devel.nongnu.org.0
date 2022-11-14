Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBAA628E2A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:19:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiql-0003WT-Uj; Mon, 14 Nov 2022 18:26:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ouieW-0002Di-Gc
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oue5h-0005J2-Sq
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668450113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pkrx8AuIWsABNiCf2QEXLq04X/wEI3wVF3ckPvibi1M=;
 b=MjqMdV3JXYZh+MtwchBHZICDPBu/WPCaZu22txoNA+YyAqTLTEINNGwOo9Aw635pGnJbOf
 a6NdQlMuuFXGSUuIIjOUTnXqzuoc52hbEhLDSKYyp1PfPq5BxbweMn2FeQpsUUxNFwD2LK
 uqFA6+k0SX3BYa0Kpy5PZuS4vICRgSE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-N4S8WXp4M_qlXTGAxXWIjQ-1; Mon, 14 Nov 2022 13:21:50 -0500
X-MC-Unique: N4S8WXp4M_qlXTGAxXWIjQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 hb35-20020a170907162300b007ae6746f240so5818868ejc.12
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 10:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pkrx8AuIWsABNiCf2QEXLq04X/wEI3wVF3ckPvibi1M=;
 b=BRUpP7TokKlWBboLS3F+Zf3O4L787ytnQ54zBOHeQczGm86fPY8omz7pGfHG9AqhO7
 5lb8XPp+H9CstfFitQsDJTZmUv/i29OHfdZdrcMJCNbYIdF9eGjtslfF6e8L9+N2VF9T
 0LI28fHA+FJMmlqDYNEIlhLI5xs/ZSG1DsKP+yEM9ricwDDZwXIYvTw2BbeayViVKguX
 nhKT5VfTyiTgp11EAYGKXakR1suWzq1OUa01erqZ3Naw586I9wsBPDAAM0tMwy9ELXob
 CG4BALartQVlwnDjsI0xa2fJ+JlxIgo6LpJT4N6k3XE1xS7ek3sxPeo4YK6PTwHHKFoH
 wH9Q==
X-Gm-Message-State: ANoB5pkj3deVtWLHdMzlSMnVQ9Pg0MB0FpVeeyLbv3nZt34huE34B2SJ
 jkkGff8D3yuE/3cl4LW7reGDp9I+efIbvdv48qXEln70mYO6GuyXgqbqxq/Ww2bluqJKSgTBiGY
 am0kTXsNxm9YOCZk=
X-Received: by 2002:a17:906:a046:b0:741:5c0e:1058 with SMTP id
 bg6-20020a170906a04600b007415c0e1058mr11076647ejb.472.1668450108853; 
 Mon, 14 Nov 2022 10:21:48 -0800 (PST)
X-Google-Smtp-Source: AA0mqf66d8Wbkr2f/DjUj5vIP2qSxlh7FJ/mX7hvQURgEGaqk/uPSS3Kuh/OZvRD9Fm/rTBPUhLiEA==
X-Received: by 2002:a17:906:a046:b0:741:5c0e:1058 with SMTP id
 bg6-20020a170906a04600b007415c0e1058mr11076629ejb.472.1668450108599; 
 Mon, 14 Nov 2022 10:21:48 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a170906118b00b007ad4a555499sm4365113eja.204.2022.11.14.10.21.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 10:21:47 -0800 (PST)
Message-ID: <d5b986ee-bb54-90dd-77cc-eb18c504b2a8@redhat.com>
Date: Mon, 14 Nov 2022 19:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/13] stream: Replace subtree drain with a single node
 drain
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
 <20221108123738.530873-9-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221108123738.530873-9-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> The subtree drain was introduced in commit b1e1af394d9 as a way to avoid
> graph changes between finding the base node and changing the block graph
> as necessary on completion of the image streaming job.
>
> The block graph could change between these two points because
> bdrv_set_backing_hd() first drains the parent node, which involved
> polling and can do anything.
>
> Subtree draining was an imperfect way to make this less likely (because
> with it, fewer callbacks are called during this window). Everyone agreed
> that it's not really the right solution, and it was only committed as a
> stopgap solution.
>
> This replaces the subtree drain with a solution that simply drains the
> parent node before we try to find the base node, and then call a version
> of bdrv_set_backing_hd() that doesn't drain, but just asserts that the
> parent node is already drained.
>
> This way, any graph changes caused by draining happen before we start
> looking at the graph and things stay consistent between finding the base
> node and changing the graph.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   include/block/block-global-state.h |  3 +++
>   block.c                            | 17 ++++++++++++++---
>   block/stream.c                     | 20 ++++++++++----------
>   3 files changed, 27 insertions(+), 13 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



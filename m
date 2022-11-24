Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E38637EE4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 19:27:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyGvf-0004n8-Od; Thu, 24 Nov 2022 13:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oyGve-0004ma-7r
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oyGvc-0004lp-E1
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 13:26:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669314386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WFUhQ2w/Z9eTdR/qc6x9gH+wIuW4r4FK2duHGHjmIrg=;
 b=Dbc5hGu1DCTBfUGvPDAhtTTZ8tk16Qu+xjk9ZN5nu1ULwudx8YQ5M7HBsdawOXd8m5t5pn
 dyrwUDo9gOZwUjWTjb4FJHTVDrdGWLSorp6UR7OVGcLKzGaPfsxpV09PplhplmtvP+UBzC
 YwtWAyGsUx5VAYTwPiszVcOSFI5dgmA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-611-DAjOGU-wOvOp0MN5eQjXQw-1; Thu, 24 Nov 2022 13:26:25 -0500
X-MC-Unique: DAjOGU-wOvOp0MN5eQjXQw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r23-20020adfa157000000b00241bcae980cso550050wrr.7
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 10:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WFUhQ2w/Z9eTdR/qc6x9gH+wIuW4r4FK2duHGHjmIrg=;
 b=wUyQ14cd/+QwO+Q0KbuscieyrINPBQutiCCId/X9I+EVbZJHOZFCg7w43ZRnmmHrbS
 0qOSmuTn9jZt1uCdOxIyM06/zg2I9GCMUnsKPXP7tGap684QmUqNWxOizUTpikfCiEdm
 nxs2MR/iARlAUkOC0ioow9oChRj88SLSlQooH5ron47A1GCuh+0syrnHnrUL9mX3yYuE
 eN5axQ+z5McTQ46/wkiRWiaG3dBA1nCKIWGN/upRWTSOcxVH/8nzocNnh16rGr73ZYpe
 1uOnSUjIB5gRFiar4FByAzVdeGOHHp+Uu7BBuOGqktcNOsarkNrXuYHlvIrPOJDNw5Kv
 NlHg==
X-Gm-Message-State: ANoB5pkVJjI3vpJEEQSJLeySmSQWVn+ukJEtGhj4frX2bDMt4wkir438
 FZ+fTzwZoUAfi3rEhwFzL4ayRGsh2DnjuHAc/RzYMdecP8MsRYfI3oXuCfW9DWez2+haaQkaJ87
 628CtMV2tqJxmby4=
X-Received: by 2002:a5d:6f0f:0:b0:236:5b81:1daa with SMTP id
 ay15-20020a5d6f0f000000b002365b811daamr12078806wrb.17.1669314383847; 
 Thu, 24 Nov 2022 10:26:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4R8QZCJuhuFyn2DiAsXZVdKzFmof33k2R+EjOeUwspStGv4rg0hiIC4PkD4GBHY9GfxBhoEQ==
X-Received: by 2002:a5d:6f0f:0:b0:236:5b81:1daa with SMTP id
 ay15-20020a5d6f0f000000b002365b811daamr12078783wrb.17.1669314383444; 
 Thu, 24 Nov 2022 10:26:23 -0800 (PST)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 iv19-20020a05600c549300b003cf87623c16sm7534361wmb.4.2022.11.24.10.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Nov 2022 10:26:22 -0800 (PST)
Message-ID: <b07eb222-d6c4-3fcc-e485-fe56a06e1cd1@redhat.com>
Date: Thu, 24 Nov 2022 19:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/15] block: Simplify drain
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 vsementsov@yandex-team.ru, qemu-devel@nongnu.org
References: <20221118174110.55183-1-kwolf@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20221118174110.55183-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 18.11.22 18:40, Kevin Wolf wrote:
> I'm aware that exactly nobody has been looking forward to a series with
> this title, but it has to be. The way drain works means that we need to
> poll in bdrv_replace_child_noperm() and that makes things rather messy
> with Emanuele's multiqueue work because you must not poll while you hold
> the graph lock.
>
> The other reason why it has to be is that drain is way too complex and
> there are too many different cases. Some simplification like this will
> hopefully make it considerably more maintainable. The diffstat probably
> tells something, too.
>
> There are roughly speaking three parts in this series:
>
> 1. Make BlockDriver.bdrv_drained_begin/end() non-coroutine_fn again,
>     which allows us to not poll on bdrv_drained_end() any more.
>
> 2. Remove subtree drains. They are a considerable complication in the
>     whole drain machinery (in particular, they require polling in the
>     BdrvChildClass.attach/detach() callbacks that are called during
>     bdrv_replace_child_noperm()) and none of their users actually has a
>     good reason to use them.
>
> 3. Finally get rid of polling in bdrv_replace_child_noperm() by
>     requiring that the child is already drained by the caller and calling
>     callbacks only once and not again for every nested drain section.
>
> If necessary, a prefix of this series can be merged that covers only the
> first or the first two parts and it would still make sense.
>
> v2:
> - Rebased on master
> - Patch 3: Removed left over _co parts in function names
> - Patch 4: Updated function comments to reflect that we're not polling
>    any more
> - Patch 6 (new): Fix inconsistent AioContext locking for reopen code
> - Patch 9 (was 8): Added comment to clarify when polling is allowed
>    and the graph may change again
> - Patch 11 (was 10):
>    * Reworded some comments and the commit message.
>    * Dropped a now unnecessary assertion that was dropped only in a later
>      patch in v1 of the series.
>    * Changed 'int parent_quiesce_counter' into 'bool quiesced_parent'
> - Patch 12 (was 11): Don't remove ignore_bds_parents from
>    bdrv_drain_poll(), it is actually still a valid optimisation there
>    that makes polling O(n) instead of O(n²)
> - Patch 13 (new): Instead of only removing assert(!qemu_in_coroutine())
>    like in v1 of the series, drop out of coroutine context in
>    bdrv_do_drained_begin_quiesce() just to be sure that we'll never get
>    coroutine surprises in drain code.
> - Patch 14 (was 12): More and reworded comments to make things hopefully
>    a bit clearer

Thanks!

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFBF462EA6
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 09:42:15 +0100 (CET)
Received: from localhost ([::1]:33494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mryiM-0005A6-JO
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 03:42:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrygJ-00044C-Bb
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mrygG-0002dy-2O
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 03:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638261602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l0LCNsjCj67uOms6L+BtHmkfiPg+REgvbHOn4AysoNk=;
 b=bVpR8ZvpfU6jvF7eXVgeGyWsDbLKdMcs78hE9dzDzYQpw6c8xH0goGmHN30FQy+bjAxl4j
 Fc954GW0cqDLJKtNvSIZTDP21wHQXP6BMlw6HB2YqAuIQJzFvHBUbm/yDo24bVqlk7HPGx
 yfkth27UlB98chS36BKXsC2kSYW8o5k=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-_wQHcbGsObmFkK2DYU8hEA-1; Tue, 30 Nov 2021 03:40:01 -0500
X-MC-Unique: _wQHcbGsObmFkK2DYU8hEA-1
Received: by mail-ed1-f72.google.com with SMTP id
 i19-20020a05640242d300b003e7d13ebeedso16245589edc.7
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 00:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l0LCNsjCj67uOms6L+BtHmkfiPg+REgvbHOn4AysoNk=;
 b=TyB61TnhN5gwo45wh7GEHLzUbKND97y7tQ+h4sQp5EhLnjqt4flCTQVGWZH1YZeumi
 hgcpLuGsyzxNlgyDSMEFtE1n11BAiXTrWGSv6rzbwQX4zHueoVRcPZoo0Ps8dcT8BFa6
 KNTSymsD83L60Nd3b99917jeIg4E7th+kvu3XQ/Ft1d7y8fpcaLoq9nFp6XVE5DfDzZ3
 ExJ+FdjPN/3PcXUHlIz8RgInSGWBJhCp69xEuGPtP4E+p4Spf/XZaOLrr3priK87hoTB
 gGI0q/8F7fKKx58+xHsz6XLeKYVqyWWmt5E0VepDyWU3pXKugMPzky2sDCGfHUwGVAV5
 fh6A==
X-Gm-Message-State: AOAM532hXSIa70j3Mf4/0UbpyyAuI1Zg7Et6cPwxbXXiIlvrf+1dtp1F
 qk+XlQ8yGMEULIqd17f5ircSNItoIBKp9nj3k4Lc/irymABMm/3vLY6/B3hTP3JvKi6d5XNbENg
 aCkh1nT5elDMgXTw=
X-Received: by 2002:a17:907:3f95:: with SMTP id
 hr21mr67620141ejc.427.1638261600099; 
 Tue, 30 Nov 2021 00:40:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyq8hj0i/xxCXNWs95hhJ5yWCFlesJyanazgDOTiTW4k84M1/EpHGP8VzEpXAyFfq1fuXuglg==
X-Received: by 2002:a17:907:3f95:: with SMTP id
 hr21mr67620094ejc.427.1638261599782; 
 Tue, 30 Nov 2021 00:39:59 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id ne33sm9058271ejc.6.2021.11.30.00.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 00:39:59 -0800 (PST)
Message-ID: <9e86e5fc-2d66-730e-8ad5-44112292a980@redhat.com>
Date: Tue, 30 Nov 2021 09:39:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 00/31] block layer: split block APIs in global state
 and I/O
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <YaTWd2z4dua9Rtxu@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YaTWd2z4dua9Rtxu@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 29/11/2021 14:32, Stefan Hajnoczi wrote:
> On Wed, Nov 24, 2021 at 01:43:47AM -0500, Emanuele Giuseppe Esposito wrote:
>> v5 -> v6:
>> * In short, apply all Hanna's comments. More in details,
>>    the following functions in the following headers have been moved:
>>    block-backend:
>>      blk_replace_bs (to gs)
>>      blk_nb_sectors (to io)
>>      blk_name (to io)
>>      blk_set_perm (to io)
>>      blk_get_perm (to io)
>>      blk_drain (to io)
>>      blk_abort_aio_request (to io)
>>      blk_make_empty (to gs)
>>      blk_invalidate_cache (was in io, but had GS assertion)
>>      blk_aio_cancel (to gs)
>>    block:
>>      bdrv_replace_child_bs (to gs)
>>      bdrv_get_device_name (to io)
>>      bdrv_get_device_or_node_name (to io)
>>      bdrv_drained_end_no_poll (to io)
>>      bdrv_block_status (was in io, but had GS assertion)
>>      bdrv_drain (to io)
>>      bdrv_co_drain (to io)
>>      bdrv_make_zero (was in GS, but did not have the assertion)
>>      bdrv_save_vmstate (to io)
>>      bdrv_load_vmstate (to io)
>>      bdrv_aio_cancel_async (to io)
>>    block_int:
>>      bdrv_get_parent_name (to io)
>>      bdrv_apply_subtree_drain (to io)
>>      bdrv_unapply_subtree_drain (to io)
>>      bdrv_co_copy_range_from (was in io, but had GS assertion)
>>      bdrv_co_copy_range_to (was in io, but had GS assertion)
>>      ->bdrv_save_vmstate (to io)
>>      ->bdrv_load_vmstate (to io)
>>
>>    coding style (assertion after definitions):
>>      bdrv_save_vmstate
>>      bdrv_load_vmstate
>>      block_job_next
>>      block_job_get
>>
>>    new patches:
>>      block.c: modify .attach and .detach callbacks of child_of_bds
>>      introduce pre_run as JobDriver callback to handle
>>        bdrv_co_amend usage of permission function
>>      leave blk_set/get_perm as a TODO in fuse.c
>>      make sure bdrv_co_invalidate_cache does not use permissions
>>        if BQL is not held
>>
>>    minor changes:
>>      put back TODO for include block/block.h in block-backend-common.h
>>      rebase on kwolf/block branch
>>      modify where are used assert_bdrv_graph_writable, due to rebase
> 
> These changes sound fine to me. Hanna or Kevin can merge the series when
> they are happy.
> 

Just a tiny nitpick, I would just not merge patch 10: "block.c: modify 
.attach and .detach callbacks of child_of_bds". It is not wrong and 
should produce no side effect, but does not do what it was intended for 
(ie using the drain to protect the bs's list of children). I will work 
on that in a future serie. Apologies.

Thank you,
Emanuele



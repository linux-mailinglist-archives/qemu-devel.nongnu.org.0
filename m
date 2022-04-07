Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342304F79C7
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:31:34 +0200 (CEST)
Received: from localhost ([::1]:54372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNYD-00030D-2h
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncNPR-0005nL-AV
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncNPP-0002Y6-Cv
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:22:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649319746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHcFzRWuIE9zcbYdHp7jsyBMzmn4b1/rxLmDaEUYQI0=;
 b=HkTUTfCSs35B/Gux5wG2CWxG5JjQCn55vQt0wdHe+ht/jRkMvK6UT48U75rTBFdnL9z8Gi
 SbghD+p8UBdADRSxOzF6ZUSeZUZOJfl1rr/YPl/JuS2s/hFwclBtynoouSD6ackLSlS4oA
 H97jB1Knnaomf4+X4MI9tdkJ9wY3MfA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-mtLxgbwUMnKjkqFMCnWAMQ-1; Thu, 07 Apr 2022 04:22:25 -0400
X-MC-Unique: mtLxgbwUMnKjkqFMCnWAMQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m23-20020a056402051700b0041cd56be44cso2542308edv.10
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 01:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qHcFzRWuIE9zcbYdHp7jsyBMzmn4b1/rxLmDaEUYQI0=;
 b=ohdPhu/cqae6g7aJoxZ4k6rqfzyI602qJOlxVxZoQRGK99I/p+SajxjpnuPaUaW5hT
 Q1EyKpwunN0Nrz3H8uDG2v9CWLM0T2vXoA2zAxeETBNy+qn86rIywp0ix6FPmnwZHl15
 JhxK2F5CGY2uecuukaRQKWBGoH44nlFFB9rVNcb2uAcnTnCDCZbjeVtuMxIfAmgP3472
 e9QcsdSnwQZW6PPtw4mK97lAvv10n28bxQj5jxdJ+pf8Xg2VclSp6iOSXryUn9E1DAfZ
 D32GcWAKQXu8D/Jyiw0pKNHDzHZl/hN/QeJi/4Pf/Ha+nCmQTLZ912B84XdE6Twkt34S
 GT1w==
X-Gm-Message-State: AOAM531T87hMAoEvFUM4Yum1UXqRWyo4deFg7F5sUZ/w3L6+MqjcrOU/
 eExskKmTI9HVBQJgmTJXzqG56ZUd9ZLGqisVtQZWObwovXT9gxA5KvnZEJ2/E6Pe/zkH3SaVSq5
 IfHPYkWGWt+1gHIU=
X-Received: by 2002:aa7:c307:0:b0:41c:d381:d60e with SMTP id
 l7-20020aa7c307000000b0041cd381d60emr12930453edq.184.1649319744291; 
 Thu, 07 Apr 2022 01:22:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIQ4wWAAd7ReeG9HIG/VG7ZhyjrBgNyQkfjxhkIQ0DKl++/ASzuYT7BkKgCDDPiAKe56UDUg==
X-Received: by 2002:aa7:c307:0:b0:41c:d381:d60e with SMTP id
 l7-20020aa7c307000000b0041cd381d60emr12930427edq.184.1649319744008; 
 Thu, 07 Apr 2022 01:22:24 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a170906289600b006e44a0c1105sm7453174ejd.46.2022.04.07.01.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:22:23 -0700 (PDT)
Message-ID: <ec47e2d2-57e8-bf7d-5226-9881cf635579@redhat.com>
Date: Thu, 7 Apr 2022 10:22:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/7] block/copy-before-write: add on-cbw-error open
 parameter
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-3-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406180801.374844-3-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 20:07, Vladimir Sementsov-Ogievskiy wrote:
> Currently, behavior on copy-before-write operation failure is simple:
> report error to the guest.
>
> Let's implement alternative behavior: break the whole copy-before-write
> process (and corresponding backup job or NBD client) but keep guest
> working. It's needed if we consider guest stability as more important.
>
> The realisation is simple: on copy-before-write failure we set
> s->snapshot_ret and continue guest operations. s->snapshot_ret being
> set will lead to all further snapshot API requests. Note that all
> in-flight snapshot-API requests may still success: we do wait for them
> on BREAK_SNAPSHOT-failure path in cbw_do_copy_before_write().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   qapi/block-core.json      | 25 ++++++++++++++++++++++++-
>   block/copy-before-write.c | 32 ++++++++++++++++++++++++++++++--
>   2 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index beeb91952a..085f1666af 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json

[...]

> @@ -4184,11 +4203,15 @@
>   #          modifications (or removing) of specified bitmap doesn't
>   #          influence the filter. (Since 7.0)
>   #
> +# @on-cbw-error: Behavior on failure of copy-before-write operation.
> +#                Default is @break-guest-write. (Since 7.0)

With *7.1:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> +#
>   # Since: 6.2
>   ##
>   { 'struct': 'BlockdevOptionsCbw',
>     'base': 'BlockdevOptionsGenericFormat',
> -  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
> +  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
> +            '*on-cbw-error': 'OnCbwError' } }
>   
>   ##
>   # @BlockdevOptions:



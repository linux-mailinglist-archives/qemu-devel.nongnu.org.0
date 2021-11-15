Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55245075E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:43:44 +0100 (CET)
Received: from localhost ([::1]:56506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdCx-0007GW-6P
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmd5n-0006l0-RS
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:36:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmd5l-0005Ld-UW
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636986977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1v2JsmUxKpdRVPALmQpF81zKNzYqCF8rLrpTUaa0Wpk=;
 b=UUVdKdwg2881+7WBXZxR9QaClxO/nxPitPJOFYPDizOpzEV0Qv9Jn7ZnEPXVh+QfdGypWe
 7XmZX9XbYegYfxZUokINast6zuad8KPAwPKT+VNStRKo3j3T4ZkIN3lv+ZKalz6dujEWM6
 InhiP/kn7fiWXegNYHr/LPUM65QlPwg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-X2zHXz0-OZ2YN4d8dmPL3A-1; Mon, 15 Nov 2021 09:36:14 -0500
X-MC-Unique: X2zHXz0-OZ2YN4d8dmPL3A-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020adfedd1000000b0017c5e737b02so3621258wro.18
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1v2JsmUxKpdRVPALmQpF81zKNzYqCF8rLrpTUaa0Wpk=;
 b=bU30Kfsxh8hsX/giy/VLMr90i3Goq9idM0zwzOmnyiyDR6KmUtwvnXikkoifnGR6eO
 BQayBw5vgROk4dkmguunae3GKayOx4P3uCK9ZGR1qXz+PQfKCVE833mNBu/tOtHTjkiD
 TgQWXtZZC3guRkG8O1fZk70GSPUfLW9os63oAuBcXt7YVHZDdDs21/2bFa3AnU84Brvt
 PPGVegV3SM7YNqh8ZEpKYZYZ3ou0CuoQK20roGtaq/Mr4PYm2RYBtsWURhcT9/3X73Me
 u3OGcYKMQLTi62crfedkMnqtvRDMiWEu7JvqezB6vyDldpw8qY+b7fvqi2TESix+uPNv
 Ftgw==
X-Gm-Message-State: AOAM530NbCgEk+j3IsfwItyTdZzNMyQCsmVW8aIn+fLerEJUFXA0yCtA
 Pu00oqc6VCwW/5MAFBYftOZkwPXqduKNY5y5qCfb6c9roGcfKUR9xml+ONLKrAIxtkwBwcWPlNv
 f/e7DptHF5xOAF4w=
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr48226390wrw.434.1636986972949; 
 Mon, 15 Nov 2021 06:36:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylK3j2yYaGDpwvWJITlJmtaq49l9GM6hKGwm4HRP5sD4EcNkMImWjLnen4isIxM/oT8oTkqw==
X-Received: by 2002:a5d:4fcc:: with SMTP id h12mr48226330wrw.434.1636986972686; 
 Mon, 15 Nov 2021 06:36:12 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l21sm5224304wrb.38.2021.11.15.06.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:36:12 -0800 (PST)
Message-ID: <f18fe877-2a11-16fe-01bb-e48f59702e03@redhat.com>
Date: Mon, 15 Nov 2021 15:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 21/25] block_int-common.h: split function pointers in
 BdrvChildClass
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-22-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-22-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/block/block_int-common.h | 51 ++++++++++++++++++++------------
>   1 file changed, 32 insertions(+), 19 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 9857e775fe..ea16099c53 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h

[...]

> +    /*
> +     * I/O API functions. These functions are thread-safe.
> +     *
> +     * See include/block/block-io.h for more information about
> +     * the I/O API.
> +     */
> +
> +    void (*resize)(BdrvChild *child);
> +
>       /*
>        * If this pair of functions is implemented, the parent doesn't issue new
>        * requests after returning from .drained_begin() until .drained_end() is
> @@ -859,23 +889,6 @@ struct BdrvChildClass {
>        */
>       void (*activate)(BdrvChild *child, Error **errp);
>       int (*inactivate)(BdrvChild *child);

These are now I/O functions, but I believe they should be GS functions: 
BlockBackend’s implementation for .activate (blk_root_activate()) 
invokes blk_set_perm(), which is a GS function.  Its .inactivate 
implementation (blk_root_inactivate()) invokes bdrv_child_try_set_perm().

(I also believe this makes sense in context: .activate is called by 
bdrv_co_invalidate_cache(), which should be a GS function as I’ve 
suggested in my reply to patch 20.  .inactivate is called by 
bdrv_inactivate_recurse(), which is a GS function, too.)

Hanna



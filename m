Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4C49CA41
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 14:02:28 +0100 (CET)
Received: from localhost ([::1]:37054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nChwR-0000oL-Iq
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 08:02:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChgt-00050E-MF
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:46:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChgq-0006Gv-PK
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643201180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BeIHvLOcgy4JLEOL5hcmDj8khgfFaxH/mgpQPvi5cyo=;
 b=GfUCEJlhcP/EyhLII8PoCVXOdcgen1b9dnaoPcFChgHdNr/mxZVw2z+/B1WGSoIZudhT/+
 FO/jEomRzNROBLfNJ38+2x4A1Sd1Fr2fvCvcEx8SVRDqSHMWpcA1Bv2JH3hyHtTUWFSVI0
 vw4xOxZ7O6dBBPwZS7ibf5DwdSrxKVc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-gnXnOSzwPGK4Fb4X8Z-pJA-1; Wed, 26 Jan 2022 07:46:18 -0500
X-MC-Unique: gnXnOSzwPGK4Fb4X8Z-pJA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso4287203wrg.7
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 04:46:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BeIHvLOcgy4JLEOL5hcmDj8khgfFaxH/mgpQPvi5cyo=;
 b=oIp1iK8hj5uVYRQwpXNzm/tAZmXmgoyG1PpqfMmWcfl4+F3ohUEEIyCBFDtFYubR/7
 DwG3T652J7veomDdvokwmsvvtvj07/ir5KVqmTmUbg/Q0yrhr6d0cCVyp85IT76+XVAU
 jEO6vLD44fAsEo0omqACa7kZO5Qk7w7IHOLuraXuuIJ+y8Om7EWyXtp5Rnot5TbiFs8+
 sol+4RA3lr0BEhRY4TrAxAKi5tDjjmMI9wtYrey9A8etSkrIfMf5tgNlN0L7HhkZfuGj
 tfJS2QVi/LXld7f/RCZJNv5rZY+L9fEgyiYLwBGurva4V3qpdvmtYZl+2ws0G0nSEdDV
 nMAw==
X-Gm-Message-State: AOAM5326BP7WmJyOcWasQkFE0aO795M3LCS7TtdYfXZwX8ldOdd9maN7
 6vWTN95iUsPuiVxHyi/sxwq9RL0+5U3iOP5ViO6rq10Msc6qJT6M9lT9DuEcFzq+PT7WgxMiwko
 kUElBKZP3vx/jaFk=
X-Received: by 2002:adf:f307:: with SMTP id i7mr6520633wro.615.1643201177624; 
 Wed, 26 Jan 2022 04:46:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6n30s9KzcWZRY27Seb7zzbYiCkxOPagG72zYHkDecBWX9MXIkVfrK0T2ORICINOQi+tb2ng==
X-Received: by 2002:adf:f307:: with SMTP id i7mr6520599wro.615.1643201177357; 
 Wed, 26 Jan 2022 04:46:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id 10sm3133790wmc.44.2022.01.26.04.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:46:16 -0800 (PST)
Message-ID: <7d75e8f7-bbbc-ce7e-8db7-664e26772123@redhat.com>
Date: Wed, 26 Jan 2022 13:46:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 26/33] block_int-common.h: assertions in the callers of
 BdrvChildClass function pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-27-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-27-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/block.c b/block.c
> index 448fb9d76f..ca16d90627 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -2120,6 +2121,7 @@ bool bdrv_is_writable(BlockDriverState *bs)
>   
>   static char *bdrv_child_user_desc(BdrvChild *c)
>   {
> +    assert(qemu_in_main_thread());
>       return c->klass->get_parent_desc(c);
>   }

Quick note: Whether we really want this depends on whether we find that 
`.get_parent_desc()` really should be a GS-only function.

Since I leave that up to you, though (and this patch interestingly (and 
correctly) doesn’t add an assertion to bdrv_get_parent_name(), even 
though that calls `.get_name()`, which the previous patch did classify 
as GS):

Reviewed-by: Hanna Reitz <hreitz@redhat.com>



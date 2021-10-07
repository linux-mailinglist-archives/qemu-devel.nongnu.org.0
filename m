Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E64252C3
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:12:21 +0200 (CEST)
Received: from localhost ([::1]:36382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSG4-00086q-Ol
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYSCn-0004Uu-MX
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYSCm-00022f-3j
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ARZLirVAyvVQlFC0QPhzqkRda6WKfsIE5Y5xWUbWG0=;
 b=DvJi7vxncjVf2Z609Didehu1LFw8j2IOSk5H3gcTd8v2sVAJDJ7KU0OOeX+iJk9l71ihiN
 3gph42CnbxhcThwVaZYZPdxQ7FFm4DipOrm/V2R+VgpzXZEq2nZ+bAnuEHhaGL8tJ1AkGr
 mj4VYrickGAzg0E7Ze/5B/FYdb1RGkc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-TWwEdwvONjac5gpC9Tpahg-1; Thu, 07 Oct 2021 08:08:42 -0400
X-MC-Unique: TWwEdwvONjac5gpC9Tpahg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso4510460wrg.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0ARZLirVAyvVQlFC0QPhzqkRda6WKfsIE5Y5xWUbWG0=;
 b=gaIaqzOOKlZJ9dE9y4TbxzV8KBzeqt/OWSD40I8YwMkoTJPv9zlMTduC1/EfN9V0OE
 4aIIrQyfLUVJDDQ5HyZqRRypwwXuRFS+5UY4T2+hf6JYhrqaUXHapjHY9l9x/zhM1Db8
 V1RIz6q5BUd+COLh3BXn5OM1QDi6hKEEANDZotAW65zBP3KldOSje4aGPwWEy/y51fvf
 jLeaiuMpWG2xkOUboqpGkdbJp1oxcA2d9i5ezhJzcLAktAhEIus37chR5TYuLksYvZoB
 OeXoPAPIAxBUWMk+JGcgdg+6TMqO1zt1slywJfc//nuwu2pnZn8LUpzPmXNCC/2oIewu
 nS4w==
X-Gm-Message-State: AOAM531Bmx+ii2J3ERodsTsOdRPa4s5GmMySMK82e4Lw5RLMagoNgPQU
 lvCQBSYYadidJO0iSdIWjxbBNp2c7MTiPh7iMhiSWgrtBUbMSFWAk+sdMDJtNlIgAR230L1VK05
 VkaAcpIvWf9NrM6k=
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr4989626wrx.427.1633608521319; 
 Thu, 07 Oct 2021 05:08:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvO51WXtr6rR793RRoZ/BuknL79u0/xmfEsEhANlrrIdQb7PAi2TeJZUQ0BxWZDhMKV9qJGw==
X-Received: by 2002:a05:6000:1446:: with SMTP id
 v6mr4989597wrx.427.1633608521140; 
 Thu, 07 Oct 2021 05:08:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d8sm16786360wrz.84.2021.10.07.05.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:08:40 -0700 (PDT)
Message-ID: <9eef357e-e672-a875-0f3b-2f800b452d4a@redhat.com>
Date: Thu, 7 Oct 2021 14:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 16/25] block/backup-top.h: global state API +
 assertions
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-17-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005143215.29500-17-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/21 16:32, Emanuele Giuseppe Esposito wrote:
> backup-top functions always run under BQL lock.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/backup-top.c |  2 ++
>   block/backup-top.h | 11 +++++++++++
>   2 files changed, 13 insertions(+)
> 
> diff --git a/block/backup-top.c b/block/backup-top.c
> index 425e3778be..8b58a909f7 100644
> --- a/block/backup-top.c
> +++ b/block/backup-top.c
> @@ -182,6 +182,7 @@ BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>       bool appended = false;
>   
>       assert(source->total_sectors == target->total_sectors);
> +    g_assert(qemu_in_main_thread());
>   
>       top = bdrv_new_open_driver(&bdrv_backup_top_filter, filter_node_name,
>                                  BDRV_O_RDWR, errp);
> @@ -244,6 +245,7 @@ fail:
>   void bdrv_backup_top_drop(BlockDriverState *bs)
>   {
>       BDRVBackupTopState *s = bs->opaque;
> +    g_assert(qemu_in_main_thread());
>   
>       bdrv_drop_filter(bs, &error_abort);
>   
> diff --git a/block/backup-top.h b/block/backup-top.h
> index b28b0031c4..8cb6f62869 100644
> --- a/block/backup-top.h
> +++ b/block/backup-top.h
> @@ -29,6 +29,17 @@
>   #include "block/block_int.h"
>   #include "block/block-copy.h"
>   
> +/*
> + * Graph API. These functions run under the BQL lock.
> + *
> + * If a function modifies the graph, it uses drain and/or
> + * aio_context_acquire/release to be sure it has unique access.
> + *
> + * All functions in this header must use this assertion:
> + * g_assert(qemu_in_main_thread());
> + * to be sure they belong here.
> + */
> +
>   BlockDriverState *bdrv_backup_top_append(BlockDriverState *source,
>                                            BlockDriverState *target,
>                                            const char *filter_node_name,
> 

This is now bdrv_cbw_append, but anyway:

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



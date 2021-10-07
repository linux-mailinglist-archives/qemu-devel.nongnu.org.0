Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1A9425292
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 14:08:24 +0200 (CEST)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYSCF-0001JJ-Lm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 08:08:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYS8S-0006Uh-4F
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYS8N-0005DK-KP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 08:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633608262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9Curh6WsSagpuhx5vSBnIts8bikvbVOPZIufKLyKo4=;
 b=Hl3gnKc5WzopmD0elC0/wvJ9Vxw/sIbhMQ/XyjGEyaDqqktdA2FqE7H5EOcKOgBCDYmEjA
 madAjhA9NcxyyiY6CzjgyPbXlffK2vpdV7s+mVe2WtALs2nWld52MXvL97bbroTFHv0k31
 AIZDxPE5o863jP574bfuX4fwdUE1hEU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-jKV62tgZMFmjtNTwQDm2iQ-1; Thu, 07 Oct 2021 08:04:21 -0400
X-MC-Unique: jKV62tgZMFmjtNTwQDm2iQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 q26-20020aa7da9a000000b003db531e7acbso1315319eds.22
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 05:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G9Curh6WsSagpuhx5vSBnIts8bikvbVOPZIufKLyKo4=;
 b=A1xYIQaSmnK+aX8aBSWR89TUhIe3Qwqin041qYLlB2tBuSzoFZEqgvDxcfFXBkhfUZ
 zxox0mgbFpv2HJi5xTW2lfKsLy/ahw0lkQ9UBnVOKIhX89bW3ljKboDsjH9Lc7r09/j6
 HFkb0cMk7Pj4hfQ4jaHv4QpeflGEsDhD1vhjWnyxslUPnVxdC/4xPgkZaxOn4fa67h6p
 SwWjXsqaLkXg2lfUY05nYQO8jzbnikRYLhy5YosKLjs4soDaWOlTgQ3hg26iGzd0sy2+
 fabTnFbjA83qIXA4yycuVxPvd5DhZX8pOwOKLv0Jzmp0IaFwYHdGTJytRhv/hQra26FE
 CJ4w==
X-Gm-Message-State: AOAM533v8doHauB4fyOIi3nzLJ8ir1TxdZtwCARSa+oI/H7YoUd+KnTH
 ZM9MdEMO7Rg2Nxh1HmfGyGFeSiEZh/Q5diMShSIZiDxJADGEtShz0Jrjg37lE8H1krtBO52UnA3
 eKI8JxpHgpkDeREI=
X-Received: by 2002:a17:906:eda6:: with SMTP id
 sa6mr5035780ejb.443.1633608259970; 
 Thu, 07 Oct 2021 05:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBBGGaaSs7zALwXeFbdmAh+wa5q0DeHz8AWcNd3JntRLsINdGoafuK25vMIupuVMw8R0JQWQ==
X-Received: by 2002:a17:906:eda6:: with SMTP id
 sa6mr5035749ejb.443.1633608259732; 
 Thu, 07 Oct 2021 05:04:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u6sm11251155edt.30.2021.10.07.05.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 05:04:19 -0700 (PDT)
Message-ID: <4989de6a-8164-5a96-6854-df9bb0dd6a1f@redhat.com>
Date: Thu, 7 Oct 2021 14:04:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 14/25] assertions for blockdev.h global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-15-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211005143215.29500-15-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c |  2 ++
>   blockdev.c            | 12 ++++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 9f09245069..18791c4fdc 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -805,6 +805,7 @@ DriveInfo *blk_legacy_dinfo(BlockBackend *blk)
>   DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
>   {
>       assert(!blk->legacy_dinfo);
> +    g_assert(qemu_in_main_thread());
>       return blk->legacy_dinfo = dinfo;
>   }
>   
> @@ -815,6 +816,7 @@ DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo)
>   BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo)
>   {
>       BlockBackend *blk = NULL;
> +    g_assert(qemu_in_main_thread());
>   
>       while ((blk = blk_next(blk)) != NULL) {
>           if (blk->legacy_dinfo == dinfo) {
> diff --git a/blockdev.c b/blockdev.c
> index 5608b78f8f..917bcf8cbc 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -114,6 +114,8 @@ void override_max_devs(BlockInterfaceType type, int max_devs)
>       BlockBackend *blk;
>       DriveInfo *dinfo;
>   
> +    g_assert(qemu_in_main_thread());
> +
>       if (max_devs <= 0) {
>           return;
>       }
> @@ -230,6 +232,8 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit)
>       BlockBackend *blk;
>       DriveInfo *dinfo;
>   
> +    g_assert(qemu_in_main_thread());
> +
>       for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
>           dinfo = blk_legacy_dinfo(blk);
>           if (dinfo && dinfo->type == type
> @@ -252,6 +256,8 @@ void drive_check_orphaned(void)
>       Location loc;
>       bool orphans = false;
>   
> +    g_assert(qemu_in_main_thread());
> +
>       for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
>           dinfo = blk_legacy_dinfo(blk);
>           /*
> @@ -285,6 +291,7 @@ void drive_check_orphaned(void)
>   
>   DriveInfo *drive_get_by_index(BlockInterfaceType type, int index)
>   {
> +    g_assert(qemu_in_main_thread());
>       return drive_get(type,
>                        drive_index_to_bus_id(type, index),
>                        drive_index_to_unit_id(type, index));
> @@ -296,6 +303,8 @@ int drive_get_max_bus(BlockInterfaceType type)
>       BlockBackend *blk;
>       DriveInfo *dinfo;
>   
> +    g_assert(qemu_in_main_thread());
> +
>       max_bus = -1;
>       for (blk = blk_next(NULL); blk; blk = blk_next(blk)) {
>           dinfo = blk_legacy_dinfo(blk);
> @@ -312,6 +321,7 @@ int drive_get_max_bus(BlockInterfaceType type)
>   DriveInfo *drive_get_next(BlockInterfaceType type)
>   {
>       static int next_block_unit[IF_COUNT];
> +    g_assert(qemu_in_main_thread());
>   
>       return drive_get(type, 0, next_block_unit[type]++);
>   }
> @@ -792,6 +802,8 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfaceType block_default_type,
>       const char *filename;
>       int i;
>   
> +    g_assert(qemu_in_main_thread());
> +
>       /* Change legacy command line options into QMP ones */
>       static const struct {
>           const char *from;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>



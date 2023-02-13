Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA369424F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:08:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVkM-0002VB-Jm; Mon, 13 Feb 2023 05:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRVkK-0002Uf-0M
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:07:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pRVkI-00025b-AH
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676282857;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ra8KEm1YDggh8er/VrLi0MHI0K6A0cmebp8ubzkywvc=;
 b=c7zSqwSq/gxBOXvsL/oYrgZLs2Y39++uNR8BWVtvuJAWT6comO4wit7yM2cnKMGjhVbNRX
 C7dgH8ifKuMzKPGoWnkqu2zFBpGtLw5O0JZpQyg14W5s1hSo8p2E7RuYG46syzayXzSu+l
 NXlYiWs/djGg4baowSXfxRMy/+0nMTg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-IjZsijcEPrGr7JvWwLoQ2w-1; Mon, 13 Feb 2023 05:07:36 -0500
X-MC-Unique: IjZsijcEPrGr7JvWwLoQ2w-1
Received: by mail-wm1-f70.google.com with SMTP id
 s11-20020a05600c384b00b003dffc7343c3so5924065wmr.0
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ra8KEm1YDggh8er/VrLi0MHI0K6A0cmebp8ubzkywvc=;
 b=t8EcMDcDtI4bfNbvUbcUlLIQI9+0Zq8ARBXRVoPDQFF6vimJO6TRcfflX1zRw1e4fz
 MjHa2kIlBN0RrbEj6MbWI41qG0PNnoikpv+8RXD70ZNONOkold1FfjZBmfCLpcvecGPP
 Og0Db200F9AWkDKEowav10KVFSLa+i6JQg6fXPnR4pFtAVTelZ4zDRXJOUlKr/GfEjAB
 HODElHJ/TgNCZVcPfV5dZCk98m7ylpv1qOZoDSo4IxNzCGApkVesbRdJVJdMrs5d9Cwo
 4EA3nmyWDpPgOnIJ7zxOedmKVVcQycE3OCgyll94EHOHJE+enhDvn334ZdALSkuMK9zG
 osXA==
X-Gm-Message-State: AO0yUKUyUJdWtZhXmb+3asTgh4QfV0nzrEp4Vi/mpxXewVMAw4Iuvn/r
 +Mcw3L/i8XZP5t+lAYwFxS9jxTmrYMoTLOKAL+4DJH0nlVRI/yAjDKb2F44V4ycqTYFxjIpjJj1
 TFmSTe5X2B4gukd8=
X-Received: by 2002:adf:ec4e:0:b0:2c5:5630:585d with SMTP id
 w14-20020adfec4e000000b002c55630585dmr3395050wrn.27.1676282854963; 
 Mon, 13 Feb 2023 02:07:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9UWaw/BQ9MyjSLuJ03UtgpdKnDcmBOgy3WwhvXsgs+07BZUFDPN+gNc3CmueLY32vZj9sxLQ==
X-Received: by 2002:adf:ec4e:0:b0:2c5:5630:585d with SMTP id
 w14-20020adfec4e000000b002c55630585dmr3395030wrn.27.1676282854776; 
 Mon, 13 Feb 2023 02:07:34 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a5d550f000000b002c55ebe37ddsm804726wrv.115.2023.02.13.02.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 02:07:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,  Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,  "Michael S . Tsirkin"
 <mst@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,  Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,  Zhenyu
 Wang <zhenyu.z.wang@intel.com>,  Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,  Robert Hoo
 <robert.hu@linux.intel.com>,  Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>,  Zhao Liu <zhao1.liu@intel.com>,  "Dr
 . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [RFC 15/52] migration/postcopy-ram: Use generic topology name
 and helper
In-Reply-To: <20230213095035.158240-16-zhao1.liu@linux.intel.com> (Zhao Liu's
 message of "Mon, 13 Feb 2023 17:49:58 +0800")
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-16-zhao1.liu@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 13 Feb 2023 11:07:33 +0100
Message-ID: <875yc5naje.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Zhao Liu <zhao1.liu@linux.intel.com> wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
>
> As the generic code, here we should respect the different topologies:
> smp or hybrid.
>
> So rename PostcopyBlocktimeContext.smp_cpus_down to
> PostcopyBlocktimeContext.cpus_down, and also rename other local
> variables from smp_cpus to cpus_num, to decouple with smp topology.
>
> And use generic topology helpers to get topology information.
>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

but if you ever have to rebase.

> ---
>  migration/postcopy-ram.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
> index 53299b7a5ebd..1e861e313258 100644
> --- a/migration/postcopy-ram.c
> +++ b/migration/postcopy-ram.c
> @@ -122,7 +122,7 @@ typedef struct PostcopyBlocktimeContext {
>      /* point in time when last page fault was initiated */
>      uint32_t last_begin;
>      /* number of vCPU are suspended */
> -    int smp_cpus_down;
> +    int cpus_down;

Put the rename of the variable in a single patch.  Trivial to review.

> +    unsigned int cpus_num = machine_topo_get_cpus(ms);

Put the meat in another patch.  I think you call this function in two
places instead of the old one.


Later, Juan.



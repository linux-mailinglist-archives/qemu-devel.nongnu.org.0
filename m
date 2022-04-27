Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCCA5113FE
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:01:57 +0200 (CEST)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdYZ-00059T-FW
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njdTz-0003eB-1z
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1njdTw-0001Gu-Ly
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 04:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651049819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Icb0E1W6pfjNEIxQkuxpLzKGMwKqWn43JaWbvGHWab8=;
 b=iILAcbdqN9HrQ4upMiPj2RFXZYz2bjjN1BJqOIRVqIj3tMxiahLCb6zGSvUCVSlF2z4min
 tp3l5SoE48GWCAvGnpvzGKxCWeOQffb23fZloiWq/b+MsZlIDjlyBl782oJcYx6kybzslV
 SoTGpsAXiSZKdO5CPvrrifhbaPM3QwI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-oN-VS7JrOFORgRJXYJHgxQ-1; Wed, 27 Apr 2022 04:56:58 -0400
X-MC-Unique: oN-VS7JrOFORgRJXYJHgxQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 l26-20020a2e99da000000b0024f02d881cdso534882ljj.6
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 01:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Icb0E1W6pfjNEIxQkuxpLzKGMwKqWn43JaWbvGHWab8=;
 b=uIqTvY2uCfkVBsP0t0eHO7+sJbSHzifx470YnzA3N5MDFdWPzgHZZ/CK7iJ1z8u4W3
 d1SNNsByTEFUW/a5eNjwfRf7L43orVu0NF7uTeXqrO7X3/aMMFass1r0UIs2EdJfvo5V
 YDAkW8E46ok2SB5oEyZEJuUNEpWrffOPBHkQ6EoZKLBLJNr5d6Nli4Sa8npaN0ErXUMV
 dAkx57CD9TwoM80oGLP/eWw8nsh3HxXlvp24esFWQrWLWURo1Qzs90DJFcvyCjUyDkod
 RWeldVbLuscZ8zwj04TUEHDGbElQxz+EsoZtg8AP4oMojcrkJjpKm0snzd42osXKyHII
 +ilw==
X-Gm-Message-State: AOAM533qhv8FnJ4wfpPlcqVdB1U7UudQdkPUbrOTjwPfB9OyC+q9/Cel
 b2BT+K5+c5NXxGNBYQyOSb4jz1X5SGs0JhvVWGXWZP29DrjCPDoF1MNSAstBsKdX5aHaw3UXy9p
 Jlofn4CdkwPczLzuEkIJ2d6cUWQGlepo=
X-Received: by 2002:a19:ca50:0:b0:471:f556:92b with SMTP id
 h16-20020a19ca50000000b00471f556092bmr15526278lfj.587.1651049816323; 
 Wed, 27 Apr 2022 01:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPf/9mVpuziFU/QsV+j9gYUCnZn37QgOBdX3CP21el7bEl+1ZKliL+X74EnynN5wBViktjhfEsqagb/GI2bxA=
X-Received: by 2002:a19:ca50:0:b0:471:f556:92b with SMTP id
 h16-20020a19ca50000000b00471f556092bmr15526263lfj.587.1651049816044; Wed, 27
 Apr 2022 01:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
In-Reply-To: <20220401034702.687057-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Apr 2022 16:56:44 +0800
Message-ID: <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
To: Zhang Chen <chen.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Like Xu <like.xu@linux.intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 11:59 AM Zhang Chen <chen.zhang@intel.com> wrote:
>
> If the checkpoint occurs when the guest finishes restarting
> but has not started running, the runstate_set() may reject
> the transition from COLO to PRELAUNCH with the crash log:
>
> {"timestamp": {"seconds": 1593484591, "microseconds": 26605},\
> "event": "RESET", "data": {"guest": true, "reason": "guest-reset"}}
> qemu-system-x86_64: invalid runstate transition: 'colo' -> 'prelaunch'
>
> Long-term testing says that it's pretty safe.
>
> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

I'd expect this to get ack from the relevant maintainers.

Thanks

> ---
>  softmmu/runstate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index e0d869b21a..c021c56338 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -127,6 +127,7 @@ static const RunStateTransition runstate_transitions_def[] = {
>      { RUN_STATE_RESTORE_VM, RUN_STATE_PRELAUNCH },
>
>      { RUN_STATE_COLO, RUN_STATE_RUNNING },
> +    { RUN_STATE_COLO, RUN_STATE_PRELAUNCH },
>      { RUN_STATE_COLO, RUN_STATE_SHUTDOWN},
>
>      { RUN_STATE_RUNNING, RUN_STATE_DEBUG },
> --
> 2.25.1
>



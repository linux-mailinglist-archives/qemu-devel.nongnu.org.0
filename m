Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FCC6D529A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 22:37:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjQvF-0002Lo-9D; Mon, 03 Apr 2023 16:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pjQvC-0002GZ-EK
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pjQvA-0004z7-Pp
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680554214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fbobn7EG9ItFYcZZrNzJWJA0+/+UbriIBLk5eS0rH7s=;
 b=W7GXO4Ibh0wqJ8QB7CXRaBo9NpYPeU54WwE21Kccq7mJefaNBN7jYhs9CSg3JzjdhngEYW
 ojxdJCc0tS4Q9nvi370ggrYXcD/eCm9YOHCN1faYtcHm1oD2ZHNW+B3Sx5giSnxF7UAZTn
 3hLwDQyxg02FjuOMj4+j5BwvptW4Cp4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-UE-PWKjZP_ipQCGJVARt1g-1; Mon, 03 Apr 2023 16:36:47 -0400
X-MC-Unique: UE-PWKjZP_ipQCGJVARt1g-1
Received: by mail-qt1-f199.google.com with SMTP id
 m7-20020a05622a118700b003e4e203bc30so18276865qtk.7
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 13:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680554206;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fbobn7EG9ItFYcZZrNzJWJA0+/+UbriIBLk5eS0rH7s=;
 b=JTsDQkR0nxFm37g7xgpyZl884j/J38StFUbf2hdcgSuD+8CS2z9FtkJvA43h0ePnsC
 0/7G7UxCMV1LlAmU/P60KX+2182RgahwzVi2L7+98fs7tjIaBmnzLXoWnBrRfNA97fSL
 g0ozha7ODPNlGLjP9gYNO3bvm00lRuEpaNdqPuR78k57k4T9uASNxcKQNpJK+fjkt3nW
 dxYGm0rVdv0Id5HGpPlTZ3p+B42MwBM1szN9Uor45Z5SSBvQmrHS7o7o06OxgL2h/J8+
 EGEQlBBHC2PhKcEekYVEpaJieLqVObALRJyDS7zFYvF6jntB+ZiD5QyQ6rvwEnpEoZgH
 RMKQ==
X-Gm-Message-State: AO0yUKXqYdn4UFQs8H+2E2O2fItMN5bhAfYP+0us59eD0VCPBvPm2TY3
 I/UvJtcqhf0yVEiZl1DqB8qZwH8zE0tosXKBd6JfCiB/zsiOH1pZstk6fO4NjIBW81BfB67MMGp
 Ar5nNAA2fODI5H7I=
X-Received: by 2002:ac8:5815:0:b0:3d2:efe6:3c23 with SMTP id
 g21-20020ac85815000000b003d2efe63c23mr65276926qtg.42.1680554206568; 
 Mon, 03 Apr 2023 13:36:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set/LfslmoU3K6PjBwzgZyxnINpZswg2gpyDhJbzuz0IkY+BBZixFqJf+evR41Zx+P54KMW9xng==
X-Received: by 2002:ac8:5815:0:b0:3d2:efe6:3c23 with SMTP id
 g21-20020ac85815000000b003d2efe63c23mr65276904qtg.42.1680554206312; 
 Mon, 03 Apr 2023 13:36:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 z2-20020ac875c2000000b003e41dae31f1sm2741750qtq.67.2023.04.03.13.36.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 13:36:45 -0700 (PDT)
Message-ID: <bebd7827-1d72-9572-ea1a-d41d8b856dbe@redhat.com>
Date: Mon, 3 Apr 2023 22:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] vfio/migration: Skip log_sync during migration SETUP state
To: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Keqian Zhu <zhukeqian1@huawei.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230403130000.6422-1-avihaih@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230403130000.6422-1-avihaih@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.349, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 4/3/23 15:00, Avihai Horon wrote:
> Currently, VFIO log_sync can be issued while migration is in SETUP
> state. However, doing this log_sync is at best redundant and at worst
> can fail.
> 
> Redundant -- all RAM is marked dirty in migration SETUP state and is
> transferred only after migration is set to ACTIVE state, so doing
> log_sync during migration SETUP is pointless.
> 
> Can fail -- there is a time window, between setting migration state to
> SETUP and starting dirty tracking by RAM save_live_setup handler, during
> which dirty tracking is still not started. Any VFIO log_sync call that
> is issued during this time window will fail. For example, this error can
> be triggered by migrating a VM when a GUI is active, which constantly
> calls log_sync.
> 
> Fix it by skipping VFIO log_sync while migration is in SETUP state.
> 
> Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
migration is still experimental, so this can wait 8.1. Correct me if not.

Thanks,

C.

> ---
>   hw/vfio/common.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 4d01ea3515..78358ede27 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -478,7 +478,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>       VFIODevice *vbasedev;
>       MigrationState *ms = migrate_get_current();
>   
> -    if (!migration_is_setup_or_active(ms->state)) {
> +    if (ms->state != MIGRATION_STATUS_ACTIVE &&
> +        ms->state != MIGRATION_STATUS_DEVICE) {
>           return false;
>       }
>   



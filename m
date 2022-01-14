Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCD848EA22
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 13:53:25 +0100 (CET)
Received: from localhost ([::1]:35600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8M55-0000JO-Rp
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 07:53:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Luj-0006Wo-Kh
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:42:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Lug-0004iH-8r
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 07:42:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642164149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZL4SMl7v/f3UG37fUInIRLk3LOVH9Q0wzhGRmHp998=;
 b=GZnCSTUD/VFXeJcChfBT9KojK84z/Mj90r52lqxJjq1OiXFrOOZ7GaAW+i0THL9dpUF8fa
 miFqjxkSIcHcW+rfFmjZ8h/ZpZ3ji4KAiDi21RgScH6nPVueEdd5e5JeW2ENB8MBe1VLyf
 KCd2W2bYyN6Bk4nx+C3/+/9a0ZDoobs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-FxQx4ID7PVS0c8t1NYNqng-1; Fri, 14 Jan 2022 07:42:27 -0500
X-MC-Unique: FxQx4ID7PVS0c8t1NYNqng-1
Received: by mail-wm1-f69.google.com with SMTP id
 i81-20020a1c3b54000000b003467c58cbddso7915027wma.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 04:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HZL4SMl7v/f3UG37fUInIRLk3LOVH9Q0wzhGRmHp998=;
 b=4VuYiu/KORJrWoyANW6+qP4yxr24K+cD13RRmU1StucJbTYBzenuKp8wQUTM3cyh7B
 o3HSk19nxOqVUsl7v9gSvvhC1SoeUPlckNInqr+rxvFruWmI2Lria/W9/K2tX0KGUVui
 meVJ7cox3J4K4L1o6vSF4X5V/PrLXl5GEW3HJsZ9F6uZhwVKTqt4hxHgHXTVOfaJwX6S
 zfLDjweAcApPPvXXqkjY65Qv3GiuqSGtJK3fBJAns20MR8U+gfxZk7j30y2GPALPSPqt
 Ji8pq1M4XGseEpRPpUrt2kbilO79oKiaWD393TaM5qUoe8w9QsR4wL40liGFfGQpnA3H
 sUfg==
X-Gm-Message-State: AOAM531wlgdW+O85pbh6QUKUMrf8cRMTVgKh8sTAUu1pGJVAtR2MXSMK
 VKcAX28bZwyEbiSZSNYs8ImXXrXgB3MgVlNFU8mlfwdTPVNDNlVRmiTuB7tf93d22Ru0LTEfVF2
 DZGjYknlKNbTE3yg=
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr2607898wrj.118.1642164145978; 
 Fri, 14 Jan 2022 04:42:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvb73zVS6PCOYzXodlOIXuWePWhPNnkVJnWo0OpDxFFDf8vPdzS3c7W10rPaqyDG+thqk9UQ==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr2607885wrj.118.1642164145788; 
 Fri, 14 Jan 2022 04:42:25 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id i8sm5054306wru.26.2022.01.14.04.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 04:42:25 -0800 (PST)
Message-ID: <6923d170-4dea-ffbd-14dc-6a0ef9301522@redhat.com>
Date: Fri, 14 Jan 2022 13:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 0/2] block-backend: Retain permissions after migration
To: qemu-block@nongnu.org
References: <20211125135317.186576-1-hreitz@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211125135317.186576-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peng Liang <liangpeng10@huawei.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.11.21 14:53, Hanna Reitz wrote:
> Hi,
>
> Peng Liang has reported an issue regarding migration of raw images here:
> https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00673.html
>
> It turns out that after migrating, all permissions are shared when they
> weren’t before.  The cause of the problem is that we deliberately delay
> restricting the shared permissions until migration is really done (until
> the runstate is no longer INMIGRATE) and first share all permissions;
> but this causes us to lose the original shared permission mask and
> overwrites it with BLK_PERM_ALL, so once we do try to restrict the
> shared permissions, we only again share them all.
>
> Fix this by saving the set of shared permissions through the first
> blk_perm_set() call that shares all; and add a regression test.
>
>
> I don’t believe we have to fix this in 6.2, because I think this bug has
> existed for four years now.  (I.e. it isn’t critical, and it’s no
> regression.)

Thanks for the reviews, applied to my block branch:

https://gitlab.com/hreitz/qemu/-/commits/block

Hanna


